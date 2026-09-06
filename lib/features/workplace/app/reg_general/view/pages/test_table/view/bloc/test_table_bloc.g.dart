// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_table_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TestTableStateCWProxy {
  TestTableState status(BaseStateStatus status);

  TestTableState message(String? message);

  TestTableState testCard(List<TestCardItem> testCard);

  TestTableState testTable(List<TestTableItem> testTable);

  TestTableState employee(List<EmployeeInfoItem> employee);

  TestTableState project(List<ProjectItem> project);

  TestTableState keyword(String keyword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestTableState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestTableState(...).copyWith(id: 12, name: "My name")
  /// ````
  TestTableState call({
    BaseStateStatus? status,
    String? message,
    List<TestCardItem>? testCard,
    List<TestTableItem>? testTable,
    List<EmployeeInfoItem>? employee,
    List<ProjectItem>? project,
    String? keyword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTestTableState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTestTableState.copyWith.fieldName(...)`
class _$TestTableStateCWProxyImpl implements _$TestTableStateCWProxy {
  const _$TestTableStateCWProxyImpl(this._value);

  final TestTableState _value;

  @override
  TestTableState status(BaseStateStatus status) => this(status: status);

  @override
  TestTableState message(String? message) => this(message: message);

  @override
  TestTableState testCard(List<TestCardItem> testCard) =>
      this(testCard: testCard);

  @override
  TestTableState testTable(List<TestTableItem> testTable) =>
      this(testTable: testTable);

  @override
  TestTableState employee(List<EmployeeInfoItem> employee) =>
      this(employee: employee);

  @override
  TestTableState project(List<ProjectItem> project) => this(project: project);

  @override
  TestTableState keyword(String keyword) => this(keyword: keyword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestTableState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestTableState(...).copyWith(id: 12, name: "My name")
  /// ````
  TestTableState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? testCard = const $CopyWithPlaceholder(),
    Object? testTable = const $CopyWithPlaceholder(),
    Object? employee = const $CopyWithPlaceholder(),
    Object? project = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
  }) {
    return TestTableState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      testCard: testCard == const $CopyWithPlaceholder() || testCard == null
          ? _value.testCard
          // ignore: cast_nullable_to_non_nullable
          : testCard as List<TestCardItem>,
      testTable: testTable == const $CopyWithPlaceholder() || testTable == null
          ? _value.testTable
          // ignore: cast_nullable_to_non_nullable
          : testTable as List<TestTableItem>,
      employee: employee == const $CopyWithPlaceholder() || employee == null
          ? _value.employee
          // ignore: cast_nullable_to_non_nullable
          : employee as List<EmployeeInfoItem>,
      project: project == const $CopyWithPlaceholder() || project == null
          ? _value.project
          // ignore: cast_nullable_to_non_nullable
          : project as List<ProjectItem>,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
    );
  }
}

extension $TestTableStateCopyWith on TestTableState {
  /// Returns a callable class that can be used as follows: `instanceOfTestTableState.copyWith(...)` or like so:`instanceOfTestTableState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestTableStateCWProxy get copyWith => _$TestTableStateCWProxyImpl(this);
}
