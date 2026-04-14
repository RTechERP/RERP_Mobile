part of 'personal_asset_bloc.dart';

@CopyWith()
class PersonalAssetState extends BaseBlocState {
  final List<PersonalAssetItem> personalAsset;
  final List<PersonalPropertyItem> personalProperty;

  const PersonalAssetState({
    required super.status,
    super.message,
    this.personalAsset = const [],
    this.personalProperty = const [],
  });

  factory PersonalAssetState.init() => const PersonalAssetState(
        status: BaseStateStatus.init,
        personalAsset: [],
        personalProperty: [],
      );

  @override
  List get props => [status, message, personalAsset, personalProperty];
}
