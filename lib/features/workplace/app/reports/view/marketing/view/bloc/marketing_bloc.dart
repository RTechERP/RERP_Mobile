import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';

part 'marketing_event.dart';
part 'marketing_state.dart';
part 'marketing_bloc.g.dart';
part 'marketing_bloc.freezed.dart';

@injectable
class MarketingBloc extends BaseBloc<MarketingEvent, MarketingState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;

  MarketingBloc(this._reportRepo, this._authRepo, this._log)
    : super(MarketingState.init()) {
    on<MarketingEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        submitReport: (pickedDate) =>
            _onSubmitMarketingReport(pickedDate, emit),
        resetSubmitFlags: () => _onResetSubmitFlags(emit),
        updateDate: (picked) => _onUpdateDate(picked, emit),
        updateWork: (content, results, note, planNextDay) =>
            _onUpdateWork(content, results, note, planNextDay, emit),

        uploadFiles: (files) =>
            _onUploadFiles(files, emit),
        setLocalFiles: (files) =>
            _onSetLocalFiles(files, emit),

        removeLocalFile: (file) =>
            _onRemoveLocalFile(file, emit),

        markDeletedFile: (fileId) =>
            _onMarkDeletedFile(fileId, emit),
        deleteReport: (dailyID) =>
            _onDeleteReport(dailyID, emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
      );
    });
  }

  Future<void> _loadDailyReport({
    required DateTime start,
    required DateTime end,
    required Emitter<MarketingState> emit,
  }) async {
    final teamId = state.teamId;
    final userId = state.userId;
    final departmentId = state.departmentId;

    if (teamId == null || userId == null || departmentId == null) {
      emit(state.copyWith(status: BaseStateStatus.failed));
      return;
    }

    final res = await _reportRepo.getDailyReportTech(
      dateStart: start,
      dateEnd: end,
      keyword: state.keyword ?? '',
      teamId: teamId.toString(),
      userId: userId.toString(),
      departmentId: departmentId.toString(),
    );

    res.fold(
      (l) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            reports: r,
            dateStart: start,
            dateEnd: end,
          ),
        );
      },
    );
  }

  Future<void> _onInit(Emitter<MarketingState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    final departRes = await _reportRepo.getDepart();

    await userRes.fold(
      (l) async {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        emit(
          state.copyWith(
            userId: user.id,
            fullName: user.fullName,
            departmentId: user.departmentId,
            teamId: user.teamOfUser,
            employeeID: user.employeeId,
            positionName: user.positionName,
            departmentName: user.departmentName,
          ),
        );

        final now = DateTime.now();
        final start = now;
        final end = DateTime(now.year, now.month, now.day + 1);

        await _loadDailyReport(start: start, end: end, emit: emit);
      },
    );

    departRes.fold(
      (l) => _log.logE('Get depart failed: ${l.getErrorMessage}'),
      (r) => emit(state.copyWith(departs: r)),
    );
  }

  bool _isSubmittingReport = false;

  Future<void> _onSubmitMarketingReport(
      DateTime pickedDate,
      Emitter<MarketingState> emit,
      ) async {

    /// 1️⃣ Chặn double click
    if (_isSubmittingReport) return;

    /// 2️⃣ Không cho submit nếu đang upload
    if (state.isUploadingFile) {
      // _log.logE('[SubmitMarketing] Still uploading');
      return;
    }

    /// 3️⃣ Nếu còn localFiles mà upload chưa thành công → không cho submit
    if ((state.localFiles?.isNotEmpty ?? false) &&
        !state.uploadSuccess) {
      // _log.logE('[SubmitMarketing] Upload not completed');
      return;
    }

    _isSubmittingReport = true;

    try {
      emit(state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
      ));

      /// 4️⃣ Lấy user
      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      /// 5️⃣ Format date
      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      /// 6️⃣ Build payload
      final payload = {
        'ID': 0,
        'UserReport': userId,
        'DateReport': dateStr,
        'Content': state.content ?? '',
        'Results': state.results ?? '',
        'PlanNextDay': state.planNextDay ?? '',
        'Note': state.note ?? '',
        'dailyReportMarketingFiles':
        (state.files ?? []).map((e) => e.toJson()).toList(),
        'deletedFileID': state.deletedFileIds ?? [],
      };

      /// 7️⃣ Call API
      final res = await _reportRepo.saveReportMarketing(
        payload: payload,
      );

      final isFailed = res.fold(
            (l) {
          return true;
        },
            (_) => false,
      );

      if (isFailed) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      /// 8️⃣ Thành công
      emit(state.copyWith(
        isSubmitting: false,
        submitSuccess: true,

        /// reset file state
        files: [],
        deletedFileIds: [],
        uploadSuccess: false,
        localFiles: [],
      ));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        submitSuccess: false,
      ));
    } finally {
      _isSubmittingReport = false;
    }
  }

  _onResetSubmitFlags(Emitter<MarketingState> emit) {
    emit(state.copyWith(submitSuccess: false, sendMailSuccess: false));
    emit(state.copyWith(isSubmitting: false, sendMailSuccess: false));
  }

  _onUpdateDate(DateTime? picked, Emitter<MarketingState> emit) {
    if (picked == null) return;

    final safeDate = DateTime(picked.year, picked.month, picked.day);

    emit(state.copyWith(dateReport: safeDate));
  }

  Future<void> _onUpdateWork(
    String? content,
    String? results,
    String? note,
    String? planNextDay,
    Emitter<MarketingState> emit,
  ) async {
    emit(
      state.copyWith(
        content: content ?? state.content,
        results: results ?? state.results,
        note: note ?? state.note,
        planNextDay: planNextDay ?? state.planNextDay,
      ),
    );
  }

  Future<void> _onUploadFiles(
      List<File> files,
      Emitter<MarketingState> emit,
      ) async {
    if (files.isEmpty) return;

    emit(state.copyWith(
      isUploadingFile: true,
      uploadSuccess: false,
    ));

    try {
      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isUploadingFile: false));
        return;
      }

      final date = state.dateReport ?? DateTime.now();
      final year = DateFormat('yyyy').format(date);
      final month = DateFormat('MM').format(date);

      final subPath = 'DailyReportMarketing/$year/$month/$userId';


      final uploadRes = await _reportRepo.uploadReportFile(
        files: files,
        key: 'PathDailyReportMarketing',
        subPath: subPath,
      );

      uploadRes.fold(
            (l) {
          emit(state.copyWith(
            isUploadingFile: false,
            uploadSuccess: false,
          ));
        },
            (uploadedFiles) {

          final mapped = uploadedFiles.map((f) {
            final extension = f.originalFileName.contains('.')
                ? '.${f.originalFileName.split('.').last}'
                : '';

            final model = MarketingFileRequest(
              id: 0,
              fileName: f.savedFileName,
              fileNameOrigin: f.originalFileName,
              originPath: f.originalFileName,
              extension: extension,
              pathServer: f.filePath.replaceAll(r'\', r'\\'),
              dailyReportId: 0,
            );

            return model;
          }).toList();

          emit(
            state.copyWith(
              isUploadingFile: false,
              uploadSuccess: true,
              files: [...(state.files ?? []), ...mapped],
              localFiles: [],
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(isUploadingFile: false));
    }
  }

  Future<void> _onSetLocalFiles(
      List<File> files,
      Emitter<MarketingState> emit,
      ) async {
    final current = state.localFiles ?? [];

    /// Merge + tránh duplicate theo path
    final merged = [
      ...current,
      ...files,
    ];

    final unique = {
      for (var f in merged) f.path: f,
    }.values.toList();

    emit(state.copyWith(
      localFiles: unique,
      uploadSuccess: false,
    ));
  }

   _onRemoveLocalFile(
      File file,
      Emitter<MarketingState> emit,
      ) {
    final current = state.localFiles ?? [];

    final updated = current
        .where((f) => f.path != file.path)
        .toList();

    emit(state.copyWith(
      localFiles: updated,
      uploadSuccess: false,
    ));
  }

   _onMarkDeletedFile(
      int fileId,
      Emitter<MarketingState> emit,
      ) {
    emit(state.copyWith(
      deletedFileIds: [
        ...state.deletedFileIds ?? [],
        fileId,
      ],
    ));
  }

  Future<void> _onDeleteReport(int dailyID, Emitter<MarketingState> emit) async {
    emit(
      state.copyWith(
        isDeleting: true,
        deleteSuccess: false,
        status: BaseStateStatus.loading,
      ),
    );

    final result = await _reportRepo.deleteReportById(dailyID: dailyID);

    result.fold(
          (error) {
        emit(state.copyWith(isDeleting: false, deleteSuccess: false));
      },
          (message) {
        /// remove khỏi list hiện tại (không cần gọi lại API)
        final updatedReports = state.reports
            .where((e) => e.id != dailyID)
            .toList();

        emit(
          state.copyWith(
            reports: updatedReports,
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
            message: message,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
      DateTime dateStart,
      DateTime dateEnd,
      Emitter<MarketingState> emit,
      ) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    emit(state.copyWith(status: BaseStateStatus.loading));

    await _loadDailyReport(start: start, end: end, emit: emit);
  }
}
