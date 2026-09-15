part of 'material_category_bloc.dart';

@freezed
class MaterialCategoryEvent with _$MaterialCategoryEvent {
  const factory MaterialCategoryEvent.init() = _Init;
  const factory MaterialCategoryEvent.refresh() = _Refresh;
  const factory MaterialCategoryEvent.search({
    String? keyword,
  }) = _Search;
  const factory MaterialCategoryEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;
}
