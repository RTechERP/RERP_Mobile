import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../../base/bloc/base_bloc.dart';
import '../../../../../base/bloc/index.dart';
import '../../../../common/logger/index.dart';
import '../../data/datasource/models/app_version_model.dart';
import '../../data/repository/app_version_repo.dart';

part 'app_version_event.dart';
part 'app_version_state.dart';
part 'app_version_bloc.g.dart';
part 'app_version_bloc.freezed.dart';

@injectable
class AppVersionBloc extends BaseBloc<AppVersionEvent, AppVersionState> {
  final LogUtils _log;
  final AppVersionRepo _repo;

  AppVersionBloc(this._repo, this._log) : super(AppVersionState.init()) {
    on<AppVersionEvent>((event, emit) async {
      await event.when(init: () => _onInit(emit));
    });
  }

  Future<void> _onInit(Emitter<AppVersionState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final version = await _repo.getAppVersion();

    await version.fold(
      (err) async {
        _log.logE('Get app version failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            appVersion: data.first,
          ),
        );
      },
    );
  }
}
