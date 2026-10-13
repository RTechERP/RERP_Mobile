import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';

import '../../data/datasource/model/version_model.dart';
import '../../data/repository/version_repo.dart';
import '../models/version_item.dart';

part 'version_event.dart';
part 'version_state.dart';
part 'version_bloc.g.dart';
part 'version_bloc.freezed.dart';

/// Bloc xử lý dữ liệu tab Phiên bản.
/// Gọi song song 2 API với isPO=true/false để lấy cả version GP và version PO.
@injectable
class VersionBloc extends BaseBloc<VersionEvent, VersionState> {
  final VersionRepo _repo;
  final LogUtils _log;

  VersionBloc(this._repo, this._log) : super(VersionState.init()) {
    on<VersionEvent>((event, emit) async {
      await event.when(
        init: (projectSolutionId) =>
            _onInit(projectSolutionId, emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  Future<void> _onInit(
    int? projectSolutionId,
    Emitter<VersionState> emit,
  ) async {
    if (projectSolutionId == null || projectSolutionId <= 0) {
      emit(state.copyWith(
        status: BaseStateStatus.success,
        versions: const [],
        projectSolutionId: projectSolutionId,
      ));
      return;
    }

    emit(state.copyWith(
      status: BaseStateStatus.loading,
      projectSolutionId: projectSolutionId,
    ));

    final result = await _repo.getVersions(projectSolutionId);

    result.fold(
      (error) {
        _log.logE('VersionBloc._onInit error: $error');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ));
      },
      (data) {
        final items = <VersionItem>[
          ...data.solutionVersions
              .map((m) => _mapToVersionItem(m, VersionType.solutionVersion)),
          ...data.poVersions
              .map((m) => _mapToVersionItem(m, VersionType.poVersion)),
        ];
        emit(state.copyWith(
          status: BaseStateStatus.success,
          versions: items,
        ));
      },
    );
  }

  Future<void> _onRefresh(Emitter<VersionState> emit) async {
    await _onInit(state.projectSolutionId, emit);
  }

  /// Chuyển đổi VersionModel sang VersionItem để hiển thị.
  VersionItem _mapToVersionItem(VersionModel model, VersionType type) {
    return VersionItem(
      id: model.id ?? 0,
      code: model.code ?? '--',
      description: model.descriptionVersion ?? '--',
      usage: _mapUsage(model.isActive),
      approval: _mapApproval(model.isApproved),
      type: type,
      projectTypeName: model.projectTypeName ?? '--',
      fullNameCreated: model.fullNameCreated ?? '--',
      projectTypeId: model.projectTypeId,
      statusVersionText: model.statusVersionText,
      stt: model.stt ?? 0,
      codeNew: model.codeNew,
      createdDate: model.createdDate,
      updatedDate: model.updatedDate,
      tbpApprover: model.fullNameCreated,
      tbpApprovedDate: model.approvedTbpDate,
      projectSolutionId: model.projectSolutionId,
      projectId: model.projectId,
    );
  }

  VersionUsageStatus _mapUsage(bool? isActive) {
    if (isActive == null) return VersionUsageStatus.unknown;
    return isActive ? VersionUsageStatus.inUse : VersionUsageStatus.archived;
  }

  VersionApprovalStatus _mapApproval(bool? isApproved) {
    if (isApproved == null) return VersionApprovalStatus.pending;
    return isApproved
        ? VersionApprovalStatus.approved
        : VersionApprovalStatus.pending;
  }
}
