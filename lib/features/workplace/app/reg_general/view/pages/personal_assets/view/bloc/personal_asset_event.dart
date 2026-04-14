part of 'personal_asset_bloc.dart';

@freezed
class PersonalAssetEvent with _$PersonalAssetEvent {
  const factory PersonalAssetEvent.init() = _Init;

  const factory PersonalAssetEvent.fetchAssets() = _FetchAssets;

  const factory PersonalAssetEvent.fetchProperties() = _FetchProperties;
}