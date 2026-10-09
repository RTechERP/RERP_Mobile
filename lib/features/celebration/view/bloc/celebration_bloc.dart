import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/bloc/index.dart';
import '../../data/datasource/model/celebration_model.dart';
import '../../data/repository/celebration_repo.dart';

part 'celebration_event.dart';
part 'celebration_state.dart';
part 'celebration_bloc.g.dart';
part 'celebration_bloc.freezed.dart';

@injectable
class CelebrationBloc extends BaseBloc<CelebrationEvent, CelebrationState> {
  final CelebrationRepo _repo;

  CelebrationBloc(this._repo) : super(CelebrationState.init()) {
    on<CelebrationEvent>((event, emit) async {
      await event.when(
        checkBirthdaySeniority: () => _onCheckBirthdaySeniority(emit),
      );
    });
  }

  Future<void> _onCheckBirthdaySeniority(
    Emitter<CelebrationState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final result = await _repo.checkBirthdaySeniority();

    result.fold(
      (error) {
        final msg = error.when(
          httpInternalServerError: (body) => body,
          httpUnAuthorizedError: () => 'Unauthorized',
          httpUnknownError: (m) => m,
        );
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: msg,
        ));
      },
      (item) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          celebrationItem: item,
        ));
      },
    );
  }
}
