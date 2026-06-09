import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/poll_model.dart';
import '../../data/repository/poll_repo.dart';

part 'poll_event.dart';
part 'poll_state.dart';
part 'poll_bloc.g.dart';
part 'poll_bloc.freezed.dart';

@injectable
class PollBloc extends BaseBloc<PollEvent, PollState> {
  final LogUtils _log;
  final PollRepo _pollRepo;

  PollBloc(this._pollRepo, this._log) : super(PollState.init()) {
    on<PollEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<PollState> emit) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        message: null,
      ),
    );

    await _fetchPolls(emit);
  }

  Future<void> _onRefresh(Emitter<PollState> emit) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        message: null,
      ),
    );

    await _fetchPolls(emit);
  }

  Future<void> _fetchPolls(Emitter<PollState> emit) async {
    final result = await _pollRepo.getPolls();

    result.fold(
      (error) {
        _log.logE('Get polls failed: $error');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: error.getErrorMessage,
            polls: const [],
          ),
        );
      },
      (polls) {
        _log.logI('Get polls success: ${polls.length} items');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            polls: polls,
            message: null,
          ),
        );
      },
    );
  }
}
