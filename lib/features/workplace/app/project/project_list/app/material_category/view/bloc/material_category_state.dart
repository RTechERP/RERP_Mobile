part of 'material_category_bloc.dart';

@CopyWith()
class MaterialCategoryState extends BaseBlocState {
  final List<MaterialCategoryItem> categories;
  final String searchKeyword;

  const MaterialCategoryState({
    required super.status,
    super.message,
    this.categories = const [],
    this.searchKeyword = '',
  });

  factory MaterialCategoryState.init() => const MaterialCategoryState(
        status: BaseStateStatus.init,
        categories: [],
        searchKeyword: '',
      );

  /// Lọc theo searchKeyword. Lọc trên `name` và `code`.
  List<MaterialCategoryItem> get filteredCategories {
    if (searchKeyword.isEmpty) return categories;
    final keywordLower = searchKeyword.toLowerCase();
    return categories.where((item) {
      final nameMatch = item.name.toLowerCase().contains(keywordLower);
      final codeMatch = item.code.toLowerCase().contains(keywordLower);
      return nameMatch || codeMatch;
    }).toList();
  }

  @override
  List get props => [
        status,
        message,
        categories,
        searchKeyword,
      ];
}
