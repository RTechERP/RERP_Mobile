import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../base/bloc/index.dart';
import '../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/newsfeed_model.dart';
import '../../data/repository/newsfeed_repo.dart';

part 'newsfeed_event.dart';
part 'newsfeed_state.dart';
part 'newsfeed_bloc.g.dart';
part 'newsfeed_bloc.freezed.dart';

@injectable
class NewsfeedBloc extends BaseBloc<NewsfeedEvent, NewsfeedState> {
  final NewsfeedRepo _newsfeedRepo;
  final LogUtils _log;

  NewsfeedBloc(this._newsfeedRepo, this._log) : super(NewsfeedState.init()) {
    on<NewsfeedEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onInit(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<NewsfeedState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final res = await _newsfeedRepo.getNewsfeed();
    await res.fold(
      (err) async {
        _log.logE('❌ Get newsfeed failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI('✅ Get newsfeed success - count: ${data.length}');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            newsfeeds: data,
            message: null,
          ),
        );
      },
    );
  }
}
