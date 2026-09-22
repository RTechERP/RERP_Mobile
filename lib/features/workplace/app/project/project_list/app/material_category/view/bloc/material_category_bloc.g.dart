// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_category_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MaterialCategoryStateCWProxy {
  MaterialCategoryState status(BaseStateStatus status);

  MaterialCategoryState message(String? message);

  MaterialCategoryState categories(List<PartListModel> categories);

  MaterialCategoryState searchKeyword(String searchKeyword);

  MaterialCategoryState projectId(int? projectId);

  MaterialCategoryState projectPartListVersionId(int? projectPartListVersionId);

  MaterialCategoryState projectTypeId(int? projectTypeId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MaterialCategoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MaterialCategoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  MaterialCategoryState call({
    BaseStateStatus? status,
    String? message,
    List<PartListModel>? categories,
    String? searchKeyword,
    int? projectId,
    int? projectPartListVersionId,
    int? projectTypeId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMaterialCategoryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMaterialCategoryState.copyWith.fieldName(...)`
class _$MaterialCategoryStateCWProxyImpl
    implements _$MaterialCategoryStateCWProxy {
  const _$MaterialCategoryStateCWProxyImpl(this._value);

  final MaterialCategoryState _value;

  @override
  MaterialCategoryState status(BaseStateStatus status) => this(status: status);

  @override
  MaterialCategoryState message(String? message) => this(message: message);

  @override
  MaterialCategoryState categories(List<PartListModel> categories) =>
      this(categories: categories);

  @override
  MaterialCategoryState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  MaterialCategoryState projectId(int? projectId) => this(projectId: projectId);

  @override
  MaterialCategoryState projectPartListVersionId(
          int? projectPartListVersionId) =>
      this(projectPartListVersionId: projectPartListVersionId);

  @override
  MaterialCategoryState projectTypeId(int? projectTypeId) =>
      this(projectTypeId: projectTypeId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MaterialCategoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MaterialCategoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  MaterialCategoryState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? categories = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? projectId = const $CopyWithPlaceholder(),
    Object? projectPartListVersionId = const $CopyWithPlaceholder(),
    Object? projectTypeId = const $CopyWithPlaceholder(),
  }) {
    return MaterialCategoryState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      categories:
          categories == const $CopyWithPlaceholder() || categories == null
              ? _value.categories
              // ignore: cast_nullable_to_non_nullable
              : categories as List<PartListModel>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      projectId: projectId == const $CopyWithPlaceholder()
          ? _value.projectId
          // ignore: cast_nullable_to_non_nullable
          : projectId as int?,
      projectPartListVersionId:
          projectPartListVersionId == const $CopyWithPlaceholder()
              ? _value.projectPartListVersionId
              // ignore: cast_nullable_to_non_nullable
              : projectPartListVersionId as int?,
      projectTypeId: projectTypeId == const $CopyWithPlaceholder()
          ? _value.projectTypeId
          // ignore: cast_nullable_to_non_nullable
          : projectTypeId as int?,
    );
  }
}

extension $MaterialCategoryStateCopyWith on MaterialCategoryState {
  /// Returns a callable class that can be used as follows: `instanceOfMaterialCategoryState.copyWith(...)` or like so:`instanceOfMaterialCategoryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MaterialCategoryStateCWProxy get copyWith =>
      _$MaterialCategoryStateCWProxyImpl(this);
}
