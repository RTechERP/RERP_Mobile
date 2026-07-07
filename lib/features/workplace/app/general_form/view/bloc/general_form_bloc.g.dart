// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_form_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GeneralFormStateCWProxy {
  GeneralFormState status(BaseStateStatus status);

  GeneralFormState message(String? message);

  GeneralFormState formItems(List<FormItem> formItems);

  GeneralFormState departments(List<DepartResponse> departments);

  GeneralFormState selectedDepartmentId(int? selectedDepartmentId);

  GeneralFormState searchKeyword(String searchKeyword);

  GeneralFormState detailFiles(List<FormDetailItem> detailFiles);

  GeneralFormState isDetailLoading(bool isDetailLoading);

  GeneralFormState isDownloading(bool isDownloading);

  GeneralFormState downloadMessage(String? downloadMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeneralFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeneralFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  GeneralFormState call({
    BaseStateStatus? status,
    String? message,
    List<FormItem>? formItems,
    List<DepartResponse>? departments,
    int? selectedDepartmentId,
    String? searchKeyword,
    List<FormDetailItem>? detailFiles,
    bool? isDetailLoading,
    bool? isDownloading,
    String? downloadMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeneralFormState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeneralFormState.copyWith.fieldName(...)`
class _$GeneralFormStateCWProxyImpl implements _$GeneralFormStateCWProxy {
  const _$GeneralFormStateCWProxyImpl(this._value);

  final GeneralFormState _value;

  @override
  GeneralFormState status(BaseStateStatus status) => this(status: status);

  @override
  GeneralFormState message(String? message) => this(message: message);

  @override
  GeneralFormState formItems(List<FormItem> formItems) =>
      this(formItems: formItems);

  @override
  GeneralFormState departments(List<DepartResponse> departments) =>
      this(departments: departments);

  @override
  GeneralFormState selectedDepartmentId(int? selectedDepartmentId) =>
      this(selectedDepartmentId: selectedDepartmentId);

  @override
  GeneralFormState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  GeneralFormState detailFiles(List<FormDetailItem> detailFiles) =>
      this(detailFiles: detailFiles);

  @override
  GeneralFormState isDetailLoading(bool isDetailLoading) =>
      this(isDetailLoading: isDetailLoading);

  @override
  GeneralFormState isDownloading(bool isDownloading) =>
      this(isDownloading: isDownloading);

  @override
  GeneralFormState downloadMessage(String? downloadMessage) =>
      this(downloadMessage: downloadMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeneralFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeneralFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  GeneralFormState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? formItems = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? selectedDepartmentId = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? detailFiles = const $CopyWithPlaceholder(),
    Object? isDetailLoading = const $CopyWithPlaceholder(),
    Object? isDownloading = const $CopyWithPlaceholder(),
    Object? downloadMessage = const $CopyWithPlaceholder(),
  }) {
    return GeneralFormState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      formItems: formItems == const $CopyWithPlaceholder() || formItems == null
          ? _value.formItems
          // ignore: cast_nullable_to_non_nullable
          : formItems as List<FormItem>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<DepartResponse>,
      selectedDepartmentId: selectedDepartmentId == const $CopyWithPlaceholder()
          ? _value.selectedDepartmentId
          // ignore: cast_nullable_to_non_nullable
          : selectedDepartmentId as int?,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      detailFiles:
          detailFiles == const $CopyWithPlaceholder() || detailFiles == null
              ? _value.detailFiles
              // ignore: cast_nullable_to_non_nullable
              : detailFiles as List<FormDetailItem>,
      isDetailLoading: isDetailLoading == const $CopyWithPlaceholder() ||
              isDetailLoading == null
          ? _value.isDetailLoading
          // ignore: cast_nullable_to_non_nullable
          : isDetailLoading as bool,
      isDownloading:
          isDownloading == const $CopyWithPlaceholder() || isDownloading == null
              ? _value.isDownloading
              // ignore: cast_nullable_to_non_nullable
              : isDownloading as bool,
      downloadMessage: downloadMessage == const $CopyWithPlaceholder()
          ? _value.downloadMessage
          // ignore: cast_nullable_to_non_nullable
          : downloadMessage as String?,
    );
  }
}

extension $GeneralFormStateCopyWith on GeneralFormState {
  /// Returns a callable class that can be used as follows: `instanceOfGeneralFormState.copyWith(...)` or like so:`instanceOfGeneralFormState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeneralFormStateCWProxy get copyWith => _$GeneralFormStateCWProxyImpl(this);
}
