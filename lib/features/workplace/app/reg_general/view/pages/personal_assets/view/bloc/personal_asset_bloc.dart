import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/personal_asset_model.dart';
import '../../data/repository/personal_asset_repo.dart';

part 'personal_asset_event.dart';
part 'personal_asset_state.dart';
part 'personal_asset_bloc.g.dart';
part 'personal_asset_bloc.freezed.dart';

@injectable
class PersonalAssetBloc extends BaseBloc<PersonalAssetEvent, PersonalAssetState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final PersonalAssetRepo _personalAssetRepo;

  PersonalAssetBloc(this._personalAssetRepo, this._authRepo, this._log)
      : super(PersonalAssetState.init()) {
    on<PersonalAssetEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        fetchAssets: () => _onFetchAssets(emit),
        fetchProperties: () => _onFetchProperties(emit),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInit(Emitter<PersonalAssetState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _onFetchAssets(emit);
  }

  //---(Fetch)---//
  Future<void> _onFetchAssets(Emitter<PersonalAssetState> emit) async {
    final payload = <String, dynamic>{
      'PageNumber': 1,
      'PageSize': 100,
      'DateStart': '1900-01-01T00:00:00.000Z',
      'DateEnd': '2100-12-31T23:59:59.000Z',
      'FilterText': '',
    };
    final res = await _personalAssetRepo.getPersonalAsset(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ Get personal asset failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('✅ Get personal asset success');
        emit(state.copyWith(
          personalAsset: data,
          status: BaseStateStatus.success,
        ));
      },
    );
  }

  Future<void> _onFetchProperties(Emitter<PersonalAssetState> emit) async {}
}