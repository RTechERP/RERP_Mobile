part of 'material_category_bloc.dart';

@CopyWith()
class MaterialCategoryState extends BaseBlocState {
  final List<PartListModel> categories;
  final String searchKeyword;
  final int? projectId;
  final int? projectPartListVersionId;

  const MaterialCategoryState({
    required super.status,
    super.message,
    this.categories = const [],
    this.searchKeyword = '',
    this.projectId,
    this.projectPartListVersionId,
  });

  factory MaterialCategoryState.init() => const MaterialCategoryState(
        status: BaseStateStatus.init,
        categories: [],
        searchKeyword: '',
      );

  /// Lọc theo searchKeyword. Lọc trên productCode, groupMaterial, manufacturer.
  List<PartListModel> get filteredCategories {
    if (searchKeyword.isEmpty) return categories;
    final keywordLower = searchKeyword.toLowerCase();
    return categories.where((item) {
      final codeMatch =
          (item.productCode ?? '').toLowerCase().contains(keywordLower);
      final groupMatch =
          (item.groupMaterial ?? '').toLowerCase().contains(keywordLower);
      final makerMatch =
          (item.manufacturer ?? '').toLowerCase().contains(keywordLower);
      return codeMatch || groupMatch || makerMatch;
    }).toList();
  }

  @override
  List get props => [
        status,
        message,
        categories,
        searchKeyword,
        projectId,
        projectPartListVersionId,
      ];
}
