import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/repository/approve_timesheet_repo.dart';

part 'approve_timesheet_event.dart';
part 'approve_timesheet_state.dart';
part 'approve_timesheet_bloc.g.dart';
part 'approve_timesheet_bloc.freezed.dart';

@injectable
class ApproveTimesheetBloc
    extends BaseBloc<ApproveTimesheetEvent, ApproveTimesheetState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final ApproveTimesheetRepo _approveTimesheetRepo;

  ApproveTimesheetBloc(this._approveTimesheetRepo, this._authRepo, this._log)
      : super(ApproveTimesheetState.init()) {
    on<ApproveTimesheetEvent>((event, emit) async {
      await event.when(init: () => _onInit(emit));
    });
  }

  Future<void> _onInit(Emitter<ApproveTimesheetState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
  }
}