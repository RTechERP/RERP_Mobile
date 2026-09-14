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
    );
  }
}

extension $ProjectListStateCopyWith on ProjectListState {
  /// Returns a callable class that can be used as follows: `instanceOfProjectListState.copyWith(...)` or like so:`instanceOfProjectListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProjectListStateCWProxy get copyWith => _$ProjectListStateCWProxyImpl(this);
}
