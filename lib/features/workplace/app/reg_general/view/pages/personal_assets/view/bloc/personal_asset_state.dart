part of 'personal_asset_bloc.dart';

@CopyWith()
class PersonalAssetState extends BaseBlocState {
  final List<PersonalAssetItem> personalAsset;
  final List<PersonalPropertyItem> personalProperty;
  final List<DetailPersonalPropertyItem> propertyDetailItems;
  final bool isApproving;
  final bool isDetailLoading;
  final int propertyCategoryFilter;
  final String assetSearchQuery;
  final int? departmentId;

  const PersonalAssetState({
    required super.status,
    super.message,
    this.personalAsset = const [],
    this.personalProperty = const [],
    this.propertyDetailItems = const [],
    this.isApproving = false,
    this.isDetailLoading = false,
    this.propertyCategoryFilter = -1,
    this.assetSearchQuery = '',
    this.departmentId,
  });

  factory PersonalAssetState.init() => const PersonalAssetState(
        status: BaseStateStatus.init,
        personalAsset: [],
        personalProperty: [],
        propertyDetailItems: [],
        isApproving: false,
        isDetailLoading: false,
        propertyCategoryFilter: -1,
        assetSearchQuery: '',
        departmentId: null,
      );

  @override
  List get props => [
        status,
        message,
        personalAsset,
        personalProperty,
        propertyDetailItems,
        isApproving,
        isDetailLoading,
        propertyCategoryFilter,
        assetSearchQuery,
        departmentId,
      ];
}
