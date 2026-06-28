import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../common/logger/index.dart';

import '../../../../../auth/data/repository/auth_repo.dart';

part 'personal_approve_menu_event.dart';
part 'personal_approve_menu_state.dart';
part 'personal_approve_menu_bloc.g.dart';
part 'personal_approve_menu_bloc.freezed.dart';

/// Bloc cho Personal Approve menu.
///
/// Lưu ý: route Senior/Menu đã được resolve sẵn tại workspace_bloc
/// (cache vào WorkspaceState.personalApproveRoute), bấm trên workspace
/// là vào thẳng — không redirect trong menu này.
///
/// Bloc này chỉ load thông tin user để cache cho child screens dùng.
@injectable
class PersonalApproveMenuBloc
    extends BaseBloc<PersonalApproveMenuEvent, PersonalApproveMenuState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  PersonalApproveMenuBloc(this._authRepo, this._log)
      : super(PersonalApproveMenuState.init()) {
    on<PersonalApproveMenuEvent>((event, emit) async {
      await event.when(init: () => _onInit(emit));
    });
  }

  Future<void> _onInit(Emitter<PersonalApproveMenuState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    final user = userRes.getOrElse(() => null);

    if (user == null) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Không có thông tin người dùng',
      ));
      return;
    }

    _log.logI('PersonalApproveMenu.init: ${user.fullName} (${user.employeeId})');

    emit(state.copyWith(
      status: BaseStateStatus.success,
      currentUserEmployeeId: user.employeeId,
      currentUserName: user.fullName,
    ));
  }
}