import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';
import '../../data/sale_model.dart';

part 'sale_event.dart';
part 'sale_state.dart';
part 'sale_bloc.g.dart';
part 'sale_bloc.freezed.dart';

@injectable
class SaleBloc extends BaseBloc<SaleEvent, SaleState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;

  SaleBloc(this._reportRepo, this._authRepo, this._log)
    : super(SaleState.init()) {
    on<SaleEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        addWork: () => _onAddWork(emit),
        removeWork: (index) => _onRemoveWork(index, emit),
        expandWork: (index) => _onExpandWork(index, emit),
      );
    });
  }

  Future<void> _loadDailyReport({
    required DateTime start,
    required DateTime end,
    required Emitter<SaleState> emit,
  }) async {
    final userId = state.userId;
    final departmentId = state.departmentId;
    final teamId = state.teamId;

    if (userId == null && departmentId == null && teamId == null) {
      emit(state.copyWith(status: BaseStateStatus.failed));
      return;
    }

    final res = await _reportRepo.getSaleDailyReport(
      dateStart: start,
      dateEnd: end,
      userId: userId!,
      employeeTeamSaleId: teamId!,
    );

    res.fold(
      (l) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            reports: r.data.data,
            dateStart: start,
            dateEnd: end,
          ),
        );
      },
    );
  }

  Future<void> _onInit(Emitter<SaleState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

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
            positionId: user.positionId,

            /// auto có sẵn công việc 1
            staffWorks: [
              SaleStaffWork(
                id: DateTime.now().microsecondsSinceEpoch,
                code: '',
                fullName: user.fullName,
                userId: user.id,
                positionName: user.positionName,
                totalHours: 0,
                content: '',
                results: '',
                planNextDay: '',
                mission: '',
                projectItemCode: '',
              ),
            ],

            /// auto mở
            expandedWorkIndex: 0,
          ),
        );

        final now = DateTime.now();
        final start = now;
        final end = DateTime(now.year, now.month, now.day + 1);

        await _loadDailyReport(start: start, end: end, emit: emit);
      },
    );
  }

  _onExpandWork(int index, Emitter<SaleState> emit) {
    emit(
      state.copyWith(
        expandedWorkIndex: state.expandedWorkIndex == index ? null : index,
      ),
    );
  }

  _onAddWork(Emitter<SaleState> emit) {
    final dateStr = state.dateStart != null
        ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
        : '';

    final newWorks = [
      ...state.staffWorks,
      SaleStaffWork.empty(
        dateReport: dateStr,
        projectId: 0,
        userId: 0,
        code: '',
        fullName: '',
        projectItemId: 0,
      ),
    ];

    emit(
      state.copyWith(
        staffWorks: newWorks,
        expandedWorkIndex: newWorks.length - 1,
      ),
    );
  }

  _onRemoveWork(int index, Emitter<SaleState> emit) {
    final newWorks = [...state.staffWorks];

    if (index < 0 || index >= newWorks.length) return;

    newWorks.removeAt(index);

    emit(state.copyWith(staffWorks: newWorks, expandedWorkIndex: null));
  }
}