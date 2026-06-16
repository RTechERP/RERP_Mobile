// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accountant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountantItem _$AccountantItemFromJson(Map<String, dynamic> json) {
  return _AccountantItem.fromJson(json);
}

/// @nodoc
mixin _$AccountantItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportDate')
  String get reportDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result')
  String get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'NextPlan')
  String? get nextPlan => throw _privateConstructorUsedError;
  @JsonKey(name: 'PendingIssues')
  String? get pendingIssues => throw _privateConstructorUsedError;
  @JsonKey(name: 'Urgent')
  String? get urgent => throw _privateConstructorUsedError;
  @JsonKey(name: 'MistakeOrViolation')
  String? get mistakeOrViolation => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVu')
  String? get chucVu => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNum')
  int? get rowNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountantItemCopyWith<AccountantItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountantItemCopyWith<$Res> {
  factory $AccountantItemCopyWith(
          AccountantItem value, $Res Function(AccountantItem) then) =
      _$AccountantItemCopyWithImpl<$Res, AccountantItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'ReportDate') String reportDate,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Result') String result,
      @JsonKey(name: 'NextPlan') String? nextPlan,
      @JsonKey(name: 'PendingIssues') String? pendingIssues,
      @JsonKey(name: 'Urgent') String? urgent,
      @JsonKey(name: 'MistakeOrViolation') String? mistakeOrViolation,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'IsDeleted') bool isDeleted,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'RowNum') int? rowNum});
}

/// @nodoc
class _$AccountantItemCopyWithImpl<$Res, $Val extends AccountantItem>
    implements $AccountantItemCopyWith<$Res> {
  _$AccountantItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? reportDate = null,
    Object? content = null,
    Object? result = null,
    Object? nextPlan = freezed,
    Object? pendingIssues = freezed,
    Object? urgent = freezed,
    Object? mistakeOrViolation = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = null,
    Object? fullName = freezed,
    Object? chucVu = freezed,
    Object? rowNum = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      nextPlan: freezed == nextPlan
          ? _value.nextPlan
          : nextPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingIssues: freezed == pendingIssues
          ? _value.pendingIssues
          : pendingIssues // ignore: cast_nullable_to_non_nullable
              as String?,
      urgent: freezed == urgent
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as String?,
      mistakeOrViolation: freezed == mistakeOrViolation
          ? _value.mistakeOrViolation
          : mistakeOrViolation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountantItemImplCopyWith<$Res>
    implements $AccountantItemCopyWith<$Res> {
  factory _$$AccountantItemImplCopyWith(_$AccountantItemImpl value,
          $Res Function(_$AccountantItemImpl) then) =
      __$$AccountantItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'ReportDate') String reportDate,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Result') String result,
      @JsonKey(name: 'NextPlan') String? nextPlan,
      @JsonKey(name: 'PendingIssues') String? pendingIssues,
      @JsonKey(name: 'Urgent') String? urgent,
      @JsonKey(name: 'MistakeOrViolation') String? mistakeOrViolation,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'IsDeleted') bool isDeleted,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'RowNum') int? rowNum});
}

/// @nodoc
class __$$AccountantItemImplCopyWithImpl<$Res>
    extends _$AccountantItemCopyWithImpl<$Res, _$AccountantItemImpl>
    implements _$$AccountantItemImplCopyWith<$Res> {
  __$$AccountantItemImplCopyWithImpl(
      _$AccountantItemImpl _value, $Res Function(_$AccountantItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? reportDate = null,
    Object? content = null,
    Object? result = null,
    Object? nextPlan = freezed,
    Object? pendingIssues = freezed,
    Object? urgent = freezed,
    Object? mistakeOrViolation = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = null,
    Object? fullName = freezed,
    Object? chucVu = freezed,
    Object? rowNum = freezed,
  }) {
    return _then(_$AccountantItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      nextPlan: freezed == nextPlan
          ? _value.nextPlan
          : nextPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingIssues: freezed == pendingIssues
          ? _value.pendingIssues
          : pendingIssues // ignore: cast_nullable_to_non_nullable
              as String?,
      urgent: freezed == urgent
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as String?,
      mistakeOrViolation: freezed == mistakeOrViolation
          ? _value.mistakeOrViolation
          : mistakeOrViolation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountantItemImpl implements _AccountantItem {
  const _$AccountantItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'EmployeeID') required this.employeeId,
      @JsonKey(name: 'ReportDate') required this.reportDate,
      @JsonKey(name: 'Content') required this.content,
      @JsonKey(name: 'Result') required this.result,
      @JsonKey(name: 'NextPlan') this.nextPlan,
      @JsonKey(name: 'PendingIssues') this.pendingIssues,
      @JsonKey(name: 'Urgent') this.urgent,
      @JsonKey(name: 'MistakeOrViolation') this.mistakeOrViolation,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted = false,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'ChucVu') this.chucVu,
      @JsonKey(name: 'RowNum') this.rowNum});

  factory _$AccountantItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountantItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int employeeId;
  @override
  @JsonKey(name: 'ReportDate')
  final String reportDate;
  @override
  @JsonKey(name: 'Content')
  final String content;
  @override
  @JsonKey(name: 'Result')
  final String result;
  @override
  @JsonKey(name: 'NextPlan')
  final String? nextPlan;
  @override
  @JsonKey(name: 'PendingIssues')
  final String? pendingIssues;
  @override
  @JsonKey(name: 'Urgent')
  final String? urgent;
  @override
  @JsonKey(name: 'MistakeOrViolation')
  final String? mistakeOrViolation;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool isDeleted;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'ChucVu')
  final String? chucVu;
  @override
  @JsonKey(name: 'RowNum')
  final int? rowNum;

  @override
  String toString() {
    return 'AccountantItem(id: $id, employeeId: $employeeId, reportDate: $reportDate, content: $content, result: $result, nextPlan: $nextPlan, pendingIssues: $pendingIssues, urgent: $urgent, mistakeOrViolation: $mistakeOrViolation, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, fullName: $fullName, chucVu: $chucVu, rowNum: $rowNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountantItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.reportDate, reportDate) ||
                other.reportDate == reportDate) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.nextPlan, nextPlan) ||
                other.nextPlan == nextPlan) &&
            (identical(other.pendingIssues, pendingIssues) ||
                other.pendingIssues == pendingIssues) &&
            (identical(other.urgent, urgent) || other.urgent == urgent) &&
            (identical(other.mistakeOrViolation, mistakeOrViolation) ||
                other.mistakeOrViolation == mistakeOrViolation) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.chucVu, chucVu) || other.chucVu == chucVu) &&
            (identical(other.rowNum, rowNum) || other.rowNum == rowNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeId,
      reportDate,
      content,
      result,
      nextPlan,
      pendingIssues,
      urgent,
      mistakeOrViolation,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      isDeleted,
      fullName,
      chucVu,
      rowNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountantItemImplCopyWith<_$AccountantItemImpl> get copyWith =>
      __$$AccountantItemImplCopyWithImpl<_$AccountantItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountantItemImplToJson(
      this,
    );
  }
}

abstract class _AccountantItem implements AccountantItem {
  const factory _AccountantItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'EmployeeID') required final int employeeId,
      @JsonKey(name: 'ReportDate') required final String reportDate,
      @JsonKey(name: 'Content') required final String content,
      @JsonKey(name: 'Result') required final String result,
      @JsonKey(name: 'NextPlan') final String? nextPlan,
      @JsonKey(name: 'PendingIssues') final String? pendingIssues,
      @JsonKey(name: 'Urgent') final String? urgent,
      @JsonKey(name: 'MistakeOrViolation') final String? mistakeOrViolation,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final String? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate') final String? updatedDate,
      @JsonKey(name: 'IsDeleted') final bool isDeleted,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'ChucVu') final String? chucVu,
      @JsonKey(name: 'RowNum') final int? rowNum}) = _$AccountantItemImpl;

  factory _AccountantItem.fromJson(Map<String, dynamic> json) =
      _$AccountantItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int get employeeId;
  @override
  @JsonKey(name: 'ReportDate')
  String get reportDate;
  @override
  @JsonKey(name: 'Content')
  String get content;
  @override
  @JsonKey(name: 'Result')
  String get result;
  @override
  @JsonKey(name: 'NextPlan')
  String? get nextPlan;
  @override
  @JsonKey(name: 'PendingIssues')
  String? get pendingIssues;
  @override
  @JsonKey(name: 'Urgent')
  String? get urgent;
  @override
  @JsonKey(name: 'MistakeOrViolation')
  String? get mistakeOrViolation;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'ChucVu')
  String? get chucVu;
  @override
  @JsonKey(name: 'RowNum')
  int? get rowNum;
  @override
  @JsonKey(ignore: true)
  _$$AccountantItemImplCopyWith<_$AccountantItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
