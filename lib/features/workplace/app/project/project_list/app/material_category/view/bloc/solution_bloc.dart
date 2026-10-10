import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';

import '../../data/datasource/model/solution_model.dart';
import '../../data/repository/solution_repo.dart';
import '../models/solution_item.dart';

part 'solution_event.dart';
part 'solution_state.dart';
part 'solution_bloc.g.dart';
part 'solution_bloc.freezed.dart';

@injectable
class SolutionBloc extends BaseBloc<SolutionEvent, SolutionState> {
  final SolutionRepo _repo;
  final LogUtils _log;

  SolutionBloc(this._repo, this._log) : super(SolutionState.init()) {
    on<SolutionEvent>((event, emit) async {
      await event.when(
        init: (projectRequestId) => _onInit(projectRequestId, emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  Future<void> _onInit(int? projectRequestId, Emitter<SolutionState> emit) async {
    if (projectRequestId == null || projectRequestId <= 0) {
      emit(state.copyWith(
        status: BaseStateStatus.success,
        solutions: [],
      ));
      return;
    }

    emit(state.copyWith(status: BaseStateStatus.loading));

    final result = await _repo.getSolutions(projectRequestId);

    result.fold(
      (error) {
        _log.logE('SolutionBloc._onInit error: $error');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ));
      },
      (data) {
        final items = data.map(_mapToSolutionItem).toList();
        emit(state.copyWith(
          status: BaseStateStatus.success,
          solutions: items,
        ));
      },
    );
  }

  Future<void> _onRefresh(Emitter<SolutionState> emit) async {
    // Refresh giữ nguyên projectRequestId đã dùng trước đó.
    await _onInit(state.projectRequestId, emit);
  }

  /// Chuyển đổi SolutionModel sang SolutionItem để hiển thị.
  SolutionItem _mapToSolutionItem(SolutionModel model) {
    return SolutionItem(
      id: model.id ?? 0,
      code: model.codeSolution ?? '--',
      content: model.contentSolution ?? '--',
      status: _mapStatus(model.statusSolution),
      requestCode: model.codeRequest ?? '--',
      poApproval: _mapPoApproval(model.isApprovedPO),
      gpDate: _parseDate(model.dateSolution),
      // Các trường bổ sung từ API
      projectRequestId: model.projectRequestId,
      projectCode: model.projectCode,
      projectName: model.projectName,
      stt: model.stt ?? 0,
      createdBy: model.createdBy,
      createdDate: model.createdDate,
      updatedBy: model.updatedBy,
      updatedDate: model.updatedDate,
      statusSolution: model.statusSolution,
      isApprovedPrice: model.isApprovedPrice,
      isApprovedPO: model.isApprovedPO,
      note: model.note,
    );
  }

  SolutionStatus _mapStatus(int? status) {
    switch (status) {
      case 0:
        return SolutionStatus.pending;
      case 1:
        return SolutionStatus.approved;
      case 2:
        return SolutionStatus.rejected;
      case 3:
        return SolutionStatus.inProgress;
      case 4:
        return SolutionStatus.done;
      default:
        return SolutionStatus.unknown;
    }
  }

  PoApproval _mapPoApproval(bool? isApproved) {
    if (isApproved == null) return PoApproval.notRequired;
    return isApproved ? PoApproval.approved : PoApproval.pending;
  }

  DateTime? _parseDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return null;
    try {
      return DateTime.parse(dateStr);
    } catch (_) {
      return null;
    }
  }
}
