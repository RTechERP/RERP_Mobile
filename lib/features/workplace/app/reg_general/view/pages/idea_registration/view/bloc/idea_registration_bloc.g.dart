// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea_registration_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IdeaRegistrationStateCWProxy {
  IdeaRegistrationState status(BaseStateStatus status);

  IdeaRegistrationState message(String? message);

  IdeaRegistrationState items(List<IdeaItem> items);

  IdeaRegistrationState catalogs(List<IdeaCatalogItem> catalogs);

  IdeaRegistrationState departments(List<DepartResponse> departments);

  IdeaRegistrationState isSubmitting(bool isSubmitting);

  IdeaRegistrationState submitSuccess(bool submitSuccess);

  IdeaRegistrationState isDeleting(bool isDeleting);

  IdeaRegistrationState deleteSuccess(bool deleteSuccess);

  IdeaRegistrationState dateStart(DateTime? dateStart);

  IdeaRegistrationState dateEnd(DateTime? dateEnd);

  IdeaRegistrationState departmentId(int? departmentId);

  IdeaRegistrationState departmentName(String? departmentName);

  IdeaRegistrationState catalogId(int? catalogId);

  IdeaRegistrationState catalogName(String? catalogName);

  IdeaRegistrationState details(List<IdeaDetailRow> details);

  IdeaRegistrationState employeeId(int? employeeId);

  IdeaRegistrationState currentDepartmentId(int? currentDepartmentId);

  IdeaRegistrationState headOfDepartment(int? headOfDepartment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdeaRegistrationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdeaRegistrationState(...).copyWith(id: 12, name: "My name")
  /// ````
  IdeaRegistrationState call({
    BaseStateStatus? status,
    String? message,
    List<IdeaItem>? items,
    List<IdeaCatalogItem>? catalogs,
    List<DepartResponse>? departments,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? isDeleting,
    bool? deleteSuccess,
    DateTime? dateStart,
    DateTime? dateEnd,
    int? departmentId,
    String? departmentName,
    int? catalogId,
    String? catalogName,
    List<IdeaDetailRow>? details,
    int? employeeId,
    int? currentDepartmentId,
    int? headOfDepartment,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIdeaRegistrationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIdeaRegistrationState.copyWith.fieldName(...)`
class _$IdeaRegistrationStateCWProxyImpl
    implements _$IdeaRegistrationStateCWProxy {
  const _$IdeaRegistrationStateCWProxyImpl(this._value);

  final IdeaRegistrationState _value;

  @override
  IdeaRegistrationState status(BaseStateStatus status) => this(status: status);

  @override
  IdeaRegistrationState message(String? message) => this(message: message);

  @override
  IdeaRegistrationState items(List<IdeaItem> items) => this(items: items);

  @override
  IdeaRegistrationState catalogs(List<IdeaCatalogItem> catalogs) =>
      this(catalogs: catalogs);

  @override
  IdeaRegistrationState departments(List<DepartResponse> departments) =>
      this(departments: departments);

  @override
  IdeaRegistrationState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  IdeaRegistrationState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  IdeaRegistrationState isDeleting(bool isDeleting) =>
      this(isDeleting: isDeleting);

  @override
  IdeaRegistrationState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  IdeaRegistrationState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  IdeaRegistrationState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  IdeaRegistrationState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  IdeaRegistrationState departmentName(String? departmentName) =>
      this(departmentName: departmentName);

  @override
  IdeaRegistrationState catalogId(int? catalogId) => this(catalogId: catalogId);

  @override
  IdeaRegistrationState catalogName(String? catalogName) =>
      this(catalogName: catalogName);

  @override
  IdeaRegistrationState details(List<IdeaDetailRow> details) =>
      this(details: details);

  @override
  IdeaRegistrationState employeeId(int? employeeId) =>
      this(employeeId: employeeId);

  @override
  IdeaRegistrationState currentDepartmentId(int? currentDepartmentId) =>
      this(currentDepartmentId: currentDepartmentId);

  @override
  IdeaRegistrationState headOfDepartment(int? headOfDepartment) =>
      this(headOfDepartment: headOfDepartment);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdeaRegistrationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdeaRegistrationState(...).copyWith(id: 12, name: "My name")
  /// ````
  IdeaRegistrationState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? catalogs = const $CopyWithPlaceholder(),
    Object? departments = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? departmentName = const $CopyWithPlaceholder(),
    Object? catalogId = const $CopyWithPlaceholder(),
    Object? catalogName = const $CopyWithPlaceholder(),
    Object? details = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? currentDepartmentId = const $CopyWithPlaceholder(),
    Object? headOfDepartment = const $CopyWithPlaceholder(),
  }) {
    return IdeaRegistrationState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<IdeaItem>,
      catalogs: catalogs == const $CopyWithPlaceholder() || catalogs == null
          ? _value.catalogs
          // ignore: cast_nullable_to_non_nullable
          : catalogs as List<IdeaCatalogItem>,
      departments:
          departments == const $CopyWithPlaceholder() || departments == null
              ? _value.departments
              // ignore: cast_nullable_to_non_nullable
              : departments as List<DepartResponse>,
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
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      departmentName: departmentName == const $CopyWithPlaceholder()
          ? _value.departmentName
          // ignore: cast_nullable_to_non_nullable
          : departmentName as String?,
      catalogId: catalogId == const $CopyWithPlaceholder()
          ? _value.catalogId
          // ignore: cast_nullable_to_non_nullable
          : catalogId as int?,
      catalogName: catalogName == const $CopyWithPlaceholder()
          ? _value.catalogName
          // ignore: cast_nullable_to_non_nullable
          : catalogName as String?,
      details: details == const $CopyWithPlaceholder() || details == null
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as List<IdeaDetailRow>,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      currentDepartmentId: currentDepartmentId == const $CopyWithPlaceholder()
          ? _value.currentDepartmentId
          // ignore: cast_nullable_to_non_nullable
          : currentDepartmentId as int?,
      headOfDepartment: headOfDepartment == const $CopyWithPlaceholder()
          ? _value.headOfDepartment
          // ignore: cast_nullable_to_non_nullable
          : headOfDepartment as int?,
    );
  }
}

extension $IdeaRegistrationStateCopyWith on IdeaRegistrationState {
  /// Returns a callable class that can be used as follows: `instanceOfIdeaRegistrationState.copyWith(...)` or like so:`instanceOfIdeaRegistrationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IdeaRegistrationStateCWProxy get copyWith =>
      _$IdeaRegistrationStateCWProxyImpl(this);
}
