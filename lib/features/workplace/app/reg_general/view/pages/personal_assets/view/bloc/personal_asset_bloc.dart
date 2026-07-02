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

  bool _isSearchingAsset = false;

  PersonalAssetBloc(this._personalAssetRepo, this._authRepo, this._log)
      : super(PersonalAssetState.init()) {
    on<PersonalAssetEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        fetchAssets: () => _onFetchAssets(emit),
        fetchProperties: () => _onFetchProperties(emit),
        searchAssets: (filterText) =>
            _onSearchAssets(emit, filterText: filterText),
        filterPropertyCategory: (category) =>
            _onFilterPropertyCategory(emit, category: category),
        fetchPropertyDetail: (assetId, assetCategory) =>
            _onFetchPropertyDetail(emit, assetId: assetId, assetCategory: assetCategory),
        approveProperty: (deliverId, assetId, approveType) =>
            _onApproveProperty(emit, deliverId: deliverId, assetId: assetId, approveType: approveType),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInit(Emitter<PersonalAssetState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    await userRes.fold(
      (err) async {
        _log.logE('Get current user failed: $err');
      },
      (user) async {
        emit(state.copyWith(departmentId: user?.departmentId));
      },
    );

    await Future.wait([
      _onFetchAssets(emit),
      _onFetchProperties(emit),
    ]);
  }

  //---(Fetch)---//
  Future<void> _onFetchAssets(Emitter<PersonalAssetState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final payload = <String, dynamic>{
      'PageNumber': 1,
      'PageSize': 100,
      'DateStart': '1900-01-01T00:00:00.000Z',
      'DateEnd': '2100-12-31T23:59:59.000Z',
      'FilterText': state.assetSearchQuery,
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

  Future<void> _onFetchProperties(Emitter<PersonalAssetState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final payload = <String, dynamic>{
      'dateStart': '1900-01-01T00:00:00.000Z',
      'dateEnd': '2100-12-31T23:59:59.000Z',
      'receiverID': 0,
      'assetCategory': state.propertyCategoryFilter,
    };
    final res = await _personalAssetRepo.getPersonalProperty(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ Get personal property failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('✅ Get personal property success - total: ${data.length}');
        emit(state.copyWith(
          personalProperty: data,
          status: BaseStateStatus.success,
        ));
      },
    );
  }

  //---(Search & Filter)---//
  Future<void> _onSearchAssets(
    Emitter<PersonalAssetState> emit, {
    required String filterText,
  }) async {
    if (_isSearchingAsset) return;
    _isSearchingAsset = true;

    emit(state.copyWith(assetSearchQuery: filterText));
    emit(state.copyWith(status: BaseStateStatus.loading));

    final payload = <String, dynamic>{
      'PageNumber': 1,
      'PageSize': 100,
      'DateStart': '1900-01-01T00:00:00.000Z',
      'DateEnd': '2100-12-31T23:59:59.000Z',
      'FilterText': filterText,
    };

    final res = await _personalAssetRepo.getPersonalAsset(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ Search asset failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('✅ Search asset success - total: ${data.length}');
        emit(state.copyWith(
          personalAsset: data,
          status: BaseStateStatus.success,
        ));
      },
    );

    _isSearchingAsset = false;
  }

  Future<void> _onFilterPropertyCategory(
    Emitter<PersonalAssetState> emit, {
    required int category,
  }) async {
    if (state.propertyCategoryFilter == category) return;
    emit(state.copyWith(propertyCategoryFilter: category, status: BaseStateStatus.loading));

    final payload = <String, dynamic>{
      'dateStart': '1900-01-01T00:00:00.000Z',
      'dateEnd': '2100-12-31T23:59:59.000Z',
      'receiverID': 0,
      'assetCategory': category,
    };

    final res = await _personalAssetRepo.getPersonalProperty(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ Filter property failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('✅ Filter property success - total: ${data.length}');
        emit(state.copyWith(
          personalProperty: data,
          status: BaseStateStatus.success,
        ));
      },
    );
  }

  Future<void> _onFetchPropertyDetail(
    Emitter<PersonalAssetState> emit, {
    required int assetId,
    required int assetCategory,
  }) async {
    emit(state.copyWith(isDetailLoading: true, message: null));

    final query = <String, dynamic>{
      'assetID': assetId,
      'assetCategory': assetCategory,
    };

    _log.logI('📋 Fetch property detail: $query');

    final res = await _personalAssetRepo.getPersonalPropertyDetail(query: query);

    await res.fold(
      (err) async {
        _log.logE('❌ Get property detail failed: $err');
        emit(state.copyWith(
          isDetailLoading: false,
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('✅ Get property detail success - total: ${data.length}');
        emit(state.copyWith(
          isDetailLoading: false,
          propertyDetailItems: data,
          status: BaseStateStatus.success,
        ));
      },
    );
  }

  //---(Approve)---//
  Future<void> _onApproveProperty(
    Emitter<PersonalAssetState> emit, {
    required int deliverId,
    required int assetId,
    required int approveType,
  }) async {
    emit(state.copyWith(isApproving: true, message: null));

    final payload = <String, dynamic>{
      'DeliverID': deliverId,
      'AssetID': assetId,
      'IsApprovedPersonalProperty': approveType == 1,
      'IsApproveAccountant': approveType == 2,
      'IsApproved': approveType == 3,
    };

    _log.logI('📋 Approve payload: $payload');

    final res = await _personalAssetRepo.approvePersonalProperty(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ Approve property failed: $err');
        emit(state.copyWith(
          isApproving: false,
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (_) async {
        _log.logI('✅ Approve property success');
        emit(state.copyWith(isApproving: false));
        await _onFetchProperties(emit);
      },
    );
  }
}