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

  OvertimeState detailFile(OvertimeFileItem? detailFile);

  OvertimeState detailProjectItemLink(
      OvertimeProjectItemLink? detailProjectItemLink);

  OvertimeState approveId(FillApproverItem? approveId);

  OvertimeState isProjectRequired(bool isProjectRequired);

  OvertimeState isProjectItemRequired(bool isProjectItemRequired);

  OvertimeState departmentRequireProjectItemIds(
      List<int> departmentRequireProjectItemIds);

  OvertimeState projectItems(Map<int, List<OvertimeProjectItem>> projectItems);

  OvertimeState projectItemsAll(
      Map<int, List<OvertimeProjectItem>> projectItemsAll);

  OvertimeState loadingProjectItemIds(Set<int> loadingProjectItemIds);

  OvertimeState loadedProjectItemIds(Set<int> loadedProjectItemIds);

  OvertimeState loadedProjectItemAllIds(Set<int> loadedProjectItemAllIds);

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
    OvertimeFileItem? detailFile,
    OvertimeProjectItemLink? detailProjectItemLink,
    FillApproverItem? approveId,
    bool? isProjectRequired,
    bool? isProjectItemRequired,
    List<int>? departmentRequireProjectItemIds,
    Map<int, List<OvertimeProjectItem>>? projectItems,
    Map<int, List<OvertimeProjectItem>>? projectItemsAll,
    Set<int>? loadingProjectItemIds,
    Set<int>? loadedProjectItemIds,
    Set<int>? loadedProjectItemAllIds,
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
  OvertimeState detailFile(OvertimeFileItem? detailFile) =>
      this(detailFile: detailFile);

  @override
  OvertimeState detailProjectItemLink(
          OvertimeProjectItemLink? detailProjectItemLink) =>
      this(detailProjectItemLink: detailProjectItemLink);

  @override
  OvertimeState approveId(FillApproverItem? approveId) =>
      this(approveId: approveId);

  @override
  OvertimeState isProjectRequired(bool isProjectRequired) =>
      this(isProjectRequired: isProjectRequired);

  @override
  OvertimeState isProjectItemRequired(bool isProjectItemRequired) =>
      this(isProjectItemRequired: isProjectItemRequired);

  @override
  OvertimeState departmentRequireProjectItemIds(
          List<int> departmentRequireProjectItemIds) =>
      this(departmentRequireProjectItemIds: departmentRequireProjectItemIds);

  @override
  OvertimeState projectItems(
          Map<int, List<OvertimeProjectItem>> projectItems) =>
      this(projectItems: projectItems);

  @override
  OvertimeState projectItemsAll(
          Map<int, List<OvertimeProjectItem>> projectItemsAll) =>
      this(projectItemsAll: projectItemsAll);

  @override
  OvertimeState loadingProjectItemIds(Set<int> loadingProjectItemIds) =>
      this(loadingProjectItemIds: loadingProjectItemIds);

  @override
  OvertimeState loadedProjectItemIds(Set<int> loadedProjectItemIds) =>
      this(loadedProjectItemIds: loadedProjectItemIds);

  @override
  OvertimeState loadedProjectItemAllIds(Set<int> loadedProjectItemAllIds) =>
      this(loadedProjectItemAllIds: loadedProjectItemAllIds);

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
    Object? detailFile = const $CopyWithPlaceholder(),
    Object? detailProjectItemLink = const $CopyWithPlaceholder(),
    Object? approveId = const $CopyWithPlaceholder(),
    Object? isProjectRequired = const $CopyWithPlaceholder(),
    Object? isProjectItemRequired = const $CopyWithPlaceholder(),
    Object? departmentRequireProjectItemIds = const $CopyWithPlaceholder(),
    Object? projectItems = const $CopyWithPlaceholder(),
    Object? projectItemsAll = const $CopyWithPlaceholder(),
    Object? loadingProjectItemIds = const $CopyWithPlaceholder(),
    Object? loadedProjectItemIds = const $CopyWithPlaceholder(),
    Object? loadedProjectItemAllIds = const $CopyWithPlaceholder(),
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
      detailFile: detailFile == const $CopyWithPlaceholder()
          ? _value.detailFile
          // ignore: cast_nullable_to_non_nullable
          : detailFile as OvertimeFileItem?,
      detailProjectItemLink:
          detailProjectItemLink == const $CopyWithPlaceholder()
              ? _value.detailProjectItemLink
              // ignore: cast_nullable_to_non_nullable
              : detailProjectItemLink as OvertimeProjectItemLink?,
      approveId: approveId == const $CopyWithPlaceholder()
          ? _value.approveId
          // ignore: cast_nullable_to_non_nullable
          : approveId as FillApproverItem?,
      isProjectRequired: isProjectRequired == const $CopyWithPlaceholder() ||
              isProjectRequired == null
          ? _value.isProjectRequired
          // ignore: cast_nullable_to_non_nullable
          : isProjectRequired as bool,
      isProjectItemRequired:
          isProjectItemRequired == const $CopyWithPlaceholder() ||
                  isProjectItemRequired == null
              ? _value.isProjectItemRequired
              // ignore: cast_nullable_to_non_nullable
              : isProjectItemRequired as bool,
      departmentRequireProjectItemIds:
          departmentRequireProjectItemIds == const $CopyWithPlaceholder() ||
                  departmentRequireProjectItemIds == null
              ? _value.departmentRequireProjectItemIds
              // ignore: cast_nullable_to_non_nullable
              : departmentRequireProjectItemIds as List<int>,
      projectItems:
          projectItems == const $CopyWithPlaceholder() || projectItems == null
              ? _value.projectItems
              // ignore: cast_nullable_to_non_nullable
              : projectItems as Map<int, List<OvertimeProjectItem>>,
      projectItemsAll: projectItemsAll == const $CopyWithPlaceholder() ||
              projectItemsAll == null
          ? _value.projectItemsAll
          // ignore: cast_nullable_to_non_nullable
          : projectItemsAll as Map<int, List<OvertimeProjectItem>>,
      loadingProjectItemIds:
          loadingProjectItemIds == const $CopyWithPlaceholder() ||
                  loadingProjectItemIds == null
              ? _value.loadingProjectItemIds
              // ignore: cast_nullable_to_non_nullable
              : loadingProjectItemIds as Set<int>,
      loadedProjectItemIds:
          loadedProjectItemIds == const $CopyWithPlaceholder() ||
                  loadedProjectItemIds == null
              ? _value.loadedProjectItemIds
              // ignore: cast_nullable_to_non_nullable
              : loadedProjectItemIds as Set<int>,
      loadedProjectItemAllIds:
          loadedProjectItemAllIds == const $CopyWithPlaceholder() ||
                  loadedProjectItemAllIds == null
              ? _value.loadedProjectItemAllIds
              // ignore: cast_nullable_to_non_nullable
              : loadedProjectItemAllIds as Set<int>,
    );
  }
}

extension $OvertimeStateCopyWith on OvertimeState {
  /// Returns a callable class that can be used as follows: `instanceOfOvertimeState.copyWith(...)` or like so:`instanceOfOvertimeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OvertimeStateCWProxy get copyWith => _$OvertimeStateCWProxyImpl(this);
}
