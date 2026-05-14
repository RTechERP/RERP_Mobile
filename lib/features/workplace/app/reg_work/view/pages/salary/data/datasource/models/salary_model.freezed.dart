// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummarySalaryResponse _$SummarySalaryResponseFromJson(
    Map<String, dynamic> json) {
  return _SummarySalaryResponse.fromJson(json);
}

/// @nodoc
mixin _$SummarySalaryResponse {
  @JsonKey(name: 'listSummary')
  List<List<SalarySummaryItem>>? get listSummary =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'fingers')
  SalaryFingers? get fingers => throw _privateConstructorUsedError;
  @JsonKey(name: 'payroll')
  List<SalaryPayrollItem>? get payroll => throw _privateConstructorUsedError;
  @JsonKey(name: 'listChamcong')
  SalaryListChamCong? get listChamcong => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummarySalaryResponseCopyWith<SummarySalaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummarySalaryResponseCopyWith<$Res> {
  factory $SummarySalaryResponseCopyWith(SummarySalaryResponse value,
          $Res Function(SummarySalaryResponse) then) =
      _$SummarySalaryResponseCopyWithImpl<$Res, SummarySalaryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'listSummary') List<List<SalarySummaryItem>>? listSummary,
      @JsonKey(name: 'fingers') SalaryFingers? fingers,
      @JsonKey(name: 'payroll') List<SalaryPayrollItem>? payroll,
      @JsonKey(name: 'listChamcong') SalaryListChamCong? listChamcong});

  $SalaryFingersCopyWith<$Res>? get fingers;
  $SalaryListChamCongCopyWith<$Res>? get listChamcong;
}

/// @nodoc
class _$SummarySalaryResponseCopyWithImpl<$Res,
        $Val extends SummarySalaryResponse>
    implements $SummarySalaryResponseCopyWith<$Res> {
  _$SummarySalaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listSummary = freezed,
    Object? fingers = freezed,
    Object? payroll = freezed,
    Object? listChamcong = freezed,
  }) {
    return _then(_value.copyWith(
      listSummary: freezed == listSummary
          ? _value.listSummary
          : listSummary // ignore: cast_nullable_to_non_nullable
              as List<List<SalarySummaryItem>>?,
      fingers: freezed == fingers
          ? _value.fingers
          : fingers // ignore: cast_nullable_to_non_nullable
              as SalaryFingers?,
      payroll: freezed == payroll
          ? _value.payroll
          : payroll // ignore: cast_nullable_to_non_nullable
              as List<SalaryPayrollItem>?,
      listChamcong: freezed == listChamcong
          ? _value.listChamcong
          : listChamcong // ignore: cast_nullable_to_non_nullable
              as SalaryListChamCong?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryFingersCopyWith<$Res>? get fingers {
    if (_value.fingers == null) {
      return null;
    }

    return $SalaryFingersCopyWith<$Res>(_value.fingers!, (value) {
      return _then(_value.copyWith(fingers: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryListChamCongCopyWith<$Res>? get listChamcong {
    if (_value.listChamcong == null) {
      return null;
    }

    return $SalaryListChamCongCopyWith<$Res>(_value.listChamcong!, (value) {
      return _then(_value.copyWith(listChamcong: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SummarySalaryResponseImplCopyWith<$Res>
    implements $SummarySalaryResponseCopyWith<$Res> {
  factory _$$SummarySalaryResponseImplCopyWith(
          _$SummarySalaryResponseImpl value,
          $Res Function(_$SummarySalaryResponseImpl) then) =
      __$$SummarySalaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listSummary') List<List<SalarySummaryItem>>? listSummary,
      @JsonKey(name: 'fingers') SalaryFingers? fingers,
      @JsonKey(name: 'payroll') List<SalaryPayrollItem>? payroll,
      @JsonKey(name: 'listChamcong') SalaryListChamCong? listChamcong});

  @override
  $SalaryFingersCopyWith<$Res>? get fingers;
  @override
  $SalaryListChamCongCopyWith<$Res>? get listChamcong;
}

/// @nodoc
class __$$SummarySalaryResponseImplCopyWithImpl<$Res>
    extends _$SummarySalaryResponseCopyWithImpl<$Res,
        _$SummarySalaryResponseImpl>
    implements _$$SummarySalaryResponseImplCopyWith<$Res> {
  __$$SummarySalaryResponseImplCopyWithImpl(_$SummarySalaryResponseImpl _value,
      $Res Function(_$SummarySalaryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listSummary = freezed,
    Object? fingers = freezed,
    Object? payroll = freezed,
    Object? listChamcong = freezed,
  }) {
    return _then(_$SummarySalaryResponseImpl(
      listSummary: freezed == listSummary
          ? _value._listSummary
          : listSummary // ignore: cast_nullable_to_non_nullable
              as List<List<SalarySummaryItem>>?,
      fingers: freezed == fingers
          ? _value.fingers
          : fingers // ignore: cast_nullable_to_non_nullable
              as SalaryFingers?,
      payroll: freezed == payroll
          ? _value._payroll
          : payroll // ignore: cast_nullable_to_non_nullable
              as List<SalaryPayrollItem>?,
      listChamcong: freezed == listChamcong
          ? _value.listChamcong
          : listChamcong // ignore: cast_nullable_to_non_nullable
              as SalaryListChamCong?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummarySalaryResponseImpl implements _SummarySalaryResponse {
  const _$SummarySalaryResponseImpl(
      {@JsonKey(name: 'listSummary')
      final List<List<SalarySummaryItem>>? listSummary,
      @JsonKey(name: 'fingers') this.fingers,
      @JsonKey(name: 'payroll') final List<SalaryPayrollItem>? payroll,
      @JsonKey(name: 'listChamcong') this.listChamcong})
      : _listSummary = listSummary,
        _payroll = payroll;

  factory _$SummarySalaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummarySalaryResponseImplFromJson(json);

  final List<List<SalarySummaryItem>>? _listSummary;
  @override
  @JsonKey(name: 'listSummary')
  List<List<SalarySummaryItem>>? get listSummary {
    final value = _listSummary;
    if (value == null) return null;
    if (_listSummary is EqualUnmodifiableListView) return _listSummary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'fingers')
  final SalaryFingers? fingers;
  final List<SalaryPayrollItem>? _payroll;
  @override
  @JsonKey(name: 'payroll')
  List<SalaryPayrollItem>? get payroll {
    final value = _payroll;
    if (value == null) return null;
    if (_payroll is EqualUnmodifiableListView) return _payroll;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'listChamcong')
  final SalaryListChamCong? listChamcong;

  @override
  String toString() {
    return 'SummarySalaryResponse(listSummary: $listSummary, fingers: $fingers, payroll: $payroll, listChamcong: $listChamcong)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummarySalaryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._listSummary, _listSummary) &&
            (identical(other.fingers, fingers) || other.fingers == fingers) &&
            const DeepCollectionEquality().equals(other._payroll, _payroll) &&
            (identical(other.listChamcong, listChamcong) ||
                other.listChamcong == listChamcong));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listSummary),
      fingers,
      const DeepCollectionEquality().hash(_payroll),
      listChamcong);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummarySalaryResponseImplCopyWith<_$SummarySalaryResponseImpl>
      get copyWith => __$$SummarySalaryResponseImplCopyWithImpl<
          _$SummarySalaryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummarySalaryResponseImplToJson(
      this,
    );
  }
}

abstract class _SummarySalaryResponse implements SummarySalaryResponse {
  const factory _SummarySalaryResponse(
      {@JsonKey(name: 'listSummary')
      final List<List<SalarySummaryItem>>? listSummary,
      @JsonKey(name: 'fingers') final SalaryFingers? fingers,
      @JsonKey(name: 'payroll') final List<SalaryPayrollItem>? payroll,
      @JsonKey(name: 'listChamcong')
      final SalaryListChamCong? listChamcong}) = _$SummarySalaryResponseImpl;

  factory _SummarySalaryResponse.fromJson(Map<String, dynamic> json) =
      _$SummarySalaryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'listSummary')
  List<List<SalarySummaryItem>>? get listSummary;
  @override
  @JsonKey(name: 'fingers')
  SalaryFingers? get fingers;
  @override
  @JsonKey(name: 'payroll')
  List<SalaryPayrollItem>? get payroll;
  @override
  @JsonKey(name: 'listChamcong')
  SalaryListChamCong? get listChamcong;
  @override
  @JsonKey(ignore: true)
  _$$SummarySalaryResponseImplCopyWith<_$SummarySalaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SalarySummaryItem _$SalarySummaryItemFromJson(Map<String, dynamic> json) {
  return _SalarySummaryItem.fromJson(json);
}

/// @nodoc
mixin _$SalarySummaryItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeTable')
  int? get typeTable => throw _privateConstructorUsedError;
  @JsonKey(name: 'Typetext')
  String? get typeText => throw _privateConstructorUsedError;
  @JsonKey(name: 'HangMuc')
  String? get hangMuc => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Value')
  double? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValueText')
  String? get valueText => throw _privateConstructorUsedError;
  @JsonKey(name: 'HRApproved')
  String? get hrApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'TBPApproved')
  String? get tbpApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'HRCancel')
  String? get hrCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'TBPCancel')
  String? get tbpCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValueReal')
  double? get valueReal => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValueTextReal')
  String? get valueTextReal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalarySummaryItemCopyWith<SalarySummaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalarySummaryItemCopyWith<$Res> {
  factory $SalarySummaryItemCopyWith(
          SalarySummaryItem value, $Res Function(SalarySummaryItem) then) =
      _$SalarySummaryItemCopyWithImpl<$Res, SalarySummaryItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'TypeTable') int? typeTable,
      @JsonKey(name: 'Typetext') String? typeText,
      @JsonKey(name: 'HangMuc') String? hangMuc,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ValueText') String? valueText,
      @JsonKey(name: 'HRApproved') String? hrApproved,
      @JsonKey(name: 'TBPApproved') String? tbpApproved,
      @JsonKey(name: 'HRCancel') String? hrCancel,
      @JsonKey(name: 'TBPCancel') String? tbpCancel,
      @JsonKey(name: 'ValueReal') double? valueReal,
      @JsonKey(name: 'ValueTextReal') String? valueTextReal});
}

/// @nodoc
class _$SalarySummaryItemCopyWithImpl<$Res, $Val extends SalarySummaryItem>
    implements $SalarySummaryItemCopyWith<$Res> {
  _$SalarySummaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? typeTable = freezed,
    Object? typeText = freezed,
    Object? hangMuc = freezed,
    Object? unit = freezed,
    Object? value = freezed,
    Object? note = freezed,
    Object? valueText = freezed,
    Object? hrApproved = freezed,
    Object? tbpApproved = freezed,
    Object? hrCancel = freezed,
    Object? tbpCancel = freezed,
    Object? valueReal = freezed,
    Object? valueTextReal = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      typeTable: freezed == typeTable
          ? _value.typeTable
          : typeTable // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      hangMuc: freezed == hangMuc
          ? _value.hangMuc
          : hangMuc // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      valueText: freezed == valueText
          ? _value.valueText
          : valueText // ignore: cast_nullable_to_non_nullable
              as String?,
      hrApproved: freezed == hrApproved
          ? _value.hrApproved
          : hrApproved // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpApproved: freezed == tbpApproved
          ? _value.tbpApproved
          : tbpApproved // ignore: cast_nullable_to_non_nullable
              as String?,
      hrCancel: freezed == hrCancel
          ? _value.hrCancel
          : hrCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpCancel: freezed == tbpCancel
          ? _value.tbpCancel
          : tbpCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      valueReal: freezed == valueReal
          ? _value.valueReal
          : valueReal // ignore: cast_nullable_to_non_nullable
              as double?,
      valueTextReal: freezed == valueTextReal
          ? _value.valueTextReal
          : valueTextReal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalarySummaryItemImplCopyWith<$Res>
    implements $SalarySummaryItemCopyWith<$Res> {
  factory _$$SalarySummaryItemImplCopyWith(_$SalarySummaryItemImpl value,
          $Res Function(_$SalarySummaryItemImpl) then) =
      __$$SalarySummaryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'TypeTable') int? typeTable,
      @JsonKey(name: 'Typetext') String? typeText,
      @JsonKey(name: 'HangMuc') String? hangMuc,
      @JsonKey(name: 'Unit') String? unit,
      @JsonKey(name: 'Value') double? value,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ValueText') String? valueText,
      @JsonKey(name: 'HRApproved') String? hrApproved,
      @JsonKey(name: 'TBPApproved') String? tbpApproved,
      @JsonKey(name: 'HRCancel') String? hrCancel,
      @JsonKey(name: 'TBPCancel') String? tbpCancel,
      @JsonKey(name: 'ValueReal') double? valueReal,
      @JsonKey(name: 'ValueTextReal') String? valueTextReal});
}

/// @nodoc
class __$$SalarySummaryItemImplCopyWithImpl<$Res>
    extends _$SalarySummaryItemCopyWithImpl<$Res, _$SalarySummaryItemImpl>
    implements _$$SalarySummaryItemImplCopyWith<$Res> {
  __$$SalarySummaryItemImplCopyWithImpl(_$SalarySummaryItemImpl _value,
      $Res Function(_$SalarySummaryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? typeTable = freezed,
    Object? typeText = freezed,
    Object? hangMuc = freezed,
    Object? unit = freezed,
    Object? value = freezed,
    Object? note = freezed,
    Object? valueText = freezed,
    Object? hrApproved = freezed,
    Object? tbpApproved = freezed,
    Object? hrCancel = freezed,
    Object? tbpCancel = freezed,
    Object? valueReal = freezed,
    Object? valueTextReal = freezed,
  }) {
    return _then(_$SalarySummaryItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      typeTable: freezed == typeTable
          ? _value.typeTable
          : typeTable // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      hangMuc: freezed == hangMuc
          ? _value.hangMuc
          : hangMuc // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      valueText: freezed == valueText
          ? _value.valueText
          : valueText // ignore: cast_nullable_to_non_nullable
              as String?,
      hrApproved: freezed == hrApproved
          ? _value.hrApproved
          : hrApproved // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpApproved: freezed == tbpApproved
          ? _value.tbpApproved
          : tbpApproved // ignore: cast_nullable_to_non_nullable
              as String?,
      hrCancel: freezed == hrCancel
          ? _value.hrCancel
          : hrCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      tbpCancel: freezed == tbpCancel
          ? _value.tbpCancel
          : tbpCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      valueReal: freezed == valueReal
          ? _value.valueReal
          : valueReal // ignore: cast_nullable_to_non_nullable
              as double?,
      valueTextReal: freezed == valueTextReal
          ? _value.valueTextReal
          : valueTextReal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalarySummaryItemImpl implements _SalarySummaryItem {
  const _$SalarySummaryItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'TypeTable') this.typeTable,
      @JsonKey(name: 'Typetext') this.typeText,
      @JsonKey(name: 'HangMuc') this.hangMuc,
      @JsonKey(name: 'Unit') this.unit,
      @JsonKey(name: 'Value') this.value,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'ValueText') this.valueText,
      @JsonKey(name: 'HRApproved') this.hrApproved,
      @JsonKey(name: 'TBPApproved') this.tbpApproved,
      @JsonKey(name: 'HRCancel') this.hrCancel,
      @JsonKey(name: 'TBPCancel') this.tbpCancel,
      @JsonKey(name: 'ValueReal') this.valueReal,
      @JsonKey(name: 'ValueTextReal') this.valueTextReal});

  factory _$SalarySummaryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalarySummaryItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'TypeTable')
  final int? typeTable;
  @override
  @JsonKey(name: 'Typetext')
  final String? typeText;
  @override
  @JsonKey(name: 'HangMuc')
  final String? hangMuc;
  @override
  @JsonKey(name: 'Unit')
  final String? unit;
  @override
  @JsonKey(name: 'Value')
  final double? value;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'ValueText')
  final String? valueText;
  @override
  @JsonKey(name: 'HRApproved')
  final String? hrApproved;
  @override
  @JsonKey(name: 'TBPApproved')
  final String? tbpApproved;
  @override
  @JsonKey(name: 'HRCancel')
  final String? hrCancel;
  @override
  @JsonKey(name: 'TBPCancel')
  final String? tbpCancel;
  @override
  @JsonKey(name: 'ValueReal')
  final double? valueReal;
  @override
  @JsonKey(name: 'ValueTextReal')
  final String? valueTextReal;

  @override
  String toString() {
    return 'SalarySummaryItem(id: $id, typeTable: $typeTable, typeText: $typeText, hangMuc: $hangMuc, unit: $unit, value: $value, note: $note, valueText: $valueText, hrApproved: $hrApproved, tbpApproved: $tbpApproved, hrCancel: $hrCancel, tbpCancel: $tbpCancel, valueReal: $valueReal, valueTextReal: $valueTextReal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalarySummaryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.typeTable, typeTable) ||
                other.typeTable == typeTable) &&
            (identical(other.typeText, typeText) ||
                other.typeText == typeText) &&
            (identical(other.hangMuc, hangMuc) || other.hangMuc == hangMuc) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.valueText, valueText) ||
                other.valueText == valueText) &&
            (identical(other.hrApproved, hrApproved) ||
                other.hrApproved == hrApproved) &&
            (identical(other.tbpApproved, tbpApproved) ||
                other.tbpApproved == tbpApproved) &&
            (identical(other.hrCancel, hrCancel) ||
                other.hrCancel == hrCancel) &&
            (identical(other.tbpCancel, tbpCancel) ||
                other.tbpCancel == tbpCancel) &&
            (identical(other.valueReal, valueReal) ||
                other.valueReal == valueReal) &&
            (identical(other.valueTextReal, valueTextReal) ||
                other.valueTextReal == valueTextReal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      typeTable,
      typeText,
      hangMuc,
      unit,
      value,
      note,
      valueText,
      hrApproved,
      tbpApproved,
      hrCancel,
      tbpCancel,
      valueReal,
      valueTextReal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalarySummaryItemImplCopyWith<_$SalarySummaryItemImpl> get copyWith =>
      __$$SalarySummaryItemImplCopyWithImpl<_$SalarySummaryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalarySummaryItemImplToJson(
      this,
    );
  }
}

abstract class _SalarySummaryItem implements SalarySummaryItem {
  const factory _SalarySummaryItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'TypeTable') final int? typeTable,
          @JsonKey(name: 'Typetext') final String? typeText,
          @JsonKey(name: 'HangMuc') final String? hangMuc,
          @JsonKey(name: 'Unit') final String? unit,
          @JsonKey(name: 'Value') final double? value,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'ValueText') final String? valueText,
          @JsonKey(name: 'HRApproved') final String? hrApproved,
          @JsonKey(name: 'TBPApproved') final String? tbpApproved,
          @JsonKey(name: 'HRCancel') final String? hrCancel,
          @JsonKey(name: 'TBPCancel') final String? tbpCancel,
          @JsonKey(name: 'ValueReal') final double? valueReal,
          @JsonKey(name: 'ValueTextReal') final String? valueTextReal}) =
      _$SalarySummaryItemImpl;

  factory _SalarySummaryItem.fromJson(Map<String, dynamic> json) =
      _$SalarySummaryItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'TypeTable')
  int? get typeTable;
  @override
  @JsonKey(name: 'Typetext')
  String? get typeText;
  @override
  @JsonKey(name: 'HangMuc')
  String? get hangMuc;
  @override
  @JsonKey(name: 'Unit')
  String? get unit;
  @override
  @JsonKey(name: 'Value')
  double? get value;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'ValueText')
  String? get valueText;
  @override
  @JsonKey(name: 'HRApproved')
  String? get hrApproved;
  @override
  @JsonKey(name: 'TBPApproved')
  String? get tbpApproved;
  @override
  @JsonKey(name: 'HRCancel')
  String? get hrCancel;
  @override
  @JsonKey(name: 'TBPCancel')
  String? get tbpCancel;
  @override
  @JsonKey(name: 'ValueReal')
  double? get valueReal;
  @override
  @JsonKey(name: 'ValueTextReal')
  String? get valueTextReal;
  @override
  @JsonKey(ignore: true)
  _$$SalarySummaryItemImplCopyWith<_$SalarySummaryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryFingers _$SalaryFingersFromJson(Map<String, dynamic> json) {
  return _SalaryFingers.fromJson(json);
}

/// @nodoc
mixin _$SalaryFingers {
  @JsonKey(name: 'data')
  SalaryFingerData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'details')
  List<SalaryFingerDetail>? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryFingersCopyWith<SalaryFingers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryFingersCopyWith<$Res> {
  factory $SalaryFingersCopyWith(
          SalaryFingers value, $Res Function(SalaryFingers) then) =
      _$SalaryFingersCopyWithImpl<$Res, SalaryFingers>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') SalaryFingerData? data,
      @JsonKey(name: 'details') List<SalaryFingerDetail>? details});

  $SalaryFingerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SalaryFingersCopyWithImpl<$Res, $Val extends SalaryFingers>
    implements $SalaryFingersCopyWith<$Res> {
  _$SalaryFingersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalaryFingerData?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<SalaryFingerDetail>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryFingerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SalaryFingerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalaryFingersImplCopyWith<$Res>
    implements $SalaryFingersCopyWith<$Res> {
  factory _$$SalaryFingersImplCopyWith(
          _$SalaryFingersImpl value, $Res Function(_$SalaryFingersImpl) then) =
      __$$SalaryFingersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') SalaryFingerData? data,
      @JsonKey(name: 'details') List<SalaryFingerDetail>? details});

  @override
  $SalaryFingerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SalaryFingersImplCopyWithImpl<$Res>
    extends _$SalaryFingersCopyWithImpl<$Res, _$SalaryFingersImpl>
    implements _$$SalaryFingersImplCopyWith<$Res> {
  __$$SalaryFingersImplCopyWithImpl(
      _$SalaryFingersImpl _value, $Res Function(_$SalaryFingersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? details = freezed,
  }) {
    return _then(_$SalaryFingersImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalaryFingerData?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<SalaryFingerDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryFingersImpl implements _SalaryFingers {
  const _$SalaryFingersImpl(
      {@JsonKey(name: 'data') this.data,
      @JsonKey(name: 'details') final List<SalaryFingerDetail>? details})
      : _details = details;

  factory _$SalaryFingersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryFingersImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final SalaryFingerData? data;
  final List<SalaryFingerDetail>? _details;
  @override
  @JsonKey(name: 'details')
  List<SalaryFingerDetail>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SalaryFingers(data: $data, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryFingersImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, data, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryFingersImplCopyWith<_$SalaryFingersImpl> get copyWith =>
      __$$SalaryFingersImplCopyWithImpl<_$SalaryFingersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryFingersImplToJson(
      this,
    );
  }
}

abstract class _SalaryFingers implements SalaryFingers {
  const factory _SalaryFingers(
          {@JsonKey(name: 'data') final SalaryFingerData? data,
          @JsonKey(name: 'details') final List<SalaryFingerDetail>? details}) =
      _$SalaryFingersImpl;

  factory _SalaryFingers.fromJson(Map<String, dynamic> json) =
      _$SalaryFingersImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  SalaryFingerData? get data;
  @override
  @JsonKey(name: 'details')
  List<SalaryFingerDetail>? get details;
  @override
  @JsonKey(ignore: true)
  _$$SalaryFingersImplCopyWith<_$SalaryFingersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryFingerData _$SalaryFingerDataFromJson(Map<String, dynamic> json) {
  return _SalaryFingerData.fromJson(json);
}

/// @nodoc
mixin _$SalaryFingerData {
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalLate')
  int? get totalLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalLateCty')
  int? get totalLateCty => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalEarly')
  int? get totalEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalEarlyCty')
  int? get totalEarlyCty => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalRegisterCheckin')
  int? get totalRegisterCheckin => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalRegisterCheckout')
  int? get totalRegisterCheckout => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalNoCheckIn')
  int? get totalNoCheckIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalNoCheckOut')
  int? get totalNoCheckOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayNoSalary')
  double? get totalDayNoSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDaySalary')
  double? get totalDaySalary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryFingerDataCopyWith<SalaryFingerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryFingerDataCopyWith<$Res> {
  factory $SalaryFingerDataCopyWith(
          SalaryFingerData value, $Res Function(SalaryFingerData) then) =
      _$SalaryFingerDataCopyWithImpl<$Res, SalaryFingerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalLateCty') int? totalLateCty,
      @JsonKey(name: 'TotalEarly') int? totalEarly,
      @JsonKey(name: 'TotalEarlyCty') int? totalEarlyCty,
      @JsonKey(name: 'TotalRegisterCheckin') int? totalRegisterCheckin,
      @JsonKey(name: 'TotalRegisterCheckout') int? totalRegisterCheckout,
      @JsonKey(name: 'TotalNoCheckIn') int? totalNoCheckIn,
      @JsonKey(name: 'TotalNoCheckOut') int? totalNoCheckOut,
      @JsonKey(name: 'TotalDayNoSalary') double? totalDayNoSalary,
      @JsonKey(name: 'TotalDaySalary') double? totalDaySalary});
}

/// @nodoc
class _$SalaryFingerDataCopyWithImpl<$Res, $Val extends SalaryFingerData>
    implements $SalaryFingerDataCopyWith<$Res> {
  _$SalaryFingerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? totalLate = freezed,
    Object? totalLateCty = freezed,
    Object? totalEarly = freezed,
    Object? totalEarlyCty = freezed,
    Object? totalRegisterCheckin = freezed,
    Object? totalRegisterCheckout = freezed,
    Object? totalNoCheckIn = freezed,
    Object? totalNoCheckOut = freezed,
    Object? totalDayNoSalary = freezed,
    Object? totalDaySalary = freezed,
  }) {
    return _then(_value.copyWith(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLateCty: freezed == totalLateCty
          ? _value.totalLateCty
          : totalLateCty // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarly: freezed == totalEarly
          ? _value.totalEarly
          : totalEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarlyCty: freezed == totalEarlyCty
          ? _value.totalEarlyCty
          : totalEarlyCty // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRegisterCheckin: freezed == totalRegisterCheckin
          ? _value.totalRegisterCheckin
          : totalRegisterCheckin // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRegisterCheckout: freezed == totalRegisterCheckout
          ? _value.totalRegisterCheckout
          : totalRegisterCheckout // ignore: cast_nullable_to_non_nullable
              as int?,
      totalNoCheckIn: freezed == totalNoCheckIn
          ? _value.totalNoCheckIn
          : totalNoCheckIn // ignore: cast_nullable_to_non_nullable
              as int?,
      totalNoCheckOut: freezed == totalNoCheckOut
          ? _value.totalNoCheckOut
          : totalNoCheckOut // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDayNoSalary: freezed == totalDayNoSalary
          ? _value.totalDayNoSalary
          : totalDayNoSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDaySalary: freezed == totalDaySalary
          ? _value.totalDaySalary
          : totalDaySalary // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryFingerDataImplCopyWith<$Res>
    implements $SalaryFingerDataCopyWith<$Res> {
  factory _$$SalaryFingerDataImplCopyWith(_$SalaryFingerDataImpl value,
          $Res Function(_$SalaryFingerDataImpl) then) =
      __$$SalaryFingerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalLateCty') int? totalLateCty,
      @JsonKey(name: 'TotalEarly') int? totalEarly,
      @JsonKey(name: 'TotalEarlyCty') int? totalEarlyCty,
      @JsonKey(name: 'TotalRegisterCheckin') int? totalRegisterCheckin,
      @JsonKey(name: 'TotalRegisterCheckout') int? totalRegisterCheckout,
      @JsonKey(name: 'TotalNoCheckIn') int? totalNoCheckIn,
      @JsonKey(name: 'TotalNoCheckOut') int? totalNoCheckOut,
      @JsonKey(name: 'TotalDayNoSalary') double? totalDayNoSalary,
      @JsonKey(name: 'TotalDaySalary') double? totalDaySalary});
}

/// @nodoc
class __$$SalaryFingerDataImplCopyWithImpl<$Res>
    extends _$SalaryFingerDataCopyWithImpl<$Res, _$SalaryFingerDataImpl>
    implements _$$SalaryFingerDataImplCopyWith<$Res> {
  __$$SalaryFingerDataImplCopyWithImpl(_$SalaryFingerDataImpl _value,
      $Res Function(_$SalaryFingerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? totalLate = freezed,
    Object? totalLateCty = freezed,
    Object? totalEarly = freezed,
    Object? totalEarlyCty = freezed,
    Object? totalRegisterCheckin = freezed,
    Object? totalRegisterCheckout = freezed,
    Object? totalNoCheckIn = freezed,
    Object? totalNoCheckOut = freezed,
    Object? totalDayNoSalary = freezed,
    Object? totalDaySalary = freezed,
  }) {
    return _then(_$SalaryFingerDataImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLateCty: freezed == totalLateCty
          ? _value.totalLateCty
          : totalLateCty // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarly: freezed == totalEarly
          ? _value.totalEarly
          : totalEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarlyCty: freezed == totalEarlyCty
          ? _value.totalEarlyCty
          : totalEarlyCty // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRegisterCheckin: freezed == totalRegisterCheckin
          ? _value.totalRegisterCheckin
          : totalRegisterCheckin // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRegisterCheckout: freezed == totalRegisterCheckout
          ? _value.totalRegisterCheckout
          : totalRegisterCheckout // ignore: cast_nullable_to_non_nullable
              as int?,
      totalNoCheckIn: freezed == totalNoCheckIn
          ? _value.totalNoCheckIn
          : totalNoCheckIn // ignore: cast_nullable_to_non_nullable
              as int?,
      totalNoCheckOut: freezed == totalNoCheckOut
          ? _value.totalNoCheckOut
          : totalNoCheckOut // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDayNoSalary: freezed == totalDayNoSalary
          ? _value.totalDayNoSalary
          : totalDayNoSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDaySalary: freezed == totalDaySalary
          ? _value.totalDaySalary
          : totalDaySalary // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryFingerDataImpl implements _SalaryFingerData {
  const _$SalaryFingerDataImpl(
      {@JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'TotalLate') this.totalLate,
      @JsonKey(name: 'TotalLateCty') this.totalLateCty,
      @JsonKey(name: 'TotalEarly') this.totalEarly,
      @JsonKey(name: 'TotalEarlyCty') this.totalEarlyCty,
      @JsonKey(name: 'TotalRegisterCheckin') this.totalRegisterCheckin,
      @JsonKey(name: 'TotalRegisterCheckout') this.totalRegisterCheckout,
      @JsonKey(name: 'TotalNoCheckIn') this.totalNoCheckIn,
      @JsonKey(name: 'TotalNoCheckOut') this.totalNoCheckOut,
      @JsonKey(name: 'TotalDayNoSalary') this.totalDayNoSalary,
      @JsonKey(name: 'TotalDaySalary') this.totalDaySalary});

  factory _$SalaryFingerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryFingerDataImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'TotalLate')
  final int? totalLate;
  @override
  @JsonKey(name: 'TotalLateCty')
  final int? totalLateCty;
  @override
  @JsonKey(name: 'TotalEarly')
  final int? totalEarly;
  @override
  @JsonKey(name: 'TotalEarlyCty')
  final int? totalEarlyCty;
  @override
  @JsonKey(name: 'TotalRegisterCheckin')
  final int? totalRegisterCheckin;
  @override
  @JsonKey(name: 'TotalRegisterCheckout')
  final int? totalRegisterCheckout;
  @override
  @JsonKey(name: 'TotalNoCheckIn')
  final int? totalNoCheckIn;
  @override
  @JsonKey(name: 'TotalNoCheckOut')
  final int? totalNoCheckOut;
  @override
  @JsonKey(name: 'TotalDayNoSalary')
  final double? totalDayNoSalary;
  @override
  @JsonKey(name: 'TotalDaySalary')
  final double? totalDaySalary;

  @override
  String toString() {
    return 'SalaryFingerData(employeeId: $employeeId, totalLate: $totalLate, totalLateCty: $totalLateCty, totalEarly: $totalEarly, totalEarlyCty: $totalEarlyCty, totalRegisterCheckin: $totalRegisterCheckin, totalRegisterCheckout: $totalRegisterCheckout, totalNoCheckIn: $totalNoCheckIn, totalNoCheckOut: $totalNoCheckOut, totalDayNoSalary: $totalDayNoSalary, totalDaySalary: $totalDaySalary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryFingerDataImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.totalLate, totalLate) ||
                other.totalLate == totalLate) &&
            (identical(other.totalLateCty, totalLateCty) ||
                other.totalLateCty == totalLateCty) &&
            (identical(other.totalEarly, totalEarly) ||
                other.totalEarly == totalEarly) &&
            (identical(other.totalEarlyCty, totalEarlyCty) ||
                other.totalEarlyCty == totalEarlyCty) &&
            (identical(other.totalRegisterCheckin, totalRegisterCheckin) ||
                other.totalRegisterCheckin == totalRegisterCheckin) &&
            (identical(other.totalRegisterCheckout, totalRegisterCheckout) ||
                other.totalRegisterCheckout == totalRegisterCheckout) &&
            (identical(other.totalNoCheckIn, totalNoCheckIn) ||
                other.totalNoCheckIn == totalNoCheckIn) &&
            (identical(other.totalNoCheckOut, totalNoCheckOut) ||
                other.totalNoCheckOut == totalNoCheckOut) &&
            (identical(other.totalDayNoSalary, totalDayNoSalary) ||
                other.totalDayNoSalary == totalDayNoSalary) &&
            (identical(other.totalDaySalary, totalDaySalary) ||
                other.totalDaySalary == totalDaySalary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      employeeId,
      totalLate,
      totalLateCty,
      totalEarly,
      totalEarlyCty,
      totalRegisterCheckin,
      totalRegisterCheckout,
      totalNoCheckIn,
      totalNoCheckOut,
      totalDayNoSalary,
      totalDaySalary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryFingerDataImplCopyWith<_$SalaryFingerDataImpl> get copyWith =>
      __$$SalaryFingerDataImplCopyWithImpl<_$SalaryFingerDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryFingerDataImplToJson(
      this,
    );
  }
}

abstract class _SalaryFingerData implements SalaryFingerData {
  const factory _SalaryFingerData(
      {@JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'TotalLate') final int? totalLate,
      @JsonKey(name: 'TotalLateCty') final int? totalLateCty,
      @JsonKey(name: 'TotalEarly') final int? totalEarly,
      @JsonKey(name: 'TotalEarlyCty') final int? totalEarlyCty,
      @JsonKey(name: 'TotalRegisterCheckin') final int? totalRegisterCheckin,
      @JsonKey(name: 'TotalRegisterCheckout') final int? totalRegisterCheckout,
      @JsonKey(name: 'TotalNoCheckIn') final int? totalNoCheckIn,
      @JsonKey(name: 'TotalNoCheckOut') final int? totalNoCheckOut,
      @JsonKey(name: 'TotalDayNoSalary') final double? totalDayNoSalary,
      @JsonKey(name: 'TotalDaySalary')
      final double? totalDaySalary}) = _$SalaryFingerDataImpl;

  factory _SalaryFingerData.fromJson(Map<String, dynamic> json) =
      _$SalaryFingerDataImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'TotalLate')
  int? get totalLate;
  @override
  @JsonKey(name: 'TotalLateCty')
  int? get totalLateCty;
  @override
  @JsonKey(name: 'TotalEarly')
  int? get totalEarly;
  @override
  @JsonKey(name: 'TotalEarlyCty')
  int? get totalEarlyCty;
  @override
  @JsonKey(name: 'TotalRegisterCheckin')
  int? get totalRegisterCheckin;
  @override
  @JsonKey(name: 'TotalRegisterCheckout')
  int? get totalRegisterCheckout;
  @override
  @JsonKey(name: 'TotalNoCheckIn')
  int? get totalNoCheckIn;
  @override
  @JsonKey(name: 'TotalNoCheckOut')
  int? get totalNoCheckOut;
  @override
  @JsonKey(name: 'TotalDayNoSalary')
  double? get totalDayNoSalary;
  @override
  @JsonKey(name: 'TotalDaySalary')
  double? get totalDaySalary;
  @override
  @JsonKey(ignore: true)
  _$$SalaryFingerDataImplCopyWith<_$SalaryFingerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryFingerDetail _$SalaryFingerDetailFromJson(Map<String, dynamic> json) {
  return _SalaryFingerDetail.fromJson(json);
}

/// @nodoc
mixin _$SalaryFingerDetail {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckIn')
  String? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckOut')
  String? get checkOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLate')
  bool? get isLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeLate')
  double? get timeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsEarly')
  bool? get isEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeEarly')
  double? get timeEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'AttendanceDate')
  DateTime? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DayWeek')
  String? get dayWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'Interval')
  String? get interval => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToChuc')
  String? get toChuc => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVu')
  String? get chucVu => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLunch')
  bool? get isLunch => throw _privateConstructorUsedError;
  @JsonKey(name: 'Overtime')
  bool? get overtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bussiness')
  bool? get bussiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoFingerprint')
  bool? get noFingerprint => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnLeave')
  bool? get onLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'WFH')
  bool? get wfh => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLateRegister')
  bool? get isLateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsEarlyRegister')
  bool? get isEarlyRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDay')
  double? get totalDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayDay')
  int? get holidayDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt => throw _privateConstructorUsedError;
  @JsonKey(name: 'OvertimeLate')
  int? get overtimeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OvertimeEarly')
  int? get overtimeEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsOverEarly')
  bool? get isOverEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsOverLate')
  bool? get isOverLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeLate')
  int? get typeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeEarly')
  int? get typeEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLateActual')
  int? get isLateActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsEarlyActual')
  int? get isEarlyActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalProblem')
  int? get totalProblem => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxIsLate')
  int? get maxIsLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxIsEarly')
  int? get maxIsEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNoFinger')
  int? get isNoFinger => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNoCheckIn')
  int? get isNoCheckIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNoCheckOut')
  int? get isNoCheckOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryFingerDetailCopyWith<SalaryFingerDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryFingerDetailCopyWith<$Res> {
  factory $SalaryFingerDetailCopyWith(
          SalaryFingerDetail value, $Res Function(SalaryFingerDetail) then) =
      _$SalaryFingerDetailCopyWithImpl<$Res, SalaryFingerDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CheckIn') String? checkIn,
      @JsonKey(name: 'CheckOut') String? checkOut,
      @JsonKey(name: 'IsLate') bool? isLate,
      @JsonKey(name: 'TimeLate') double? timeLate,
      @JsonKey(name: 'IsEarly') bool? isEarly,
      @JsonKey(name: 'TimeEarly') double? timeEarly,
      @JsonKey(name: 'AttendanceDate') DateTime? attendanceDate,
      @JsonKey(name: 'DayWeek') String? dayWeek,
      @JsonKey(name: 'Interval') String? interval,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ToChuc') String? toChuc,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'IsLunch') bool? isLunch,
      @JsonKey(name: 'Overtime') bool? overtime,
      @JsonKey(name: 'Bussiness') bool? bussiness,
      @JsonKey(name: 'NoFingerprint') bool? noFingerprint,
      @JsonKey(name: 'OnLeave') bool? onLeave,
      @JsonKey(name: 'WFH') bool? wfh,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'IsLateRegister') bool? isLateRegister,
      @JsonKey(name: 'IsEarlyRegister') bool? isEarlyRegister,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'HolidayDay') int? holidayDay,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'OvertimeLate') int? overtimeLate,
      @JsonKey(name: 'OvertimeEarly') int? overtimeEarly,
      @JsonKey(name: 'IsOverEarly') bool? isOverEarly,
      @JsonKey(name: 'IsOverLate') bool? isOverLate,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
      @JsonKey(name: 'TypeLate') int? typeLate,
      @JsonKey(name: 'TypeEarly') int? typeEarly,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsLateActual') int? isLateActual,
      @JsonKey(name: 'IsEarlyActual') int? isEarlyActual,
      @JsonKey(name: 'TotalProblem') int? totalProblem,
      @JsonKey(name: 'MaxIsLate') int? maxIsLate,
      @JsonKey(name: 'MaxIsEarly') int? maxIsEarly,
      @JsonKey(name: 'IsNoFinger') int? isNoFinger,
      @JsonKey(name: 'IsNoCheckIn') int? isNoCheckIn,
      @JsonKey(name: 'IsNoCheckOut') int? isNoCheckOut});
}

/// @nodoc
class _$SalaryFingerDetailCopyWithImpl<$Res, $Val extends SalaryFingerDetail>
    implements $SalaryFingerDetailCopyWith<$Res> {
  _$SalaryFingerDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idChamCongMoi = freezed,
    Object? employeeId = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? isLate = freezed,
    Object? timeLate = freezed,
    Object? isEarly = freezed,
    Object? timeEarly = freezed,
    Object? attendanceDate = freezed,
    Object? dayWeek = freezed,
    Object? interval = freezed,
    Object? stt = freezed,
    Object? fullName = freezed,
    Object? toChuc = freezed,
    Object? chucVu = freezed,
    Object? isLunch = freezed,
    Object? overtime = freezed,
    Object? bussiness = freezed,
    Object? noFingerprint = freezed,
    Object? onLeave = freezed,
    Object? wfh = freezed,
    Object? departmentName = freezed,
    Object? isLateRegister = freezed,
    Object? isEarlyRegister = freezed,
    Object? totalDay = freezed,
    Object? holidayDay = freezed,
    Object? departmentId = freezed,
    Object? departmentStt = freezed,
    Object? overtimeLate = freezed,
    Object? overtimeEarly = freezed,
    Object? isOverEarly = freezed,
    Object? isOverLate = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? typeLate = freezed,
    Object? typeEarly = freezed,
    Object? code = freezed,
    Object? isLateActual = freezed,
    Object? isEarlyActual = freezed,
    Object? totalProblem = freezed,
    Object? maxIsLate = freezed,
    Object? maxIsEarly = freezed,
    Object? isNoFinger = freezed,
    Object? isNoCheckIn = freezed,
    Object? isNoCheckOut = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: freezed == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeLate: freezed == timeLate
          ? _value.timeLate
          : timeLate // ignore: cast_nullable_to_non_nullable
              as double?,
      isEarly: freezed == isEarly
          ? _value.isEarly
          : isEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeEarly: freezed == timeEarly
          ? _value.timeEarly
          : timeEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayWeek: freezed == dayWeek
          ? _value.dayWeek
          : dayWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      toChuc: freezed == toChuc
          ? _value.toChuc
          : toChuc // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      isLunch: freezed == isLunch
          ? _value.isLunch
          : isLunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      overtime: freezed == overtime
          ? _value.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as bool?,
      bussiness: freezed == bussiness
          ? _value.bussiness
          : bussiness // ignore: cast_nullable_to_non_nullable
              as bool?,
      noFingerprint: freezed == noFingerprint
          ? _value.noFingerprint
          : noFingerprint // ignore: cast_nullable_to_non_nullable
              as bool?,
      onLeave: freezed == onLeave
          ? _value.onLeave
          : onLeave // ignore: cast_nullable_to_non_nullable
              as bool?,
      wfh: freezed == wfh
          ? _value.wfh
          : wfh // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateRegister: freezed == isLateRegister
          ? _value.isLateRegister
          : isLateRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEarlyRegister: freezed == isEarlyRegister
          ? _value.isEarlyRegister
          : isEarlyRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDay: freezed == holidayDay
          ? _value.holidayDay
          : holidayDay // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeLate: freezed == overtimeLate
          ? _value.overtimeLate
          : overtimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeEarly: freezed == overtimeEarly
          ? _value.overtimeEarly
          : overtimeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isOverEarly: freezed == isOverEarly
          ? _value.isOverEarly
          : isOverEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOverLate: freezed == isOverLate
          ? _value.isOverLate
          : isOverLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      typeLate: freezed == typeLate
          ? _value.typeLate
          : typeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      typeEarly: freezed == typeEarly
          ? _value.typeEarly
          : typeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateActual: freezed == isLateActual
          ? _value.isLateActual
          : isLateActual // ignore: cast_nullable_to_non_nullable
              as int?,
      isEarlyActual: freezed == isEarlyActual
          ? _value.isEarlyActual
          : isEarlyActual // ignore: cast_nullable_to_non_nullable
              as int?,
      totalProblem: freezed == totalProblem
          ? _value.totalProblem
          : totalProblem // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsLate: freezed == maxIsLate
          ? _value.maxIsLate
          : maxIsLate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsEarly: freezed == maxIsEarly
          ? _value.maxIsEarly
          : maxIsEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoFinger: freezed == isNoFinger
          ? _value.isNoFinger
          : isNoFinger // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckIn: freezed == isNoCheckIn
          ? _value.isNoCheckIn
          : isNoCheckIn // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckOut: freezed == isNoCheckOut
          ? _value.isNoCheckOut
          : isNoCheckOut // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryFingerDetailImplCopyWith<$Res>
    implements $SalaryFingerDetailCopyWith<$Res> {
  factory _$$SalaryFingerDetailImplCopyWith(_$SalaryFingerDetailImpl value,
          $Res Function(_$SalaryFingerDetailImpl) then) =
      __$$SalaryFingerDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CheckIn') String? checkIn,
      @JsonKey(name: 'CheckOut') String? checkOut,
      @JsonKey(name: 'IsLate') bool? isLate,
      @JsonKey(name: 'TimeLate') double? timeLate,
      @JsonKey(name: 'IsEarly') bool? isEarly,
      @JsonKey(name: 'TimeEarly') double? timeEarly,
      @JsonKey(name: 'AttendanceDate') DateTime? attendanceDate,
      @JsonKey(name: 'DayWeek') String? dayWeek,
      @JsonKey(name: 'Interval') String? interval,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ToChuc') String? toChuc,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'IsLunch') bool? isLunch,
      @JsonKey(name: 'Overtime') bool? overtime,
      @JsonKey(name: 'Bussiness') bool? bussiness,
      @JsonKey(name: 'NoFingerprint') bool? noFingerprint,
      @JsonKey(name: 'OnLeave') bool? onLeave,
      @JsonKey(name: 'WFH') bool? wfh,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'IsLateRegister') bool? isLateRegister,
      @JsonKey(name: 'IsEarlyRegister') bool? isEarlyRegister,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'HolidayDay') int? holidayDay,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'OvertimeLate') int? overtimeLate,
      @JsonKey(name: 'OvertimeEarly') int? overtimeEarly,
      @JsonKey(name: 'IsOverEarly') bool? isOverEarly,
      @JsonKey(name: 'IsOverLate') bool? isOverLate,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
      @JsonKey(name: 'TypeLate') int? typeLate,
      @JsonKey(name: 'TypeEarly') int? typeEarly,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsLateActual') int? isLateActual,
      @JsonKey(name: 'IsEarlyActual') int? isEarlyActual,
      @JsonKey(name: 'TotalProblem') int? totalProblem,
      @JsonKey(name: 'MaxIsLate') int? maxIsLate,
      @JsonKey(name: 'MaxIsEarly') int? maxIsEarly,
      @JsonKey(name: 'IsNoFinger') int? isNoFinger,
      @JsonKey(name: 'IsNoCheckIn') int? isNoCheckIn,
      @JsonKey(name: 'IsNoCheckOut') int? isNoCheckOut});
}

/// @nodoc
class __$$SalaryFingerDetailImplCopyWithImpl<$Res>
    extends _$SalaryFingerDetailCopyWithImpl<$Res, _$SalaryFingerDetailImpl>
    implements _$$SalaryFingerDetailImplCopyWith<$Res> {
  __$$SalaryFingerDetailImplCopyWithImpl(_$SalaryFingerDetailImpl _value,
      $Res Function(_$SalaryFingerDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idChamCongMoi = freezed,
    Object? employeeId = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? isLate = freezed,
    Object? timeLate = freezed,
    Object? isEarly = freezed,
    Object? timeEarly = freezed,
    Object? attendanceDate = freezed,
    Object? dayWeek = freezed,
    Object? interval = freezed,
    Object? stt = freezed,
    Object? fullName = freezed,
    Object? toChuc = freezed,
    Object? chucVu = freezed,
    Object? isLunch = freezed,
    Object? overtime = freezed,
    Object? bussiness = freezed,
    Object? noFingerprint = freezed,
    Object? onLeave = freezed,
    Object? wfh = freezed,
    Object? departmentName = freezed,
    Object? isLateRegister = freezed,
    Object? isEarlyRegister = freezed,
    Object? totalDay = freezed,
    Object? holidayDay = freezed,
    Object? departmentId = freezed,
    Object? departmentStt = freezed,
    Object? overtimeLate = freezed,
    Object? overtimeEarly = freezed,
    Object? isOverEarly = freezed,
    Object? isOverLate = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? typeLate = freezed,
    Object? typeEarly = freezed,
    Object? code = freezed,
    Object? isLateActual = freezed,
    Object? isEarlyActual = freezed,
    Object? totalProblem = freezed,
    Object? maxIsLate = freezed,
    Object? maxIsEarly = freezed,
    Object? isNoFinger = freezed,
    Object? isNoCheckIn = freezed,
    Object? isNoCheckOut = freezed,
  }) {
    return _then(_$SalaryFingerDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: freezed == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeLate: freezed == timeLate
          ? _value.timeLate
          : timeLate // ignore: cast_nullable_to_non_nullable
              as double?,
      isEarly: freezed == isEarly
          ? _value.isEarly
          : isEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeEarly: freezed == timeEarly
          ? _value.timeEarly
          : timeEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayWeek: freezed == dayWeek
          ? _value.dayWeek
          : dayWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      toChuc: freezed == toChuc
          ? _value.toChuc
          : toChuc // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      isLunch: freezed == isLunch
          ? _value.isLunch
          : isLunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      overtime: freezed == overtime
          ? _value.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as bool?,
      bussiness: freezed == bussiness
          ? _value.bussiness
          : bussiness // ignore: cast_nullable_to_non_nullable
              as bool?,
      noFingerprint: freezed == noFingerprint
          ? _value.noFingerprint
          : noFingerprint // ignore: cast_nullable_to_non_nullable
              as bool?,
      onLeave: freezed == onLeave
          ? _value.onLeave
          : onLeave // ignore: cast_nullable_to_non_nullable
              as bool?,
      wfh: freezed == wfh
          ? _value.wfh
          : wfh // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateRegister: freezed == isLateRegister
          ? _value.isLateRegister
          : isLateRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEarlyRegister: freezed == isEarlyRegister
          ? _value.isEarlyRegister
          : isEarlyRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDay: freezed == holidayDay
          ? _value.holidayDay
          : holidayDay // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeLate: freezed == overtimeLate
          ? _value.overtimeLate
          : overtimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeEarly: freezed == overtimeEarly
          ? _value.overtimeEarly
          : overtimeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isOverEarly: freezed == isOverEarly
          ? _value.isOverEarly
          : isOverEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOverLate: freezed == isOverLate
          ? _value.isOverLate
          : isOverLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      typeLate: freezed == typeLate
          ? _value.typeLate
          : typeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      typeEarly: freezed == typeEarly
          ? _value.typeEarly
          : typeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateActual: freezed == isLateActual
          ? _value.isLateActual
          : isLateActual // ignore: cast_nullable_to_non_nullable
              as int?,
      isEarlyActual: freezed == isEarlyActual
          ? _value.isEarlyActual
          : isEarlyActual // ignore: cast_nullable_to_non_nullable
              as int?,
      totalProblem: freezed == totalProblem
          ? _value.totalProblem
          : totalProblem // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsLate: freezed == maxIsLate
          ? _value.maxIsLate
          : maxIsLate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsEarly: freezed == maxIsEarly
          ? _value.maxIsEarly
          : maxIsEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoFinger: freezed == isNoFinger
          ? _value.isNoFinger
          : isNoFinger // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckIn: freezed == isNoCheckIn
          ? _value.isNoCheckIn
          : isNoCheckIn // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckOut: freezed == isNoCheckOut
          ? _value.isNoCheckOut
          : isNoCheckOut // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryFingerDetailImpl implements _SalaryFingerDetail {
  const _$SalaryFingerDetailImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'IDChamCongMoi') this.idChamCongMoi,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'CheckIn') this.checkIn,
      @JsonKey(name: 'CheckOut') this.checkOut,
      @JsonKey(name: 'IsLate') this.isLate,
      @JsonKey(name: 'TimeLate') this.timeLate,
      @JsonKey(name: 'IsEarly') this.isEarly,
      @JsonKey(name: 'TimeEarly') this.timeEarly,
      @JsonKey(name: 'AttendanceDate') this.attendanceDate,
      @JsonKey(name: 'DayWeek') this.dayWeek,
      @JsonKey(name: 'Interval') this.interval,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'ToChuc') this.toChuc,
      @JsonKey(name: 'ChucVu') this.chucVu,
      @JsonKey(name: 'IsLunch') this.isLunch,
      @JsonKey(name: 'Overtime') this.overtime,
      @JsonKey(name: 'Bussiness') this.bussiness,
      @JsonKey(name: 'NoFingerprint') this.noFingerprint,
      @JsonKey(name: 'OnLeave') this.onLeave,
      @JsonKey(name: 'WFH') this.wfh,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'IsLateRegister') this.isLateRegister,
      @JsonKey(name: 'IsEarlyRegister') this.isEarlyRegister,
      @JsonKey(name: 'TotalDay') this.totalDay,
      @JsonKey(name: 'HolidayDay') this.holidayDay,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentSTT') this.departmentStt,
      @JsonKey(name: 'OvertimeLate') this.overtimeLate,
      @JsonKey(name: 'OvertimeEarly') this.overtimeEarly,
      @JsonKey(name: 'IsOverEarly') this.isOverEarly,
      @JsonKey(name: 'IsOverLate') this.isOverLate,
      @JsonKey(name: 'CheckInDate') this.checkInDate,
      @JsonKey(name: 'CheckOutDate') this.checkOutDate,
      @JsonKey(name: 'TypeLate') this.typeLate,
      @JsonKey(name: 'TypeEarly') this.typeEarly,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'IsLateActual') this.isLateActual,
      @JsonKey(name: 'IsEarlyActual') this.isEarlyActual,
      @JsonKey(name: 'TotalProblem') this.totalProblem,
      @JsonKey(name: 'MaxIsLate') this.maxIsLate,
      @JsonKey(name: 'MaxIsEarly') this.maxIsEarly,
      @JsonKey(name: 'IsNoFinger') this.isNoFinger,
      @JsonKey(name: 'IsNoCheckIn') this.isNoCheckIn,
      @JsonKey(name: 'IsNoCheckOut') this.isNoCheckOut});

  factory _$SalaryFingerDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryFingerDetailImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  final String? idChamCongMoi;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'CheckIn')
  final String? checkIn;
  @override
  @JsonKey(name: 'CheckOut')
  final String? checkOut;
  @override
  @JsonKey(name: 'IsLate')
  final bool? isLate;
  @override
  @JsonKey(name: 'TimeLate')
  final double? timeLate;
  @override
  @JsonKey(name: 'IsEarly')
  final bool? isEarly;
  @override
  @JsonKey(name: 'TimeEarly')
  final double? timeEarly;
  @override
  @JsonKey(name: 'AttendanceDate')
  final DateTime? attendanceDate;
  @override
  @JsonKey(name: 'DayWeek')
  final String? dayWeek;
  @override
  @JsonKey(name: 'Interval')
  final String? interval;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'ToChuc')
  final String? toChuc;
  @override
  @JsonKey(name: 'ChucVu')
  final String? chucVu;
  @override
  @JsonKey(name: 'IsLunch')
  final bool? isLunch;
  @override
  @JsonKey(name: 'Overtime')
  final bool? overtime;
  @override
  @JsonKey(name: 'Bussiness')
  final bool? bussiness;
  @override
  @JsonKey(name: 'NoFingerprint')
  final bool? noFingerprint;
  @override
  @JsonKey(name: 'OnLeave')
  final bool? onLeave;
  @override
  @JsonKey(name: 'WFH')
  final bool? wfh;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'IsLateRegister')
  final bool? isLateRegister;
  @override
  @JsonKey(name: 'IsEarlyRegister')
  final bool? isEarlyRegister;
  @override
  @JsonKey(name: 'TotalDay')
  final double? totalDay;
  @override
  @JsonKey(name: 'HolidayDay')
  final int? holidayDay;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'DepartmentSTT')
  final int? departmentStt;
  @override
  @JsonKey(name: 'OvertimeLate')
  final int? overtimeLate;
  @override
  @JsonKey(name: 'OvertimeEarly')
  final int? overtimeEarly;
  @override
  @JsonKey(name: 'IsOverEarly')
  final bool? isOverEarly;
  @override
  @JsonKey(name: 'IsOverLate')
  final bool? isOverLate;
  @override
  @JsonKey(name: 'CheckInDate')
  final DateTime? checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  final DateTime? checkOutDate;
  @override
  @JsonKey(name: 'TypeLate')
  final int? typeLate;
  @override
  @JsonKey(name: 'TypeEarly')
  final int? typeEarly;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'IsLateActual')
  final int? isLateActual;
  @override
  @JsonKey(name: 'IsEarlyActual')
  final int? isEarlyActual;
  @override
  @JsonKey(name: 'TotalProblem')
  final int? totalProblem;
  @override
  @JsonKey(name: 'MaxIsLate')
  final int? maxIsLate;
  @override
  @JsonKey(name: 'MaxIsEarly')
  final int? maxIsEarly;
  @override
  @JsonKey(name: 'IsNoFinger')
  final int? isNoFinger;
  @override
  @JsonKey(name: 'IsNoCheckIn')
  final int? isNoCheckIn;
  @override
  @JsonKey(name: 'IsNoCheckOut')
  final int? isNoCheckOut;

  @override
  String toString() {
    return 'SalaryFingerDetail(id: $id, idChamCongMoi: $idChamCongMoi, employeeId: $employeeId, checkIn: $checkIn, checkOut: $checkOut, isLate: $isLate, timeLate: $timeLate, isEarly: $isEarly, timeEarly: $timeEarly, attendanceDate: $attendanceDate, dayWeek: $dayWeek, interval: $interval, stt: $stt, fullName: $fullName, toChuc: $toChuc, chucVu: $chucVu, isLunch: $isLunch, overtime: $overtime, bussiness: $bussiness, noFingerprint: $noFingerprint, onLeave: $onLeave, wfh: $wfh, departmentName: $departmentName, isLateRegister: $isLateRegister, isEarlyRegister: $isEarlyRegister, totalDay: $totalDay, holidayDay: $holidayDay, departmentId: $departmentId, departmentStt: $departmentStt, overtimeLate: $overtimeLate, overtimeEarly: $overtimeEarly, isOverEarly: $isOverEarly, isOverLate: $isOverLate, checkInDate: $checkInDate, checkOutDate: $checkOutDate, typeLate: $typeLate, typeEarly: $typeEarly, code: $code, isLateActual: $isLateActual, isEarlyActual: $isEarlyActual, totalProblem: $totalProblem, maxIsLate: $maxIsLate, maxIsEarly: $maxIsEarly, isNoFinger: $isNoFinger, isNoCheckIn: $isNoCheckIn, isNoCheckOut: $isNoCheckOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryFingerDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idChamCongMoi, idChamCongMoi) ||
                other.idChamCongMoi == idChamCongMoi) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.isLate, isLate) || other.isLate == isLate) &&
            (identical(other.timeLate, timeLate) ||
                other.timeLate == timeLate) &&
            (identical(other.isEarly, isEarly) || other.isEarly == isEarly) &&
            (identical(other.timeEarly, timeEarly) ||
                other.timeEarly == timeEarly) &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.dayWeek, dayWeek) || other.dayWeek == dayWeek) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.toChuc, toChuc) || other.toChuc == toChuc) &&
            (identical(other.chucVu, chucVu) || other.chucVu == chucVu) &&
            (identical(other.isLunch, isLunch) || other.isLunch == isLunch) &&
            (identical(other.overtime, overtime) ||
                other.overtime == overtime) &&
            (identical(other.bussiness, bussiness) ||
                other.bussiness == bussiness) &&
            (identical(other.noFingerprint, noFingerprint) ||
                other.noFingerprint == noFingerprint) &&
            (identical(other.onLeave, onLeave) || other.onLeave == onLeave) &&
            (identical(other.wfh, wfh) || other.wfh == wfh) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.isLateRegister, isLateRegister) ||
                other.isLateRegister == isLateRegister) &&
            (identical(other.isEarlyRegister, isEarlyRegister) ||
                other.isEarlyRegister == isEarlyRegister) &&
            (identical(other.totalDay, totalDay) ||
                other.totalDay == totalDay) &&
            (identical(other.holidayDay, holidayDay) ||
                other.holidayDay == holidayDay) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentStt, departmentStt) ||
                other.departmentStt == departmentStt) &&
            (identical(other.overtimeLate, overtimeLate) ||
                other.overtimeLate == overtimeLate) &&
            (identical(other.overtimeEarly, overtimeEarly) ||
                other.overtimeEarly == overtimeEarly) &&
            (identical(other.isOverEarly, isOverEarly) ||
                other.isOverEarly == isOverEarly) &&
            (identical(other.isOverLate, isOverLate) ||
                other.isOverLate == isOverLate) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.typeLate, typeLate) ||
                other.typeLate == typeLate) &&
            (identical(other.typeEarly, typeEarly) ||
                other.typeEarly == typeEarly) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isLateActual, isLateActual) ||
                other.isLateActual == isLateActual) &&
            (identical(other.isEarlyActual, isEarlyActual) ||
                other.isEarlyActual == isEarlyActual) &&
            (identical(other.totalProblem, totalProblem) ||
                other.totalProblem == totalProblem) &&
            (identical(other.maxIsLate, maxIsLate) ||
                other.maxIsLate == maxIsLate) &&
            (identical(other.maxIsEarly, maxIsEarly) ||
                other.maxIsEarly == maxIsEarly) &&
            (identical(other.isNoFinger, isNoFinger) ||
                other.isNoFinger == isNoFinger) &&
            (identical(other.isNoCheckIn, isNoCheckIn) ||
                other.isNoCheckIn == isNoCheckIn) &&
            (identical(other.isNoCheckOut, isNoCheckOut) ||
                other.isNoCheckOut == isNoCheckOut));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        idChamCongMoi,
        employeeId,
        checkIn,
        checkOut,
        isLate,
        timeLate,
        isEarly,
        timeEarly,
        attendanceDate,
        dayWeek,
        interval,
        stt,
        fullName,
        toChuc,
        chucVu,
        isLunch,
        overtime,
        bussiness,
        noFingerprint,
        onLeave,
        wfh,
        departmentName,
        isLateRegister,
        isEarlyRegister,
        totalDay,
        holidayDay,
        departmentId,
        departmentStt,
        overtimeLate,
        overtimeEarly,
        isOverEarly,
        isOverLate,
        checkInDate,
        checkOutDate,
        typeLate,
        typeEarly,
        code,
        isLateActual,
        isEarlyActual,
        totalProblem,
        maxIsLate,
        maxIsEarly,
        isNoFinger,
        isNoCheckIn,
        isNoCheckOut
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryFingerDetailImplCopyWith<_$SalaryFingerDetailImpl> get copyWith =>
      __$$SalaryFingerDetailImplCopyWithImpl<_$SalaryFingerDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryFingerDetailImplToJson(
      this,
    );
  }
}

abstract class _SalaryFingerDetail implements SalaryFingerDetail {
  const factory _SalaryFingerDetail(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'IDChamCongMoi') final String? idChamCongMoi,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'CheckIn') final String? checkIn,
          @JsonKey(name: 'CheckOut') final String? checkOut,
          @JsonKey(name: 'IsLate') final bool? isLate,
          @JsonKey(name: 'TimeLate') final double? timeLate,
          @JsonKey(name: 'IsEarly') final bool? isEarly,
          @JsonKey(name: 'TimeEarly') final double? timeEarly,
          @JsonKey(name: 'AttendanceDate') final DateTime? attendanceDate,
          @JsonKey(name: 'DayWeek') final String? dayWeek,
          @JsonKey(name: 'Interval') final String? interval,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'ToChuc') final String? toChuc,
          @JsonKey(name: 'ChucVu') final String? chucVu,
          @JsonKey(name: 'IsLunch') final bool? isLunch,
          @JsonKey(name: 'Overtime') final bool? overtime,
          @JsonKey(name: 'Bussiness') final bool? bussiness,
          @JsonKey(name: 'NoFingerprint') final bool? noFingerprint,
          @JsonKey(name: 'OnLeave') final bool? onLeave,
          @JsonKey(name: 'WFH') final bool? wfh,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'IsLateRegister') final bool? isLateRegister,
          @JsonKey(name: 'IsEarlyRegister') final bool? isEarlyRegister,
          @JsonKey(name: 'TotalDay') final double? totalDay,
          @JsonKey(name: 'HolidayDay') final int? holidayDay,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'DepartmentSTT') final int? departmentStt,
          @JsonKey(name: 'OvertimeLate') final int? overtimeLate,
          @JsonKey(name: 'OvertimeEarly') final int? overtimeEarly,
          @JsonKey(name: 'IsOverEarly') final bool? isOverEarly,
          @JsonKey(name: 'IsOverLate') final bool? isOverLate,
          @JsonKey(name: 'CheckInDate') final DateTime? checkInDate,
          @JsonKey(name: 'CheckOutDate') final DateTime? checkOutDate,
          @JsonKey(name: 'TypeLate') final int? typeLate,
          @JsonKey(name: 'TypeEarly') final int? typeEarly,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'IsLateActual') final int? isLateActual,
          @JsonKey(name: 'IsEarlyActual') final int? isEarlyActual,
          @JsonKey(name: 'TotalProblem') final int? totalProblem,
          @JsonKey(name: 'MaxIsLate') final int? maxIsLate,
          @JsonKey(name: 'MaxIsEarly') final int? maxIsEarly,
          @JsonKey(name: 'IsNoFinger') final int? isNoFinger,
          @JsonKey(name: 'IsNoCheckIn') final int? isNoCheckIn,
          @JsonKey(name: 'IsNoCheckOut') final int? isNoCheckOut}) =
      _$SalaryFingerDetailImpl;

  factory _SalaryFingerDetail.fromJson(Map<String, dynamic> json) =
      _$SalaryFingerDetailImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'CheckIn')
  String? get checkIn;
  @override
  @JsonKey(name: 'CheckOut')
  String? get checkOut;
  @override
  @JsonKey(name: 'IsLate')
  bool? get isLate;
  @override
  @JsonKey(name: 'TimeLate')
  double? get timeLate;
  @override
  @JsonKey(name: 'IsEarly')
  bool? get isEarly;
  @override
  @JsonKey(name: 'TimeEarly')
  double? get timeEarly;
  @override
  @JsonKey(name: 'AttendanceDate')
  DateTime? get attendanceDate;
  @override
  @JsonKey(name: 'DayWeek')
  String? get dayWeek;
  @override
  @JsonKey(name: 'Interval')
  String? get interval;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'ToChuc')
  String? get toChuc;
  @override
  @JsonKey(name: 'ChucVu')
  String? get chucVu;
  @override
  @JsonKey(name: 'IsLunch')
  bool? get isLunch;
  @override
  @JsonKey(name: 'Overtime')
  bool? get overtime;
  @override
  @JsonKey(name: 'Bussiness')
  bool? get bussiness;
  @override
  @JsonKey(name: 'NoFingerprint')
  bool? get noFingerprint;
  @override
  @JsonKey(name: 'OnLeave')
  bool? get onLeave;
  @override
  @JsonKey(name: 'WFH')
  bool? get wfh;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'IsLateRegister')
  bool? get isLateRegister;
  @override
  @JsonKey(name: 'IsEarlyRegister')
  bool? get isEarlyRegister;
  @override
  @JsonKey(name: 'TotalDay')
  double? get totalDay;
  @override
  @JsonKey(name: 'HolidayDay')
  int? get holidayDay;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt;
  @override
  @JsonKey(name: 'OvertimeLate')
  int? get overtimeLate;
  @override
  @JsonKey(name: 'OvertimeEarly')
  int? get overtimeEarly;
  @override
  @JsonKey(name: 'IsOverEarly')
  bool? get isOverEarly;
  @override
  @JsonKey(name: 'IsOverLate')
  bool? get isOverLate;
  @override
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate;
  @override
  @JsonKey(name: 'TypeLate')
  int? get typeLate;
  @override
  @JsonKey(name: 'TypeEarly')
  int? get typeEarly;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'IsLateActual')
  int? get isLateActual;
  @override
  @JsonKey(name: 'IsEarlyActual')
  int? get isEarlyActual;
  @override
  @JsonKey(name: 'TotalProblem')
  int? get totalProblem;
  @override
  @JsonKey(name: 'MaxIsLate')
  int? get maxIsLate;
  @override
  @JsonKey(name: 'MaxIsEarly')
  int? get maxIsEarly;
  @override
  @JsonKey(name: 'IsNoFinger')
  int? get isNoFinger;
  @override
  @JsonKey(name: 'IsNoCheckIn')
  int? get isNoCheckIn;
  @override
  @JsonKey(name: 'IsNoCheckOut')
  int? get isNoCheckOut;
  @override
  @JsonKey(ignore: true)
  _$$SalaryFingerDetailImplCopyWith<_$SalaryFingerDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryListChamCong _$SalaryListChamCongFromJson(Map<String, dynamic> json) {
  return _SalaryListChamCong.fromJson(json);
}

/// @nodoc
mixin _$SalaryListChamCong {
  @JsonKey(name: 'header')
  List<SalaryListChamCongHeader>? get header =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  SalaryListChamCongData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalworkday')
  int? get totalworkday => throw _privateConstructorUsedError;
  @JsonKey(name: 'detail')
  List<SalaryListChamCongDetail>? get detail =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryListChamCongCopyWith<SalaryListChamCong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryListChamCongCopyWith<$Res> {
  factory $SalaryListChamCongCopyWith(
          SalaryListChamCong value, $Res Function(SalaryListChamCong) then) =
      _$SalaryListChamCongCopyWithImpl<$Res, SalaryListChamCong>;
  @useResult
  $Res call(
      {@JsonKey(name: 'header') List<SalaryListChamCongHeader>? header,
      @JsonKey(name: 'data') SalaryListChamCongData? data,
      @JsonKey(name: 'totalworkday') int? totalworkday,
      @JsonKey(name: 'detail') List<SalaryListChamCongDetail>? detail});

  $SalaryListChamCongDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SalaryListChamCongCopyWithImpl<$Res, $Val extends SalaryListChamCong>
    implements $SalaryListChamCongCopyWith<$Res> {
  _$SalaryListChamCongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? data = freezed,
    Object? totalworkday = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as List<SalaryListChamCongHeader>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalaryListChamCongData?,
      totalworkday: freezed == totalworkday
          ? _value.totalworkday
          : totalworkday // ignore: cast_nullable_to_non_nullable
              as int?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<SalaryListChamCongDetail>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryListChamCongDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SalaryListChamCongDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalaryListChamCongImplCopyWith<$Res>
    implements $SalaryListChamCongCopyWith<$Res> {
  factory _$$SalaryListChamCongImplCopyWith(_$SalaryListChamCongImpl value,
          $Res Function(_$SalaryListChamCongImpl) then) =
      __$$SalaryListChamCongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'header') List<SalaryListChamCongHeader>? header,
      @JsonKey(name: 'data') SalaryListChamCongData? data,
      @JsonKey(name: 'totalworkday') int? totalworkday,
      @JsonKey(name: 'detail') List<SalaryListChamCongDetail>? detail});

  @override
  $SalaryListChamCongDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SalaryListChamCongImplCopyWithImpl<$Res>
    extends _$SalaryListChamCongCopyWithImpl<$Res, _$SalaryListChamCongImpl>
    implements _$$SalaryListChamCongImplCopyWith<$Res> {
  __$$SalaryListChamCongImplCopyWithImpl(_$SalaryListChamCongImpl _value,
      $Res Function(_$SalaryListChamCongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? data = freezed,
    Object? totalworkday = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$SalaryListChamCongImpl(
      header: freezed == header
          ? _value._header
          : header // ignore: cast_nullable_to_non_nullable
              as List<SalaryListChamCongHeader>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalaryListChamCongData?,
      totalworkday: freezed == totalworkday
          ? _value.totalworkday
          : totalworkday // ignore: cast_nullable_to_non_nullable
              as int?,
      detail: freezed == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<SalaryListChamCongDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryListChamCongImpl implements _SalaryListChamCong {
  const _$SalaryListChamCongImpl(
      {@JsonKey(name: 'header') final List<SalaryListChamCongHeader>? header,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'totalworkday') this.totalworkday,
      @JsonKey(name: 'detail') final List<SalaryListChamCongDetail>? detail})
      : _header = header,
        _detail = detail;

  factory _$SalaryListChamCongImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryListChamCongImplFromJson(json);

  final List<SalaryListChamCongHeader>? _header;
  @override
  @JsonKey(name: 'header')
  List<SalaryListChamCongHeader>? get header {
    final value = _header;
    if (value == null) return null;
    if (_header is EqualUnmodifiableListView) return _header;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'data')
  final SalaryListChamCongData? data;
  @override
  @JsonKey(name: 'totalworkday')
  final int? totalworkday;
  final List<SalaryListChamCongDetail>? _detail;
  @override
  @JsonKey(name: 'detail')
  List<SalaryListChamCongDetail>? get detail {
    final value = _detail;
    if (value == null) return null;
    if (_detail is EqualUnmodifiableListView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SalaryListChamCong(header: $header, data: $data, totalworkday: $totalworkday, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryListChamCongImpl &&
            const DeepCollectionEquality().equals(other._header, _header) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.totalworkday, totalworkday) ||
                other.totalworkday == totalworkday) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_header),
      data,
      totalworkday,
      const DeepCollectionEquality().hash(_detail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryListChamCongImplCopyWith<_$SalaryListChamCongImpl> get copyWith =>
      __$$SalaryListChamCongImplCopyWithImpl<_$SalaryListChamCongImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryListChamCongImplToJson(
      this,
    );
  }
}

abstract class _SalaryListChamCong implements SalaryListChamCong {
  const factory _SalaryListChamCong(
      {@JsonKey(name: 'header') final List<SalaryListChamCongHeader>? header,
      @JsonKey(name: 'data') final SalaryListChamCongData? data,
      @JsonKey(name: 'totalworkday') final int? totalworkday,
      @JsonKey(name: 'detail')
      final List<SalaryListChamCongDetail>? detail}) = _$SalaryListChamCongImpl;

  factory _SalaryListChamCong.fromJson(Map<String, dynamic> json) =
      _$SalaryListChamCongImpl.fromJson;

  @override
  @JsonKey(name: 'header')
  List<SalaryListChamCongHeader>? get header;
  @override
  @JsonKey(name: 'data')
  SalaryListChamCongData? get data;
  @override
  @JsonKey(name: 'totalworkday')
  int? get totalworkday;
  @override
  @JsonKey(name: 'detail')
  List<SalaryListChamCongDetail>? get detail;
  @override
  @JsonKey(ignore: true)
  _$$SalaryListChamCongImplCopyWith<_$SalaryListChamCongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryListChamCongHeader _$SalaryListChamCongHeaderFromJson(
    Map<String, dynamic> json) {
  return _SalaryListChamCongHeader.fromJson(json);
}

/// @nodoc
mixin _$SalaryListChamCongHeader {
  @JsonKey(name: 'fieldname')
  String? get fieldname => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'statuswork')
  int? get statuswork => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryListChamCongHeaderCopyWith<SalaryListChamCongHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryListChamCongHeaderCopyWith<$Res> {
  factory $SalaryListChamCongHeaderCopyWith(SalaryListChamCongHeader value,
          $Res Function(SalaryListChamCongHeader) then) =
      _$SalaryListChamCongHeaderCopyWithImpl<$Res, SalaryListChamCongHeader>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fieldname') String? fieldname,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'statuswork') int? statuswork});
}

/// @nodoc
class _$SalaryListChamCongHeaderCopyWithImpl<$Res,
        $Val extends SalaryListChamCongHeader>
    implements $SalaryListChamCongHeaderCopyWith<$Res> {
  _$SalaryListChamCongHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldname = freezed,
    Object? text = freezed,
    Object? statuswork = freezed,
  }) {
    return _then(_value.copyWith(
      fieldname: freezed == fieldname
          ? _value.fieldname
          : fieldname // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      statuswork: freezed == statuswork
          ? _value.statuswork
          : statuswork // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryListChamCongHeaderImplCopyWith<$Res>
    implements $SalaryListChamCongHeaderCopyWith<$Res> {
  factory _$$SalaryListChamCongHeaderImplCopyWith(
          _$SalaryListChamCongHeaderImpl value,
          $Res Function(_$SalaryListChamCongHeaderImpl) then) =
      __$$SalaryListChamCongHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fieldname') String? fieldname,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'statuswork') int? statuswork});
}

/// @nodoc
class __$$SalaryListChamCongHeaderImplCopyWithImpl<$Res>
    extends _$SalaryListChamCongHeaderCopyWithImpl<$Res,
        _$SalaryListChamCongHeaderImpl>
    implements _$$SalaryListChamCongHeaderImplCopyWith<$Res> {
  __$$SalaryListChamCongHeaderImplCopyWithImpl(
      _$SalaryListChamCongHeaderImpl _value,
      $Res Function(_$SalaryListChamCongHeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldname = freezed,
    Object? text = freezed,
    Object? statuswork = freezed,
  }) {
    return _then(_$SalaryListChamCongHeaderImpl(
      fieldname: freezed == fieldname
          ? _value.fieldname
          : fieldname // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      statuswork: freezed == statuswork
          ? _value.statuswork
          : statuswork // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryListChamCongHeaderImpl implements _SalaryListChamCongHeader {
  const _$SalaryListChamCongHeaderImpl(
      {@JsonKey(name: 'fieldname') this.fieldname,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'statuswork') this.statuswork});

  factory _$SalaryListChamCongHeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryListChamCongHeaderImplFromJson(json);

  @override
  @JsonKey(name: 'fieldname')
  final String? fieldname;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'statuswork')
  final int? statuswork;

  @override
  String toString() {
    return 'SalaryListChamCongHeader(fieldname: $fieldname, text: $text, statuswork: $statuswork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryListChamCongHeaderImpl &&
            (identical(other.fieldname, fieldname) ||
                other.fieldname == fieldname) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.statuswork, statuswork) ||
                other.statuswork == statuswork));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fieldname, text, statuswork);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryListChamCongHeaderImplCopyWith<_$SalaryListChamCongHeaderImpl>
      get copyWith => __$$SalaryListChamCongHeaderImplCopyWithImpl<
          _$SalaryListChamCongHeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryListChamCongHeaderImplToJson(
      this,
    );
  }
}

abstract class _SalaryListChamCongHeader implements SalaryListChamCongHeader {
  const factory _SalaryListChamCongHeader(
          {@JsonKey(name: 'fieldname') final String? fieldname,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'statuswork') final int? statuswork}) =
      _$SalaryListChamCongHeaderImpl;

  factory _SalaryListChamCongHeader.fromJson(Map<String, dynamic> json) =
      _$SalaryListChamCongHeaderImpl.fromJson;

  @override
  @JsonKey(name: 'fieldname')
  String? get fieldname;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'statuswork')
  int? get statuswork;
  @override
  @JsonKey(ignore: true)
  _$$SalaryListChamCongHeaderImplCopyWith<_$SalaryListChamCongHeaderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SalaryListChamCongData _$SalaryListChamCongDataFromJson(
    Map<String, dynamic> json) {
  return _SalaryListChamCongData.fromJson(json);
}

/// @nodoc
mixin _$SalaryListChamCongData {
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionName')
  String? get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriorityOrder')
  int? get priorityOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'D1')
  String? get d1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D2')
  String? get d2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D3')
  String? get d3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D4')
  String? get d4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D5')
  String? get d5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D6')
  String? get d6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D7')
  String? get d7 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D8')
  String? get d8 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D9')
  String? get d9 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D10')
  String? get d10 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D11')
  String? get d11 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D12')
  String? get d12 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D13')
  String? get d13 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D14')
  String? get d14 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D15')
  String? get d15 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D16')
  String? get d16 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D17')
  String? get d17 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D18')
  String? get d18 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D19')
  String? get d19 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D20')
  String? get d20 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D21')
  String? get d21 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D22')
  String? get d22 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D23')
  String? get d23 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D24')
  String? get d24 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D25')
  String? get d25 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D26')
  String? get d26 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D27')
  String? get d27 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D28')
  String? get d28 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D29')
  String? get d29 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D30')
  String? get d30 => throw _privateConstructorUsedError;
  @JsonKey(name: 'D31')
  String? get d31 => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayActual')
  double? get totalDayActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHoliday')
  int? get totalHoliday => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayOnleave2')
  double? get totalDayOnleave2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayOnleave3')
  double? get totalDayOnleave3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayWFH')
  double? get totalDayWfh => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayGet')
  double? get totalDayGet => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayOnleave1')
  double? get totalDayOnleave1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDay')
  double? get totalDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryListChamCongDataCopyWith<SalaryListChamCongData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryListChamCongDataCopyWith<$Res> {
  factory $SalaryListChamCongDataCopyWith(SalaryListChamCongData value,
          $Res Function(SalaryListChamCongData) then) =
      _$SalaryListChamCongDataCopyWithImpl<$Res, SalaryListChamCongData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'PositionName') String? positionName,
      @JsonKey(name: 'PriorityOrder') int? priorityOrder,
      @JsonKey(name: 'D1') String? d1,
      @JsonKey(name: 'D2') String? d2,
      @JsonKey(name: 'D3') String? d3,
      @JsonKey(name: 'D4') String? d4,
      @JsonKey(name: 'D5') String? d5,
      @JsonKey(name: 'D6') String? d6,
      @JsonKey(name: 'D7') String? d7,
      @JsonKey(name: 'D8') String? d8,
      @JsonKey(name: 'D9') String? d9,
      @JsonKey(name: 'D10') String? d10,
      @JsonKey(name: 'D11') String? d11,
      @JsonKey(name: 'D12') String? d12,
      @JsonKey(name: 'D13') String? d13,
      @JsonKey(name: 'D14') String? d14,
      @JsonKey(name: 'D15') String? d15,
      @JsonKey(name: 'D16') String? d16,
      @JsonKey(name: 'D17') String? d17,
      @JsonKey(name: 'D18') String? d18,
      @JsonKey(name: 'D19') String? d19,
      @JsonKey(name: 'D20') String? d20,
      @JsonKey(name: 'D21') String? d21,
      @JsonKey(name: 'D22') String? d22,
      @JsonKey(name: 'D23') String? d23,
      @JsonKey(name: 'D24') String? d24,
      @JsonKey(name: 'D25') String? d25,
      @JsonKey(name: 'D26') String? d26,
      @JsonKey(name: 'D27') String? d27,
      @JsonKey(name: 'D28') String? d28,
      @JsonKey(name: 'D29') String? d29,
      @JsonKey(name: 'D30') String? d30,
      @JsonKey(name: 'D31') String? d31,
      @JsonKey(name: 'TotalDayActual') double? totalDayActual,
      @JsonKey(name: 'TotalHoliday') int? totalHoliday,
      @JsonKey(name: 'TotalDayOnleave2') double? totalDayOnleave2,
      @JsonKey(name: 'TotalDayOnleave3') double? totalDayOnleave3,
      @JsonKey(name: 'TotalDayWFH') double? totalDayWfh,
      @JsonKey(name: 'TotalDayGet') double? totalDayGet,
      @JsonKey(name: 'TotalDayOnleave1') double? totalDayOnleave1,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class _$SalaryListChamCongDataCopyWithImpl<$Res,
        $Val extends SalaryListChamCongData>
    implements $SalaryListChamCongDataCopyWith<$Res> {
  _$SalaryListChamCongDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? positionName = freezed,
    Object? priorityOrder = freezed,
    Object? d1 = freezed,
    Object? d2 = freezed,
    Object? d3 = freezed,
    Object? d4 = freezed,
    Object? d5 = freezed,
    Object? d6 = freezed,
    Object? d7 = freezed,
    Object? d8 = freezed,
    Object? d9 = freezed,
    Object? d10 = freezed,
    Object? d11 = freezed,
    Object? d12 = freezed,
    Object? d13 = freezed,
    Object? d14 = freezed,
    Object? d15 = freezed,
    Object? d16 = freezed,
    Object? d17 = freezed,
    Object? d18 = freezed,
    Object? d19 = freezed,
    Object? d20 = freezed,
    Object? d21 = freezed,
    Object? d22 = freezed,
    Object? d23 = freezed,
    Object? d24 = freezed,
    Object? d25 = freezed,
    Object? d26 = freezed,
    Object? d27 = freezed,
    Object? d28 = freezed,
    Object? d29 = freezed,
    Object? d30 = freezed,
    Object? d31 = freezed,
    Object? totalDayActual = freezed,
    Object? totalHoliday = freezed,
    Object? totalDayOnleave2 = freezed,
    Object? totalDayOnleave3 = freezed,
    Object? totalDayWfh = freezed,
    Object? totalDayGet = freezed,
    Object? totalDayOnleave1 = freezed,
    Object? totalDay = freezed,
    Object? departmentStt = freezed,
    Object? stt = freezed,
  }) {
    return _then(_value.copyWith(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityOrder: freezed == priorityOrder
          ? _value.priorityOrder
          : priorityOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      d1: freezed == d1
          ? _value.d1
          : d1 // ignore: cast_nullable_to_non_nullable
              as String?,
      d2: freezed == d2
          ? _value.d2
          : d2 // ignore: cast_nullable_to_non_nullable
              as String?,
      d3: freezed == d3
          ? _value.d3
          : d3 // ignore: cast_nullable_to_non_nullable
              as String?,
      d4: freezed == d4
          ? _value.d4
          : d4 // ignore: cast_nullable_to_non_nullable
              as String?,
      d5: freezed == d5
          ? _value.d5
          : d5 // ignore: cast_nullable_to_non_nullable
              as String?,
      d6: freezed == d6
          ? _value.d6
          : d6 // ignore: cast_nullable_to_non_nullable
              as String?,
      d7: freezed == d7
          ? _value.d7
          : d7 // ignore: cast_nullable_to_non_nullable
              as String?,
      d8: freezed == d8
          ? _value.d8
          : d8 // ignore: cast_nullable_to_non_nullable
              as String?,
      d9: freezed == d9
          ? _value.d9
          : d9 // ignore: cast_nullable_to_non_nullable
              as String?,
      d10: freezed == d10
          ? _value.d10
          : d10 // ignore: cast_nullable_to_non_nullable
              as String?,
      d11: freezed == d11
          ? _value.d11
          : d11 // ignore: cast_nullable_to_non_nullable
              as String?,
      d12: freezed == d12
          ? _value.d12
          : d12 // ignore: cast_nullable_to_non_nullable
              as String?,
      d13: freezed == d13
          ? _value.d13
          : d13 // ignore: cast_nullable_to_non_nullable
              as String?,
      d14: freezed == d14
          ? _value.d14
          : d14 // ignore: cast_nullable_to_non_nullable
              as String?,
      d15: freezed == d15
          ? _value.d15
          : d15 // ignore: cast_nullable_to_non_nullable
              as String?,
      d16: freezed == d16
          ? _value.d16
          : d16 // ignore: cast_nullable_to_non_nullable
              as String?,
      d17: freezed == d17
          ? _value.d17
          : d17 // ignore: cast_nullable_to_non_nullable
              as String?,
      d18: freezed == d18
          ? _value.d18
          : d18 // ignore: cast_nullable_to_non_nullable
              as String?,
      d19: freezed == d19
          ? _value.d19
          : d19 // ignore: cast_nullable_to_non_nullable
              as String?,
      d20: freezed == d20
          ? _value.d20
          : d20 // ignore: cast_nullable_to_non_nullable
              as String?,
      d21: freezed == d21
          ? _value.d21
          : d21 // ignore: cast_nullable_to_non_nullable
              as String?,
      d22: freezed == d22
          ? _value.d22
          : d22 // ignore: cast_nullable_to_non_nullable
              as String?,
      d23: freezed == d23
          ? _value.d23
          : d23 // ignore: cast_nullable_to_non_nullable
              as String?,
      d24: freezed == d24
          ? _value.d24
          : d24 // ignore: cast_nullable_to_non_nullable
              as String?,
      d25: freezed == d25
          ? _value.d25
          : d25 // ignore: cast_nullable_to_non_nullable
              as String?,
      d26: freezed == d26
          ? _value.d26
          : d26 // ignore: cast_nullable_to_non_nullable
              as String?,
      d27: freezed == d27
          ? _value.d27
          : d27 // ignore: cast_nullable_to_non_nullable
              as String?,
      d28: freezed == d28
          ? _value.d28
          : d28 // ignore: cast_nullable_to_non_nullable
              as String?,
      d29: freezed == d29
          ? _value.d29
          : d29 // ignore: cast_nullable_to_non_nullable
              as String?,
      d30: freezed == d30
          ? _value.d30
          : d30 // ignore: cast_nullable_to_non_nullable
              as String?,
      d31: freezed == d31
          ? _value.d31
          : d31 // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayActual: freezed == totalDayActual
          ? _value.totalDayActual
          : totalDayActual // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHoliday: freezed == totalHoliday
          ? _value.totalHoliday
          : totalHoliday // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDayOnleave2: freezed == totalDayOnleave2
          ? _value.totalDayOnleave2
          : totalDayOnleave2 // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayOnleave3: freezed == totalDayOnleave3
          ? _value.totalDayOnleave3
          : totalDayOnleave3 // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayWfh: freezed == totalDayWfh
          ? _value.totalDayWfh
          : totalDayWfh // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayGet: freezed == totalDayGet
          ? _value.totalDayGet
          : totalDayGet // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayOnleave1: freezed == totalDayOnleave1
          ? _value.totalDayOnleave1
          : totalDayOnleave1 // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryListChamCongDataImplCopyWith<$Res>
    implements $SalaryListChamCongDataCopyWith<$Res> {
  factory _$$SalaryListChamCongDataImplCopyWith(
          _$SalaryListChamCongDataImpl value,
          $Res Function(_$SalaryListChamCongDataImpl) then) =
      __$$SalaryListChamCongDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'PositionName') String? positionName,
      @JsonKey(name: 'PriorityOrder') int? priorityOrder,
      @JsonKey(name: 'D1') String? d1,
      @JsonKey(name: 'D2') String? d2,
      @JsonKey(name: 'D3') String? d3,
      @JsonKey(name: 'D4') String? d4,
      @JsonKey(name: 'D5') String? d5,
      @JsonKey(name: 'D6') String? d6,
      @JsonKey(name: 'D7') String? d7,
      @JsonKey(name: 'D8') String? d8,
      @JsonKey(name: 'D9') String? d9,
      @JsonKey(name: 'D10') String? d10,
      @JsonKey(name: 'D11') String? d11,
      @JsonKey(name: 'D12') String? d12,
      @JsonKey(name: 'D13') String? d13,
      @JsonKey(name: 'D14') String? d14,
      @JsonKey(name: 'D15') String? d15,
      @JsonKey(name: 'D16') String? d16,
      @JsonKey(name: 'D17') String? d17,
      @JsonKey(name: 'D18') String? d18,
      @JsonKey(name: 'D19') String? d19,
      @JsonKey(name: 'D20') String? d20,
      @JsonKey(name: 'D21') String? d21,
      @JsonKey(name: 'D22') String? d22,
      @JsonKey(name: 'D23') String? d23,
      @JsonKey(name: 'D24') String? d24,
      @JsonKey(name: 'D25') String? d25,
      @JsonKey(name: 'D26') String? d26,
      @JsonKey(name: 'D27') String? d27,
      @JsonKey(name: 'D28') String? d28,
      @JsonKey(name: 'D29') String? d29,
      @JsonKey(name: 'D30') String? d30,
      @JsonKey(name: 'D31') String? d31,
      @JsonKey(name: 'TotalDayActual') double? totalDayActual,
      @JsonKey(name: 'TotalHoliday') int? totalHoliday,
      @JsonKey(name: 'TotalDayOnleave2') double? totalDayOnleave2,
      @JsonKey(name: 'TotalDayOnleave3') double? totalDayOnleave3,
      @JsonKey(name: 'TotalDayWFH') double? totalDayWfh,
      @JsonKey(name: 'TotalDayGet') double? totalDayGet,
      @JsonKey(name: 'TotalDayOnleave1') double? totalDayOnleave1,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class __$$SalaryListChamCongDataImplCopyWithImpl<$Res>
    extends _$SalaryListChamCongDataCopyWithImpl<$Res,
        _$SalaryListChamCongDataImpl>
    implements _$$SalaryListChamCongDataImplCopyWith<$Res> {
  __$$SalaryListChamCongDataImplCopyWithImpl(
      _$SalaryListChamCongDataImpl _value,
      $Res Function(_$SalaryListChamCongDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? positionName = freezed,
    Object? priorityOrder = freezed,
    Object? d1 = freezed,
    Object? d2 = freezed,
    Object? d3 = freezed,
    Object? d4 = freezed,
    Object? d5 = freezed,
    Object? d6 = freezed,
    Object? d7 = freezed,
    Object? d8 = freezed,
    Object? d9 = freezed,
    Object? d10 = freezed,
    Object? d11 = freezed,
    Object? d12 = freezed,
    Object? d13 = freezed,
    Object? d14 = freezed,
    Object? d15 = freezed,
    Object? d16 = freezed,
    Object? d17 = freezed,
    Object? d18 = freezed,
    Object? d19 = freezed,
    Object? d20 = freezed,
    Object? d21 = freezed,
    Object? d22 = freezed,
    Object? d23 = freezed,
    Object? d24 = freezed,
    Object? d25 = freezed,
    Object? d26 = freezed,
    Object? d27 = freezed,
    Object? d28 = freezed,
    Object? d29 = freezed,
    Object? d30 = freezed,
    Object? d31 = freezed,
    Object? totalDayActual = freezed,
    Object? totalHoliday = freezed,
    Object? totalDayOnleave2 = freezed,
    Object? totalDayOnleave3 = freezed,
    Object? totalDayWfh = freezed,
    Object? totalDayGet = freezed,
    Object? totalDayOnleave1 = freezed,
    Object? totalDay = freezed,
    Object? departmentStt = freezed,
    Object? stt = freezed,
  }) {
    return _then(_$SalaryListChamCongDataImpl(
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityOrder: freezed == priorityOrder
          ? _value.priorityOrder
          : priorityOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      d1: freezed == d1
          ? _value.d1
          : d1 // ignore: cast_nullable_to_non_nullable
              as String?,
      d2: freezed == d2
          ? _value.d2
          : d2 // ignore: cast_nullable_to_non_nullable
              as String?,
      d3: freezed == d3
          ? _value.d3
          : d3 // ignore: cast_nullable_to_non_nullable
              as String?,
      d4: freezed == d4
          ? _value.d4
          : d4 // ignore: cast_nullable_to_non_nullable
              as String?,
      d5: freezed == d5
          ? _value.d5
          : d5 // ignore: cast_nullable_to_non_nullable
              as String?,
      d6: freezed == d6
          ? _value.d6
          : d6 // ignore: cast_nullable_to_non_nullable
              as String?,
      d7: freezed == d7
          ? _value.d7
          : d7 // ignore: cast_nullable_to_non_nullable
              as String?,
      d8: freezed == d8
          ? _value.d8
          : d8 // ignore: cast_nullable_to_non_nullable
              as String?,
      d9: freezed == d9
          ? _value.d9
          : d9 // ignore: cast_nullable_to_non_nullable
              as String?,
      d10: freezed == d10
          ? _value.d10
          : d10 // ignore: cast_nullable_to_non_nullable
              as String?,
      d11: freezed == d11
          ? _value.d11
          : d11 // ignore: cast_nullable_to_non_nullable
              as String?,
      d12: freezed == d12
          ? _value.d12
          : d12 // ignore: cast_nullable_to_non_nullable
              as String?,
      d13: freezed == d13
          ? _value.d13
          : d13 // ignore: cast_nullable_to_non_nullable
              as String?,
      d14: freezed == d14
          ? _value.d14
          : d14 // ignore: cast_nullable_to_non_nullable
              as String?,
      d15: freezed == d15
          ? _value.d15
          : d15 // ignore: cast_nullable_to_non_nullable
              as String?,
      d16: freezed == d16
          ? _value.d16
          : d16 // ignore: cast_nullable_to_non_nullable
              as String?,
      d17: freezed == d17
          ? _value.d17
          : d17 // ignore: cast_nullable_to_non_nullable
              as String?,
      d18: freezed == d18
          ? _value.d18
          : d18 // ignore: cast_nullable_to_non_nullable
              as String?,
      d19: freezed == d19
          ? _value.d19
          : d19 // ignore: cast_nullable_to_non_nullable
              as String?,
      d20: freezed == d20
          ? _value.d20
          : d20 // ignore: cast_nullable_to_non_nullable
              as String?,
      d21: freezed == d21
          ? _value.d21
          : d21 // ignore: cast_nullable_to_non_nullable
              as String?,
      d22: freezed == d22
          ? _value.d22
          : d22 // ignore: cast_nullable_to_non_nullable
              as String?,
      d23: freezed == d23
          ? _value.d23
          : d23 // ignore: cast_nullable_to_non_nullable
              as String?,
      d24: freezed == d24
          ? _value.d24
          : d24 // ignore: cast_nullable_to_non_nullable
              as String?,
      d25: freezed == d25
          ? _value.d25
          : d25 // ignore: cast_nullable_to_non_nullable
              as String?,
      d26: freezed == d26
          ? _value.d26
          : d26 // ignore: cast_nullable_to_non_nullable
              as String?,
      d27: freezed == d27
          ? _value.d27
          : d27 // ignore: cast_nullable_to_non_nullable
              as String?,
      d28: freezed == d28
          ? _value.d28
          : d28 // ignore: cast_nullable_to_non_nullable
              as String?,
      d29: freezed == d29
          ? _value.d29
          : d29 // ignore: cast_nullable_to_non_nullable
              as String?,
      d30: freezed == d30
          ? _value.d30
          : d30 // ignore: cast_nullable_to_non_nullable
              as String?,
      d31: freezed == d31
          ? _value.d31
          : d31 // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayActual: freezed == totalDayActual
          ? _value.totalDayActual
          : totalDayActual // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHoliday: freezed == totalHoliday
          ? _value.totalHoliday
          : totalHoliday // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDayOnleave2: freezed == totalDayOnleave2
          ? _value.totalDayOnleave2
          : totalDayOnleave2 // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayOnleave3: freezed == totalDayOnleave3
          ? _value.totalDayOnleave3
          : totalDayOnleave3 // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayWfh: freezed == totalDayWfh
          ? _value.totalDayWfh
          : totalDayWfh // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayGet: freezed == totalDayGet
          ? _value.totalDayGet
          : totalDayGet // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDayOnleave1: freezed == totalDayOnleave1
          ? _value.totalDayOnleave1
          : totalDayOnleave1 // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryListChamCongDataImpl implements _SalaryListChamCongData {
  const _$SalaryListChamCongDataImpl(
      {@JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'PositionName') this.positionName,
      @JsonKey(name: 'PriorityOrder') this.priorityOrder,
      @JsonKey(name: 'D1') this.d1,
      @JsonKey(name: 'D2') this.d2,
      @JsonKey(name: 'D3') this.d3,
      @JsonKey(name: 'D4') this.d4,
      @JsonKey(name: 'D5') this.d5,
      @JsonKey(name: 'D6') this.d6,
      @JsonKey(name: 'D7') this.d7,
      @JsonKey(name: 'D8') this.d8,
      @JsonKey(name: 'D9') this.d9,
      @JsonKey(name: 'D10') this.d10,
      @JsonKey(name: 'D11') this.d11,
      @JsonKey(name: 'D12') this.d12,
      @JsonKey(name: 'D13') this.d13,
      @JsonKey(name: 'D14') this.d14,
      @JsonKey(name: 'D15') this.d15,
      @JsonKey(name: 'D16') this.d16,
      @JsonKey(name: 'D17') this.d17,
      @JsonKey(name: 'D18') this.d18,
      @JsonKey(name: 'D19') this.d19,
      @JsonKey(name: 'D20') this.d20,
      @JsonKey(name: 'D21') this.d21,
      @JsonKey(name: 'D22') this.d22,
      @JsonKey(name: 'D23') this.d23,
      @JsonKey(name: 'D24') this.d24,
      @JsonKey(name: 'D25') this.d25,
      @JsonKey(name: 'D26') this.d26,
      @JsonKey(name: 'D27') this.d27,
      @JsonKey(name: 'D28') this.d28,
      @JsonKey(name: 'D29') this.d29,
      @JsonKey(name: 'D30') this.d30,
      @JsonKey(name: 'D31') this.d31,
      @JsonKey(name: 'TotalDayActual') this.totalDayActual,
      @JsonKey(name: 'TotalHoliday') this.totalHoliday,
      @JsonKey(name: 'TotalDayOnleave2') this.totalDayOnleave2,
      @JsonKey(name: 'TotalDayOnleave3') this.totalDayOnleave3,
      @JsonKey(name: 'TotalDayWFH') this.totalDayWfh,
      @JsonKey(name: 'TotalDayGet') this.totalDayGet,
      @JsonKey(name: 'TotalDayOnleave1') this.totalDayOnleave1,
      @JsonKey(name: 'TotalDay') this.totalDay,
      @JsonKey(name: 'DepartmentSTT') this.departmentStt,
      @JsonKey(name: 'STT') this.stt});

  factory _$SalaryListChamCongDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryListChamCongDataImplFromJson(json);

  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'PositionName')
  final String? positionName;
  @override
  @JsonKey(name: 'PriorityOrder')
  final int? priorityOrder;
  @override
  @JsonKey(name: 'D1')
  final String? d1;
  @override
  @JsonKey(name: 'D2')
  final String? d2;
  @override
  @JsonKey(name: 'D3')
  final String? d3;
  @override
  @JsonKey(name: 'D4')
  final String? d4;
  @override
  @JsonKey(name: 'D5')
  final String? d5;
  @override
  @JsonKey(name: 'D6')
  final String? d6;
  @override
  @JsonKey(name: 'D7')
  final String? d7;
  @override
  @JsonKey(name: 'D8')
  final String? d8;
  @override
  @JsonKey(name: 'D9')
  final String? d9;
  @override
  @JsonKey(name: 'D10')
  final String? d10;
  @override
  @JsonKey(name: 'D11')
  final String? d11;
  @override
  @JsonKey(name: 'D12')
  final String? d12;
  @override
  @JsonKey(name: 'D13')
  final String? d13;
  @override
  @JsonKey(name: 'D14')
  final String? d14;
  @override
  @JsonKey(name: 'D15')
  final String? d15;
  @override
  @JsonKey(name: 'D16')
  final String? d16;
  @override
  @JsonKey(name: 'D17')
  final String? d17;
  @override
  @JsonKey(name: 'D18')
  final String? d18;
  @override
  @JsonKey(name: 'D19')
  final String? d19;
  @override
  @JsonKey(name: 'D20')
  final String? d20;
  @override
  @JsonKey(name: 'D21')
  final String? d21;
  @override
  @JsonKey(name: 'D22')
  final String? d22;
  @override
  @JsonKey(name: 'D23')
  final String? d23;
  @override
  @JsonKey(name: 'D24')
  final String? d24;
  @override
  @JsonKey(name: 'D25')
  final String? d25;
  @override
  @JsonKey(name: 'D26')
  final String? d26;
  @override
  @JsonKey(name: 'D27')
  final String? d27;
  @override
  @JsonKey(name: 'D28')
  final String? d28;
  @override
  @JsonKey(name: 'D29')
  final String? d29;
  @override
  @JsonKey(name: 'D30')
  final String? d30;
  @override
  @JsonKey(name: 'D31')
  final String? d31;
  @override
  @JsonKey(name: 'TotalDayActual')
  final double? totalDayActual;
  @override
  @JsonKey(name: 'TotalHoliday')
  final int? totalHoliday;
  @override
  @JsonKey(name: 'TotalDayOnleave2')
  final double? totalDayOnleave2;
  @override
  @JsonKey(name: 'TotalDayOnleave3')
  final double? totalDayOnleave3;
  @override
  @JsonKey(name: 'TotalDayWFH')
  final double? totalDayWfh;
  @override
  @JsonKey(name: 'TotalDayGet')
  final double? totalDayGet;
  @override
  @JsonKey(name: 'TotalDayOnleave1')
  final double? totalDayOnleave1;
  @override
  @JsonKey(name: 'TotalDay')
  final double? totalDay;
  @override
  @JsonKey(name: 'DepartmentSTT')
  final int? departmentStt;
  @override
  @JsonKey(name: 'STT')
  final int? stt;

  @override
  String toString() {
    return 'SalaryListChamCongData(employeeId: $employeeId, code: $code, fullName: $fullName, departmentName: $departmentName, positionName: $positionName, priorityOrder: $priorityOrder, d1: $d1, d2: $d2, d3: $d3, d4: $d4, d5: $d5, d6: $d6, d7: $d7, d8: $d8, d9: $d9, d10: $d10, d11: $d11, d12: $d12, d13: $d13, d14: $d14, d15: $d15, d16: $d16, d17: $d17, d18: $d18, d19: $d19, d20: $d20, d21: $d21, d22: $d22, d23: $d23, d24: $d24, d25: $d25, d26: $d26, d27: $d27, d28: $d28, d29: $d29, d30: $d30, d31: $d31, totalDayActual: $totalDayActual, totalHoliday: $totalHoliday, totalDayOnleave2: $totalDayOnleave2, totalDayOnleave3: $totalDayOnleave3, totalDayWfh: $totalDayWfh, totalDayGet: $totalDayGet, totalDayOnleave1: $totalDayOnleave1, totalDay: $totalDay, departmentStt: $departmentStt, stt: $stt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryListChamCongDataImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.priorityOrder, priorityOrder) ||
                other.priorityOrder == priorityOrder) &&
            (identical(other.d1, d1) || other.d1 == d1) &&
            (identical(other.d2, d2) || other.d2 == d2) &&
            (identical(other.d3, d3) || other.d3 == d3) &&
            (identical(other.d4, d4) || other.d4 == d4) &&
            (identical(other.d5, d5) || other.d5 == d5) &&
            (identical(other.d6, d6) || other.d6 == d6) &&
            (identical(other.d7, d7) || other.d7 == d7) &&
            (identical(other.d8, d8) || other.d8 == d8) &&
            (identical(other.d9, d9) || other.d9 == d9) &&
            (identical(other.d10, d10) || other.d10 == d10) &&
            (identical(other.d11, d11) || other.d11 == d11) &&
            (identical(other.d12, d12) || other.d12 == d12) &&
            (identical(other.d13, d13) || other.d13 == d13) &&
            (identical(other.d14, d14) || other.d14 == d14) &&
            (identical(other.d15, d15) || other.d15 == d15) &&
            (identical(other.d16, d16) || other.d16 == d16) &&
            (identical(other.d17, d17) || other.d17 == d17) &&
            (identical(other.d18, d18) || other.d18 == d18) &&
            (identical(other.d19, d19) || other.d19 == d19) &&
            (identical(other.d20, d20) || other.d20 == d20) &&
            (identical(other.d21, d21) || other.d21 == d21) &&
            (identical(other.d22, d22) || other.d22 == d22) &&
            (identical(other.d23, d23) || other.d23 == d23) &&
            (identical(other.d24, d24) || other.d24 == d24) &&
            (identical(other.d25, d25) || other.d25 == d25) &&
            (identical(other.d26, d26) || other.d26 == d26) &&
            (identical(other.d27, d27) || other.d27 == d27) &&
            (identical(other.d28, d28) || other.d28 == d28) &&
            (identical(other.d29, d29) || other.d29 == d29) &&
            (identical(other.d30, d30) || other.d30 == d30) &&
            (identical(other.d31, d31) || other.d31 == d31) &&
            (identical(other.totalDayActual, totalDayActual) ||
                other.totalDayActual == totalDayActual) &&
            (identical(other.totalHoliday, totalHoliday) ||
                other.totalHoliday == totalHoliday) &&
            (identical(other.totalDayOnleave2, totalDayOnleave2) ||
                other.totalDayOnleave2 == totalDayOnleave2) &&
            (identical(other.totalDayOnleave3, totalDayOnleave3) ||
                other.totalDayOnleave3 == totalDayOnleave3) &&
            (identical(other.totalDayWfh, totalDayWfh) ||
                other.totalDayWfh == totalDayWfh) &&
            (identical(other.totalDayGet, totalDayGet) ||
                other.totalDayGet == totalDayGet) &&
            (identical(other.totalDayOnleave1, totalDayOnleave1) ||
                other.totalDayOnleave1 == totalDayOnleave1) &&
            (identical(other.totalDay, totalDay) ||
                other.totalDay == totalDay) &&
            (identical(other.departmentStt, departmentStt) ||
                other.departmentStt == departmentStt) &&
            (identical(other.stt, stt) || other.stt == stt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        employeeId,
        code,
        fullName,
        departmentName,
        positionName,
        priorityOrder,
        d1,
        d2,
        d3,
        d4,
        d5,
        d6,
        d7,
        d8,
        d9,
        d10,
        d11,
        d12,
        d13,
        d14,
        d15,
        d16,
        d17,
        d18,
        d19,
        d20,
        d21,
        d22,
        d23,
        d24,
        d25,
        d26,
        d27,
        d28,
        d29,
        d30,
        d31,
        totalDayActual,
        totalHoliday,
        totalDayOnleave2,
        totalDayOnleave3,
        totalDayWfh,
        totalDayGet,
        totalDayOnleave1,
        totalDay,
        departmentStt,
        stt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryListChamCongDataImplCopyWith<_$SalaryListChamCongDataImpl>
      get copyWith => __$$SalaryListChamCongDataImplCopyWithImpl<
          _$SalaryListChamCongDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryListChamCongDataImplToJson(
      this,
    );
  }
}

abstract class _SalaryListChamCongData implements SalaryListChamCongData {
  const factory _SalaryListChamCongData(
      {@JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'PositionName') final String? positionName,
      @JsonKey(name: 'PriorityOrder') final int? priorityOrder,
      @JsonKey(name: 'D1') final String? d1,
      @JsonKey(name: 'D2') final String? d2,
      @JsonKey(name: 'D3') final String? d3,
      @JsonKey(name: 'D4') final String? d4,
      @JsonKey(name: 'D5') final String? d5,
      @JsonKey(name: 'D6') final String? d6,
      @JsonKey(name: 'D7') final String? d7,
      @JsonKey(name: 'D8') final String? d8,
      @JsonKey(name: 'D9') final String? d9,
      @JsonKey(name: 'D10') final String? d10,
      @JsonKey(name: 'D11') final String? d11,
      @JsonKey(name: 'D12') final String? d12,
      @JsonKey(name: 'D13') final String? d13,
      @JsonKey(name: 'D14') final String? d14,
      @JsonKey(name: 'D15') final String? d15,
      @JsonKey(name: 'D16') final String? d16,
      @JsonKey(name: 'D17') final String? d17,
      @JsonKey(name: 'D18') final String? d18,
      @JsonKey(name: 'D19') final String? d19,
      @JsonKey(name: 'D20') final String? d20,
      @JsonKey(name: 'D21') final String? d21,
      @JsonKey(name: 'D22') final String? d22,
      @JsonKey(name: 'D23') final String? d23,
      @JsonKey(name: 'D24') final String? d24,
      @JsonKey(name: 'D25') final String? d25,
      @JsonKey(name: 'D26') final String? d26,
      @JsonKey(name: 'D27') final String? d27,
      @JsonKey(name: 'D28') final String? d28,
      @JsonKey(name: 'D29') final String? d29,
      @JsonKey(name: 'D30') final String? d30,
      @JsonKey(name: 'D31') final String? d31,
      @JsonKey(name: 'TotalDayActual') final double? totalDayActual,
      @JsonKey(name: 'TotalHoliday') final int? totalHoliday,
      @JsonKey(name: 'TotalDayOnleave2') final double? totalDayOnleave2,
      @JsonKey(name: 'TotalDayOnleave3') final double? totalDayOnleave3,
      @JsonKey(name: 'TotalDayWFH') final double? totalDayWfh,
      @JsonKey(name: 'TotalDayGet') final double? totalDayGet,
      @JsonKey(name: 'TotalDayOnleave1') final double? totalDayOnleave1,
      @JsonKey(name: 'TotalDay') final double? totalDay,
      @JsonKey(name: 'DepartmentSTT') final int? departmentStt,
      @JsonKey(name: 'STT') final int? stt}) = _$SalaryListChamCongDataImpl;

  factory _SalaryListChamCongData.fromJson(Map<String, dynamic> json) =
      _$SalaryListChamCongDataImpl.fromJson;

  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'PositionName')
  String? get positionName;
  @override
  @JsonKey(name: 'PriorityOrder')
  int? get priorityOrder;
  @override
  @JsonKey(name: 'D1')
  String? get d1;
  @override
  @JsonKey(name: 'D2')
  String? get d2;
  @override
  @JsonKey(name: 'D3')
  String? get d3;
  @override
  @JsonKey(name: 'D4')
  String? get d4;
  @override
  @JsonKey(name: 'D5')
  String? get d5;
  @override
  @JsonKey(name: 'D6')
  String? get d6;
  @override
  @JsonKey(name: 'D7')
  String? get d7;
  @override
  @JsonKey(name: 'D8')
  String? get d8;
  @override
  @JsonKey(name: 'D9')
  String? get d9;
  @override
  @JsonKey(name: 'D10')
  String? get d10;
  @override
  @JsonKey(name: 'D11')
  String? get d11;
  @override
  @JsonKey(name: 'D12')
  String? get d12;
  @override
  @JsonKey(name: 'D13')
  String? get d13;
  @override
  @JsonKey(name: 'D14')
  String? get d14;
  @override
  @JsonKey(name: 'D15')
  String? get d15;
  @override
  @JsonKey(name: 'D16')
  String? get d16;
  @override
  @JsonKey(name: 'D17')
  String? get d17;
  @override
  @JsonKey(name: 'D18')
  String? get d18;
  @override
  @JsonKey(name: 'D19')
  String? get d19;
  @override
  @JsonKey(name: 'D20')
  String? get d20;
  @override
  @JsonKey(name: 'D21')
  String? get d21;
  @override
  @JsonKey(name: 'D22')
  String? get d22;
  @override
  @JsonKey(name: 'D23')
  String? get d23;
  @override
  @JsonKey(name: 'D24')
  String? get d24;
  @override
  @JsonKey(name: 'D25')
  String? get d25;
  @override
  @JsonKey(name: 'D26')
  String? get d26;
  @override
  @JsonKey(name: 'D27')
  String? get d27;
  @override
  @JsonKey(name: 'D28')
  String? get d28;
  @override
  @JsonKey(name: 'D29')
  String? get d29;
  @override
  @JsonKey(name: 'D30')
  String? get d30;
  @override
  @JsonKey(name: 'D31')
  String? get d31;
  @override
  @JsonKey(name: 'TotalDayActual')
  double? get totalDayActual;
  @override
  @JsonKey(name: 'TotalHoliday')
  int? get totalHoliday;
  @override
  @JsonKey(name: 'TotalDayOnleave2')
  double? get totalDayOnleave2;
  @override
  @JsonKey(name: 'TotalDayOnleave3')
  double? get totalDayOnleave3;
  @override
  @JsonKey(name: 'TotalDayWFH')
  double? get totalDayWfh;
  @override
  @JsonKey(name: 'TotalDayGet')
  double? get totalDayGet;
  @override
  @JsonKey(name: 'TotalDayOnleave1')
  double? get totalDayOnleave1;
  @override
  @JsonKey(name: 'TotalDay')
  double? get totalDay;
  @override
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(ignore: true)
  _$$SalaryListChamCongDataImplCopyWith<_$SalaryListChamCongDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SalaryListChamCongDetail _$SalaryListChamCongDetailFromJson(
    Map<String, dynamic> json) {
  return _SalaryListChamCongDetail.fromJson(json);
}

/// @nodoc
mixin _$SalaryListChamCongDetail {
  @JsonKey(name: 'value')
  DateTime? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'fieldname')
  String? get fieldname => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  int? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'disabled')
  bool? get disabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'statuswork')
  int? get statuswork => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryListChamCongDetailCopyWith<SalaryListChamCongDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryListChamCongDetailCopyWith<$Res> {
  factory $SalaryListChamCongDetailCopyWith(SalaryListChamCongDetail value,
          $Res Function(SalaryListChamCongDetail) then) =
      _$SalaryListChamCongDetailCopyWithImpl<$Res, SalaryListChamCongDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value') DateTime? value,
      @JsonKey(name: 'fieldname') String? fieldname,
      @JsonKey(name: 'text') int? text,
      @JsonKey(name: 'disabled') bool? disabled,
      @JsonKey(name: 'statuswork') int? statuswork});
}

/// @nodoc
class _$SalaryListChamCongDetailCopyWithImpl<$Res,
        $Val extends SalaryListChamCongDetail>
    implements $SalaryListChamCongDetailCopyWith<$Res> {
  _$SalaryListChamCongDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? fieldname = freezed,
    Object? text = freezed,
    Object? disabled = freezed,
    Object? statuswork = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fieldname: freezed == fieldname
          ? _value.fieldname
          : fieldname // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as int?,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      statuswork: freezed == statuswork
          ? _value.statuswork
          : statuswork // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryListChamCongDetailImplCopyWith<$Res>
    implements $SalaryListChamCongDetailCopyWith<$Res> {
  factory _$$SalaryListChamCongDetailImplCopyWith(
          _$SalaryListChamCongDetailImpl value,
          $Res Function(_$SalaryListChamCongDetailImpl) then) =
      __$$SalaryListChamCongDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value') DateTime? value,
      @JsonKey(name: 'fieldname') String? fieldname,
      @JsonKey(name: 'text') int? text,
      @JsonKey(name: 'disabled') bool? disabled,
      @JsonKey(name: 'statuswork') int? statuswork});
}

/// @nodoc
class __$$SalaryListChamCongDetailImplCopyWithImpl<$Res>
    extends _$SalaryListChamCongDetailCopyWithImpl<$Res,
        _$SalaryListChamCongDetailImpl>
    implements _$$SalaryListChamCongDetailImplCopyWith<$Res> {
  __$$SalaryListChamCongDetailImplCopyWithImpl(
      _$SalaryListChamCongDetailImpl _value,
      $Res Function(_$SalaryListChamCongDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? fieldname = freezed,
    Object? text = freezed,
    Object? disabled = freezed,
    Object? statuswork = freezed,
  }) {
    return _then(_$SalaryListChamCongDetailImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fieldname: freezed == fieldname
          ? _value.fieldname
          : fieldname // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as int?,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      statuswork: freezed == statuswork
          ? _value.statuswork
          : statuswork // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryListChamCongDetailImpl implements _SalaryListChamCongDetail {
  const _$SalaryListChamCongDetailImpl(
      {@JsonKey(name: 'value') this.value,
      @JsonKey(name: 'fieldname') this.fieldname,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'disabled') this.disabled,
      @JsonKey(name: 'statuswork') this.statuswork});

  factory _$SalaryListChamCongDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryListChamCongDetailImplFromJson(json);

  @override
  @JsonKey(name: 'value')
  final DateTime? value;
  @override
  @JsonKey(name: 'fieldname')
  final String? fieldname;
  @override
  @JsonKey(name: 'text')
  final int? text;
  @override
  @JsonKey(name: 'disabled')
  final bool? disabled;
  @override
  @JsonKey(name: 'statuswork')
  final int? statuswork;

  @override
  String toString() {
    return 'SalaryListChamCongDetail(value: $value, fieldname: $fieldname, text: $text, disabled: $disabled, statuswork: $statuswork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryListChamCongDetailImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.fieldname, fieldname) ||
                other.fieldname == fieldname) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.statuswork, statuswork) ||
                other.statuswork == statuswork));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, value, fieldname, text, disabled, statuswork);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryListChamCongDetailImplCopyWith<_$SalaryListChamCongDetailImpl>
      get copyWith => __$$SalaryListChamCongDetailImplCopyWithImpl<
          _$SalaryListChamCongDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryListChamCongDetailImplToJson(
      this,
    );
  }
}

abstract class _SalaryListChamCongDetail implements SalaryListChamCongDetail {
  const factory _SalaryListChamCongDetail(
          {@JsonKey(name: 'value') final DateTime? value,
          @JsonKey(name: 'fieldname') final String? fieldname,
          @JsonKey(name: 'text') final int? text,
          @JsonKey(name: 'disabled') final bool? disabled,
          @JsonKey(name: 'statuswork') final int? statuswork}) =
      _$SalaryListChamCongDetailImpl;

  factory _SalaryListChamCongDetail.fromJson(Map<String, dynamic> json) =
      _$SalaryListChamCongDetailImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  DateTime? get value;
  @override
  @JsonKey(name: 'fieldname')
  String? get fieldname;
  @override
  @JsonKey(name: 'text')
  int? get text;
  @override
  @JsonKey(name: 'disabled')
  bool? get disabled;
  @override
  @JsonKey(name: 'statuswork')
  int? get statuswork;
  @override
  @JsonKey(ignore: true)
  _$$SalaryListChamCongDetailImplCopyWith<_$SalaryListChamCongDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SalaryPayrollItem _$SalaryPayrollItemFromJson(Map<String, dynamic> json) {
  return _SalaryPayrollItem.fromJson(json);
}

/// @nodoc
mixin _$SalaryPayrollItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sign')
  bool? get sign => throw _privateConstructorUsedError;
  @JsonKey(name: 'PayrollID')
  int? get payrollId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentSTT => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriorityOrder')
  int? get priorityOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionName')
  String? get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'BasicSalary')
  double? get basicSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalWorkday')
  double? get totalWorkday => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalMerit')
  double? get totalMerit => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalSalaryByDay')
  double? get totalSalaryByDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalaryOneHour')
  double? get salaryOneHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'OT_Hour_WD')
  double? get otHourWD => throw _privateConstructorUsedError;
  @JsonKey(name: 'OT_Money_WD')
  double? get otMoneyWD => throw _privateConstructorUsedError;
  @JsonKey(name: 'OT_Hour_WK')
  double? get otHourWK => throw _privateConstructorUsedError;
  @JsonKey(name: 'OT_Money_WK')
  double? get otMoneyWK => throw _privateConstructorUsedError;
  @JsonKey(name: 'OT_Hour_HD')
  double? get otHourHD => throw _privateConstructorUsedError;
  @JsonKey(name: 'OT_Money_HD')
  double? get otMoneyHD => throw _privateConstructorUsedError;
  @JsonKey(name: 'OT_TotalSalary')
  double? get otTotalSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReferenceIndustry')
  double? get referenceIndustry => throw _privateConstructorUsedError;
  @JsonKey(name: 'RealIndustry')
  double? get realIndustry => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowanceMeal')
  double? get allowanceMeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'Allowance_OT_Early')
  double? get allowanceOTEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalAllowance')
  double? get totalAllowance => throw _privateConstructorUsedError;
  @JsonKey(name: 'BussinessMoney')
  double? get bussinessMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'NightShiftMoney')
  double? get nightShiftMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'CostVehicleBussiness')
  double? get costVehicleBussiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bonus')
  double? get bonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Other')
  double? get other => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalBonus')
  double? get totalBonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'SocialInsurance')
  double? get socialInsurance => throw _privateConstructorUsedError;
  @JsonKey(name: 'Insurances')
  double? get insurances => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnionFees')
  double? get unionFees => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdvancePayment')
  double? get advancePayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentalFees')
  double? get departmentalFees => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParkingMoney')
  double? get parkingMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'Punish5S')
  double? get punish5S => throw _privateConstructorUsedError;
  @JsonKey(name: 'OtherDeduction')
  double? get otherDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDeduction')
  double? get totalDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPublish')
  bool? get isPublish => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartWorking')
  DateTime? get startWorking => throw _privateConstructorUsedError;
  @JsonKey(name: 'MealUse')
  int? get mealUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxSalaryOT')
  double? get taxSalaryOT => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxSalaryMeal')
  double? get taxSalaryMeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxSalaryPhone')
  double? get taxSalaryPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxPersonalDeduction')
  double? get taxPersonalDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxDependentsDeduction')
  double? get taxDependentsDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTaxDeduction')
  double? get totalTaxDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxAbleIncome')
  double? get taxAbleIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCompanyName')
  String? get taxCompanyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusContract')
  String? get statusContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxDeduction')
  double? get taxDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'RealSalary')
  double? get realSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualAmountReceived')
  double? get actualAmountReceived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryPayrollItemCopyWith<SalaryPayrollItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryPayrollItemCopyWith<$Res> {
  factory $SalaryPayrollItemCopyWith(
          SalaryPayrollItem value, $Res Function(SalaryPayrollItem) then) =
      _$SalaryPayrollItemCopyWithImpl<$Res, SalaryPayrollItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Sign') bool? sign,
      @JsonKey(name: 'PayrollID') int? payrollId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentSTT') int? departmentSTT,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'PriorityOrder') int? priorityOrder,
      @JsonKey(name: 'PositionName') String? positionName,
      @JsonKey(name: 'BasicSalary') double? basicSalary,
      @JsonKey(name: 'TotalWorkday') double? totalWorkday,
      @JsonKey(name: 'TotalMerit') double? totalMerit,
      @JsonKey(name: 'TotalSalaryByDay') double? totalSalaryByDay,
      @JsonKey(name: 'SalaryOneHour') double? salaryOneHour,
      @JsonKey(name: 'OT_Hour_WD') double? otHourWD,
      @JsonKey(name: 'OT_Money_WD') double? otMoneyWD,
      @JsonKey(name: 'OT_Hour_WK') double? otHourWK,
      @JsonKey(name: 'OT_Money_WK') double? otMoneyWK,
      @JsonKey(name: 'OT_Hour_HD') double? otHourHD,
      @JsonKey(name: 'OT_Money_HD') double? otMoneyHD,
      @JsonKey(name: 'OT_TotalSalary') double? otTotalSalary,
      @JsonKey(name: 'ReferenceIndustry') double? referenceIndustry,
      @JsonKey(name: 'RealIndustry') double? realIndustry,
      @JsonKey(name: 'AllowanceMeal') double? allowanceMeal,
      @JsonKey(name: 'Allowance_OT_Early') double? allowanceOTEarly,
      @JsonKey(name: 'TotalAllowance') double? totalAllowance,
      @JsonKey(name: 'BussinessMoney') double? bussinessMoney,
      @JsonKey(name: 'NightShiftMoney') double? nightShiftMoney,
      @JsonKey(name: 'CostVehicleBussiness') double? costVehicleBussiness,
      @JsonKey(name: 'Bonus') double? bonus,
      @JsonKey(name: 'Other') double? other,
      @JsonKey(name: 'TotalBonus') double? totalBonus,
      @JsonKey(name: 'SocialInsurance') double? socialInsurance,
      @JsonKey(name: 'Insurances') double? insurances,
      @JsonKey(name: 'UnionFees') double? unionFees,
      @JsonKey(name: 'AdvancePayment') double? advancePayment,
      @JsonKey(name: 'DepartmentalFees') double? departmentalFees,
      @JsonKey(name: 'ParkingMoney') double? parkingMoney,
      @JsonKey(name: 'Punish5S') double? punish5S,
      @JsonKey(name: 'OtherDeduction') double? otherDeduction,
      @JsonKey(name: 'TotalDeduction') double? totalDeduction,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsPublish') bool? isPublish,
      @JsonKey(name: 'StartWorking') DateTime? startWorking,
      @JsonKey(name: 'MealUse') int? mealUse,
      @JsonKey(name: 'TaxSalaryOT') double? taxSalaryOT,
      @JsonKey(name: 'TaxSalaryMeal') double? taxSalaryMeal,
      @JsonKey(name: 'TaxSalaryPhone') double? taxSalaryPhone,
      @JsonKey(name: 'TaxPersonalDeduction') double? taxPersonalDeduction,
      @JsonKey(name: 'TaxDependentsDeduction') double? taxDependentsDeduction,
      @JsonKey(name: 'TotalTaxDeduction') double? totalTaxDeduction,
      @JsonKey(name: 'TaxAbleIncome') double? taxAbleIncome,
      @JsonKey(name: 'TaxCompanyName') String? taxCompanyName,
      @JsonKey(name: 'StatusContract') String? statusContract,
      @JsonKey(name: 'TaxDeduction') double? taxDeduction,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'RealSalary') double? realSalary,
      @JsonKey(name: 'ActualAmountReceived') double? actualAmountReceived});
}

/// @nodoc
class _$SalaryPayrollItemCopyWithImpl<$Res, $Val extends SalaryPayrollItem>
    implements $SalaryPayrollItemCopyWith<$Res> {
  _$SalaryPayrollItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sign = freezed,
    Object? payrollId = freezed,
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentSTT = freezed,
    Object? departmentName = freezed,
    Object? priorityOrder = freezed,
    Object? positionName = freezed,
    Object? basicSalary = freezed,
    Object? totalWorkday = freezed,
    Object? totalMerit = freezed,
    Object? totalSalaryByDay = freezed,
    Object? salaryOneHour = freezed,
    Object? otHourWD = freezed,
    Object? otMoneyWD = freezed,
    Object? otHourWK = freezed,
    Object? otMoneyWK = freezed,
    Object? otHourHD = freezed,
    Object? otMoneyHD = freezed,
    Object? otTotalSalary = freezed,
    Object? referenceIndustry = freezed,
    Object? realIndustry = freezed,
    Object? allowanceMeal = freezed,
    Object? allowanceOTEarly = freezed,
    Object? totalAllowance = freezed,
    Object? bussinessMoney = freezed,
    Object? nightShiftMoney = freezed,
    Object? costVehicleBussiness = freezed,
    Object? bonus = freezed,
    Object? other = freezed,
    Object? totalBonus = freezed,
    Object? socialInsurance = freezed,
    Object? insurances = freezed,
    Object? unionFees = freezed,
    Object? advancePayment = freezed,
    Object? departmentalFees = freezed,
    Object? parkingMoney = freezed,
    Object? punish5S = freezed,
    Object? otherDeduction = freezed,
    Object? totalDeduction = freezed,
    Object? note = freezed,
    Object? isPublish = freezed,
    Object? startWorking = freezed,
    Object? mealUse = freezed,
    Object? taxSalaryOT = freezed,
    Object? taxSalaryMeal = freezed,
    Object? taxSalaryPhone = freezed,
    Object? taxPersonalDeduction = freezed,
    Object? taxDependentsDeduction = freezed,
    Object? totalTaxDeduction = freezed,
    Object? taxAbleIncome = freezed,
    Object? taxCompanyName = freezed,
    Object? statusContract = freezed,
    Object? taxDeduction = freezed,
    Object? stt = freezed,
    Object? realSalary = freezed,
    Object? actualAmountReceived = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sign: freezed == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as bool?,
      payrollId: freezed == payrollId
          ? _value.payrollId
          : payrollId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentSTT: freezed == departmentSTT
          ? _value.departmentSTT
          : departmentSTT // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityOrder: freezed == priorityOrder
          ? _value.priorityOrder
          : priorityOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSalary: freezed == basicSalary
          ? _value.basicSalary
          : basicSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      totalWorkday: freezed == totalWorkday
          ? _value.totalWorkday
          : totalWorkday // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMerit: freezed == totalMerit
          ? _value.totalMerit
          : totalMerit // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSalaryByDay: freezed == totalSalaryByDay
          ? _value.totalSalaryByDay
          : totalSalaryByDay // ignore: cast_nullable_to_non_nullable
              as double?,
      salaryOneHour: freezed == salaryOneHour
          ? _value.salaryOneHour
          : salaryOneHour // ignore: cast_nullable_to_non_nullable
              as double?,
      otHourWD: freezed == otHourWD
          ? _value.otHourWD
          : otHourWD // ignore: cast_nullable_to_non_nullable
              as double?,
      otMoneyWD: freezed == otMoneyWD
          ? _value.otMoneyWD
          : otMoneyWD // ignore: cast_nullable_to_non_nullable
              as double?,
      otHourWK: freezed == otHourWK
          ? _value.otHourWK
          : otHourWK // ignore: cast_nullable_to_non_nullable
              as double?,
      otMoneyWK: freezed == otMoneyWK
          ? _value.otMoneyWK
          : otMoneyWK // ignore: cast_nullable_to_non_nullable
              as double?,
      otHourHD: freezed == otHourHD
          ? _value.otHourHD
          : otHourHD // ignore: cast_nullable_to_non_nullable
              as double?,
      otMoneyHD: freezed == otMoneyHD
          ? _value.otMoneyHD
          : otMoneyHD // ignore: cast_nullable_to_non_nullable
              as double?,
      otTotalSalary: freezed == otTotalSalary
          ? _value.otTotalSalary
          : otTotalSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      referenceIndustry: freezed == referenceIndustry
          ? _value.referenceIndustry
          : referenceIndustry // ignore: cast_nullable_to_non_nullable
              as double?,
      realIndustry: freezed == realIndustry
          ? _value.realIndustry
          : realIndustry // ignore: cast_nullable_to_non_nullable
              as double?,
      allowanceMeal: freezed == allowanceMeal
          ? _value.allowanceMeal
          : allowanceMeal // ignore: cast_nullable_to_non_nullable
              as double?,
      allowanceOTEarly: freezed == allowanceOTEarly
          ? _value.allowanceOTEarly
          : allowanceOTEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAllowance: freezed == totalAllowance
          ? _value.totalAllowance
          : totalAllowance // ignore: cast_nullable_to_non_nullable
              as double?,
      bussinessMoney: freezed == bussinessMoney
          ? _value.bussinessMoney
          : bussinessMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      nightShiftMoney: freezed == nightShiftMoney
          ? _value.nightShiftMoney
          : nightShiftMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      costVehicleBussiness: freezed == costVehicleBussiness
          ? _value.costVehicleBussiness
          : costVehicleBussiness // ignore: cast_nullable_to_non_nullable
              as double?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as double?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBonus: freezed == totalBonus
          ? _value.totalBonus
          : totalBonus // ignore: cast_nullable_to_non_nullable
              as double?,
      socialInsurance: freezed == socialInsurance
          ? _value.socialInsurance
          : socialInsurance // ignore: cast_nullable_to_non_nullable
              as double?,
      insurances: freezed == insurances
          ? _value.insurances
          : insurances // ignore: cast_nullable_to_non_nullable
              as double?,
      unionFees: freezed == unionFees
          ? _value.unionFees
          : unionFees // ignore: cast_nullable_to_non_nullable
              as double?,
      advancePayment: freezed == advancePayment
          ? _value.advancePayment
          : advancePayment // ignore: cast_nullable_to_non_nullable
              as double?,
      departmentalFees: freezed == departmentalFees
          ? _value.departmentalFees
          : departmentalFees // ignore: cast_nullable_to_non_nullable
              as double?,
      parkingMoney: freezed == parkingMoney
          ? _value.parkingMoney
          : parkingMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      punish5S: freezed == punish5S
          ? _value.punish5S
          : punish5S // ignore: cast_nullable_to_non_nullable
              as double?,
      otherDeduction: freezed == otherDeduction
          ? _value.otherDeduction
          : otherDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDeduction: freezed == totalDeduction
          ? _value.totalDeduction
          : totalDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      startWorking: freezed == startWorking
          ? _value.startWorking
          : startWorking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mealUse: freezed == mealUse
          ? _value.mealUse
          : mealUse // ignore: cast_nullable_to_non_nullable
              as int?,
      taxSalaryOT: freezed == taxSalaryOT
          ? _value.taxSalaryOT
          : taxSalaryOT // ignore: cast_nullable_to_non_nullable
              as double?,
      taxSalaryMeal: freezed == taxSalaryMeal
          ? _value.taxSalaryMeal
          : taxSalaryMeal // ignore: cast_nullable_to_non_nullable
              as double?,
      taxSalaryPhone: freezed == taxSalaryPhone
          ? _value.taxSalaryPhone
          : taxSalaryPhone // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPersonalDeduction: freezed == taxPersonalDeduction
          ? _value.taxPersonalDeduction
          : taxPersonalDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      taxDependentsDeduction: freezed == taxDependentsDeduction
          ? _value.taxDependentsDeduction
          : taxDependentsDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTaxDeduction: freezed == totalTaxDeduction
          ? _value.totalTaxDeduction
          : totalTaxDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      taxAbleIncome: freezed == taxAbleIncome
          ? _value.taxAbleIncome
          : taxAbleIncome // ignore: cast_nullable_to_non_nullable
              as double?,
      taxCompanyName: freezed == taxCompanyName
          ? _value.taxCompanyName
          : taxCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusContract: freezed == statusContract
          ? _value.statusContract
          : statusContract // ignore: cast_nullable_to_non_nullable
              as String?,
      taxDeduction: freezed == taxDeduction
          ? _value.taxDeduction
          : taxDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      realSalary: freezed == realSalary
          ? _value.realSalary
          : realSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      actualAmountReceived: freezed == actualAmountReceived
          ? _value.actualAmountReceived
          : actualAmountReceived // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryPayrollItemImplCopyWith<$Res>
    implements $SalaryPayrollItemCopyWith<$Res> {
  factory _$$SalaryPayrollItemImplCopyWith(_$SalaryPayrollItemImpl value,
          $Res Function(_$SalaryPayrollItemImpl) then) =
      __$$SalaryPayrollItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Sign') bool? sign,
      @JsonKey(name: 'PayrollID') int? payrollId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentSTT') int? departmentSTT,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'PriorityOrder') int? priorityOrder,
      @JsonKey(name: 'PositionName') String? positionName,
      @JsonKey(name: 'BasicSalary') double? basicSalary,
      @JsonKey(name: 'TotalWorkday') double? totalWorkday,
      @JsonKey(name: 'TotalMerit') double? totalMerit,
      @JsonKey(name: 'TotalSalaryByDay') double? totalSalaryByDay,
      @JsonKey(name: 'SalaryOneHour') double? salaryOneHour,
      @JsonKey(name: 'OT_Hour_WD') double? otHourWD,
      @JsonKey(name: 'OT_Money_WD') double? otMoneyWD,
      @JsonKey(name: 'OT_Hour_WK') double? otHourWK,
      @JsonKey(name: 'OT_Money_WK') double? otMoneyWK,
      @JsonKey(name: 'OT_Hour_HD') double? otHourHD,
      @JsonKey(name: 'OT_Money_HD') double? otMoneyHD,
      @JsonKey(name: 'OT_TotalSalary') double? otTotalSalary,
      @JsonKey(name: 'ReferenceIndustry') double? referenceIndustry,
      @JsonKey(name: 'RealIndustry') double? realIndustry,
      @JsonKey(name: 'AllowanceMeal') double? allowanceMeal,
      @JsonKey(name: 'Allowance_OT_Early') double? allowanceOTEarly,
      @JsonKey(name: 'TotalAllowance') double? totalAllowance,
      @JsonKey(name: 'BussinessMoney') double? bussinessMoney,
      @JsonKey(name: 'NightShiftMoney') double? nightShiftMoney,
      @JsonKey(name: 'CostVehicleBussiness') double? costVehicleBussiness,
      @JsonKey(name: 'Bonus') double? bonus,
      @JsonKey(name: 'Other') double? other,
      @JsonKey(name: 'TotalBonus') double? totalBonus,
      @JsonKey(name: 'SocialInsurance') double? socialInsurance,
      @JsonKey(name: 'Insurances') double? insurances,
      @JsonKey(name: 'UnionFees') double? unionFees,
      @JsonKey(name: 'AdvancePayment') double? advancePayment,
      @JsonKey(name: 'DepartmentalFees') double? departmentalFees,
      @JsonKey(name: 'ParkingMoney') double? parkingMoney,
      @JsonKey(name: 'Punish5S') double? punish5S,
      @JsonKey(name: 'OtherDeduction') double? otherDeduction,
      @JsonKey(name: 'TotalDeduction') double? totalDeduction,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsPublish') bool? isPublish,
      @JsonKey(name: 'StartWorking') DateTime? startWorking,
      @JsonKey(name: 'MealUse') int? mealUse,
      @JsonKey(name: 'TaxSalaryOT') double? taxSalaryOT,
      @JsonKey(name: 'TaxSalaryMeal') double? taxSalaryMeal,
      @JsonKey(name: 'TaxSalaryPhone') double? taxSalaryPhone,
      @JsonKey(name: 'TaxPersonalDeduction') double? taxPersonalDeduction,
      @JsonKey(name: 'TaxDependentsDeduction') double? taxDependentsDeduction,
      @JsonKey(name: 'TotalTaxDeduction') double? totalTaxDeduction,
      @JsonKey(name: 'TaxAbleIncome') double? taxAbleIncome,
      @JsonKey(name: 'TaxCompanyName') String? taxCompanyName,
      @JsonKey(name: 'StatusContract') String? statusContract,
      @JsonKey(name: 'TaxDeduction') double? taxDeduction,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'RealSalary') double? realSalary,
      @JsonKey(name: 'ActualAmountReceived') double? actualAmountReceived});
}

/// @nodoc
class __$$SalaryPayrollItemImplCopyWithImpl<$Res>
    extends _$SalaryPayrollItemCopyWithImpl<$Res, _$SalaryPayrollItemImpl>
    implements _$$SalaryPayrollItemImplCopyWith<$Res> {
  __$$SalaryPayrollItemImplCopyWithImpl(_$SalaryPayrollItemImpl _value,
      $Res Function(_$SalaryPayrollItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sign = freezed,
    Object? payrollId = freezed,
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentSTT = freezed,
    Object? departmentName = freezed,
    Object? priorityOrder = freezed,
    Object? positionName = freezed,
    Object? basicSalary = freezed,
    Object? totalWorkday = freezed,
    Object? totalMerit = freezed,
    Object? totalSalaryByDay = freezed,
    Object? salaryOneHour = freezed,
    Object? otHourWD = freezed,
    Object? otMoneyWD = freezed,
    Object? otHourWK = freezed,
    Object? otMoneyWK = freezed,
    Object? otHourHD = freezed,
    Object? otMoneyHD = freezed,
    Object? otTotalSalary = freezed,
    Object? referenceIndustry = freezed,
    Object? realIndustry = freezed,
    Object? allowanceMeal = freezed,
    Object? allowanceOTEarly = freezed,
    Object? totalAllowance = freezed,
    Object? bussinessMoney = freezed,
    Object? nightShiftMoney = freezed,
    Object? costVehicleBussiness = freezed,
    Object? bonus = freezed,
    Object? other = freezed,
    Object? totalBonus = freezed,
    Object? socialInsurance = freezed,
    Object? insurances = freezed,
    Object? unionFees = freezed,
    Object? advancePayment = freezed,
    Object? departmentalFees = freezed,
    Object? parkingMoney = freezed,
    Object? punish5S = freezed,
    Object? otherDeduction = freezed,
    Object? totalDeduction = freezed,
    Object? note = freezed,
    Object? isPublish = freezed,
    Object? startWorking = freezed,
    Object? mealUse = freezed,
    Object? taxSalaryOT = freezed,
    Object? taxSalaryMeal = freezed,
    Object? taxSalaryPhone = freezed,
    Object? taxPersonalDeduction = freezed,
    Object? taxDependentsDeduction = freezed,
    Object? totalTaxDeduction = freezed,
    Object? taxAbleIncome = freezed,
    Object? taxCompanyName = freezed,
    Object? statusContract = freezed,
    Object? taxDeduction = freezed,
    Object? stt = freezed,
    Object? realSalary = freezed,
    Object? actualAmountReceived = freezed,
  }) {
    return _then(_$SalaryPayrollItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sign: freezed == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as bool?,
      payrollId: freezed == payrollId
          ? _value.payrollId
          : payrollId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentSTT: freezed == departmentSTT
          ? _value.departmentSTT
          : departmentSTT // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityOrder: freezed == priorityOrder
          ? _value.priorityOrder
          : priorityOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSalary: freezed == basicSalary
          ? _value.basicSalary
          : basicSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      totalWorkday: freezed == totalWorkday
          ? _value.totalWorkday
          : totalWorkday // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMerit: freezed == totalMerit
          ? _value.totalMerit
          : totalMerit // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSalaryByDay: freezed == totalSalaryByDay
          ? _value.totalSalaryByDay
          : totalSalaryByDay // ignore: cast_nullable_to_non_nullable
              as double?,
      salaryOneHour: freezed == salaryOneHour
          ? _value.salaryOneHour
          : salaryOneHour // ignore: cast_nullable_to_non_nullable
              as double?,
      otHourWD: freezed == otHourWD
          ? _value.otHourWD
          : otHourWD // ignore: cast_nullable_to_non_nullable
              as double?,
      otMoneyWD: freezed == otMoneyWD
          ? _value.otMoneyWD
          : otMoneyWD // ignore: cast_nullable_to_non_nullable
              as double?,
      otHourWK: freezed == otHourWK
          ? _value.otHourWK
          : otHourWK // ignore: cast_nullable_to_non_nullable
              as double?,
      otMoneyWK: freezed == otMoneyWK
          ? _value.otMoneyWK
          : otMoneyWK // ignore: cast_nullable_to_non_nullable
              as double?,
      otHourHD: freezed == otHourHD
          ? _value.otHourHD
          : otHourHD // ignore: cast_nullable_to_non_nullable
              as double?,
      otMoneyHD: freezed == otMoneyHD
          ? _value.otMoneyHD
          : otMoneyHD // ignore: cast_nullable_to_non_nullable
              as double?,
      otTotalSalary: freezed == otTotalSalary
          ? _value.otTotalSalary
          : otTotalSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      referenceIndustry: freezed == referenceIndustry
          ? _value.referenceIndustry
          : referenceIndustry // ignore: cast_nullable_to_non_nullable
              as double?,
      realIndustry: freezed == realIndustry
          ? _value.realIndustry
          : realIndustry // ignore: cast_nullable_to_non_nullable
              as double?,
      allowanceMeal: freezed == allowanceMeal
          ? _value.allowanceMeal
          : allowanceMeal // ignore: cast_nullable_to_non_nullable
              as double?,
      allowanceOTEarly: freezed == allowanceOTEarly
          ? _value.allowanceOTEarly
          : allowanceOTEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAllowance: freezed == totalAllowance
          ? _value.totalAllowance
          : totalAllowance // ignore: cast_nullable_to_non_nullable
              as double?,
      bussinessMoney: freezed == bussinessMoney
          ? _value.bussinessMoney
          : bussinessMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      nightShiftMoney: freezed == nightShiftMoney
          ? _value.nightShiftMoney
          : nightShiftMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      costVehicleBussiness: freezed == costVehicleBussiness
          ? _value.costVehicleBussiness
          : costVehicleBussiness // ignore: cast_nullable_to_non_nullable
              as double?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as double?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as double?,
      totalBonus: freezed == totalBonus
          ? _value.totalBonus
          : totalBonus // ignore: cast_nullable_to_non_nullable
              as double?,
      socialInsurance: freezed == socialInsurance
          ? _value.socialInsurance
          : socialInsurance // ignore: cast_nullable_to_non_nullable
              as double?,
      insurances: freezed == insurances
          ? _value.insurances
          : insurances // ignore: cast_nullable_to_non_nullable
              as double?,
      unionFees: freezed == unionFees
          ? _value.unionFees
          : unionFees // ignore: cast_nullable_to_non_nullable
              as double?,
      advancePayment: freezed == advancePayment
          ? _value.advancePayment
          : advancePayment // ignore: cast_nullable_to_non_nullable
              as double?,
      departmentalFees: freezed == departmentalFees
          ? _value.departmentalFees
          : departmentalFees // ignore: cast_nullable_to_non_nullable
              as double?,
      parkingMoney: freezed == parkingMoney
          ? _value.parkingMoney
          : parkingMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      punish5S: freezed == punish5S
          ? _value.punish5S
          : punish5S // ignore: cast_nullable_to_non_nullable
              as double?,
      otherDeduction: freezed == otherDeduction
          ? _value.otherDeduction
          : otherDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDeduction: freezed == totalDeduction
          ? _value.totalDeduction
          : totalDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      startWorking: freezed == startWorking
          ? _value.startWorking
          : startWorking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mealUse: freezed == mealUse
          ? _value.mealUse
          : mealUse // ignore: cast_nullable_to_non_nullable
              as int?,
      taxSalaryOT: freezed == taxSalaryOT
          ? _value.taxSalaryOT
          : taxSalaryOT // ignore: cast_nullable_to_non_nullable
              as double?,
      taxSalaryMeal: freezed == taxSalaryMeal
          ? _value.taxSalaryMeal
          : taxSalaryMeal // ignore: cast_nullable_to_non_nullable
              as double?,
      taxSalaryPhone: freezed == taxSalaryPhone
          ? _value.taxSalaryPhone
          : taxSalaryPhone // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPersonalDeduction: freezed == taxPersonalDeduction
          ? _value.taxPersonalDeduction
          : taxPersonalDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      taxDependentsDeduction: freezed == taxDependentsDeduction
          ? _value.taxDependentsDeduction
          : taxDependentsDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTaxDeduction: freezed == totalTaxDeduction
          ? _value.totalTaxDeduction
          : totalTaxDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      taxAbleIncome: freezed == taxAbleIncome
          ? _value.taxAbleIncome
          : taxAbleIncome // ignore: cast_nullable_to_non_nullable
              as double?,
      taxCompanyName: freezed == taxCompanyName
          ? _value.taxCompanyName
          : taxCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusContract: freezed == statusContract
          ? _value.statusContract
          : statusContract // ignore: cast_nullable_to_non_nullable
              as String?,
      taxDeduction: freezed == taxDeduction
          ? _value.taxDeduction
          : taxDeduction // ignore: cast_nullable_to_non_nullable
              as double?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      realSalary: freezed == realSalary
          ? _value.realSalary
          : realSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      actualAmountReceived: freezed == actualAmountReceived
          ? _value.actualAmountReceived
          : actualAmountReceived // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryPayrollItemImpl implements _SalaryPayrollItem {
  const _$SalaryPayrollItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Sign') this.sign,
      @JsonKey(name: 'PayrollID') this.payrollId,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentSTT') this.departmentSTT,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'PriorityOrder') this.priorityOrder,
      @JsonKey(name: 'PositionName') this.positionName,
      @JsonKey(name: 'BasicSalary') this.basicSalary,
      @JsonKey(name: 'TotalWorkday') this.totalWorkday,
      @JsonKey(name: 'TotalMerit') this.totalMerit,
      @JsonKey(name: 'TotalSalaryByDay') this.totalSalaryByDay,
      @JsonKey(name: 'SalaryOneHour') this.salaryOneHour,
      @JsonKey(name: 'OT_Hour_WD') this.otHourWD,
      @JsonKey(name: 'OT_Money_WD') this.otMoneyWD,
      @JsonKey(name: 'OT_Hour_WK') this.otHourWK,
      @JsonKey(name: 'OT_Money_WK') this.otMoneyWK,
      @JsonKey(name: 'OT_Hour_HD') this.otHourHD,
      @JsonKey(name: 'OT_Money_HD') this.otMoneyHD,
      @JsonKey(name: 'OT_TotalSalary') this.otTotalSalary,
      @JsonKey(name: 'ReferenceIndustry') this.referenceIndustry,
      @JsonKey(name: 'RealIndustry') this.realIndustry,
      @JsonKey(name: 'AllowanceMeal') this.allowanceMeal,
      @JsonKey(name: 'Allowance_OT_Early') this.allowanceOTEarly,
      @JsonKey(name: 'TotalAllowance') this.totalAllowance,
      @JsonKey(name: 'BussinessMoney') this.bussinessMoney,
      @JsonKey(name: 'NightShiftMoney') this.nightShiftMoney,
      @JsonKey(name: 'CostVehicleBussiness') this.costVehicleBussiness,
      @JsonKey(name: 'Bonus') this.bonus,
      @JsonKey(name: 'Other') this.other,
      @JsonKey(name: 'TotalBonus') this.totalBonus,
      @JsonKey(name: 'SocialInsurance') this.socialInsurance,
      @JsonKey(name: 'Insurances') this.insurances,
      @JsonKey(name: 'UnionFees') this.unionFees,
      @JsonKey(name: 'AdvancePayment') this.advancePayment,
      @JsonKey(name: 'DepartmentalFees') this.departmentalFees,
      @JsonKey(name: 'ParkingMoney') this.parkingMoney,
      @JsonKey(name: 'Punish5S') this.punish5S,
      @JsonKey(name: 'OtherDeduction') this.otherDeduction,
      @JsonKey(name: 'TotalDeduction') this.totalDeduction,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsPublish') this.isPublish,
      @JsonKey(name: 'StartWorking') this.startWorking,
      @JsonKey(name: 'MealUse') this.mealUse,
      @JsonKey(name: 'TaxSalaryOT') this.taxSalaryOT,
      @JsonKey(name: 'TaxSalaryMeal') this.taxSalaryMeal,
      @JsonKey(name: 'TaxSalaryPhone') this.taxSalaryPhone,
      @JsonKey(name: 'TaxPersonalDeduction') this.taxPersonalDeduction,
      @JsonKey(name: 'TaxDependentsDeduction') this.taxDependentsDeduction,
      @JsonKey(name: 'TotalTaxDeduction') this.totalTaxDeduction,
      @JsonKey(name: 'TaxAbleIncome') this.taxAbleIncome,
      @JsonKey(name: 'TaxCompanyName') this.taxCompanyName,
      @JsonKey(name: 'StatusContract') this.statusContract,
      @JsonKey(name: 'TaxDeduction') this.taxDeduction,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'RealSalary') this.realSalary,
      @JsonKey(name: 'ActualAmountReceived') this.actualAmountReceived});

  factory _$SalaryPayrollItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryPayrollItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Sign')
  final bool? sign;
  @override
  @JsonKey(name: 'PayrollID')
  final int? payrollId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentSTT')
  final int? departmentSTT;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'PriorityOrder')
  final int? priorityOrder;
  @override
  @JsonKey(name: 'PositionName')
  final String? positionName;
  @override
  @JsonKey(name: 'BasicSalary')
  final double? basicSalary;
  @override
  @JsonKey(name: 'TotalWorkday')
  final double? totalWorkday;
  @override
  @JsonKey(name: 'TotalMerit')
  final double? totalMerit;
  @override
  @JsonKey(name: 'TotalSalaryByDay')
  final double? totalSalaryByDay;
  @override
  @JsonKey(name: 'SalaryOneHour')
  final double? salaryOneHour;
  @override
  @JsonKey(name: 'OT_Hour_WD')
  final double? otHourWD;
  @override
  @JsonKey(name: 'OT_Money_WD')
  final double? otMoneyWD;
  @override
  @JsonKey(name: 'OT_Hour_WK')
  final double? otHourWK;
  @override
  @JsonKey(name: 'OT_Money_WK')
  final double? otMoneyWK;
  @override
  @JsonKey(name: 'OT_Hour_HD')
  final double? otHourHD;
  @override
  @JsonKey(name: 'OT_Money_HD')
  final double? otMoneyHD;
  @override
  @JsonKey(name: 'OT_TotalSalary')
  final double? otTotalSalary;
  @override
  @JsonKey(name: 'ReferenceIndustry')
  final double? referenceIndustry;
  @override
  @JsonKey(name: 'RealIndustry')
  final double? realIndustry;
  @override
  @JsonKey(name: 'AllowanceMeal')
  final double? allowanceMeal;
  @override
  @JsonKey(name: 'Allowance_OT_Early')
  final double? allowanceOTEarly;
  @override
  @JsonKey(name: 'TotalAllowance')
  final double? totalAllowance;
  @override
  @JsonKey(name: 'BussinessMoney')
  final double? bussinessMoney;
  @override
  @JsonKey(name: 'NightShiftMoney')
  final double? nightShiftMoney;
  @override
  @JsonKey(name: 'CostVehicleBussiness')
  final double? costVehicleBussiness;
  @override
  @JsonKey(name: 'Bonus')
  final double? bonus;
  @override
  @JsonKey(name: 'Other')
  final double? other;
  @override
  @JsonKey(name: 'TotalBonus')
  final double? totalBonus;
  @override
  @JsonKey(name: 'SocialInsurance')
  final double? socialInsurance;
  @override
  @JsonKey(name: 'Insurances')
  final double? insurances;
  @override
  @JsonKey(name: 'UnionFees')
  final double? unionFees;
  @override
  @JsonKey(name: 'AdvancePayment')
  final double? advancePayment;
  @override
  @JsonKey(name: 'DepartmentalFees')
  final double? departmentalFees;
  @override
  @JsonKey(name: 'ParkingMoney')
  final double? parkingMoney;
  @override
  @JsonKey(name: 'Punish5S')
  final double? punish5S;
  @override
  @JsonKey(name: 'OtherDeduction')
  final double? otherDeduction;
  @override
  @JsonKey(name: 'TotalDeduction')
  final double? totalDeduction;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsPublish')
  final bool? isPublish;
  @override
  @JsonKey(name: 'StartWorking')
  final DateTime? startWorking;
  @override
  @JsonKey(name: 'MealUse')
  final int? mealUse;
  @override
  @JsonKey(name: 'TaxSalaryOT')
  final double? taxSalaryOT;
  @override
  @JsonKey(name: 'TaxSalaryMeal')
  final double? taxSalaryMeal;
  @override
  @JsonKey(name: 'TaxSalaryPhone')
  final double? taxSalaryPhone;
  @override
  @JsonKey(name: 'TaxPersonalDeduction')
  final double? taxPersonalDeduction;
  @override
  @JsonKey(name: 'TaxDependentsDeduction')
  final double? taxDependentsDeduction;
  @override
  @JsonKey(name: 'TotalTaxDeduction')
  final double? totalTaxDeduction;
  @override
  @JsonKey(name: 'TaxAbleIncome')
  final double? taxAbleIncome;
  @override
  @JsonKey(name: 'TaxCompanyName')
  final String? taxCompanyName;
  @override
  @JsonKey(name: 'StatusContract')
  final String? statusContract;
  @override
  @JsonKey(name: 'TaxDeduction')
  final double? taxDeduction;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'RealSalary')
  final double? realSalary;
  @override
  @JsonKey(name: 'ActualAmountReceived')
  final double? actualAmountReceived;

  @override
  String toString() {
    return 'SalaryPayrollItem(id: $id, sign: $sign, payrollId: $payrollId, employeeId: $employeeId, code: $code, fullName: $fullName, departmentSTT: $departmentSTT, departmentName: $departmentName, priorityOrder: $priorityOrder, positionName: $positionName, basicSalary: $basicSalary, totalWorkday: $totalWorkday, totalMerit: $totalMerit, totalSalaryByDay: $totalSalaryByDay, salaryOneHour: $salaryOneHour, otHourWD: $otHourWD, otMoneyWD: $otMoneyWD, otHourWK: $otHourWK, otMoneyWK: $otMoneyWK, otHourHD: $otHourHD, otMoneyHD: $otMoneyHD, otTotalSalary: $otTotalSalary, referenceIndustry: $referenceIndustry, realIndustry: $realIndustry, allowanceMeal: $allowanceMeal, allowanceOTEarly: $allowanceOTEarly, totalAllowance: $totalAllowance, bussinessMoney: $bussinessMoney, nightShiftMoney: $nightShiftMoney, costVehicleBussiness: $costVehicleBussiness, bonus: $bonus, other: $other, totalBonus: $totalBonus, socialInsurance: $socialInsurance, insurances: $insurances, unionFees: $unionFees, advancePayment: $advancePayment, departmentalFees: $departmentalFees, parkingMoney: $parkingMoney, punish5S: $punish5S, otherDeduction: $otherDeduction, totalDeduction: $totalDeduction, note: $note, isPublish: $isPublish, startWorking: $startWorking, mealUse: $mealUse, taxSalaryOT: $taxSalaryOT, taxSalaryMeal: $taxSalaryMeal, taxSalaryPhone: $taxSalaryPhone, taxPersonalDeduction: $taxPersonalDeduction, taxDependentsDeduction: $taxDependentsDeduction, totalTaxDeduction: $totalTaxDeduction, taxAbleIncome: $taxAbleIncome, taxCompanyName: $taxCompanyName, statusContract: $statusContract, taxDeduction: $taxDeduction, stt: $stt, realSalary: $realSalary, actualAmountReceived: $actualAmountReceived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryPayrollItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sign, sign) || other.sign == sign) &&
            (identical(other.payrollId, payrollId) ||
                other.payrollId == payrollId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentSTT, departmentSTT) ||
                other.departmentSTT == departmentSTT) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.priorityOrder, priorityOrder) ||
                other.priorityOrder == priorityOrder) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.basicSalary, basicSalary) ||
                other.basicSalary == basicSalary) &&
            (identical(other.totalWorkday, totalWorkday) ||
                other.totalWorkday == totalWorkday) &&
            (identical(other.totalMerit, totalMerit) ||
                other.totalMerit == totalMerit) &&
            (identical(other.totalSalaryByDay, totalSalaryByDay) ||
                other.totalSalaryByDay == totalSalaryByDay) &&
            (identical(other.salaryOneHour, salaryOneHour) ||
                other.salaryOneHour == salaryOneHour) &&
            (identical(other.otHourWD, otHourWD) ||
                other.otHourWD == otHourWD) &&
            (identical(other.otMoneyWD, otMoneyWD) ||
                other.otMoneyWD == otMoneyWD) &&
            (identical(other.otHourWK, otHourWK) ||
                other.otHourWK == otHourWK) &&
            (identical(other.otMoneyWK, otMoneyWK) ||
                other.otMoneyWK == otMoneyWK) &&
            (identical(other.otHourHD, otHourHD) ||
                other.otHourHD == otHourHD) &&
            (identical(other.otMoneyHD, otMoneyHD) ||
                other.otMoneyHD == otMoneyHD) &&
            (identical(other.otTotalSalary, otTotalSalary) ||
                other.otTotalSalary == otTotalSalary) &&
            (identical(other.referenceIndustry, referenceIndustry) ||
                other.referenceIndustry == referenceIndustry) &&
            (identical(other.realIndustry, realIndustry) ||
                other.realIndustry == realIndustry) &&
            (identical(other.allowanceMeal, allowanceMeal) ||
                other.allowanceMeal == allowanceMeal) &&
            (identical(other.allowanceOTEarly, allowanceOTEarly) ||
                other.allowanceOTEarly == allowanceOTEarly) &&
            (identical(other.totalAllowance, totalAllowance) ||
                other.totalAllowance == totalAllowance) &&
            (identical(other.bussinessMoney, bussinessMoney) ||
                other.bussinessMoney == bussinessMoney) &&
            (identical(other.nightShiftMoney, nightShiftMoney) ||
                other.nightShiftMoney == nightShiftMoney) &&
            (identical(other.costVehicleBussiness, costVehicleBussiness) ||
                other.costVehicleBussiness == costVehicleBussiness) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.totalBonus, totalBonus) ||
                other.totalBonus == totalBonus) &&
            (identical(other.socialInsurance, socialInsurance) ||
                other.socialInsurance == socialInsurance) &&
            (identical(other.insurances, insurances) ||
                other.insurances == insurances) &&
            (identical(other.unionFees, unionFees) ||
                other.unionFees == unionFees) &&
            (identical(other.advancePayment, advancePayment) ||
                other.advancePayment == advancePayment) &&
            (identical(other.departmentalFees, departmentalFees) ||
                other.departmentalFees == departmentalFees) &&
            (identical(other.parkingMoney, parkingMoney) ||
                other.parkingMoney == parkingMoney) &&
            (identical(other.punish5S, punish5S) ||
                other.punish5S == punish5S) &&
            (identical(other.otherDeduction, otherDeduction) ||
                other.otherDeduction == otherDeduction) &&
            (identical(other.totalDeduction, totalDeduction) ||
                other.totalDeduction == totalDeduction) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.startWorking, startWorking) ||
                other.startWorking == startWorking) &&
            (identical(other.mealUse, mealUse) || other.mealUse == mealUse) &&
            (identical(other.taxSalaryOT, taxSalaryOT) ||
                other.taxSalaryOT == taxSalaryOT) &&
            (identical(other.taxSalaryMeal, taxSalaryMeal) ||
                other.taxSalaryMeal == taxSalaryMeal) &&
            (identical(other.taxSalaryPhone, taxSalaryPhone) ||
                other.taxSalaryPhone == taxSalaryPhone) &&
            (identical(other.taxPersonalDeduction, taxPersonalDeduction) ||
                other.taxPersonalDeduction == taxPersonalDeduction) &&
            (identical(other.taxDependentsDeduction, taxDependentsDeduction) || other.taxDependentsDeduction == taxDependentsDeduction) &&
            (identical(other.totalTaxDeduction, totalTaxDeduction) || other.totalTaxDeduction == totalTaxDeduction) &&
            (identical(other.taxAbleIncome, taxAbleIncome) || other.taxAbleIncome == taxAbleIncome) &&
            (identical(other.taxCompanyName, taxCompanyName) || other.taxCompanyName == taxCompanyName) &&
            (identical(other.statusContract, statusContract) || other.statusContract == statusContract) &&
            (identical(other.taxDeduction, taxDeduction) || other.taxDeduction == taxDeduction) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.realSalary, realSalary) || other.realSalary == realSalary) &&
            (identical(other.actualAmountReceived, actualAmountReceived) || other.actualAmountReceived == actualAmountReceived));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        sign,
        payrollId,
        employeeId,
        code,
        fullName,
        departmentSTT,
        departmentName,
        priorityOrder,
        positionName,
        basicSalary,
        totalWorkday,
        totalMerit,
        totalSalaryByDay,
        salaryOneHour,
        otHourWD,
        otMoneyWD,
        otHourWK,
        otMoneyWK,
        otHourHD,
        otMoneyHD,
        otTotalSalary,
        referenceIndustry,
        realIndustry,
        allowanceMeal,
        allowanceOTEarly,
        totalAllowance,
        bussinessMoney,
        nightShiftMoney,
        costVehicleBussiness,
        bonus,
        other,
        totalBonus,
        socialInsurance,
        insurances,
        unionFees,
        advancePayment,
        departmentalFees,
        parkingMoney,
        punish5S,
        otherDeduction,
        totalDeduction,
        note,
        isPublish,
        startWorking,
        mealUse,
        taxSalaryOT,
        taxSalaryMeal,
        taxSalaryPhone,
        taxPersonalDeduction,
        taxDependentsDeduction,
        totalTaxDeduction,
        taxAbleIncome,
        taxCompanyName,
        statusContract,
        taxDeduction,
        stt,
        realSalary,
        actualAmountReceived
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryPayrollItemImplCopyWith<_$SalaryPayrollItemImpl> get copyWith =>
      __$$SalaryPayrollItemImplCopyWithImpl<_$SalaryPayrollItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryPayrollItemImplToJson(
      this,
    );
  }
}

abstract class _SalaryPayrollItem implements SalaryPayrollItem {
  const factory _SalaryPayrollItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Sign') final bool? sign,
      @JsonKey(name: 'PayrollID') final int? payrollId,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'DepartmentSTT') final int? departmentSTT,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'PriorityOrder') final int? priorityOrder,
      @JsonKey(name: 'PositionName') final String? positionName,
      @JsonKey(name: 'BasicSalary') final double? basicSalary,
      @JsonKey(name: 'TotalWorkday') final double? totalWorkday,
      @JsonKey(name: 'TotalMerit') final double? totalMerit,
      @JsonKey(name: 'TotalSalaryByDay') final double? totalSalaryByDay,
      @JsonKey(name: 'SalaryOneHour') final double? salaryOneHour,
      @JsonKey(name: 'OT_Hour_WD') final double? otHourWD,
      @JsonKey(name: 'OT_Money_WD') final double? otMoneyWD,
      @JsonKey(name: 'OT_Hour_WK') final double? otHourWK,
      @JsonKey(name: 'OT_Money_WK') final double? otMoneyWK,
      @JsonKey(name: 'OT_Hour_HD') final double? otHourHD,
      @JsonKey(name: 'OT_Money_HD') final double? otMoneyHD,
      @JsonKey(name: 'OT_TotalSalary') final double? otTotalSalary,
      @JsonKey(name: 'ReferenceIndustry') final double? referenceIndustry,
      @JsonKey(name: 'RealIndustry') final double? realIndustry,
      @JsonKey(name: 'AllowanceMeal') final double? allowanceMeal,
      @JsonKey(name: 'Allowance_OT_Early') final double? allowanceOTEarly,
      @JsonKey(name: 'TotalAllowance') final double? totalAllowance,
      @JsonKey(name: 'BussinessMoney') final double? bussinessMoney,
      @JsonKey(name: 'NightShiftMoney') final double? nightShiftMoney,
      @JsonKey(name: 'CostVehicleBussiness') final double? costVehicleBussiness,
      @JsonKey(name: 'Bonus') final double? bonus,
      @JsonKey(name: 'Other') final double? other,
      @JsonKey(name: 'TotalBonus') final double? totalBonus,
      @JsonKey(name: 'SocialInsurance') final double? socialInsurance,
      @JsonKey(name: 'Insurances') final double? insurances,
      @JsonKey(name: 'UnionFees') final double? unionFees,
      @JsonKey(name: 'AdvancePayment') final double? advancePayment,
      @JsonKey(name: 'DepartmentalFees') final double? departmentalFees,
      @JsonKey(name: 'ParkingMoney') final double? parkingMoney,
      @JsonKey(name: 'Punish5S') final double? punish5S,
      @JsonKey(name: 'OtherDeduction') final double? otherDeduction,
      @JsonKey(name: 'TotalDeduction') final double? totalDeduction,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsPublish') final bool? isPublish,
      @JsonKey(name: 'StartWorking') final DateTime? startWorking,
      @JsonKey(name: 'MealUse') final int? mealUse,
      @JsonKey(name: 'TaxSalaryOT') final double? taxSalaryOT,
      @JsonKey(name: 'TaxSalaryMeal') final double? taxSalaryMeal,
      @JsonKey(name: 'TaxSalaryPhone') final double? taxSalaryPhone,
      @JsonKey(name: 'TaxPersonalDeduction') final double? taxPersonalDeduction,
      @JsonKey(name: 'TaxDependentsDeduction')
      final double? taxDependentsDeduction,
      @JsonKey(name: 'TotalTaxDeduction') final double? totalTaxDeduction,
      @JsonKey(name: 'TaxAbleIncome') final double? taxAbleIncome,
      @JsonKey(name: 'TaxCompanyName') final String? taxCompanyName,
      @JsonKey(name: 'StatusContract') final String? statusContract,
      @JsonKey(name: 'TaxDeduction') final double? taxDeduction,
      @JsonKey(name: 'STT') final int? stt,
      @JsonKey(name: 'RealSalary') final double? realSalary,
      @JsonKey(name: 'ActualAmountReceived')
      final double? actualAmountReceived}) = _$SalaryPayrollItemImpl;

  factory _SalaryPayrollItem.fromJson(Map<String, dynamic> json) =
      _$SalaryPayrollItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Sign')
  bool? get sign;
  @override
  @JsonKey(name: 'PayrollID')
  int? get payrollId;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentSTT;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'PriorityOrder')
  int? get priorityOrder;
  @override
  @JsonKey(name: 'PositionName')
  String? get positionName;
  @override
  @JsonKey(name: 'BasicSalary')
  double? get basicSalary;
  @override
  @JsonKey(name: 'TotalWorkday')
  double? get totalWorkday;
  @override
  @JsonKey(name: 'TotalMerit')
  double? get totalMerit;
  @override
  @JsonKey(name: 'TotalSalaryByDay')
  double? get totalSalaryByDay;
  @override
  @JsonKey(name: 'SalaryOneHour')
  double? get salaryOneHour;
  @override
  @JsonKey(name: 'OT_Hour_WD')
  double? get otHourWD;
  @override
  @JsonKey(name: 'OT_Money_WD')
  double? get otMoneyWD;
  @override
  @JsonKey(name: 'OT_Hour_WK')
  double? get otHourWK;
  @override
  @JsonKey(name: 'OT_Money_WK')
  double? get otMoneyWK;
  @override
  @JsonKey(name: 'OT_Hour_HD')
  double? get otHourHD;
  @override
  @JsonKey(name: 'OT_Money_HD')
  double? get otMoneyHD;
  @override
  @JsonKey(name: 'OT_TotalSalary')
  double? get otTotalSalary;
  @override
  @JsonKey(name: 'ReferenceIndustry')
  double? get referenceIndustry;
  @override
  @JsonKey(name: 'RealIndustry')
  double? get realIndustry;
  @override
  @JsonKey(name: 'AllowanceMeal')
  double? get allowanceMeal;
  @override
  @JsonKey(name: 'Allowance_OT_Early')
  double? get allowanceOTEarly;
  @override
  @JsonKey(name: 'TotalAllowance')
  double? get totalAllowance;
  @override
  @JsonKey(name: 'BussinessMoney')
  double? get bussinessMoney;
  @override
  @JsonKey(name: 'NightShiftMoney')
  double? get nightShiftMoney;
  @override
  @JsonKey(name: 'CostVehicleBussiness')
  double? get costVehicleBussiness;
  @override
  @JsonKey(name: 'Bonus')
  double? get bonus;
  @override
  @JsonKey(name: 'Other')
  double? get other;
  @override
  @JsonKey(name: 'TotalBonus')
  double? get totalBonus;
  @override
  @JsonKey(name: 'SocialInsurance')
  double? get socialInsurance;
  @override
  @JsonKey(name: 'Insurances')
  double? get insurances;
  @override
  @JsonKey(name: 'UnionFees')
  double? get unionFees;
  @override
  @JsonKey(name: 'AdvancePayment')
  double? get advancePayment;
  @override
  @JsonKey(name: 'DepartmentalFees')
  double? get departmentalFees;
  @override
  @JsonKey(name: 'ParkingMoney')
  double? get parkingMoney;
  @override
  @JsonKey(name: 'Punish5S')
  double? get punish5S;
  @override
  @JsonKey(name: 'OtherDeduction')
  double? get otherDeduction;
  @override
  @JsonKey(name: 'TotalDeduction')
  double? get totalDeduction;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsPublish')
  bool? get isPublish;
  @override
  @JsonKey(name: 'StartWorking')
  DateTime? get startWorking;
  @override
  @JsonKey(name: 'MealUse')
  int? get mealUse;
  @override
  @JsonKey(name: 'TaxSalaryOT')
  double? get taxSalaryOT;
  @override
  @JsonKey(name: 'TaxSalaryMeal')
  double? get taxSalaryMeal;
  @override
  @JsonKey(name: 'TaxSalaryPhone')
  double? get taxSalaryPhone;
  @override
  @JsonKey(name: 'TaxPersonalDeduction')
  double? get taxPersonalDeduction;
  @override
  @JsonKey(name: 'TaxDependentsDeduction')
  double? get taxDependentsDeduction;
  @override
  @JsonKey(name: 'TotalTaxDeduction')
  double? get totalTaxDeduction;
  @override
  @JsonKey(name: 'TaxAbleIncome')
  double? get taxAbleIncome;
  @override
  @JsonKey(name: 'TaxCompanyName')
  String? get taxCompanyName;
  @override
  @JsonKey(name: 'StatusContract')
  String? get statusContract;
  @override
  @JsonKey(name: 'TaxDeduction')
  double? get taxDeduction;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'RealSalary')
  double? get realSalary;
  @override
  @JsonKey(name: 'ActualAmountReceived')
  double? get actualAmountReceived;
  @override
  @JsonKey(ignore: true)
  _$$SalaryPayrollItemImplCopyWith<_$SalaryPayrollItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryItem _$SalaryItemFromJson(Map<String, dynamic> json) {
  return _SalaryItem.fromJson(json);
}

/// @nodoc
mixin _$SalaryItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'BasicSalary')
  double? get basicSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'Allowance')
  double? get allowance => throw _privateConstructorUsedError;
  @JsonKey(name: 'Deduction')
  double? get deduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'GrossSalary')
  double? get grossSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tax')
  double? get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'Insurance')
  double? get insurance => throw _privateConstructorUsedError;
  @JsonKey(name: 'NetSalary')
  double? get netSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'Month')
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryItemCopyWith<SalaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryItemCopyWith<$Res> {
  factory $SalaryItemCopyWith(
          SalaryItem value, $Res Function(SalaryItem) then) =
      _$SalaryItemCopyWithImpl<$Res, SalaryItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'BasicSalary') double? basicSalary,
      @JsonKey(name: 'Allowance') double? allowance,
      @JsonKey(name: 'Deduction') double? deduction,
      @JsonKey(name: 'GrossSalary') double? grossSalary,
      @JsonKey(name: 'Tax') double? tax,
      @JsonKey(name: 'Insurance') double? insurance,
      @JsonKey(name: 'NetSalary') double? netSalary,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class _$SalaryItemCopyWithImpl<$Res, $Val extends SalaryItem>
    implements $SalaryItemCopyWith<$Res> {
  _$SalaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? basicSalary = freezed,
    Object? allowance = freezed,
    Object? deduction = freezed,
    Object? grossSalary = freezed,
    Object? tax = freezed,
    Object? insurance = freezed,
    Object? netSalary = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSalary: freezed == basicSalary
          ? _value.basicSalary
          : basicSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      allowance: freezed == allowance
          ? _value.allowance
          : allowance // ignore: cast_nullable_to_non_nullable
              as double?,
      deduction: freezed == deduction
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as double?,
      grossSalary: freezed == grossSalary
          ? _value.grossSalary
          : grossSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as double?,
      netSalary: freezed == netSalary
          ? _value.netSalary
          : netSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryItemImplCopyWith<$Res>
    implements $SalaryItemCopyWith<$Res> {
  factory _$$SalaryItemImplCopyWith(
          _$SalaryItemImpl value, $Res Function(_$SalaryItemImpl) then) =
      __$$SalaryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'EmployeeCode') String? employeeCode,
      @JsonKey(name: 'BasicSalary') double? basicSalary,
      @JsonKey(name: 'Allowance') double? allowance,
      @JsonKey(name: 'Deduction') double? deduction,
      @JsonKey(name: 'GrossSalary') double? grossSalary,
      @JsonKey(name: 'Tax') double? tax,
      @JsonKey(name: 'Insurance') double? insurance,
      @JsonKey(name: 'NetSalary') double? netSalary,
      @JsonKey(name: 'Month') int? month,
      @JsonKey(name: 'Year') int? year,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class __$$SalaryItemImplCopyWithImpl<$Res>
    extends _$SalaryItemCopyWithImpl<$Res, _$SalaryItemImpl>
    implements _$$SalaryItemImplCopyWith<$Res> {
  __$$SalaryItemImplCopyWithImpl(
      _$SalaryItemImpl _value, $Res Function(_$SalaryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeName = freezed,
    Object? employeeCode = freezed,
    Object? basicSalary = freezed,
    Object? allowance = freezed,
    Object? deduction = freezed,
    Object? grossSalary = freezed,
    Object? tax = freezed,
    Object? insurance = freezed,
    Object? netSalary = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$SalaryItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      basicSalary: freezed == basicSalary
          ? _value.basicSalary
          : basicSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      allowance: freezed == allowance
          ? _value.allowance
          : allowance // ignore: cast_nullable_to_non_nullable
              as double?,
      deduction: freezed == deduction
          ? _value.deduction
          : deduction // ignore: cast_nullable_to_non_nullable
              as double?,
      grossSalary: freezed == grossSalary
          ? _value.grossSalary
          : grossSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      insurance: freezed == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as double?,
      netSalary: freezed == netSalary
          ? _value.netSalary
          : netSalary // ignore: cast_nullable_to_non_nullable
              as double?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryItemImpl implements _SalaryItem {
  const _$SalaryItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'EmployeeCode') this.employeeCode,
      @JsonKey(name: 'BasicSalary') this.basicSalary,
      @JsonKey(name: 'Allowance') this.allowance,
      @JsonKey(name: 'Deduction') this.deduction,
      @JsonKey(name: 'GrossSalary') this.grossSalary,
      @JsonKey(name: 'Tax') this.tax,
      @JsonKey(name: 'Insurance') this.insurance,
      @JsonKey(name: 'NetSalary') this.netSalary,
      @JsonKey(name: 'Month') this.month,
      @JsonKey(name: 'Year') this.year,
      @JsonKey(name: 'CreatedDate') this.createdDate});

  factory _$SalaryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'EmployeeCode')
  final String? employeeCode;
  @override
  @JsonKey(name: 'BasicSalary')
  final double? basicSalary;
  @override
  @JsonKey(name: 'Allowance')
  final double? allowance;
  @override
  @JsonKey(name: 'Deduction')
  final double? deduction;
  @override
  @JsonKey(name: 'GrossSalary')
  final double? grossSalary;
  @override
  @JsonKey(name: 'Tax')
  final double? tax;
  @override
  @JsonKey(name: 'Insurance')
  final double? insurance;
  @override
  @JsonKey(name: 'NetSalary')
  final double? netSalary;
  @override
  @JsonKey(name: 'Month')
  final int? month;
  @override
  @JsonKey(name: 'Year')
  final int? year;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;

  @override
  String toString() {
    return 'SalaryItem(id: $id, employeeId: $employeeId, employeeName: $employeeName, employeeCode: $employeeCode, basicSalary: $basicSalary, allowance: $allowance, deduction: $deduction, grossSalary: $grossSalary, tax: $tax, insurance: $insurance, netSalary: $netSalary, month: $month, year: $year, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeCode, employeeCode) ||
                other.employeeCode == employeeCode) &&
            (identical(other.basicSalary, basicSalary) ||
                other.basicSalary == basicSalary) &&
            (identical(other.allowance, allowance) ||
                other.allowance == allowance) &&
            (identical(other.deduction, deduction) ||
                other.deduction == deduction) &&
            (identical(other.grossSalary, grossSalary) ||
                other.grossSalary == grossSalary) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance) &&
            (identical(other.netSalary, netSalary) ||
                other.netSalary == netSalary) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeId,
      employeeName,
      employeeCode,
      basicSalary,
      allowance,
      deduction,
      grossSalary,
      tax,
      insurance,
      netSalary,
      month,
      year,
      createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryItemImplCopyWith<_$SalaryItemImpl> get copyWith =>
      __$$SalaryItemImplCopyWithImpl<_$SalaryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryItemImplToJson(
      this,
    );
  }
}

abstract class _SalaryItem implements SalaryItem {
  const factory _SalaryItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'EmployeeCode') final String? employeeCode,
          @JsonKey(name: 'BasicSalary') final double? basicSalary,
          @JsonKey(name: 'Allowance') final double? allowance,
          @JsonKey(name: 'Deduction') final double? deduction,
          @JsonKey(name: 'GrossSalary') final double? grossSalary,
          @JsonKey(name: 'Tax') final double? tax,
          @JsonKey(name: 'Insurance') final double? insurance,
          @JsonKey(name: 'NetSalary') final double? netSalary,
          @JsonKey(name: 'Month') final int? month,
          @JsonKey(name: 'Year') final int? year,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate}) =
      _$SalaryItemImpl;

  factory _SalaryItem.fromJson(Map<String, dynamic> json) =
      _$SalaryItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode;
  @override
  @JsonKey(name: 'BasicSalary')
  double? get basicSalary;
  @override
  @JsonKey(name: 'Allowance')
  double? get allowance;
  @override
  @JsonKey(name: 'Deduction')
  double? get deduction;
  @override
  @JsonKey(name: 'GrossSalary')
  double? get grossSalary;
  @override
  @JsonKey(name: 'Tax')
  double? get tax;
  @override
  @JsonKey(name: 'Insurance')
  double? get insurance;
  @override
  @JsonKey(name: 'NetSalary')
  double? get netSalary;
  @override
  @JsonKey(name: 'Month')
  int? get month;
  @override
  @JsonKey(name: 'Year')
  int? get year;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$SalaryItemImplCopyWith<_$SalaryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
