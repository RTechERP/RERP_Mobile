// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_trip_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkTripStateCWProxy {
  WorkTripState status(BaseStateStatus status);

  WorkTripState message(String? message);

  WorkTripState workTrips(List<WorkTripItem> workTrips);

  WorkTripState approvers(List<ApproverItem> approvers);

  WorkTripState workTripTypes(List<WorkTripTypeItem> workTripTypes);

  WorkTripState workTripVehicles(List<WorkTripTypeVehicle> workTripVehicles);

  WorkTripState workTripProjects(List<WorkTripProject> workTripProjects);

  WorkTripState isSubmitting(bool isSubmitting);

  WorkTripState submitSuccess(bool submitSuccess);

  WorkTripState deleteSuccess(bool deleteSuccess);

  WorkTripState isDeleting(bool isDeleting);

  WorkTripState employeeId(int? employeeId);

  WorkTripState loginName(String? loginName);

  WorkTripState dateStart(DateTime? dateStart);

  WorkTripState dateEnd(DateTime? dateEnd);

  WorkTripState detailItem(WorkTripDetailItem? detailItem);

  WorkTripState isFetchingDetail(bool isFetchingDetail);

  WorkTripState isSupplementaryRegistrationOpen(
      bool isSupplementaryRegistrationOpen);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkTripState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkTripState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkTripState call({
    BaseStateStatus? status,
    String? message,
    List<WorkTripItem>? workTrips,
    List<ApproverItem>? approvers,
    List<WorkTripTypeItem>? workTripTypes,
    List<WorkTripTypeVehicle>? workTripVehicles,
    List<WorkTripProject>? workTripProjects,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
    DateTime? dateStart,
    DateTime? dateEnd,
    WorkTripDetailItem? detailItem,
    bool? isFetchingDetail,
    bool? isSupplementaryRegistrationOpen,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkTripState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkTripState.copyWith.fieldName(...)`
class _$WorkTripStateCWProxyImpl implements _$WorkTripStateCWProxy {
  const _$WorkTripStateCWProxyImpl(this._value);

  final WorkTripState _value;

  @override
  WorkTripState status(BaseStateStatus status) => this(status: status);

  @override
  WorkTripState message(String? message) => this(message: message);

  @override
  WorkTripState workTrips(List<WorkTripItem> workTrips) =>
      this(workTrips: workTrips);

  @override
  WorkTripState approvers(List<ApproverItem> approvers) =>
      this(approvers: approvers);

  @override
  WorkTripState workTripTypes(List<WorkTripTypeItem> workTripTypes) =>
      this(workTripTypes: workTripTypes);

  @override
  WorkTripState workTripVehicles(List<WorkTripTypeVehicle> workTripVehicles) =>
      this(workTripVehicles: workTripVehicles);

  @override
  WorkTripState workTripProjects(List<WorkTripProject> workTripProjects) =>
      this(workTripProjects: workTripProjects);

  @override
  WorkTripState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  WorkTripState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  WorkTripState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  WorkTripState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  WorkTripState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  WorkTripState loginName(String? loginName) => this(loginName: loginName);

  @override
  WorkTripState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  WorkTripState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  WorkTripState detailItem(WorkTripDetailItem? detailItem) =>
      this(detailItem: detailItem);

  @override
  WorkTripState isFetchingDetail(bool isFetchingDetail) =>
      this(isFetchingDetail: isFetchingDetail);

  @override
  WorkTripState isSupplementaryRegistrationOpen(
          bool isSupplementaryRegistrationOpen) =>
      this(isSupplementaryRegistrationOpen: isSupplementaryRegistrationOpen);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkTripState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkTripState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkTripState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? workTrips = const $CopyWithPlaceholder(),
    Object? approvers = const $CopyWithPlaceholder(),
    Object? workTripTypes = const $CopyWithPlaceholder(),
    Object? workTripVehicles = const $CopyWithPlaceholder(),
    Object? workTripProjects = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? detailItem = const $CopyWithPlaceholder(),
    Object? isFetchingDetail = const $CopyWithPlaceholder(),
    Object? isSupplementaryRegistrationOpen = const $CopyWithPlaceholder(),
  }) {
    return WorkTripState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      workTrips: workTrips == const $CopyWithPlaceholder() || workTrips == null
          ? _value.workTrips
          // ignore: cast_nullable_to_non_nullable
          : workTrips as List<WorkTripItem>,
      approvers: approvers == const $CopyWithPlaceholder() || approvers == null
          ? _value.approvers
          // ignore: cast_nullable_to_non_nullable
          : approvers as List<ApproverItem>,
      workTripTypes:
          workTripTypes == const $CopyWithPlaceholder() || workTripTypes == null
              ? _value.workTripTypes
              // ignore: cast_nullable_to_non_nullable
              : workTripTypes as List<WorkTripTypeItem>,
      workTripVehicles: workTripVehicles == const $CopyWithPlaceholder() ||
              workTripVehicles == null
          ? _value.workTripVehicles
          // ignore: cast_nullable_to_non_nullable
          : workTripVehicles as List<WorkTripTypeVehicle>,
      workTripProjects: workTripProjects == const $CopyWithPlaceholder() ||
              workTripProjects == null
          ? _value.workTripProjects
          // ignore: cast_nullable_to_non_nullable
          : workTripProjects as List<WorkTripProject>,
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
      detailItem: detailItem == const $CopyWithPlaceholder()
          ? _value.detailItem
          // ignore: cast_nullable_to_non_nullable
          : detailItem as WorkTripDetailItem?,
      isFetchingDetail: isFetchingDetail == const $CopyWithPlaceholder() ||
              isFetchingDetail == null
          ? _value.isFetchingDetail
          // ignore: cast_nullable_to_non_nullable
          : isFetchingDetail as bool,
      isSupplementaryRegistrationOpen:
          isSupplementaryRegistrationOpen == const $CopyWithPlaceholder() ||
                  isSupplementaryRegistrationOpen == null
              ? _value.isSupplementaryRegistrationOpen
              // ignore: cast_nullable_to_non_nullable
              : isSupplementaryRegistrationOpen as bool,
    );
  }
}

extension $WorkTripStateCopyWith on WorkTripState {
  /// Returns a callable class that can be used as follows: `instanceOfWorkTripState.copyWith(...)` or like so:`instanceOfWorkTripState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkTripStateCWProxy get copyWith => _$WorkTripStateCWProxyImpl(this);
}
