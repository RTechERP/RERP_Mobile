// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProjectListStateCWProxy {
  ProjectListState status(BaseStateStatus status);

  ProjectListState message(String? message);

  ProjectListState projects(List<ProjectItem> projects);

  ProjectListState searchKeyword(String searchKeyword);

  ProjectListState dateStart(DateTime? dateStart);

  ProjectListState dateEnd(DateTime? dateEnd);

  ProjectListState filters(ProjectFilters filters);

  ProjectListState customers(List<CustomerItem> customers);

  ProjectListState projectTypes(List<ProjectTypeItem> projectTypes);

  ProjectListState statuses(List<ProjectStatusItem> statuses);

  ProjectListState users(List<UserItem> users);

  ProjectListState pms(List<PmItem> pms);

  ProjectListState businessFields(List<BusinessFieldItem> businessFields);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProjectListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProjectListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProjectListState call({
    BaseStateStatus? status,
    String? message,
    List<ProjectItem>? projects,
    String? searchKeyword,
    DateTime? dateStart,
    DateTime? dateEnd,
    ProjectFilters? filters,
    List<CustomerItem>? customers,
    List<ProjectTypeItem>? projectTypes,
    List<ProjectStatusItem>? statuses,
    List<UserItem>? users,
    List<PmItem>? pms,
    List<BusinessFieldItem>? businessFields,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProjectListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProjectListState.copyWith.fieldName(...)`
class _$ProjectListStateCWProxyImpl implements _$ProjectListStateCWProxy {
  const _$ProjectListStateCWProxyImpl(this._value);

  final ProjectListState _value;

  @override
  ProjectListState status(BaseStateStatus status) => this(status: status);

  @override
  ProjectListState message(String? message) => this(message: message);

  @override
  ProjectListState projects(List<ProjectItem> projects) =>
      this(projects: projects);

  @override
  ProjectListState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  ProjectListState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  ProjectListState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  ProjectListState filters(ProjectFilters filters) => this(filters: filters);

  @override
  ProjectListState customers(List<CustomerItem> customers) =>
      this(customers: customers);

  @override
  ProjectListState projectTypes(List<ProjectTypeItem> projectTypes) =>
      this(projectTypes: projectTypes);

  @override
  ProjectListState statuses(List<ProjectStatusItem> statuses) =>
      this(statuses: statuses);

  @override
  ProjectListState users(List<UserItem> users) => this(users: users);

  @override
  ProjectListState pms(List<PmItem> pms) => this(pms: pms);

  @override
  ProjectListState businessFields(List<BusinessFieldItem> businessFields) =>
      this(businessFields: businessFields);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProjectListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProjectListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProjectListState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? filters = const $CopyWithPlaceholder(),
    Object? customers = const $CopyWithPlaceholder(),
    Object? projectTypes = const $CopyWithPlaceholder(),
    Object? statuses = const $CopyWithPlaceholder(),
    Object? users = const $CopyWithPlaceholder(),
    Object? pms = const $CopyWithPlaceholder(),
    Object? businessFields = const $CopyWithPlaceholder(),
  }) {
    return ProjectListState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<ProjectItem>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      filters: filters == const $CopyWithPlaceholder() || filters == null
          ? _value.filters
          // ignore: cast_nullable_to_non_nullable
          : filters as ProjectFilters,
      customers: customers == const $CopyWithPlaceholder() || customers == null
          ? _value.customers
          // ignore: cast_nullable_to_non_nullable
          : customers as List<CustomerItem>,
      projectTypes:
          projectTypes == const $CopyWithPlaceholder() || projectTypes == null
              ? _value.projectTypes
              // ignore: cast_nullable_to_non_nullable
              : projectTypes as List<ProjectTypeItem>,
      statuses: statuses == const $CopyWithPlaceholder() || statuses == null
          ? _value.statuses
          // ignore: cast_nullable_to_non_nullable
          : statuses as List<ProjectStatusItem>,
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<UserItem>,
      pms: pms == const $CopyWithPlaceholder() || pms == null
          ? _value.pms
          // ignore: cast_nullable_to_non_nullable
          : pms as List<PmItem>,
      businessFields: businessFields == const $CopyWithPlaceholder() ||
              businessFields == null
          ? _value.businessFields
          // ignore: cast_nullable_to_non_nullable
          : businessFields as List<BusinessFieldItem>,
    );
  }
}

extension $ProjectListStateCopyWith on ProjectListState {
  /// Returns a callable class that can be used as follows: `instanceOfProjectListState.copyWith(...)` or like so:`instanceOfProjectListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProjectListStateCWProxy get copyWith => _$ProjectListStateCWProxyImpl(this);
}
