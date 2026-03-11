// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SaleStateCWProxy {
  SaleState status(BaseStateStatus status);

  SaleState message(String? message);

  SaleState reports(List<SaleReportItem> reports);

  SaleState projects(List<SaleProjectResponse> projects);

  SaleState staffWorks(List<SaleStaffWork> staffWorks);

  SaleState userId(int? userId);

  SaleState fullName(String? fullName);

  SaleState departmentId(int? departmentId);

  SaleState teamId(int? teamId);

  SaleState employeeID(int? employeeID);

  SaleState positionName(String? positionName);

  SaleState departmentName(String? departmentName);

  SaleState positionId(int? positionId);

  SaleState dateStart(DateTime? dateStart);

  SaleState dateEnd(DateTime? dateEnd);

  SaleState keyword(String? keyword);

  SaleState isDeleting(bool isDeleting);

  SaleState isSubmitting(bool isSubmitting);

  SaleState submitSuccess(bool submitSuccess);

  SaleState expandedWorkIndex(int? expandedWorkIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaleState call({
    BaseStateStatus? status,
    String? message,
    List<SaleReportItem>? reports,
    List<SaleProjectResponse>? projects,
    List<SaleStaffWork>? staffWorks,
    int? userId,
    String? fullName,
    int? departmentId,
    int? teamId,
    int? employeeID,
    String? positionName,
    String? departmentName,
    int? positionId,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    bool? isDeleting,
    bool? isSubmitting,
    bool? submitSuccess,
    int? expandedWorkIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSaleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSaleState.copyWith.fieldName(...)`
class _$SaleStateCWProxyImpl implements _$SaleStateCWProxy {
  const _$SaleStateCWProxyImpl(this._value);

  final SaleState _value;

  @override
  SaleState status(BaseStateStatus status) => this(status: status);

  @override
  SaleState message(String? message) => this(message: message);

  @override
  SaleState reports(List<SaleReportItem> reports) => this(reports: reports);

  @override
  SaleState projects(List<SaleProjectResponse> projects) =>
      this(projects: projects);

  @override
  SaleState staffWorks(List<SaleStaffWork> staffWorks) =>
      this(staffWorks: staffWorks);

  @override
  SaleState userId(int? userId) => this(userId: userId);

  @override
  SaleState fullName(String? fullName) => this(fullName: fullName);

  @override
  SaleState departmentId(int? departmentId) => this(departmentId: departmentId);

  @override
  SaleState teamId(int? teamId) => this(teamId: teamId);

  @override
  SaleState employeeID(int? employeeID) => this(employeeID: employeeID);

  @override
  SaleState positionName(String? positionName) =>
      this(positionName: positionName);

  @override
  SaleState departmentName(String? departmentName) =>
      this(departmentName: departmentName);

  @override
  SaleState positionId(int? positionId) => this(positionId: positionId);

  @override
  SaleState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  SaleState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  SaleState keyword(String? keyword) => this(keyword: keyword);

  @override
  SaleState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  SaleState isSubmitting(bool isSubmitting) => this(isSubmitting: isSubmitting);

  @override
  SaleState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  SaleState expandedWorkIndex(int? expandedWorkIndex) =>
      this(expandedWorkIndex: expandedWorkIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaleState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? reports = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? staffWorks = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? teamId = const $CopyWithPlaceholder(),
    Object? employeeID = const $CopyWithPlaceholder(),
    Object? positionName = const $CopyWithPlaceholder(),
    Object? departmentName = const $CopyWithPlaceholder(),
    Object? positionId = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? expandedWorkIndex = const $CopyWithPlaceholder(),
  }) {
    return SaleState(
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
          : reports as List<SaleReportItem>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<SaleProjectResponse>,
      staffWorks:
          staffWorks == const $CopyWithPlaceholder() || staffWorks == null
              ? _value.staffWorks
              // ignore: cast_nullable_to_non_nullable
              : staffWorks as List<SaleStaffWork>,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int?,
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      teamId: teamId == const $CopyWithPlaceholder()
          ? _value.teamId
          // ignore: cast_nullable_to_non_nullable
          : teamId as int?,
      employeeID: employeeID == const $CopyWithPlaceholder()
          ? _value.employeeID
          // ignore: cast_nullable_to_non_nullable
          : employeeID as int?,
      positionName: positionName == const $CopyWithPlaceholder()
          ? _value.positionName
          // ignore: cast_nullable_to_non_nullable
          : positionName as String?,
      departmentName: departmentName == const $CopyWithPlaceholder()
          ? _value.departmentName
          // ignore: cast_nullable_to_non_nullable
          : departmentName as String?,
      positionId: positionId == const $CopyWithPlaceholder()
          ? _value.positionId
          // ignore: cast_nullable_to_non_nullable
          : positionId as int?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      keyword: keyword == const $CopyWithPlaceholder()
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String?,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
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
      expandedWorkIndex: expandedWorkIndex == const $CopyWithPlaceholder()
          ? _value.expandedWorkIndex
          // ignore: cast_nullable_to_non_nullable
          : expandedWorkIndex as int?,
    );
  }
}

extension $SaleStateCopyWith on SaleState {
  /// Returns a callable class that can be used as follows: `instanceOfSaleState.copyWith(...)` or like so:`instanceOfSaleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SaleStateCWProxy get copyWith => _$SaleStateCWProxyImpl(this);
}
