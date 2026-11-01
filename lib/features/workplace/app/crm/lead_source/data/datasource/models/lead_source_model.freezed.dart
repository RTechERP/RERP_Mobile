// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeadSourceItem _$LeadSourceItemFromJson(Map<String, dynamic> json) {
  return _LeadSourceItem.fromJson(json);
}

/// @nodoc
mixin _$LeadSourceItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'SourceGroup')
  int get sourceGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeadSourceItemCopyWith<LeadSourceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSourceItemCopyWith<$Res> {
  factory $LeadSourceItemCopyWith(
          LeadSourceItem value, $Res Function(LeadSourceItem) then) =
      _$LeadSourceItemCopyWithImpl<$Res, LeadSourceItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'SourceGroup') int sourceGroup,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$LeadSourceItemCopyWithImpl<$Res, $Val extends LeadSourceItem>
    implements $LeadSourceItemCopyWith<$Res> {
  _$LeadSourceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? sourceGroup = null,
    Object? stt = freezed,
    Object? note = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sourceGroup: null == sourceGroup
          ? _value.sourceGroup
          : sourceGroup // ignore: cast_nullable_to_non_nullable
              as int,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadSourceItemImplCopyWith<$Res>
    implements $LeadSourceItemCopyWith<$Res> {
  factory _$$LeadSourceItemImplCopyWith(_$LeadSourceItemImpl value,
          $Res Function(_$LeadSourceItemImpl) then) =
      __$$LeadSourceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'SourceGroup') int sourceGroup,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$LeadSourceItemImplCopyWithImpl<$Res>
    extends _$LeadSourceItemCopyWithImpl<$Res, _$LeadSourceItemImpl>
    implements _$$LeadSourceItemImplCopyWith<$Res> {
  __$$LeadSourceItemImplCopyWithImpl(
      _$LeadSourceItemImpl _value, $Res Function(_$LeadSourceItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? sourceGroup = null,
    Object? stt = freezed,
    Object? note = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$LeadSourceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sourceGroup: null == sourceGroup
          ? _value.sourceGroup
          : sourceGroup // ignore: cast_nullable_to_non_nullable
              as int,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSourceItemImpl implements _LeadSourceItem {
  const _$LeadSourceItemImpl(
      {@JsonKey(name: 'ID') this.id = 0,
      @JsonKey(name: 'Code') this.code = '',
      @JsonKey(name: 'Name') this.name = '',
      @JsonKey(name: 'SourceGroup') this.sourceGroup = 0,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$LeadSourceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSourceItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String code;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'SourceGroup')
  final int sourceGroup;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'LeadSourceItem(id: $id, code: $code, name: $name, sourceGroup: $sourceGroup, stt: $stt, note: $note, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSourceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sourceGroup, sourceGroup) ||
                other.sourceGroup == sourceGroup) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, name, sourceGroup, stt, note, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSourceItemImplCopyWith<_$LeadSourceItemImpl> get copyWith =>
      __$$LeadSourceItemImplCopyWithImpl<_$LeadSourceItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSourceItemImplToJson(
      this,
    );
  }
}

abstract class _LeadSourceItem implements LeadSourceItem {
  const factory _LeadSourceItem(
          {@JsonKey(name: 'ID') final int id,
          @JsonKey(name: 'Code') final String code,
          @JsonKey(name: 'Name') final String name,
          @JsonKey(name: 'SourceGroup') final int sourceGroup,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$LeadSourceItemImpl;

  factory _LeadSourceItem.fromJson(Map<String, dynamic> json) =
      _$LeadSourceItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String get code;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'SourceGroup')
  int get sourceGroup;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$LeadSourceItemImplCopyWith<_$LeadSourceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
