import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';

import '../models/solution_item.dart';

part 'solution_event.dart';
part 'solution_state.dart';
part 'solution_bloc.g.dart';
part 'solution_bloc.freezed.dart';

@injectable
class SolutionBloc extends BaseBloc<SolutionEvent, SolutionState> {
  SolutionBloc() : super(SolutionState.init()) {
    on<SolutionEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<SolutionState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // Mock data tĩnh - sẽ thay bằng API call sau.
    await Future.delayed(const Duration(milliseconds: 300));

    final now = DateTime.now();
    final mockData = [
      SolutionItem(
        id: 1,
        code: 'GP-001',
        content: 'Giải pháp tích hợp hệ thống POS',
        status: SolutionStatus.approved,
        poApproval: PoApproval.approved,
        gpDate: now.subtract(const Duration(days: 30)),
        requestCode: 'YC-001',
      ),
      SolutionItem(
        id: 2,
        code: 'GP-002',
        content: 'Giải pháp quản lý kho vật tư',
        status: SolutionStatus.inProgress,
        poApproval: PoApproval.pending,
        gpDate: now.subtract(const Duration(days: 12)),
        requestCode: 'YC-001',
      ),
    ];

    emit(state.copyWith(
      status: BaseStateStatus.success,
      solutions: mockData,
    ));
  }

  Future<void> _onRefresh(Emitter<SolutionState> emit) async {
    await _onInit(emit);
  }
}
