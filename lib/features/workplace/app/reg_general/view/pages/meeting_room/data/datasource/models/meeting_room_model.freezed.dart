// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeetingRoomSaveResponse _$MeetingRoomSaveResponseFromJson(
    Map<String, dynamic> json) {
  return _MeetingRoomSaveResponse.fromJson(json);
}

/// @nodoc
mixin _$MeetingRoomSaveResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'MeetingRoomID')
  int get meetingRoomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRegister')
  DateTime get dateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartTime')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndTime')
  DateTime get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  int get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeetingRoomSaveResponseCopyWith<MeetingRoomSaveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingRoomSaveResponseCopyWith<$Res> {
  factory $MeetingRoomSaveResponseCopyWith(MeetingRoomSaveResponse value,
          $Res Function(MeetingRoomSaveResponse) then) =
      _$MeetingRoomSaveResponseCopyWithImpl<$Res, MeetingRoomSaveResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MeetingRoomID') int meetingRoomId,
      @JsonKey(name: 'DateRegister') DateTime dateRegister,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'StartTime') DateTime startTime,
      @JsonKey(name: 'EndTime') DateTime endTime,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'IsApproved') int isApproved,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$MeetingRoomSaveResponseCopyWithImpl<$Res,
        $Val extends MeetingRoomSaveResponse>
    implements $MeetingRoomSaveResponseCopyWith<$Res> {
  _$MeetingRoomSaveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? meetingRoomId = null,
    Object? dateRegister = null,
    Object? employeeId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? content = null,
    Object? isApproved = null,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? departmentId = null,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      meetingRoomId: null == meetingRoomId
          ? _value.meetingRoomId
          : meetingRoomId // ignore: cast_nullable_to_non_nullable
              as int,
      dateRegister: null == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeetingRoomSaveResponseImplCopyWith<$Res>
    implements $MeetingRoomSaveResponseCopyWith<$Res> {
  factory _$$MeetingRoomSaveResponseImplCopyWith(
          _$MeetingRoomSaveResponseImpl value,
          $Res Function(_$MeetingRoomSaveResponseImpl) then) =
      __$$MeetingRoomSaveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MeetingRoomID') int meetingRoomId,
      @JsonKey(name: 'DateRegister') DateTime dateRegister,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'StartTime') DateTime startTime,
      @JsonKey(name: 'EndTime') DateTime endTime,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'IsApproved') int isApproved,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$MeetingRoomSaveResponseImplCopyWithImpl<$Res>
    extends _$MeetingRoomSaveResponseCopyWithImpl<$Res,
        _$MeetingRoomSaveResponseImpl>
    implements _$$MeetingRoomSaveResponseImplCopyWith<$Res> {
  __$$MeetingRoomSaveResponseImplCopyWithImpl(
      _$MeetingRoomSaveResponseImpl _value,
      $Res Function(_$MeetingRoomSaveResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? meetingRoomId = null,
    Object? dateRegister = null,
    Object? employeeId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? content = null,
    Object? isApproved = null,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? departmentId = null,
    Object? isDeleted = freezed,
  }) {
    return _then(_$MeetingRoomSaveResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      meetingRoomId: null == meetingRoomId
          ? _value.meetingRoomId
          : meetingRoomId // ignore: cast_nullable_to_non_nullable
              as int,
      dateRegister: null == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeetingRoomSaveResponseImpl implements _MeetingRoomSaveResponse {
  const _$MeetingRoomSaveResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'MeetingRoomID') required this.meetingRoomId,
      @JsonKey(name: 'DateRegister') required this.dateRegister,
      @JsonKey(name: 'EmployeeID') required this.employeeId,
      @JsonKey(name: 'StartTime') required this.startTime,
      @JsonKey(name: 'EndTime') required this.endTime,
      @JsonKey(name: 'Content') required this.content,
      @JsonKey(name: 'IsApproved') required this.isApproved,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'DepartmentID') required this.departmentId,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$MeetingRoomSaveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeetingRoomSaveResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'MeetingRoomID')
  final int meetingRoomId;
  @override
  @JsonKey(name: 'DateRegister')
  final DateTime dateRegister;
  @override
  @JsonKey(name: 'EmployeeID')
  final int employeeId;
  @override
  @JsonKey(name: 'StartTime')
  final DateTime startTime;
  @override
  @JsonKey(name: 'EndTime')
  final DateTime endTime;
  @override
  @JsonKey(name: 'Content')
  final String content;
  @override
  @JsonKey(name: 'IsApproved')
  final int isApproved;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'DepartmentID')
  final int departmentId;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'MeetingRoomSaveResponse(id: $id, meetingRoomId: $meetingRoomId, dateRegister: $dateRegister, employeeId: $employeeId, startTime: $startTime, endTime: $endTime, content: $content, isApproved: $isApproved, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, departmentId: $departmentId, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingRoomSaveResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.meetingRoomId, meetingRoomId) ||
                other.meetingRoomId == meetingRoomId) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      meetingRoomId,
      dateRegister,
      employeeId,
      startTime,
      endTime,
      content,
      isApproved,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      departmentId,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingRoomSaveResponseImplCopyWith<_$MeetingRoomSaveResponseImpl>
      get copyWith => __$$MeetingRoomSaveResponseImplCopyWithImpl<
          _$MeetingRoomSaveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeetingRoomSaveResponseImplToJson(
      this,
    );
  }
}

abstract class _MeetingRoomSaveResponse implements MeetingRoomSaveResponse {
  const factory _MeetingRoomSaveResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'MeetingRoomID') required final int meetingRoomId,
          @JsonKey(name: 'DateRegister') required final DateTime dateRegister,
          @JsonKey(name: 'EmployeeID') required final int employeeId,
          @JsonKey(name: 'StartTime') required final DateTime startTime,
          @JsonKey(name: 'EndTime') required final DateTime endTime,
          @JsonKey(name: 'Content') required final String content,
          @JsonKey(name: 'IsApproved') required final int isApproved,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'DepartmentID') required final int departmentId,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$MeetingRoomSaveResponseImpl;

  factory _MeetingRoomSaveResponse.fromJson(Map<String, dynamic> json) =
      _$MeetingRoomSaveResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'MeetingRoomID')
  int get meetingRoomId;
  @override
  @JsonKey(name: 'DateRegister')
  DateTime get dateRegister;
  @override
  @JsonKey(name: 'EmployeeID')
  int get employeeId;
  @override
  @JsonKey(name: 'StartTime')
  DateTime get startTime;
  @override
  @JsonKey(name: 'EndTime')
  DateTime get endTime;
  @override
  @JsonKey(name: 'Content')
  String get content;
  @override
  @JsonKey(name: 'IsApproved')
  int get isApproved;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'DepartmentID')
  int get departmentId;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$MeetingRoomSaveResponseImplCopyWith<_$MeetingRoomSaveResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MeetingRoomData _$MeetingRoomDataFromJson(Map<String, dynamic> json) {
  return _MeetingRoomData.fromJson(json);
}

/// @nodoc
mixin _$MeetingRoomData {
  @JsonKey(name: 'room1')
  List<MeetingRoomItem> get room1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'room2')
  List<MeetingRoomItem> get room2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'room3')
  List<MeetingRoomItem> get room3 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeetingRoomDataCopyWith<MeetingRoomData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingRoomDataCopyWith<$Res> {
  factory $MeetingRoomDataCopyWith(
          MeetingRoomData value, $Res Function(MeetingRoomData) then) =
      _$MeetingRoomDataCopyWithImpl<$Res, MeetingRoomData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'room1') List<MeetingRoomItem> room1,
      @JsonKey(name: 'room2') List<MeetingRoomItem> room2,
      @JsonKey(name: 'room3') List<MeetingRoomItem> room3});
}

/// @nodoc
class _$MeetingRoomDataCopyWithImpl<$Res, $Val extends MeetingRoomData>
    implements $MeetingRoomDataCopyWith<$Res> {
  _$MeetingRoomDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room1 = null,
    Object? room2 = null,
    Object? room3 = null,
  }) {
    return _then(_value.copyWith(
      room1: null == room1
          ? _value.room1
          : room1 // ignore: cast_nullable_to_non_nullable
              as List<MeetingRoomItem>,
      room2: null == room2
          ? _value.room2
          : room2 // ignore: cast_nullable_to_non_nullable
              as List<MeetingRoomItem>,
      room3: null == room3
          ? _value.room3
          : room3 // ignore: cast_nullable_to_non_nullable
              as List<MeetingRoomItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeetingRoomDataImplCopyWith<$Res>
    implements $MeetingRoomDataCopyWith<$Res> {
  factory _$$MeetingRoomDataImplCopyWith(_$MeetingRoomDataImpl value,
          $Res Function(_$MeetingRoomDataImpl) then) =
      __$$MeetingRoomDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'room1') List<MeetingRoomItem> room1,
      @JsonKey(name: 'room2') List<MeetingRoomItem> room2,
      @JsonKey(name: 'room3') List<MeetingRoomItem> room3});
}

/// @nodoc
class __$$MeetingRoomDataImplCopyWithImpl<$Res>
    extends _$MeetingRoomDataCopyWithImpl<$Res, _$MeetingRoomDataImpl>
    implements _$$MeetingRoomDataImplCopyWith<$Res> {
  __$$MeetingRoomDataImplCopyWithImpl(
      _$MeetingRoomDataImpl _value, $Res Function(_$MeetingRoomDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room1 = null,
    Object? room2 = null,
    Object? room3 = null,
  }) {
    return _then(_$MeetingRoomDataImpl(
      room1: null == room1
          ? _value._room1
          : room1 // ignore: cast_nullable_to_non_nullable
              as List<MeetingRoomItem>,
      room2: null == room2
          ? _value._room2
          : room2 // ignore: cast_nullable_to_non_nullable
              as List<MeetingRoomItem>,
      room3: null == room3
          ? _value._room3
          : room3 // ignore: cast_nullable_to_non_nullable
              as List<MeetingRoomItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MeetingRoomDataImpl implements _MeetingRoomData {
  const _$MeetingRoomDataImpl(
      {@JsonKey(name: 'room1') required final List<MeetingRoomItem> room1,
      @JsonKey(name: 'room2') required final List<MeetingRoomItem> room2,
      @JsonKey(name: 'room3') required final List<MeetingRoomItem> room3})
      : _room1 = room1,
        _room2 = room2,
        _room3 = room3;

  factory _$MeetingRoomDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeetingRoomDataImplFromJson(json);

  final List<MeetingRoomItem> _room1;
  @override
  @JsonKey(name: 'room1')
  List<MeetingRoomItem> get room1 {
    if (_room1 is EqualUnmodifiableListView) return _room1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_room1);
  }

  final List<MeetingRoomItem> _room2;
  @override
  @JsonKey(name: 'room2')
  List<MeetingRoomItem> get room2 {
    if (_room2 is EqualUnmodifiableListView) return _room2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_room2);
  }

  final List<MeetingRoomItem> _room3;
  @override
  @JsonKey(name: 'room3')
  List<MeetingRoomItem> get room3 {
    if (_room3 is EqualUnmodifiableListView) return _room3;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_room3);
  }

  @override
  String toString() {
    return 'MeetingRoomData(room1: $room1, room2: $room2, room3: $room3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingRoomDataImpl &&
            const DeepCollectionEquality().equals(other._room1, _room1) &&
            const DeepCollectionEquality().equals(other._room2, _room2) &&
            const DeepCollectionEquality().equals(other._room3, _room3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_room1),
      const DeepCollectionEquality().hash(_room2),
      const DeepCollectionEquality().hash(_room3));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingRoomDataImplCopyWith<_$MeetingRoomDataImpl> get copyWith =>
      __$$MeetingRoomDataImplCopyWithImpl<_$MeetingRoomDataImpl>(
          this, _$identity);
}

abstract class _MeetingRoomData implements MeetingRoomData {
  const factory _MeetingRoomData(
          {@JsonKey(name: 'room1') required final List<MeetingRoomItem> room1,
          @JsonKey(name: 'room2') required final List<MeetingRoomItem> room2,
          @JsonKey(name: 'room3') required final List<MeetingRoomItem> room3}) =
      _$MeetingRoomDataImpl;

  factory _MeetingRoomData.fromJson(Map<String, dynamic> json) =
      _$MeetingRoomDataImpl.fromJson;

  @override
  @JsonKey(name: 'room1')
  List<MeetingRoomItem> get room1;
  @override
  @JsonKey(name: 'room2')
  List<MeetingRoomItem> get room2;
  @override
  @JsonKey(name: 'room3')
  List<MeetingRoomItem> get room3;
  @override
  @JsonKey(ignore: true)
  _$$MeetingRoomDataImplCopyWith<_$MeetingRoomDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MeetingRoomItem {
  @JsonKey(name: 'AllDate')
  DateTime get allDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DayOfWeek')
  String get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'MeetingRoomID')
  int? get meetingRoomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister => throw _privateConstructorUsedError;
  Map<String, dynamic> get timeSlots => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeetingRoomItemCopyWith<MeetingRoomItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingRoomItemCopyWith<$Res> {
  factory $MeetingRoomItemCopyWith(
          MeetingRoomItem value, $Res Function(MeetingRoomItem) then) =
      _$MeetingRoomItemCopyWithImpl<$Res, MeetingRoomItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AllDate') DateTime allDate,
      @JsonKey(name: 'DayOfWeek') String dayOfWeek,
      @JsonKey(name: 'MeetingRoomID') int? meetingRoomId,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      Map<String, dynamic> timeSlots});
}

/// @nodoc
class _$MeetingRoomItemCopyWithImpl<$Res, $Val extends MeetingRoomItem>
    implements $MeetingRoomItemCopyWith<$Res> {
  _$MeetingRoomItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allDate = null,
    Object? dayOfWeek = null,
    Object? meetingRoomId = freezed,
    Object? dateRegister = freezed,
    Object? timeSlots = null,
  }) {
    return _then(_value.copyWith(
      allDate: null == allDate
          ? _value.allDate
          : allDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      meetingRoomId: freezed == meetingRoomId
          ? _value.meetingRoomId
          : meetingRoomId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeSlots: null == timeSlots
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeetingRoomItemImplCopyWith<$Res>
    implements $MeetingRoomItemCopyWith<$Res> {
  factory _$$MeetingRoomItemImplCopyWith(_$MeetingRoomItemImpl value,
          $Res Function(_$MeetingRoomItemImpl) then) =
      __$$MeetingRoomItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AllDate') DateTime allDate,
      @JsonKey(name: 'DayOfWeek') String dayOfWeek,
      @JsonKey(name: 'MeetingRoomID') int? meetingRoomId,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      Map<String, dynamic> timeSlots});
}

/// @nodoc
class __$$MeetingRoomItemImplCopyWithImpl<$Res>
    extends _$MeetingRoomItemCopyWithImpl<$Res, _$MeetingRoomItemImpl>
    implements _$$MeetingRoomItemImplCopyWith<$Res> {
  __$$MeetingRoomItemImplCopyWithImpl(
      _$MeetingRoomItemImpl _value, $Res Function(_$MeetingRoomItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allDate = null,
    Object? dayOfWeek = null,
    Object? meetingRoomId = freezed,
    Object? dateRegister = freezed,
    Object? timeSlots = null,
  }) {
    return _then(_$MeetingRoomItemImpl(
      allDate: null == allDate
          ? _value.allDate
          : allDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      meetingRoomId: freezed == meetingRoomId
          ? _value.meetingRoomId
          : meetingRoomId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeSlots: null == timeSlots
          ? _value._timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$MeetingRoomItemImpl implements _MeetingRoomItem {
  const _$MeetingRoomItemImpl(
      {@JsonKey(name: 'AllDate') required this.allDate,
      @JsonKey(name: 'DayOfWeek') required this.dayOfWeek,
      @JsonKey(name: 'MeetingRoomID') this.meetingRoomId,
      @JsonKey(name: 'DateRegister') this.dateRegister,
      final Map<String, dynamic> timeSlots = const {}})
      : _timeSlots = timeSlots;

  @override
  @JsonKey(name: 'AllDate')
  final DateTime allDate;
  @override
  @JsonKey(name: 'DayOfWeek')
  final String dayOfWeek;
  @override
  @JsonKey(name: 'MeetingRoomID')
  final int? meetingRoomId;
  @override
  @JsonKey(name: 'DateRegister')
  final DateTime? dateRegister;
  final Map<String, dynamic> _timeSlots;
  @override
  @JsonKey()
  Map<String, dynamic> get timeSlots {
    if (_timeSlots is EqualUnmodifiableMapView) return _timeSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_timeSlots);
  }

  @override
  String toString() {
    return 'MeetingRoomItem(allDate: $allDate, dayOfWeek: $dayOfWeek, meetingRoomId: $meetingRoomId, dateRegister: $dateRegister, timeSlots: $timeSlots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingRoomItemImpl &&
            (identical(other.allDate, allDate) || other.allDate == allDate) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.meetingRoomId, meetingRoomId) ||
                other.meetingRoomId == meetingRoomId) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            const DeepCollectionEquality()
                .equals(other._timeSlots, _timeSlots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      allDate,
      dayOfWeek,
      meetingRoomId,
      dateRegister,
      const DeepCollectionEquality().hash(_timeSlots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingRoomItemImplCopyWith<_$MeetingRoomItemImpl> get copyWith =>
      __$$MeetingRoomItemImplCopyWithImpl<_$MeetingRoomItemImpl>(
          this, _$identity);
}

abstract class _MeetingRoomItem implements MeetingRoomItem {
  const factory _MeetingRoomItem(
      {@JsonKey(name: 'AllDate') required final DateTime allDate,
      @JsonKey(name: 'DayOfWeek') required final String dayOfWeek,
      @JsonKey(name: 'MeetingRoomID') final int? meetingRoomId,
      @JsonKey(name: 'DateRegister') final DateTime? dateRegister,
      final Map<String, dynamic> timeSlots}) = _$MeetingRoomItemImpl;

  @override
  @JsonKey(name: 'AllDate')
  DateTime get allDate;
  @override
  @JsonKey(name: 'DayOfWeek')
  String get dayOfWeek;
  @override
  @JsonKey(name: 'MeetingRoomID')
  int? get meetingRoomId;
  @override
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister;
  @override
  Map<String, dynamic> get timeSlots;
  @override
  @JsonKey(ignore: true)
  _$$MeetingRoomItemImplCopyWith<_$MeetingRoomItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
