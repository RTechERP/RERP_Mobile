// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OvertimeStateCWProxy {
  OvertimeState status(BaseStateStatus status);

  OvertimeState message(String? message);

  OvertimeState overtime(List<OvertimeItem> overtime);

  OvertimeState approvers(List<ApproverItem> approvers);

  OvertimeState overtimeTypes(List<OvertimeType> overtimeTypes);

  OvertimeState overtimeProjects(List<OvertimeProject> overtimeProjects);

  OvertimeState isSubmitting(bool isSubmitting);

  OvertimeState submitSuccess(bool submitSuccess);

  OvertimeState deleteSuccess(bool deleteSuccess);

  OvertimeState isDeleting(bool isDeleting);

  OvertimeState employeeId(int? employeeId);

  OvertimeState loginName(String? loginName);

  OvertimeState dateStart(DateTime? dateStart);

  OvertimeState dateEnd(DateTime? dateEnd);

  OvertimeState isSupplementaryRegistrationOpen(
      bool isSupplementaryRegistrationOpen);

  OvertimeState detailItem(OvertimeDetailItem? detailItem);

  OvertimeState isFetchingDetail(bool isFetchingDetail);

  OvertimeState editSuccess(bool editSuccess);

  OvertimeState approveId(FillApproverItem? approveId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OvertimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OvertimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  OvertimeState call({
    BaseStateStatus? status,
    String? message,
    List<OvertimeItem>? overtime,
    List<ApproverItem>? approvers,
    List<OvertimeType>? overtimeTypes,
    List<OvertimeProject>? overtimeProjects,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
    DateTime? dateStart,
    DateTime? dateEnd,
    bool? isSupplementaryRegistrationOpen,
    OvertimeDetailItem? detailItem,
    bool? isFetchingDetail,
    bool? editSuccess,
    FillApproverItem? approveId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOvertimeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOvertimeState.copyWith.fieldName(...)`
class _$OvertimeStateCWProxyImpl implements _$OvertimeStateCWProxy {
  const _$OvertimeStateCWProxyImpl(this._value);

  final OvertimeState _value;

  @override
  OvertimeState status(BaseStateStatus status) => this(status: status);

  @override
  OvertimeState message(String? message) => this(message: message);

  @override
  OvertimeState overtime(List<OvertimeItem> overtime) =>
      this(overtime: overtime);

  @override
  OvertimeState approvers(List<ApproverItem> approvers) =>
      this(approvers: approvers);

  @override
  OvertimeState overtimeTypes(List<OvertimeType> overtimeTypes) =>
      this(overtimeTypes: overtimeTypes);

  @override
  OvertimeState overtimeProjects(List<OvertimeProject> overtimeProjects) =>
      this(overtimeProjects: overtimeProjects);

  @override
  OvertimeState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  OvertimeState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  OvertimeState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  OvertimeState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  OvertimeState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  OvertimeState loginName(String? loginName) => this(loginName: loginName);

  @override
  OvertimeState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  OvertimeState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  OvertimeState isSupplementaryRegistrationOpen(
          bool isSupplementaryRegistrationOpen) =>
      this(isSupplementaryRegistrationOpen: isSupplementaryRegistrationOpen);

  @override
  OvertimeState detailItem(OvertimeDetailItem? detailItem) =>
      this(detailItem: detailItem);

  @override
  OvertimeState isFetchingDetail(bool isFetchingDetail) =>
      this(isFetchingDetail: isFetchingDetail);

  @override
  OvertimeState editSuccess(bool editSuccess) => this(editSuccess: editSuccess);

  @override
  OvertimeState approveId(FillApproverItem? approveId) =>
      this(approveId: approveId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OvertimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OvertimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  OvertimeState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? overtime = const $CopyWithPlaceholder(),
    Object? approvers = const $CopyWithPlaceholder(),
    Object? overtimeTypes = const $CopyWithPlaceholder(),
    Object? overtimeProjects = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? isSupplementaryRegistrationOpen = const $CopyWithPlaceholder(),
    Object? detailItem = const $CopyWithPlaceholder(),
    Object? isFetchingDetail = const $CopyWithPlaceholder(),
    Object? editSuccess = const $CopyWithPlaceholder(),
    Object? approveId = const $CopyWithPlaceholder(),
  }) {
    return OvertimeState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      overtime: overtime == const $CopyWithPlaceholder() || overtime == null
          ? _value.overtime
          // ignore: cast_nullable_to_non_nullable
          : overtime as List<OvertimeItem>,
      approvers: approvers == const $CopyWithPlaceholder() || approvers == null
          ? _value.approvers
          // ignore: cast_nullable_to_non_nullable
          : approvers as List<ApproverItem>,
      overtimeTypes:
          overtimeTypes == const $CopyWithPlaceholder() || overtimeTypes == null
              ? _value.overtimeTypes
              // ignore: cast_nullable_to_non_nullable
              : overtimeTypes as List<OvertimeType>,
      overtimeProjects: overtimeProjects == const $CopyWithPlaceholder() ||
              overtimeProjects == null
          ? _value.overtimeProjects
          // ignore: cast_nullable_to_non_nullable
          : overtimeProjects as List<OvertimeProject>,
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
      detailItem: detailItem == const $CopyWithPlaceholder()
          ? _value.detailItem
          // ignore: cast_nullable_to_non_nullable
          : detailItem as OvertimeDetailItem?,
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

extension $OvertimeStateCopyWith on OvertimeState {
  /// Returns a callable class that can be used as follows: `instanceOfOvertimeState.copyWith(...)` or like so:`instanceOfOvertimeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OvertimeStateCWProxy get copyWith => _$OvertimeStateCWProxyImpl(this);
}
