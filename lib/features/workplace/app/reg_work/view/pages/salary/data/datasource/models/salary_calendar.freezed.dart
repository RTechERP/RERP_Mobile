// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalaryCalendarItem _$SalaryCalendarItemFromJson(Map<String, dynamic> json) {
  return _SalaryCalendarItem.fromJson(json);
}

/// @nodoc
mixin _$SalaryCalendarItem {
  @JsonKey(name: 'holidays')
  List<SalaryHolidayItem>? get holidays => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduleWorkSaturdays')
  List<SalaryWorkSaturdayItem>? get scheduleWorkSaturdays =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryCalendarItemCopyWith<SalaryCalendarItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryCalendarItemCopyWith<$Res> {
  factory $SalaryCalendarItemCopyWith(
          SalaryCalendarItem value, $Res Function(SalaryCalendarItem) then) =
      _$SalaryCalendarItemCopyWithImpl<$Res, SalaryCalendarItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'holidays') List<SalaryHolidayItem>? holidays,
      @JsonKey(name: 'scheduleWorkSaturdays')
      List<SalaryWorkSaturdayItem>? scheduleWorkSaturdays});
}

/// @nodoc
class _$SalaryCalendarItemCopyWithImpl<$Res, $Val extends SalaryCalendarItem>
    implements $SalaryCalendarItemCopyWith<$Res> {
  _$SalaryCalendarItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holidays = freezed,
    Object? scheduleWorkSaturdays = freezed,
  }) {
    return _then(_value.copyWith(
      holidays: freezed == holidays
          ? _value.holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<SalaryHolidayItem>?,
      scheduleWorkSaturdays: freezed == scheduleWorkSaturdays
          ? _value.scheduleWorkSaturdays
          : scheduleWorkSaturdays // ignore: cast_nullable_to_non_nullable
              as List<SalaryWorkSaturdayItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryCalendarItemImplCopyWith<$Res>
    implements $SalaryCalendarItemCopyWith<$Res> {
  factory _$$SalaryCalendarItemImplCopyWith(_$SalaryCalendarItemImpl value,
          $Res Function(_$SalaryCalendarItemImpl) then) =
      __$$SalaryCalendarItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'holidays') List<SalaryHolidayItem>? holidays,
      @JsonKey(name: 'scheduleWorkSaturdays')
      List<SalaryWorkSaturdayItem>? scheduleWorkSaturdays});
}

/// @nodoc
class __$$SalaryCalendarItemImplCopyWithImpl<$Res>
    extends _$SalaryCalendarItemCopyWithImpl<$Res, _$SalaryCalendarItemImpl>
    implements _$$SalaryCalendarItemImplCopyWith<$Res> {
  __$$SalaryCalendarItemImplCopyWithImpl(_$SalaryCalendarItemImpl _value,
      $Res Function(_$SalaryCalendarItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holidays = freezed,
    Object? scheduleWorkSaturdays = freezed,
  }) {
    return _then(_$SalaryCalendarItemImpl(
      holidays: freezed == holidays
          ? _value._holidays
          : holidays // ignore: cast_nullable_to_non_nullable
              as List<SalaryHolidayItem>?,
      scheduleWorkSaturdays: freezed == scheduleWorkSaturdays
          ? _value._scheduleWorkSaturdays
          : scheduleWorkSaturdays // ignore: cast_nullable_to_non_nullable
              as List<SalaryWorkSaturdayItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryCalendarItemImpl implements _SalaryCalendarItem {
  const _$SalaryCalendarItemImpl(
      {@JsonKey(name: 'holidays') final List<SalaryHolidayItem>? holidays,
      @JsonKey(name: 'scheduleWorkSaturdays')
      final List<SalaryWorkSaturdayItem>? scheduleWorkSaturdays})
      : _holidays = holidays,
        _scheduleWorkSaturdays = scheduleWorkSaturdays;

  factory _$SalaryCalendarItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryCalendarItemImplFromJson(json);

  final List<SalaryHolidayItem>? _holidays;
  @override
  @JsonKey(name: 'holidays')
  List<SalaryHolidayItem>? get holidays {
    final value = _holidays;
    if (value == null) return null;
    if (_holidays is EqualUnmodifiableListView) return _holidays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SalaryWorkSaturdayItem>? _scheduleWorkSaturdays;
  @override
  @JsonKey(name: 'scheduleWorkSaturdays')
  List<SalaryWorkSaturdayItem>? get scheduleWorkSaturdays {
    final value = _scheduleWorkSaturdays;
    if (value == null) return null;
    if (_scheduleWorkSaturdays is EqualUnmodifiableListView)
      return _scheduleWorkSaturdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SalaryCalendarItem(holidays: $holidays, scheduleWorkSaturdays: $scheduleWorkSaturdays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryCalendarItemImpl &&
            const DeepCollectionEquality().equals(other._holidays, _holidays) &&
            const DeepCollectionEquality()
                .equals(other._scheduleWorkSaturdays, _scheduleWorkSaturdays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_holidays),
      const DeepCollectionEquality().hash(_scheduleWorkSaturdays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryCalendarItemImplCopyWith<_$SalaryCalendarItemImpl> get copyWith =>
      __$$SalaryCalendarItemImplCopyWithImpl<_$SalaryCalendarItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryCalendarItemImplToJson(
      this,
    );
  }
}

abstract class _SalaryCalendarItem implements SalaryCalendarItem {
  const factory _SalaryCalendarItem(
          {@JsonKey(name: 'holidays') final List<SalaryHolidayItem>? holidays,
          @JsonKey(name: 'scheduleWorkSaturdays')
          final List<SalaryWorkSaturdayItem>? scheduleWorkSaturdays}) =
      _$SalaryCalendarItemImpl;

  factory _SalaryCalendarItem.fromJson(Map<String, dynamic> json) =
      _$SalaryCalendarItemImpl.fromJson;

  @override
  @JsonKey(name: 'holidays')
  List<SalaryHolidayItem>? get holidays;
  @override
  @JsonKey(name: 'scheduleWorkSaturdays')
  List<SalaryWorkSaturdayItem>? get scheduleWorkSaturdays;
  @override
  @JsonKey(ignore: true)
  _$$SalaryCalendarItemImplCopyWith<_$SalaryCalendarItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryHolidayItem _$SalaryHolidayItemFromJson(Map<String, dynamic> json) {
  return _SalaryHolidayItem.fromJson(json);
}

/// @nodoc
mixin _$SalaryHolidayItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayDate')
  DateTime? get holidayDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayYear')
  int? get holidayYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayMonth')
  int? get holidayMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayDay')
  int? get holidayDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'DayValue')
  String? get dayValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayName')
  String? get holidayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayCode')
  String? get holidayCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeHoliday')
  int? get typeHoliday => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeHolidayText')
  String? get typeHolidayText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryHolidayItemCopyWith<SalaryHolidayItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryHolidayItemCopyWith<$Res> {
  factory $SalaryHolidayItemCopyWith(
          SalaryHolidayItem value, $Res Function(SalaryHolidayItem) then) =
      _$SalaryHolidayItemCopyWithImpl<$Res, SalaryHolidayItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'HolidayDate') DateTime? holidayDate,
      @JsonKey(name: 'HolidayYear') int? holidayYear,
      @JsonKey(name: 'HolidayMonth') int? holidayMonth,
      @JsonKey(name: 'HolidayDay') int? holidayDay,
      @JsonKey(name: 'DayValue') String? dayValue,
      @JsonKey(name: 'HolidayName') String? holidayName,
      @JsonKey(name: 'HolidayCode') String? holidayCode,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'TypeHoliday') int? typeHoliday,
      @JsonKey(name: 'TypeHolidayText') String? typeHolidayText});
}

/// @nodoc
class _$SalaryHolidayItemCopyWithImpl<$Res, $Val extends SalaryHolidayItem>
    implements $SalaryHolidayItemCopyWith<$Res> {
  _$SalaryHolidayItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? holidayDate = freezed,
    Object? holidayYear = freezed,
    Object? holidayMonth = freezed,
    Object? holidayDay = freezed,
    Object? dayValue = freezed,
    Object? holidayName = freezed,
    Object? holidayCode = freezed,
    Object? note = freezed,
    Object? typeHoliday = freezed,
    Object? typeHolidayText = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      holidayDate: freezed == holidayDate
          ? _value.holidayDate
          : holidayDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      holidayYear: freezed == holidayYear
          ? _value.holidayYear
          : holidayYear // ignore: cast_nullable_to_non_nullable
              as int?,
      holidayMonth: freezed == holidayMonth
          ? _value.holidayMonth
          : holidayMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      holidayDay: freezed == holidayDay
          ? _value.holidayDay
          : holidayDay // ignore: cast_nullable_to_non_nullable
              as int?,
      dayValue: freezed == dayValue
          ? _value.dayValue
          : dayValue // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayName: freezed == holidayName
          ? _value.holidayName
          : holidayName // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayCode: freezed == holidayCode
          ? _value.holidayCode
          : holidayCode // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      typeHoliday: freezed == typeHoliday
          ? _value.typeHoliday
          : typeHoliday // ignore: cast_nullable_to_non_nullable
              as int?,
      typeHolidayText: freezed == typeHolidayText
          ? _value.typeHolidayText
          : typeHolidayText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryHolidayItemImplCopyWith<$Res>
    implements $SalaryHolidayItemCopyWith<$Res> {
  factory _$$SalaryHolidayItemImplCopyWith(_$SalaryHolidayItemImpl value,
          $Res Function(_$SalaryHolidayItemImpl) then) =
      __$$SalaryHolidayItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'HolidayDate') DateTime? holidayDate,
      @JsonKey(name: 'HolidayYear') int? holidayYear,
      @JsonKey(name: 'HolidayMonth') int? holidayMonth,
      @JsonKey(name: 'HolidayDay') int? holidayDay,
      @JsonKey(name: 'DayValue') String? dayValue,
      @JsonKey(name: 'HolidayName') String? holidayName,
      @JsonKey(name: 'HolidayCode') String? holidayCode,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'TypeHoliday') int? typeHoliday,
      @JsonKey(name: 'TypeHolidayText') String? typeHolidayText});
}

/// @nodoc
class __$$SalaryHolidayItemImplCopyWithImpl<$Res>
    extends _$SalaryHolidayItemCopyWithImpl<$Res, _$SalaryHolidayItemImpl>
    implements _$$SalaryHolidayItemImplCopyWith<$Res> {
  __$$SalaryHolidayItemImplCopyWithImpl(_$SalaryHolidayItemImpl _value,
      $Res Function(_$SalaryHolidayItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? holidayDate = freezed,
    Object? holidayYear = freezed,
    Object? holidayMonth = freezed,
    Object? holidayDay = freezed,
    Object? dayValue = freezed,
    Object? holidayName = freezed,
    Object? holidayCode = freezed,
    Object? note = freezed,
    Object? typeHoliday = freezed,
    Object? typeHolidayText = freezed,
  }) {
    return _then(_$SalaryHolidayItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      holidayDate: freezed == holidayDate
          ? _value.holidayDate
          : holidayDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      holidayYear: freezed == holidayYear
          ? _value.holidayYear
          : holidayYear // ignore: cast_nullable_to_non_nullable
              as int?,
      holidayMonth: freezed == holidayMonth
          ? _value.holidayMonth
          : holidayMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      holidayDay: freezed == holidayDay
          ? _value.holidayDay
          : holidayDay // ignore: cast_nullable_to_non_nullable
              as int?,
      dayValue: freezed == dayValue
          ? _value.dayValue
          : dayValue // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayName: freezed == holidayName
          ? _value.holidayName
          : holidayName // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayCode: freezed == holidayCode
          ? _value.holidayCode
          : holidayCode // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      typeHoliday: freezed == typeHoliday
          ? _value.typeHoliday
          : typeHoliday // ignore: cast_nullable_to_non_nullable
              as int?,
      typeHolidayText: freezed == typeHolidayText
          ? _value.typeHolidayText
          : typeHolidayText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryHolidayItemImpl implements _SalaryHolidayItem {
  const _$SalaryHolidayItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'HolidayDate') this.holidayDate,
      @JsonKey(name: 'HolidayYear') this.holidayYear,
      @JsonKey(name: 'HolidayMonth') this.holidayMonth,
      @JsonKey(name: 'HolidayDay') this.holidayDay,
      @JsonKey(name: 'DayValue') this.dayValue,
      @JsonKey(name: 'HolidayName') this.holidayName,
      @JsonKey(name: 'HolidayCode') this.holidayCode,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'TypeHoliday') this.typeHoliday,
      @JsonKey(name: 'TypeHolidayText') this.typeHolidayText});

  factory _$SalaryHolidayItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryHolidayItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'HolidayDate')
  final DateTime? holidayDate;
  @override
  @JsonKey(name: 'HolidayYear')
  final int? holidayYear;
  @override
  @JsonKey(name: 'HolidayMonth')
  final int? holidayMonth;
  @override
  @JsonKey(name: 'HolidayDay')
  final int? holidayDay;
  @override
  @JsonKey(name: 'DayValue')
  final String? dayValue;
  @override
  @JsonKey(name: 'HolidayName')
  final String? holidayName;
  @override
  @JsonKey(name: 'HolidayCode')
  final String? holidayCode;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'TypeHoliday')
  final int? typeHoliday;
  @override
  @JsonKey(name: 'TypeHolidayText')
  final String? typeHolidayText;

  @override
  String toString() {
    return 'SalaryHolidayItem(id: $id, holidayDate: $holidayDate, holidayYear: $holidayYear, holidayMonth: $holidayMonth, holidayDay: $holidayDay, dayValue: $dayValue, holidayName: $holidayName, holidayCode: $holidayCode, note: $note, typeHoliday: $typeHoliday, typeHolidayText: $typeHolidayText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryHolidayItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.holidayDate, holidayDate) ||
                other.holidayDate == holidayDate) &&
            (identical(other.holidayYear, holidayYear) ||
                other.holidayYear == holidayYear) &&
            (identical(other.holidayMonth, holidayMonth) ||
                other.holidayMonth == holidayMonth) &&
            (identical(other.holidayDay, holidayDay) ||
                other.holidayDay == holidayDay) &&
            (identical(other.dayValue, dayValue) ||
                other.dayValue == dayValue) &&
            (identical(other.holidayName, holidayName) ||
                other.holidayName == holidayName) &&
            (identical(other.holidayCode, holidayCode) ||
                other.holidayCode == holidayCode) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.typeHoliday, typeHoliday) ||
                other.typeHoliday == typeHoliday) &&
            (identical(other.typeHolidayText, typeHolidayText) ||
                other.typeHolidayText == typeHolidayText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      holidayDate,
      holidayYear,
      holidayMonth,
      holidayDay,
      dayValue,
      holidayName,
      holidayCode,
      note,
      typeHoliday,
      typeHolidayText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryHolidayItemImplCopyWith<_$SalaryHolidayItemImpl> get copyWith =>
      __$$SalaryHolidayItemImplCopyWithImpl<_$SalaryHolidayItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryHolidayItemImplToJson(
      this,
    );
  }
}

abstract class _SalaryHolidayItem implements SalaryHolidayItem {
  const factory _SalaryHolidayItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'HolidayDate') final DateTime? holidayDate,
          @JsonKey(name: 'HolidayYear') final int? holidayYear,
          @JsonKey(name: 'HolidayMonth') final int? holidayMonth,
          @JsonKey(name: 'HolidayDay') final int? holidayDay,
          @JsonKey(name: 'DayValue') final String? dayValue,
          @JsonKey(name: 'HolidayName') final String? holidayName,
          @JsonKey(name: 'HolidayCode') final String? holidayCode,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'TypeHoliday') final int? typeHoliday,
          @JsonKey(name: 'TypeHolidayText') final String? typeHolidayText}) =
      _$SalaryHolidayItemImpl;

  factory _SalaryHolidayItem.fromJson(Map<String, dynamic> json) =
      _$SalaryHolidayItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'HolidayDate')
  DateTime? get holidayDate;
  @override
  @JsonKey(name: 'HolidayYear')
  int? get holidayYear;
  @override
  @JsonKey(name: 'HolidayMonth')
  int? get holidayMonth;
  @override
  @JsonKey(name: 'HolidayDay')
  int? get holidayDay;
  @override
  @JsonKey(name: 'DayValue')
  String? get dayValue;
  @override
  @JsonKey(name: 'HolidayName')
  String? get holidayName;
  @override
  @JsonKey(name: 'HolidayCode')
  String? get holidayCode;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'TypeHoliday')
  int? get typeHoliday;
  @override
  @JsonKey(name: 'TypeHolidayText')
  String? get typeHolidayText;
  @override
  @JsonKey(ignore: true)
  _$$SalaryHolidayItemImplCopyWith<_$SalaryHolidayItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryWorkSaturdayItem _$SalaryWorkSaturdayItemFromJson(
    Map<String, dynamic> json) {
  return _SalaryWorkSaturdayItem.fromJson(json);
}

/// @nodoc
mixin _$SalaryWorkSaturdayItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateValue')
  DateTime? get dateValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkDay')
  int? get workDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkMonth')
  int? get workMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkYear')
  int? get workYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'Approver')
  int? get approver => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryWorkSaturdayItemCopyWith<SalaryWorkSaturdayItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryWorkSaturdayItemCopyWith<$Res> {
  factory $SalaryWorkSaturdayItemCopyWith(SalaryWorkSaturdayItem value,
          $Res Function(SalaryWorkSaturdayItem) then) =
      _$SalaryWorkSaturdayItemCopyWithImpl<$Res, SalaryWorkSaturdayItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'DateValue') DateTime? dateValue,
      @JsonKey(name: 'Status') bool? status,
      @JsonKey(name: 'WorkDay') int? workDay,
      @JsonKey(name: 'WorkMonth') int? workMonth,
      @JsonKey(name: 'WorkYear') int? workYear,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'Approver') int? approver,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy});
}

/// @nodoc
class _$SalaryWorkSaturdayItemCopyWithImpl<$Res,
        $Val extends SalaryWorkSaturdayItem>
    implements $SalaryWorkSaturdayItemCopyWith<$Res> {
  _$SalaryWorkSaturdayItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dateValue = freezed,
    Object? status = freezed,
    Object? workDay = freezed,
    Object? workMonth = freezed,
    Object? workYear = freezed,
    Object? isApproved = freezed,
    Object? approver = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateValue: freezed == dateValue
          ? _value.dateValue
          : dateValue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      workDay: freezed == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int?,
      workMonth: freezed == workMonth
          ? _value.workMonth
          : workMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      workYear: freezed == workYear
          ? _value.workYear
          : workYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      approver: freezed == approver
          ? _value.approver
          : approver // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryWorkSaturdayItemImplCopyWith<$Res>
    implements $SalaryWorkSaturdayItemCopyWith<$Res> {
  factory _$$SalaryWorkSaturdayItemImplCopyWith(
          _$SalaryWorkSaturdayItemImpl value,
          $Res Function(_$SalaryWorkSaturdayItemImpl) then) =
      __$$SalaryWorkSaturdayItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'DateValue') DateTime? dateValue,
      @JsonKey(name: 'Status') bool? status,
      @JsonKey(name: 'WorkDay') int? workDay,
      @JsonKey(name: 'WorkMonth') int? workMonth,
      @JsonKey(name: 'WorkYear') int? workYear,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'Approver') int? approver,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy});
}

/// @nodoc
class __$$SalaryWorkSaturdayItemImplCopyWithImpl<$Res>
    extends _$SalaryWorkSaturdayItemCopyWithImpl<$Res,
        _$SalaryWorkSaturdayItemImpl>
    implements _$$SalaryWorkSaturdayItemImplCopyWith<$Res> {
  __$$SalaryWorkSaturdayItemImplCopyWithImpl(
      _$SalaryWorkSaturdayItemImpl _value,
      $Res Function(_$SalaryWorkSaturdayItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dateValue = freezed,
    Object? status = freezed,
    Object? workDay = freezed,
    Object? workMonth = freezed,
    Object? workYear = freezed,
    Object? isApproved = freezed,
    Object? approver = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$SalaryWorkSaturdayItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateValue: freezed == dateValue
          ? _value.dateValue
          : dateValue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      workDay: freezed == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int?,
      workMonth: freezed == workMonth
          ? _value.workMonth
          : workMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      workYear: freezed == workYear
          ? _value.workYear
          : workYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      approver: freezed == approver
          ? _value.approver
          : approver // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryWorkSaturdayItemImpl implements _SalaryWorkSaturdayItem {
  const _$SalaryWorkSaturdayItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'DateValue') this.dateValue,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'WorkDay') this.workDay,
      @JsonKey(name: 'WorkMonth') this.workMonth,
      @JsonKey(name: 'WorkYear') this.workYear,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'Approver') this.approver,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedBy') this.updatedBy});

  factory _$SalaryWorkSaturdayItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryWorkSaturdayItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'DateValue')
  final DateTime? dateValue;
  @override
  @JsonKey(name: 'Status')
  final bool? status;
  @override
  @JsonKey(name: 'WorkDay')
  final int? workDay;
  @override
  @JsonKey(name: 'WorkMonth')
  final int? workMonth;
  @override
  @JsonKey(name: 'WorkYear')
  final int? workYear;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'Approver')
  final int? approver;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;

  @override
  String toString() {
    return 'SalaryWorkSaturdayItem(id: $id, dateValue: $dateValue, status: $status, workDay: $workDay, workMonth: $workMonth, workYear: $workYear, isApproved: $isApproved, approver: $approver, createdDate: $createdDate, updatedDate: $updatedDate, createdBy: $createdBy, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryWorkSaturdayItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateValue, dateValue) ||
                other.dateValue == dateValue) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.workMonth, workMonth) ||
                other.workMonth == workMonth) &&
            (identical(other.workYear, workYear) ||
                other.workYear == workYear) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.approver, approver) ||
                other.approver == approver) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dateValue,
      status,
      workDay,
      workMonth,
      workYear,
      isApproved,
      approver,
      createdDate,
      updatedDate,
      createdBy,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryWorkSaturdayItemImplCopyWith<_$SalaryWorkSaturdayItemImpl>
      get copyWith => __$$SalaryWorkSaturdayItemImplCopyWithImpl<
          _$SalaryWorkSaturdayItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryWorkSaturdayItemImplToJson(
      this,
    );
  }
}

abstract class _SalaryWorkSaturdayItem implements SalaryWorkSaturdayItem {
  const factory _SalaryWorkSaturdayItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'DateValue') final DateTime? dateValue,
          @JsonKey(name: 'Status') final bool? status,
          @JsonKey(name: 'WorkDay') final int? workDay,
          @JsonKey(name: 'WorkMonth') final int? workMonth,
          @JsonKey(name: 'WorkYear') final int? workYear,
          @JsonKey(name: 'IsApproved') final bool? isApproved,
          @JsonKey(name: 'Approver') final int? approver,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy}) =
      _$SalaryWorkSaturdayItemImpl;

  factory _SalaryWorkSaturdayItem.fromJson(Map<String, dynamic> json) =
      _$SalaryWorkSaturdayItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'DateValue')
  DateTime? get dateValue;
  @override
  @JsonKey(name: 'Status')
  bool? get status;
  @override
  @JsonKey(name: 'WorkDay')
  int? get workDay;
  @override
  @JsonKey(name: 'WorkMonth')
  int? get workMonth;
  @override
  @JsonKey(name: 'WorkYear')
  int? get workYear;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'Approver')
  int? get approver;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$SalaryWorkSaturdayItemImplCopyWith<_$SalaryWorkSaturdayItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
