// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_table_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TestTableStateCWProxy {
  TestTableState status(BaseStateStatus status);

  TestTableState message(String? message);

  TestTableState testCard(List<TestCardItem> testCard);

  TestTableState keyword(String keyword);

  TestTableState statusFilter(int statusFilter);

  TestTableState dateStart(DateTime? dateStart);

  TestTableState dateEnd(DateTime? dateEnd);

  TestTableState testTable(List<TestTableItem> testTable);

  TestTableState employee(List<EmployeeInfoItem> employee);

  TestTableState project(List<ProjectItem> project);

  TestTableState approver(List<ApproverItem> approver);

  TestTableState currentUser(User? currentUser);

  TestTableState lookupFetched(bool lookupFetched);

  TestTableState formData(TestTableFormData formData);

  TestTableState isSubmitting(bool isSubmitting);

  TestTableState submitSuccess(bool submitSuccess);

  TestTableState createdId(int createdId);

  TestTableState conflictMessage(String? conflictMessage);

  TestTableState conflictPassed(bool conflictPassed);

  TestTableState testMachines(List<TestMachineItem> testMachines);

  TestTableState isLoadingTestMachines(bool isLoadingTestMachines);

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
    String? keyword,
    int? statusFilter,
    DateTime? dateStart,
    DateTime? dateEnd,
    List<TestTableItem>? testTable,
    List<EmployeeInfoItem>? employee,
    List<ProjectItem>? project,
    List<ApproverItem>? approver,
    User? currentUser,
    bool? lookupFetched,
    TestTableFormData? formData,
    bool? isSubmitting,
    bool? submitSuccess,
    int? createdId,
    String? conflictMessage,
    bool? conflictPassed,
    List<TestMachineItem>? testMachines,
    bool? isLoadingTestMachines,
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
  TestTableState keyword(String keyword) => this(keyword: keyword);

  @override
  TestTableState statusFilter(int statusFilter) =>
      this(statusFilter: statusFilter);

  @override
  TestTableState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  TestTableState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  TestTableState testTable(List<TestTableItem> testTable) =>
      this(testTable: testTable);

  @override
  TestTableState employee(List<EmployeeInfoItem> employee) =>
      this(employee: employee);

  @override
  TestTableState project(List<ProjectItem> project) => this(project: project);

  @override
  TestTableState approver(List<ApproverItem> approver) =>
      this(approver: approver);

  @override
  TestTableState currentUser(User? currentUser) =>
      this(currentUser: currentUser);

  @override
  TestTableState lookupFetched(bool lookupFetched) =>
      this(lookupFetched: lookupFetched);

  @override
  TestTableState formData(TestTableFormData formData) =>
      this(formData: formData);

  @override
  TestTableState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  TestTableState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  TestTableState createdId(int createdId) => this(createdId: createdId);

  @override
  TestTableState conflictMessage(String? conflictMessage) =>
      this(conflictMessage: conflictMessage);

  @override
  TestTableState conflictPassed(bool conflictPassed) =>
      this(conflictPassed: conflictPassed);

  @override
  TestTableState testMachines(List<TestMachineItem> testMachines) =>
      this(testMachines: testMachines);

  @override
  TestTableState isLoadingTestMachines(bool isLoadingTestMachines) =>
      this(isLoadingTestMachines: isLoadingTestMachines);

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
    Object? keyword = const $CopyWithPlaceholder(),
    Object? statusFilter = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? testTable = const $CopyWithPlaceholder(),
    Object? employee = const $CopyWithPlaceholder(),
    Object? project = const $CopyWithPlaceholder(),
    Object? approver = const $CopyWithPlaceholder(),
    Object? currentUser = const $CopyWithPlaceholder(),
    Object? lookupFetched = const $CopyWithPlaceholder(),
    Object? formData = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? createdId = const $CopyWithPlaceholder(),
    Object? conflictMessage = const $CopyWithPlaceholder(),
    Object? conflictPassed = const $CopyWithPlaceholder(),
    Object? testMachines = const $CopyWithPlaceholder(),
    Object? isLoadingTestMachines = const $CopyWithPlaceholder(),
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
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
      statusFilter:
          statusFilter == const $CopyWithPlaceholder() || statusFilter == null
              ? _value.statusFilter
              // ignore: cast_nullable_to_non_nullable
              : statusFilter as int,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
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
      approver: approver == const $CopyWithPlaceholder() || approver == null
          ? _value.approver
          // ignore: cast_nullable_to_non_nullable
          : approver as List<ApproverItem>,
      currentUser: currentUser == const $CopyWithPlaceholder()
          ? _value.currentUser
          // ignore: cast_nullable_to_non_nullable
          : currentUser as User?,
      lookupFetched:
          lookupFetched == const $CopyWithPlaceholder() || lookupFetched == null
              ? _value.lookupFetched
              // ignore: cast_nullable_to_non_nullable
              : lookupFetched as bool,
      formData: formData == const $CopyWithPlaceholder() || formData == null
          ? _value.formData
          // ignore: cast_nullable_to_non_nullable
          : formData as TestTableFormData,
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
      createdId: createdId == const $CopyWithPlaceholder() || createdId == null
          ? _value.createdId
          // ignore: cast_nullable_to_non_nullable
          : createdId as int,
      conflictMessage: conflictMessage == const $CopyWithPlaceholder()
          ? _value.conflictMessage
          // ignore: cast_nullable_to_non_nullable
          : conflictMessage as String?,
      conflictPassed: conflictPassed == const $CopyWithPlaceholder() ||
              conflictPassed == null
          ? _value.conflictPassed
          // ignore: cast_nullable_to_non_nullable
          : conflictPassed as bool,
      testMachines:
          testMachines == const $CopyWithPlaceholder() || testMachines == null
              ? _value.testMachines
              // ignore: cast_nullable_to_non_nullable
              : testMachines as List<TestMachineItem>,
      isLoadingTestMachines:
          isLoadingTestMachines == const $CopyWithPlaceholder() ||
                  isLoadingTestMachines == null
              ? _value.isLoadingTestMachines
              // ignore: cast_nullable_to_non_nullable
              : isLoadingTestMachines as bool,
    );
  }
}

extension $TestTableStateCopyWith on TestTableState {
  /// Returns a callable class that can be used as follows: `instanceOfTestTableState.copyWith(...)` or like so:`instanceOfTestTableState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestTableStateCWProxy get copyWith => _$TestTableStateCWProxyImpl(this);
}
