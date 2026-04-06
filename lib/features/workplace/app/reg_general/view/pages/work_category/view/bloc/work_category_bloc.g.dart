// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_category_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkCategoryStateCWProxy {
  WorkCategoryState status(BaseStateStatus status);

  WorkCategoryState message(String? message);

  WorkCategoryState workCategories(List<WorkCategoryItem> workCategories);

  WorkCategoryState assigners(List<WorkAssignItem> assigners);

  WorkCategoryState projects(List<WorkProjectItem> projects);

  WorkCategoryState projectTypes(List<WorkProjectTypeItem> projectTypes);

  WorkCategoryState parents(List<WorkParentItem> parents);

  WorkCategoryState isSubmitting(bool isSubmitting);

  WorkCategoryState submitSuccess(bool submitSuccess);

  WorkCategoryState deleteSuccess(bool deleteSuccess);

  WorkCategoryState isDeleting(bool isDeleting);

  WorkCategoryState employeeId(int? employeeId);

  WorkCategoryState loginName(String? loginName);

  WorkCategoryState dateStart(DateTime? dateStart);

  WorkCategoryState dateEnd(DateTime? dateEnd);

  WorkCategoryState isFetchingDetail(bool isFetchingDetail);

  WorkCategoryState editSuccess(bool editSuccess);

  WorkCategoryState defaultAssignerId(int? defaultAssignerId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkCategoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkCategoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkCategoryState call({
    BaseStateStatus? status,
    String? message,
    List<WorkCategoryItem>? workCategories,
    List<WorkAssignItem>? assigners,
    List<WorkProjectItem>? projects,
    List<WorkProjectTypeItem>? projectTypes,
    List<WorkParentItem>? parents,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    bool? isDeleting,
    int? employeeId,
    String? loginName,
    DateTime? dateStart,
    DateTime? dateEnd,
    bool? isFetchingDetail,
    bool? editSuccess,
    int? defaultAssignerId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkCategoryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkCategoryState.copyWith.fieldName(...)`
class _$WorkCategoryStateCWProxyImpl implements _$WorkCategoryStateCWProxy {
  const _$WorkCategoryStateCWProxyImpl(this._value);

  final WorkCategoryState _value;

  @override
  WorkCategoryState status(BaseStateStatus status) => this(status: status);

  @override
  WorkCategoryState message(String? message) => this(message: message);

  @override
  WorkCategoryState workCategories(List<WorkCategoryItem> workCategories) =>
      this(workCategories: workCategories);

  @override
  WorkCategoryState assigners(List<WorkAssignItem> assigners) =>
      this(assigners: assigners);

  @override
  WorkCategoryState projects(List<WorkProjectItem> projects) =>
      this(projects: projects);

  @override
  WorkCategoryState projectTypes(List<WorkProjectTypeItem> projectTypes) =>
      this(projectTypes: projectTypes);

  @override
  WorkCategoryState parents(List<WorkParentItem> parents) =>
      this(parents: parents);

  @override
  WorkCategoryState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  WorkCategoryState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  WorkCategoryState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  WorkCategoryState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  WorkCategoryState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  WorkCategoryState loginName(String? loginName) => this(loginName: loginName);

  @override
  WorkCategoryState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  WorkCategoryState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  WorkCategoryState isFetchingDetail(bool isFetchingDetail) =>
      this(isFetchingDetail: isFetchingDetail);

  @override
  WorkCategoryState editSuccess(bool editSuccess) =>
      this(editSuccess: editSuccess);

  @override
  WorkCategoryState defaultAssignerId(int? defaultAssignerId) =>
      this(defaultAssignerId: defaultAssignerId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkCategoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkCategoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkCategoryState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? workCategories = const $CopyWithPlaceholder(),
    Object? assigners = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? projectTypes = const $CopyWithPlaceholder(),
    Object? parents = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? loginName = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? isFetchingDetail = const $CopyWithPlaceholder(),
    Object? editSuccess = const $CopyWithPlaceholder(),
    Object? defaultAssignerId = const $CopyWithPlaceholder(),
  }) {
    return WorkCategoryState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      workCategories: workCategories == const $CopyWithPlaceholder() ||
              workCategories == null
          ? _value.workCategories
          // ignore: cast_nullable_to_non_nullable
          : workCategories as List<WorkCategoryItem>,
      assigners: assigners == const $CopyWithPlaceholder() || assigners == null
          ? _value.assigners
          // ignore: cast_nullable_to_non_nullable
          : assigners as List<WorkAssignItem>,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<WorkProjectItem>,
      projectTypes:
          projectTypes == const $CopyWithPlaceholder() || projectTypes == null
              ? _value.projectTypes
              // ignore: cast_nullable_to_non_nullable
              : projectTypes as List<WorkProjectTypeItem>,
      parents: parents == const $CopyWithPlaceholder() || parents == null
          ? _value.parents
          // ignore: cast_nullable_to_non_nullable
          : parents as List<WorkParentItem>,
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
      defaultAssignerId: defaultAssignerId == const $CopyWithPlaceholder()
          ? _value.defaultAssignerId
          // ignore: cast_nullable_to_non_nullable
          : defaultAssignerId as int?,
    );
  }
}

extension $WorkCategoryStateCopyWith on WorkCategoryState {
  /// Returns a callable class that can be used as follows: `instanceOfWorkCategoryState.copyWith(...)` or like so:`instanceOfWorkCategoryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkCategoryStateCWProxy get copyWith =>
      _$WorkCategoryStateCWProxyImpl(this);
}
