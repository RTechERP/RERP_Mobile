// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountant_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountantStateCWProxy {
  AccountantState status(BaseStateStatus status);

  AccountantState message(String? message);

  AccountantState reports(List<AccountantItem> reports);

  AccountantState dateStart(DateTime? dateStart);

  AccountantState dateEnd(DateTime? dateEnd);

  AccountantState keyword(String keyword);

  AccountantState page(int page);

  AccountantState size(int size);

  AccountantState hasReachedMax(bool hasReachedMax);

  AccountantState isLoadingMore(bool isLoadingMore);

  AccountantState employeeId(int? employeeId);

  AccountantState fullName(String? fullName);

  AccountantState chucVu(String? chucVu);

  AccountantState isSubmitting(bool isSubmitting);

  AccountantState submitSuccess(bool submitSuccess);

  AccountantState isDeleting(bool isDeleting);

  AccountantState deleteSuccess(bool deleteSuccess);

  AccountantState detailItem(AccountantItem? detailItem);

  AccountantState isFetchingDetail(bool isFetchingDetail);

  AccountantState isUpdating(bool isUpdating);

  AccountantState updateSuccess(bool updateSuccess);

  AccountantState isAccountantAdmin(bool isAccountantAdmin);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountantState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountantState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountantState call({
    BaseStateStatus? status,
    String? message,
    List<AccountantItem>? reports,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? page,
    int? size,
    bool? hasReachedMax,
    bool? isLoadingMore,
    int? employeeId,
    String? fullName,
    String? chucVu,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? isDeleting,
    bool? deleteSuccess,
    AccountantItem? detailItem,
    bool? isFetchingDetail,
    bool? isUpdating,
    bool? updateSuccess,
    bool? isAccountantAdmin,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountantState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountantState.copyWith.fieldName(...)`
class _$AccountantStateCWProxyImpl implements _$AccountantStateCWProxy {
  const _$AccountantStateCWProxyImpl(this._value);

  final AccountantState _value;

  @override
  AccountantState status(BaseStateStatus status) => this(status: status);

  @override
  AccountantState message(String? message) => this(message: message);

  @override
  AccountantState reports(List<AccountantItem> reports) =>
      this(reports: reports);

  @override
  AccountantState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  AccountantState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  AccountantState keyword(String keyword) => this(keyword: keyword);

  @override
  AccountantState page(int page) => this(page: page);

  @override
  AccountantState size(int size) => this(size: size);

  @override
  AccountantState hasReachedMax(bool hasReachedMax) =>
      this(hasReachedMax: hasReachedMax);

  @override
  AccountantState isLoadingMore(bool isLoadingMore) =>
      this(isLoadingMore: isLoadingMore);

  @override
  AccountantState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  AccountantState fullName(String? fullName) => this(fullName: fullName);

  @override
  AccountantState chucVu(String? chucVu) => this(chucVu: chucVu);

  @override
  AccountantState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  AccountantState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  AccountantState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  AccountantState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  AccountantState detailItem(AccountantItem? detailItem) =>
      this(detailItem: detailItem);

  @override
  AccountantState isFetchingDetail(bool isFetchingDetail) =>
      this(isFetchingDetail: isFetchingDetail);

  @override
  AccountantState isUpdating(bool isUpdating) => this(isUpdating: isUpdating);

  @override
  AccountantState updateSuccess(bool updateSuccess) =>
      this(updateSuccess: updateSuccess);

  @override
  AccountantState isAccountantAdmin(bool isAccountantAdmin) =>
      this(isAccountantAdmin: isAccountantAdmin);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountantState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountantState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountantState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? reports = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? hasReachedMax = const $CopyWithPlaceholder(),
    Object? isLoadingMore = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? chucVu = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? detailItem = const $CopyWithPlaceholder(),
    Object? isFetchingDetail = const $CopyWithPlaceholder(),
    Object? isUpdating = const $CopyWithPlaceholder(),
    Object? updateSuccess = const $CopyWithPlaceholder(),
    Object? isAccountantAdmin = const $CopyWithPlaceholder(),
  }) {
    return AccountantState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      reports: reports == const $CopyWithPlaceholder() || reports == null
          ? _value.reports
          // ignore: cast_nullable_to_non_nullable
          : reports as List<AccountantItem>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
      page: page == const $CopyWithPlaceholder() || page == null
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      size: size == const $CopyWithPlaceholder() || size == null
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      hasReachedMax:
          hasReachedMax == const $CopyWithPlaceholder() || hasReachedMax == null
              ? _value.hasReachedMax
              // ignore: cast_nullable_to_non_nullable
              : hasReachedMax as bool,
      isLoadingMore:
          isLoadingMore == const $CopyWithPlaceholder() || isLoadingMore == null
              ? _value.isLoadingMore
              // ignore: cast_nullable_to_non_nullable
              : isLoadingMore as bool,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
      chucVu: chucVu == const $CopyWithPlaceholder()
          ? _value.chucVu
          // ignore: cast_nullable_to_non_nullable
          : chucVu as String?,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      detailItem: detailItem == const $CopyWithPlaceholder()
          ? _value.detailItem
          // ignore: cast_nullable_to_non_nullable
          : detailItem as AccountantItem?,
      isFetchingDetail: isFetchingDetail == const $CopyWithPlaceholder() ||
              isFetchingDetail == null
          ? _value.isFetchingDetail
          // ignore: cast_nullable_to_non_nullable
          : isFetchingDetail as bool,
      isUpdating:
          isUpdating == const $CopyWithPlaceholder() || isUpdating == null
              ? _value.isUpdating
              // ignore: cast_nullable_to_non_nullable
              : isUpdating as bool,
      updateSuccess:
          updateSuccess == const $CopyWithPlaceholder() || updateSuccess == null
              ? _value.updateSuccess
              // ignore: cast_nullable_to_non_nullable
              : updateSuccess as bool,
      isAccountantAdmin: isAccountantAdmin == const $CopyWithPlaceholder() ||
              isAccountantAdmin == null
          ? _value.isAccountantAdmin
          // ignore: cast_nullable_to_non_nullable
          : isAccountantAdmin as bool,
    );
  }
}

extension $AccountantStateCopyWith on AccountantState {
  /// Returns a callable class that can be used as follows: `instanceOfAccountantState.copyWith(...)` or like so:`instanceOfAccountantState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountantStateCWProxy get copyWith => _$AccountantStateCWProxyImpl(this);
}
