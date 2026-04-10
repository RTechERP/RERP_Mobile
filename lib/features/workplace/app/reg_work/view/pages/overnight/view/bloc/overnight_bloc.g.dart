// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overnight_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OvernightStateCWProxy {
  OvernightState status(BaseStateStatus status);

  OvernightState message(String? message);

  OvernightState overnight(List<OvernightItem> overnight);

  OvernightState approvers(List<ApproverItem> approvers);

  OvernightState isSubmitting(bool isSubmitting);

  OvernightState submitSuccess(bool submitSuccess);

  OvernightState deleteSuccess(bool deleteSuccess);

  OvernightState isDeleting(bool isDeleting);

  OvernightState employeeId(int? employeeId);

  OvernightState loginName(String? loginName);

  OvernightState dateStart(DateTime? dateStart);

  OvernightState dateEnd(DateTime? dateEnd);

  OvernightState isSupplementaryRegistrationOpen(
      bool isSupplementaryRegistrationOpen);

  OvernightState isFetchingDetail(bool isFetchingDetail);

  OvernightState editSuccess(bool editSuccess);

  OvernightState approveId(FillApproverItem? approveId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OvernightState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OvernightState(...).copyWith(id: 12, name: "My name")
  /// ````
  OvernightState call({
    BaseStateStatus? status,
    String? message,
    List<OvernightItem>? overnight,
    List<ApproverItem>? approvers,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
    DateTime? dateStart,
    DateTime? dateEnd,
    bool? isSupplementaryRegistrationOpen,
    bool? isFetchingDetail,
    bool? editSuccess,
    FillApproverItem? approveId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOvernightState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOvernightState.copyWith.fieldName(...)`
class _$OvernightStateCWProxyImpl implements _$OvernightStateCWProxy {
  const _$OvernightStateCWProxyImpl(this._value);

  final OvernightState _value;

  @override
  OvernightState status(BaseStateStatus status) => this(status: status);

  @override
  OvernightState message(String? message) => this(message: message);

  @override
  OvernightState overnight(List<OvernightItem> overnight) =>
      this(overnight: overnight);

  @override
  OvernightState approvers(List<ApproverItem> approvers) =>
      this(approvers: approvers);

  @override
  OvernightState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  OvernightState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  OvernightState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  OvernightState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  OvernightState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  OvernightState loginName(String? loginName) => this(loginName: loginName);

  @override
  OvernightState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  OvernightState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  OvernightState isSupplementaryRegistrationOpen(
          bool isSupplementaryRegistrationOpen) =>
      this(isSupplementaryRegistrationOpen: isSupplementaryRegistrationOpen);

  @override
  OvernightState isFetchingDetail(bool isFetchingDetail) =>
      this(isFetchingDetail: isFetchingDetail);

  @override
  OvernightState editSuccess(bool editSuccess) =>
      this(editSuccess: editSuccess);

  @override
  OvernightState approveId(FillApproverItem? approveId) =>
      this(approveId: approveId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OvernightState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OvernightState(...).copyWith(id: 12, name: "My name")
  /// ````
  OvernightState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? overnight = const $CopyWithPlaceholder(),
    Object? approvers = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? isSupplementaryRegistrationOpen = const $CopyWithPlaceholder(),
    Object? isFetchingDetail = const $CopyWithPlaceholder(),
    Object? editSuccess = const $CopyWithPlaceholder(),
    Object? approveId = const $CopyWithPlaceholder(),
  }) {
    return OvernightState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      overnight: overnight == const $CopyWithPlaceholder() || overnight == null
          ? _value.overnight
          // ignore: cast_nullable_to_non_nullable
          : overnight as List<OvernightItem>,
      approvers: approvers == const $CopyWithPlaceholder() || approvers == null
          ? _value.approvers
          // ignore: cast_nullable_to_non_nullable
          : approvers as List<ApproverItem>,
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
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      loginName: loginName == const $CopyWithPlaceholder()
          ? _value.loginName
          // ignore: cast_nullable_to_non_nullable
          : loginName as String?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      isSupplementaryRegistrationOpen:
          isSupplementaryRegistrationOpen == const $CopyWithPlaceholder() ||
                  isSupplementaryRegistrationOpen == null
              ? _value.isSupplementaryRegistrationOpen
              // ignore: cast_nullable_to_non_nullable
              : isSupplementaryRegistrationOpen as bool,
      isFetchingDetail: isFetchingDetail == const $CopyWithPlaceholder() ||
              isFetchingDetail == null
          ? _value.isFetchingDetail
          // ignore: cast_nullable_to_non_nullable
          : isFetchingDetail as bool,
      editSuccess:
          editSuccess == const $CopyWithPlaceholder() || editSuccess == null
              ? _value.editSuccess
              // ignore: cast_nullable_to_non_nullable
              : editSuccess as bool,
      approveId: approveId == const $CopyWithPlaceholder()
          ? _value.approveId
          // ignore: cast_nullable_to_non_nullable
          : approveId as FillApproverItem?,
    );
  }
}

extension $OvernightStateCopyWith on OvernightState {
  /// Returns a callable class that can be used as follows: `instanceOfOvernightState.copyWith(...)` or like so:`instanceOfOvernightState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OvernightStateCWProxy get copyWith => _$OvernightStateCWProxyImpl(this);
}
