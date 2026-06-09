// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollItem _$PollItemFromJson(Map<String, dynamic> json) {
  return _PollItem.fromJson(json);
}

/// @nodoc
mixin _$PollItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPublic')
  bool? get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'BackgroundImagePath')
  String? get backgroundImagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'TitleColor')
  String? get titleColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNotifycation')
  bool? get isNotifycation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollItemCopyWith<PollItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollItemCopyWith<$Res> {
  factory $PollItemCopyWith(PollItem value, $Res Function(PollItem) then) =
      _$PollItemCopyWithImpl<$Res, PollItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsPublic') bool? isPublic,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'BackgroundImagePath') String? backgroundImagePath,
      @JsonKey(name: 'TitleColor') String? titleColor,
      @JsonKey(name: 'IsNotifycation') bool? isNotifycation});
}

/// @nodoc
class _$PollItemCopyWithImpl<$Res, $Val extends PollItem>
    implements $PollItemCopyWith<$Res> {
  _$PollItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isPublic = freezed,
    Object? isDeleted = freezed,
    Object? backgroundImagePath = freezed,
    Object? titleColor = freezed,
    Object? isNotifycation = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      backgroundImagePath: freezed == backgroundImagePath
          ? _value.backgroundImagePath
          : backgroundImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      titleColor: freezed == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isNotifycation: freezed == isNotifycation
          ? _value.isNotifycation
          : isNotifycation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollItemImplCopyWith<$Res>
    implements $PollItemCopyWith<$Res> {
  factory _$$PollItemImplCopyWith(
          _$PollItemImpl value, $Res Function(_$PollItemImpl) then) =
      __$$PollItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsPublic') bool? isPublic,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'BackgroundImagePath') String? backgroundImagePath,
      @JsonKey(name: 'TitleColor') String? titleColor,
      @JsonKey(name: 'IsNotifycation') bool? isNotifycation});
}

/// @nodoc
class __$$PollItemImplCopyWithImpl<$Res>
    extends _$PollItemCopyWithImpl<$Res, _$PollItemImpl>
    implements _$$PollItemImplCopyWith<$Res> {
  __$$PollItemImplCopyWithImpl(
      _$PollItemImpl _value, $Res Function(_$PollItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isPublic = freezed,
    Object? isDeleted = freezed,
    Object? backgroundImagePath = freezed,
    Object? titleColor = freezed,
    Object? isNotifycation = freezed,
  }) {
    return _then(_$PollItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      backgroundImagePath: freezed == backgroundImagePath
          ? _value.backgroundImagePath
          : backgroundImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      titleColor: freezed == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isNotifycation: freezed == isNotifycation
          ? _value.isNotifycation
          : isNotifycation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollItemImpl implements _PollItem {
  const _$PollItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsPublic') this.isPublic,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'BackgroundImagePath') this.backgroundImagePath,
      @JsonKey(name: 'TitleColor') this.titleColor,
      @JsonKey(name: 'IsNotifycation') this.isNotifycation});

  factory _$PollItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
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
  @JsonKey(name: 'IsPublic')
  final bool? isPublic;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'BackgroundImagePath')
  final String? backgroundImagePath;
  @override
  @JsonKey(name: 'TitleColor')
  final String? titleColor;
  @override
  @JsonKey(name: 'IsNotifycation')
  final bool? isNotifycation;

  @override
  String toString() {
    return 'PollItem(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isPublic: $isPublic, isDeleted: $isDeleted, backgroundImagePath: $backgroundImagePath, titleColor: $titleColor, isNotifycation: $isNotifycation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.backgroundImagePath, backgroundImagePath) ||
                other.backgroundImagePath == backgroundImagePath) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.isNotifycation, isNotifycation) ||
                other.isNotifycation == isNotifycation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      startDate,
      endDate,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      isPublic,
      isDeleted,
      backgroundImagePath,
      titleColor,
      isNotifycation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollItemImplCopyWith<_$PollItemImpl> get copyWith =>
      __$$PollItemImplCopyWithImpl<_$PollItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollItemImplToJson(
      this,
    );
  }
}

abstract class _PollItem implements PollItem {
  const factory _PollItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Title') final String? title,
      @JsonKey(name: 'Description') final String? description,
      @JsonKey(name: 'StartDate') final DateTime? startDate,
      @JsonKey(name: 'EndDate') final DateTime? endDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'IsPublic') final bool? isPublic,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'BackgroundImagePath') final String? backgroundImagePath,
      @JsonKey(name: 'TitleColor') final String? titleColor,
      @JsonKey(name: 'IsNotifycation')
      final bool? isNotifycation}) = _$PollItemImpl;

  factory _PollItem.fromJson(Map<String, dynamic> json) =
      _$PollItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Title')
  String? get title;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
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
  @JsonKey(name: 'IsPublic')
  bool? get isPublic;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'BackgroundImagePath')
  String? get backgroundImagePath;
  @override
  @JsonKey(name: 'TitleColor')
  String? get titleColor;
  @override
  @JsonKey(name: 'IsNotifycation')
  bool? get isNotifycation;
  @override
  @JsonKey(ignore: true)
  _$$PollItemImplCopyWith<_$PollItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PollDetailItem _$PollDetailItemFromJson(Map<String, dynamic> json) {
  return _PollDetailItem.fromJson(json);
}

/// @nodoc
mixin _$PollDetailItem {
  @JsonKey(name: 'Questions')
  List<PollQuestionItem>? get questions => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sections')
  List<PollSectionItem>? get sections => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'TitleColor')
  String? get titleColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'BackgroundImagePath')
  String? get backgroundImagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPublic')
  bool? get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNotifycation')
  bool? get isNotifycation => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollDetailItemCopyWith<PollDetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollDetailItemCopyWith<$Res> {
  factory $PollDetailItemCopyWith(
          PollDetailItem value, $Res Function(PollDetailItem) then) =
      _$PollDetailItemCopyWithImpl<$Res, PollDetailItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Questions') List<PollQuestionItem>? questions,
      @JsonKey(name: 'Sections') List<PollSectionItem>? sections,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'TitleColor') String? titleColor,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'BackgroundImagePath') String? backgroundImagePath,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'IsPublic') bool? isPublic,
      @JsonKey(name: 'IsNotifycation') bool? isNotifycation,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate});
}

/// @nodoc
class _$PollDetailItemCopyWithImpl<$Res, $Val extends PollDetailItem>
    implements $PollDetailItemCopyWith<$Res> {
  _$PollDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = freezed,
    Object? sections = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? titleColor = freezed,
    Object? description = freezed,
    Object? backgroundImagePath = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isPublic = freezed,
    Object? isNotifycation = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<PollQuestionItem>?,
      sections: freezed == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<PollSectionItem>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      titleColor: freezed == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImagePath: freezed == backgroundImagePath
          ? _value.backgroundImagePath
          : backgroundImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNotifycation: freezed == isNotifycation
          ? _value.isNotifycation
          : isNotifycation // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollDetailItemImplCopyWith<$Res>
    implements $PollDetailItemCopyWith<$Res> {
  factory _$$PollDetailItemImplCopyWith(_$PollDetailItemImpl value,
          $Res Function(_$PollDetailItemImpl) then) =
      __$$PollDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Questions') List<PollQuestionItem>? questions,
      @JsonKey(name: 'Sections') List<PollSectionItem>? sections,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'TitleColor') String? titleColor,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'BackgroundImagePath') String? backgroundImagePath,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'IsPublic') bool? isPublic,
      @JsonKey(name: 'IsNotifycation') bool? isNotifycation,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate});
}

/// @nodoc
class __$$PollDetailItemImplCopyWithImpl<$Res>
    extends _$PollDetailItemCopyWithImpl<$Res, _$PollDetailItemImpl>
    implements _$$PollDetailItemImplCopyWith<$Res> {
  __$$PollDetailItemImplCopyWithImpl(
      _$PollDetailItemImpl _value, $Res Function(_$PollDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = freezed,
    Object? sections = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? titleColor = freezed,
    Object? description = freezed,
    Object? backgroundImagePath = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isPublic = freezed,
    Object? isNotifycation = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_$PollDetailItemImpl(
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<PollQuestionItem>?,
      sections: freezed == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<PollSectionItem>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      titleColor: freezed == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImagePath: freezed == backgroundImagePath
          ? _value.backgroundImagePath
          : backgroundImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNotifycation: freezed == isNotifycation
          ? _value.isNotifycation
          : isNotifycation // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollDetailItemImpl implements _PollDetailItem {
  const _$PollDetailItemImpl(
      {@JsonKey(name: 'Questions') final List<PollQuestionItem>? questions,
      @JsonKey(name: 'Sections') final List<PollSectionItem>? sections,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'TitleColor') this.titleColor,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'BackgroundImagePath') this.backgroundImagePath,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'IsPublic') this.isPublic,
      @JsonKey(name: 'IsNotifycation') this.isNotifycation,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate})
      : _questions = questions,
        _sections = sections;

  factory _$PollDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollDetailItemImplFromJson(json);

  final List<PollQuestionItem>? _questions;
  @override
  @JsonKey(name: 'Questions')
  List<PollQuestionItem>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PollSectionItem>? _sections;
  @override
  @JsonKey(name: 'Sections')
  List<PollSectionItem>? get sections {
    final value = _sections;
    if (value == null) return null;
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'TitleColor')
  final String? titleColor;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'BackgroundImagePath')
  final String? backgroundImagePath;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'IsPublic')
  final bool? isPublic;
  @override
  @JsonKey(name: 'IsNotifycation')
  final bool? isNotifycation;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
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
  String toString() {
    return 'PollDetailItem(questions: $questions, sections: $sections, id: $id, title: $title, titleColor: $titleColor, description: $description, backgroundImagePath: $backgroundImagePath, startDate: $startDate, endDate: $endDate, isPublic: $isPublic, isNotifycation: $isNotifycation, isDeleted: $isDeleted, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollDetailItemImpl &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.backgroundImagePath, backgroundImagePath) ||
                other.backgroundImagePath == backgroundImagePath) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.isNotifycation, isNotifycation) ||
                other.isNotifycation == isNotifycation) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_sections),
      id,
      title,
      titleColor,
      description,
      backgroundImagePath,
      startDate,
      endDate,
      isPublic,
      isNotifycation,
      isDeleted,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollDetailItemImplCopyWith<_$PollDetailItemImpl> get copyWith =>
      __$$PollDetailItemImplCopyWithImpl<_$PollDetailItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollDetailItemImplToJson(
      this,
    );
  }
}

abstract class _PollDetailItem implements PollDetailItem {
  const factory _PollDetailItem(
      {@JsonKey(name: 'Questions') final List<PollQuestionItem>? questions,
      @JsonKey(name: 'Sections') final List<PollSectionItem>? sections,
      @JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Title') final String? title,
      @JsonKey(name: 'TitleColor') final String? titleColor,
      @JsonKey(name: 'Description') final String? description,
      @JsonKey(name: 'BackgroundImagePath') final String? backgroundImagePath,
      @JsonKey(name: 'StartDate') final DateTime? startDate,
      @JsonKey(name: 'EndDate') final DateTime? endDate,
      @JsonKey(name: 'IsPublic') final bool? isPublic,
      @JsonKey(name: 'IsNotifycation') final bool? isNotifycation,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate')
      final DateTime? updatedDate}) = _$PollDetailItemImpl;

  factory _PollDetailItem.fromJson(Map<String, dynamic> json) =
      _$PollDetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'Questions')
  List<PollQuestionItem>? get questions;
  @override
  @JsonKey(name: 'Sections')
  List<PollSectionItem>? get sections;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Title')
  String? get title;
  @override
  @JsonKey(name: 'TitleColor')
  String? get titleColor;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'BackgroundImagePath')
  String? get backgroundImagePath;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'IsPublic')
  bool? get isPublic;
  @override
  @JsonKey(name: 'IsNotifycation')
  bool? get isNotifycation;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
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
  @JsonKey(ignore: true)
  _$$PollDetailItemImplCopyWith<_$PollDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PollSectionItem _$PollSectionItemFromJson(Map<String, dynamic> json) {
  return _PollSectionItem.fromJson(json);
}

/// @nodoc
mixin _$PollSectionItem {
  @JsonKey(name: 'Questions')
  List<PollQuestionItem>? get questions => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'PollFormID')
  int? get pollFormId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'SortOrder')
  int? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShowIfJson')
  String? get showIfJson => throw _privateConstructorUsedError;
  @JsonKey(name: 'BranchingRulesJson')
  String? get branchingRulesJson => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollSectionItemCopyWith<PollSectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollSectionItemCopyWith<$Res> {
  factory $PollSectionItemCopyWith(
          PollSectionItem value, $Res Function(PollSectionItem) then) =
      _$PollSectionItemCopyWithImpl<$Res, PollSectionItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Questions') List<PollQuestionItem>? questions,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'PollFormID') int? pollFormId,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'SortOrder') int? sortOrder,
      @JsonKey(name: 'ShowIfJson') String? showIfJson,
      @JsonKey(name: 'BranchingRulesJson') String? branchingRulesJson,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate});
}

/// @nodoc
class _$PollSectionItemCopyWithImpl<$Res, $Val extends PollSectionItem>
    implements $PollSectionItemCopyWith<$Res> {
  _$PollSectionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = freezed,
    Object? id = freezed,
    Object? pollFormId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? sortOrder = freezed,
    Object? showIfJson = freezed,
    Object? branchingRulesJson = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<PollQuestionItem>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pollFormId: freezed == pollFormId
          ? _value.pollFormId
          : pollFormId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      showIfJson: freezed == showIfJson
          ? _value.showIfJson
          : showIfJson // ignore: cast_nullable_to_non_nullable
              as String?,
      branchingRulesJson: freezed == branchingRulesJson
          ? _value.branchingRulesJson
          : branchingRulesJson // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollSectionItemImplCopyWith<$Res>
    implements $PollSectionItemCopyWith<$Res> {
  factory _$$PollSectionItemImplCopyWith(_$PollSectionItemImpl value,
          $Res Function(_$PollSectionItemImpl) then) =
      __$$PollSectionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Questions') List<PollQuestionItem>? questions,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'PollFormID') int? pollFormId,
      @JsonKey(name: 'Title') String? title,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'SortOrder') int? sortOrder,
      @JsonKey(name: 'ShowIfJson') String? showIfJson,
      @JsonKey(name: 'BranchingRulesJson') String? branchingRulesJson,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate});
}

/// @nodoc
class __$$PollSectionItemImplCopyWithImpl<$Res>
    extends _$PollSectionItemCopyWithImpl<$Res, _$PollSectionItemImpl>
    implements _$$PollSectionItemImplCopyWith<$Res> {
  __$$PollSectionItemImplCopyWithImpl(
      _$PollSectionItemImpl _value, $Res Function(_$PollSectionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = freezed,
    Object? id = freezed,
    Object? pollFormId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? sortOrder = freezed,
    Object? showIfJson = freezed,
    Object? branchingRulesJson = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_$PollSectionItemImpl(
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<PollQuestionItem>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pollFormId: freezed == pollFormId
          ? _value.pollFormId
          : pollFormId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      showIfJson: freezed == showIfJson
          ? _value.showIfJson
          : showIfJson // ignore: cast_nullable_to_non_nullable
              as String?,
      branchingRulesJson: freezed == branchingRulesJson
          ? _value.branchingRulesJson
          : branchingRulesJson // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollSectionItemImpl implements _PollSectionItem {
  const _$PollSectionItemImpl(
      {@JsonKey(name: 'Questions') final List<PollQuestionItem>? questions,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'PollFormID') this.pollFormId,
      @JsonKey(name: 'Title') this.title,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'SortOrder') this.sortOrder,
      @JsonKey(name: 'ShowIfJson') this.showIfJson,
      @JsonKey(name: 'BranchingRulesJson') this.branchingRulesJson,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate})
      : _questions = questions;

  factory _$PollSectionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollSectionItemImplFromJson(json);

  final List<PollQuestionItem>? _questions;
  @override
  @JsonKey(name: 'Questions')
  List<PollQuestionItem>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'PollFormID')
  final int? pollFormId;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'SortOrder')
  final int? sortOrder;
  @override
  @JsonKey(name: 'ShowIfJson')
  final String? showIfJson;
  @override
  @JsonKey(name: 'BranchingRulesJson')
  final String? branchingRulesJson;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
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
  String toString() {
    return 'PollSectionItem(questions: $questions, id: $id, pollFormId: $pollFormId, title: $title, description: $description, sortOrder: $sortOrder, showIfJson: $showIfJson, branchingRulesJson: $branchingRulesJson, isDeleted: $isDeleted, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollSectionItemImpl &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pollFormId, pollFormId) ||
                other.pollFormId == pollFormId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.showIfJson, showIfJson) ||
                other.showIfJson == showIfJson) &&
            (identical(other.branchingRulesJson, branchingRulesJson) ||
                other.branchingRulesJson == branchingRulesJson) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      id,
      pollFormId,
      title,
      description,
      sortOrder,
      showIfJson,
      branchingRulesJson,
      isDeleted,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollSectionItemImplCopyWith<_$PollSectionItemImpl> get copyWith =>
      __$$PollSectionItemImplCopyWithImpl<_$PollSectionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollSectionItemImplToJson(
      this,
    );
  }
}

abstract class _PollSectionItem implements PollSectionItem {
  const factory _PollSectionItem(
          {@JsonKey(name: 'Questions') final List<PollQuestionItem>? questions,
          @JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'PollFormID') final int? pollFormId,
          @JsonKey(name: 'Title') final String? title,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'SortOrder') final int? sortOrder,
          @JsonKey(name: 'ShowIfJson') final String? showIfJson,
          @JsonKey(name: 'BranchingRulesJson') final String? branchingRulesJson,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate}) =
      _$PollSectionItemImpl;

  factory _PollSectionItem.fromJson(Map<String, dynamic> json) =
      _$PollSectionItemImpl.fromJson;

  @override
  @JsonKey(name: 'Questions')
  List<PollQuestionItem>? get questions;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'PollFormID')
  int? get pollFormId;
  @override
  @JsonKey(name: 'Title')
  String? get title;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'SortOrder')
  int? get sortOrder;
  @override
  @JsonKey(name: 'ShowIfJson')
  String? get showIfJson;
  @override
  @JsonKey(name: 'BranchingRulesJson')
  String? get branchingRulesJson;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
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
  @JsonKey(ignore: true)
  _$$PollSectionItemImplCopyWith<_$PollSectionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PollQuestionItem _$PollQuestionItemFromJson(Map<String, dynamic> json) {
  return _PollQuestionItem.fromJson(json);
}

/// @nodoc
mixin _$PollQuestionItem {
  @JsonKey(name: 'DataSourceLabel')
  String? get dataSourceLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataSourceValue')
  String? get dataSourceValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataSourceDisplayValue')
  String? get dataSourceDisplayValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsAutoFilled')
  bool? get isAutoFilled => throw _privateConstructorUsedError;
  @JsonKey(name: 'Options')
  List<PollOptionItem>? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'PollFormID')
  int? get pollFormId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SectionID')
  int? get sectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'QuestionText')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'FieldKey')
  String? get fieldKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'QuestionType')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRequired')
  bool? get isRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'SortOrder')
  int? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConfigJson')
  String? get configJson => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataSourceType')
  String? get dataSourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataSourceField')
  String? get dataSourceField => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollQuestionItemCopyWith<PollQuestionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollQuestionItemCopyWith<$Res> {
  factory $PollQuestionItemCopyWith(
          PollQuestionItem value, $Res Function(PollQuestionItem) then) =
      _$PollQuestionItemCopyWithImpl<$Res, PollQuestionItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DataSourceLabel') String? dataSourceLabel,
      @JsonKey(name: 'DataSourceValue') String? dataSourceValue,
      @JsonKey(name: 'DataSourceDisplayValue') String? dataSourceDisplayValue,
      @JsonKey(name: 'IsAutoFilled') bool? isAutoFilled,
      @JsonKey(name: 'Options') List<PollOptionItem>? options,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'PollFormID') int? pollFormId,
      @JsonKey(name: 'SectionID') int? sectionId,
      @JsonKey(name: 'QuestionText') String? questionText,
      @JsonKey(name: 'FieldKey') String? fieldKey,
      @JsonKey(name: 'QuestionType') String? questionType,
      @JsonKey(name: 'IsRequired') bool? isRequired,
      @JsonKey(name: 'SortOrder') int? sortOrder,
      @JsonKey(name: 'ConfigJson') String? configJson,
      @JsonKey(name: 'DataSourceType') String? dataSourceType,
      @JsonKey(name: 'DataSourceField') String? dataSourceField});
}

/// @nodoc
class _$PollQuestionItemCopyWithImpl<$Res, $Val extends PollQuestionItem>
    implements $PollQuestionItemCopyWith<$Res> {
  _$PollQuestionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataSourceLabel = freezed,
    Object? dataSourceValue = freezed,
    Object? dataSourceDisplayValue = freezed,
    Object? isAutoFilled = freezed,
    Object? options = freezed,
    Object? id = freezed,
    Object? pollFormId = freezed,
    Object? sectionId = freezed,
    Object? questionText = freezed,
    Object? fieldKey = freezed,
    Object? questionType = freezed,
    Object? isRequired = freezed,
    Object? sortOrder = freezed,
    Object? configJson = freezed,
    Object? dataSourceType = freezed,
    Object? dataSourceField = freezed,
  }) {
    return _then(_value.copyWith(
      dataSourceLabel: freezed == dataSourceLabel
          ? _value.dataSourceLabel
          : dataSourceLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceValue: freezed == dataSourceValue
          ? _value.dataSourceValue
          : dataSourceValue // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceDisplayValue: freezed == dataSourceDisplayValue
          ? _value.dataSourceDisplayValue
          : dataSourceDisplayValue // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutoFilled: freezed == isAutoFilled
          ? _value.isAutoFilled
          : isAutoFilled // ignore: cast_nullable_to_non_nullable
              as bool?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PollOptionItem>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pollFormId: freezed == pollFormId
          ? _value.pollFormId
          : pollFormId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldKey: freezed == fieldKey
          ? _value.fieldKey
          : fieldKey // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      configJson: freezed == configJson
          ? _value.configJson
          : configJson // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceType: freezed == dataSourceType
          ? _value.dataSourceType
          : dataSourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceField: freezed == dataSourceField
          ? _value.dataSourceField
          : dataSourceField // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollQuestionItemImplCopyWith<$Res>
    implements $PollQuestionItemCopyWith<$Res> {
  factory _$$PollQuestionItemImplCopyWith(_$PollQuestionItemImpl value,
          $Res Function(_$PollQuestionItemImpl) then) =
      __$$PollQuestionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DataSourceLabel') String? dataSourceLabel,
      @JsonKey(name: 'DataSourceValue') String? dataSourceValue,
      @JsonKey(name: 'DataSourceDisplayValue') String? dataSourceDisplayValue,
      @JsonKey(name: 'IsAutoFilled') bool? isAutoFilled,
      @JsonKey(name: 'Options') List<PollOptionItem>? options,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'PollFormID') int? pollFormId,
      @JsonKey(name: 'SectionID') int? sectionId,
      @JsonKey(name: 'QuestionText') String? questionText,
      @JsonKey(name: 'FieldKey') String? fieldKey,
      @JsonKey(name: 'QuestionType') String? questionType,
      @JsonKey(name: 'IsRequired') bool? isRequired,
      @JsonKey(name: 'SortOrder') int? sortOrder,
      @JsonKey(name: 'ConfigJson') String? configJson,
      @JsonKey(name: 'DataSourceType') String? dataSourceType,
      @JsonKey(name: 'DataSourceField') String? dataSourceField});
}

/// @nodoc
class __$$PollQuestionItemImplCopyWithImpl<$Res>
    extends _$PollQuestionItemCopyWithImpl<$Res, _$PollQuestionItemImpl>
    implements _$$PollQuestionItemImplCopyWith<$Res> {
  __$$PollQuestionItemImplCopyWithImpl(_$PollQuestionItemImpl _value,
      $Res Function(_$PollQuestionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataSourceLabel = freezed,
    Object? dataSourceValue = freezed,
    Object? dataSourceDisplayValue = freezed,
    Object? isAutoFilled = freezed,
    Object? options = freezed,
    Object? id = freezed,
    Object? pollFormId = freezed,
    Object? sectionId = freezed,
    Object? questionText = freezed,
    Object? fieldKey = freezed,
    Object? questionType = freezed,
    Object? isRequired = freezed,
    Object? sortOrder = freezed,
    Object? configJson = freezed,
    Object? dataSourceType = freezed,
    Object? dataSourceField = freezed,
  }) {
    return _then(_$PollQuestionItemImpl(
      dataSourceLabel: freezed == dataSourceLabel
          ? _value.dataSourceLabel
          : dataSourceLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceValue: freezed == dataSourceValue
          ? _value.dataSourceValue
          : dataSourceValue // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceDisplayValue: freezed == dataSourceDisplayValue
          ? _value.dataSourceDisplayValue
          : dataSourceDisplayValue // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutoFilled: freezed == isAutoFilled
          ? _value.isAutoFilled
          : isAutoFilled // ignore: cast_nullable_to_non_nullable
              as bool?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PollOptionItem>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pollFormId: freezed == pollFormId
          ? _value.pollFormId
          : pollFormId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldKey: freezed == fieldKey
          ? _value.fieldKey
          : fieldKey // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      configJson: freezed == configJson
          ? _value.configJson
          : configJson // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceType: freezed == dataSourceType
          ? _value.dataSourceType
          : dataSourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSourceField: freezed == dataSourceField
          ? _value.dataSourceField
          : dataSourceField // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollQuestionItemImpl implements _PollQuestionItem {
  const _$PollQuestionItemImpl(
      {@JsonKey(name: 'DataSourceLabel') this.dataSourceLabel,
      @JsonKey(name: 'DataSourceValue') this.dataSourceValue,
      @JsonKey(name: 'DataSourceDisplayValue') this.dataSourceDisplayValue,
      @JsonKey(name: 'IsAutoFilled') this.isAutoFilled,
      @JsonKey(name: 'Options') final List<PollOptionItem>? options,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'PollFormID') this.pollFormId,
      @JsonKey(name: 'SectionID') this.sectionId,
      @JsonKey(name: 'QuestionText') this.questionText,
      @JsonKey(name: 'FieldKey') this.fieldKey,
      @JsonKey(name: 'QuestionType') this.questionType,
      @JsonKey(name: 'IsRequired') this.isRequired,
      @JsonKey(name: 'SortOrder') this.sortOrder,
      @JsonKey(name: 'ConfigJson') this.configJson,
      @JsonKey(name: 'DataSourceType') this.dataSourceType,
      @JsonKey(name: 'DataSourceField') this.dataSourceField})
      : _options = options;

  factory _$PollQuestionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollQuestionItemImplFromJson(json);

  @override
  @JsonKey(name: 'DataSourceLabel')
  final String? dataSourceLabel;
  @override
  @JsonKey(name: 'DataSourceValue')
  final String? dataSourceValue;
  @override
  @JsonKey(name: 'DataSourceDisplayValue')
  final String? dataSourceDisplayValue;
  @override
  @JsonKey(name: 'IsAutoFilled')
  final bool? isAutoFilled;
  final List<PollOptionItem>? _options;
  @override
  @JsonKey(name: 'Options')
  List<PollOptionItem>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'PollFormID')
  final int? pollFormId;
  @override
  @JsonKey(name: 'SectionID')
  final int? sectionId;
  @override
  @JsonKey(name: 'QuestionText')
  final String? questionText;
  @override
  @JsonKey(name: 'FieldKey')
  final String? fieldKey;
  @override
  @JsonKey(name: 'QuestionType')
  final String? questionType;
  @override
  @JsonKey(name: 'IsRequired')
  final bool? isRequired;
  @override
  @JsonKey(name: 'SortOrder')
  final int? sortOrder;
  @override
  @JsonKey(name: 'ConfigJson')
  final String? configJson;
  @override
  @JsonKey(name: 'DataSourceType')
  final String? dataSourceType;
  @override
  @JsonKey(name: 'DataSourceField')
  final String? dataSourceField;

  @override
  String toString() {
    return 'PollQuestionItem(dataSourceLabel: $dataSourceLabel, dataSourceValue: $dataSourceValue, dataSourceDisplayValue: $dataSourceDisplayValue, isAutoFilled: $isAutoFilled, options: $options, id: $id, pollFormId: $pollFormId, sectionId: $sectionId, questionText: $questionText, fieldKey: $fieldKey, questionType: $questionType, isRequired: $isRequired, sortOrder: $sortOrder, configJson: $configJson, dataSourceType: $dataSourceType, dataSourceField: $dataSourceField)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollQuestionItemImpl &&
            (identical(other.dataSourceLabel, dataSourceLabel) ||
                other.dataSourceLabel == dataSourceLabel) &&
            (identical(other.dataSourceValue, dataSourceValue) ||
                other.dataSourceValue == dataSourceValue) &&
            (identical(other.dataSourceDisplayValue, dataSourceDisplayValue) ||
                other.dataSourceDisplayValue == dataSourceDisplayValue) &&
            (identical(other.isAutoFilled, isAutoFilled) ||
                other.isAutoFilled == isAutoFilled) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pollFormId, pollFormId) ||
                other.pollFormId == pollFormId) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.fieldKey, fieldKey) ||
                other.fieldKey == fieldKey) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.configJson, configJson) ||
                other.configJson == configJson) &&
            (identical(other.dataSourceType, dataSourceType) ||
                other.dataSourceType == dataSourceType) &&
            (identical(other.dataSourceField, dataSourceField) ||
                other.dataSourceField == dataSourceField));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dataSourceLabel,
      dataSourceValue,
      dataSourceDisplayValue,
      isAutoFilled,
      const DeepCollectionEquality().hash(_options),
      id,
      pollFormId,
      sectionId,
      questionText,
      fieldKey,
      questionType,
      isRequired,
      sortOrder,
      configJson,
      dataSourceType,
      dataSourceField);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollQuestionItemImplCopyWith<_$PollQuestionItemImpl> get copyWith =>
      __$$PollQuestionItemImplCopyWithImpl<_$PollQuestionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollQuestionItemImplToJson(
      this,
    );
  }
}

abstract class _PollQuestionItem implements PollQuestionItem {
  const factory _PollQuestionItem(
          {@JsonKey(name: 'DataSourceLabel') final String? dataSourceLabel,
          @JsonKey(name: 'DataSourceValue') final String? dataSourceValue,
          @JsonKey(name: 'DataSourceDisplayValue')
          final String? dataSourceDisplayValue,
          @JsonKey(name: 'IsAutoFilled') final bool? isAutoFilled,
          @JsonKey(name: 'Options') final List<PollOptionItem>? options,
          @JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'PollFormID') final int? pollFormId,
          @JsonKey(name: 'SectionID') final int? sectionId,
          @JsonKey(name: 'QuestionText') final String? questionText,
          @JsonKey(name: 'FieldKey') final String? fieldKey,
          @JsonKey(name: 'QuestionType') final String? questionType,
          @JsonKey(name: 'IsRequired') final bool? isRequired,
          @JsonKey(name: 'SortOrder') final int? sortOrder,
          @JsonKey(name: 'ConfigJson') final String? configJson,
          @JsonKey(name: 'DataSourceType') final String? dataSourceType,
          @JsonKey(name: 'DataSourceField') final String? dataSourceField}) =
      _$PollQuestionItemImpl;

  factory _PollQuestionItem.fromJson(Map<String, dynamic> json) =
      _$PollQuestionItemImpl.fromJson;

  @override
  @JsonKey(name: 'DataSourceLabel')
  String? get dataSourceLabel;
  @override
  @JsonKey(name: 'DataSourceValue')
  String? get dataSourceValue;
  @override
  @JsonKey(name: 'DataSourceDisplayValue')
  String? get dataSourceDisplayValue;
  @override
  @JsonKey(name: 'IsAutoFilled')
  bool? get isAutoFilled;
  @override
  @JsonKey(name: 'Options')
  List<PollOptionItem>? get options;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'PollFormID')
  int? get pollFormId;
  @override
  @JsonKey(name: 'SectionID')
  int? get sectionId;
  @override
  @JsonKey(name: 'QuestionText')
  String? get questionText;
  @override
  @JsonKey(name: 'FieldKey')
  String? get fieldKey;
  @override
  @JsonKey(name: 'QuestionType')
  String? get questionType;
  @override
  @JsonKey(name: 'IsRequired')
  bool? get isRequired;
  @override
  @JsonKey(name: 'SortOrder')
  int? get sortOrder;
  @override
  @JsonKey(name: 'ConfigJson')
  String? get configJson;
  @override
  @JsonKey(name: 'DataSourceType')
  String? get dataSourceType;
  @override
  @JsonKey(name: 'DataSourceField')
  String? get dataSourceField;
  @override
  @JsonKey(ignore: true)
  _$$PollQuestionItemImplCopyWith<_$PollQuestionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PollOptionItem _$PollOptionItemFromJson(Map<String, dynamic> json) {
  return _PollOptionItem.fromJson(json);
}

/// @nodoc
mixin _$PollOptionItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'PollQuestionID')
  int? get pollQuestionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptionText')
  String? get optionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptionValue')
  String? get optionValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'SortOrder')
  int? get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollOptionItemCopyWith<PollOptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollOptionItemCopyWith<$Res> {
  factory $PollOptionItemCopyWith(
          PollOptionItem value, $Res Function(PollOptionItem) then) =
      _$PollOptionItemCopyWithImpl<$Res, PollOptionItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'PollQuestionID') int? pollQuestionId,
      @JsonKey(name: 'OptionText') String? optionText,
      @JsonKey(name: 'OptionValue') String? optionValue,
      @JsonKey(name: 'SortOrder') int? sortOrder});
}

/// @nodoc
class _$PollOptionItemCopyWithImpl<$Res, $Val extends PollOptionItem>
    implements $PollOptionItemCopyWith<$Res> {
  _$PollOptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pollQuestionId = freezed,
    Object? optionText = freezed,
    Object? optionValue = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pollQuestionId: freezed == pollQuestionId
          ? _value.pollQuestionId
          : pollQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      optionText: freezed == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String?,
      optionValue: freezed == optionValue
          ? _value.optionValue
          : optionValue // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollOptionItemImplCopyWith<$Res>
    implements $PollOptionItemCopyWith<$Res> {
  factory _$$PollOptionItemImplCopyWith(_$PollOptionItemImpl value,
          $Res Function(_$PollOptionItemImpl) then) =
      __$$PollOptionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'PollQuestionID') int? pollQuestionId,
      @JsonKey(name: 'OptionText') String? optionText,
      @JsonKey(name: 'OptionValue') String? optionValue,
      @JsonKey(name: 'SortOrder') int? sortOrder});
}

/// @nodoc
class __$$PollOptionItemImplCopyWithImpl<$Res>
    extends _$PollOptionItemCopyWithImpl<$Res, _$PollOptionItemImpl>
    implements _$$PollOptionItemImplCopyWith<$Res> {
  __$$PollOptionItemImplCopyWithImpl(
      _$PollOptionItemImpl _value, $Res Function(_$PollOptionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pollQuestionId = freezed,
    Object? optionText = freezed,
    Object? optionValue = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_$PollOptionItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pollQuestionId: freezed == pollQuestionId
          ? _value.pollQuestionId
          : pollQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      optionText: freezed == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String?,
      optionValue: freezed == optionValue
          ? _value.optionValue
          : optionValue // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollOptionItemImpl implements _PollOptionItem {
  const _$PollOptionItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'PollQuestionID') this.pollQuestionId,
      @JsonKey(name: 'OptionText') this.optionText,
      @JsonKey(name: 'OptionValue') this.optionValue,
      @JsonKey(name: 'SortOrder') this.sortOrder});

  factory _$PollOptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollOptionItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'PollQuestionID')
  final int? pollQuestionId;
  @override
  @JsonKey(name: 'OptionText')
  final String? optionText;
  @override
  @JsonKey(name: 'OptionValue')
  final String? optionValue;
  @override
  @JsonKey(name: 'SortOrder')
  final int? sortOrder;

  @override
  String toString() {
    return 'PollOptionItem(id: $id, pollQuestionId: $pollQuestionId, optionText: $optionText, optionValue: $optionValue, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollOptionItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pollQuestionId, pollQuestionId) ||
                other.pollQuestionId == pollQuestionId) &&
            (identical(other.optionText, optionText) ||
                other.optionText == optionText) &&
            (identical(other.optionValue, optionValue) ||
                other.optionValue == optionValue) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, pollQuestionId, optionText, optionValue, sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollOptionItemImplCopyWith<_$PollOptionItemImpl> get copyWith =>
      __$$PollOptionItemImplCopyWithImpl<_$PollOptionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollOptionItemImplToJson(
      this,
    );
  }
}

abstract class _PollOptionItem implements PollOptionItem {
  const factory _PollOptionItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'PollQuestionID') final int? pollQuestionId,
      @JsonKey(name: 'OptionText') final String? optionText,
      @JsonKey(name: 'OptionValue') final String? optionValue,
      @JsonKey(name: 'SortOrder') final int? sortOrder}) = _$PollOptionItemImpl;

  factory _PollOptionItem.fromJson(Map<String, dynamic> json) =
      _$PollOptionItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'PollQuestionID')
  int? get pollQuestionId;
  @override
  @JsonKey(name: 'OptionText')
  String? get optionText;
  @override
  @JsonKey(name: 'OptionValue')
  String? get optionValue;
  @override
  @JsonKey(name: 'SortOrder')
  int? get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$PollOptionItemImplCopyWith<_$PollOptionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseItem _$ResponseItemFromJson(Map<String, dynamic> json) {
  return _ResponseItem.fromJson(json);
}

/// @nodoc
mixin _$ResponseItem {
  @JsonKey(name: 'PollFormID')
  int? get pollFormId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'HasResponse')
  bool? get hasResponse => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCompleted')
  bool? get isCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CanEdit')
  bool? get canEdit => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsClosed')
  bool? get isClosed => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClosedReason')
  String? get closedReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Response')
  String? get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseItemCopyWith<ResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseItemCopyWith<$Res> {
  factory $ResponseItemCopyWith(
          ResponseItem value, $Res Function(ResponseItem) then) =
      _$ResponseItemCopyWithImpl<$Res, ResponseItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PollFormID') int? pollFormId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'HasResponse') bool? hasResponse,
      @JsonKey(name: 'IsCompleted') bool? isCompleted,
      @JsonKey(name: 'CanEdit') bool? canEdit,
      @JsonKey(name: 'IsClosed') bool? isClosed,
      @JsonKey(name: 'ClosedReason') String? closedReason,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Response') String? response});
}

/// @nodoc
class _$ResponseItemCopyWithImpl<$Res, $Val extends ResponseItem>
    implements $ResponseItemCopyWith<$Res> {
  _$ResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollFormId = freezed,
    Object? employeeId = freezed,
    Object? hasResponse = freezed,
    Object? isCompleted = freezed,
    Object? canEdit = freezed,
    Object? isClosed = freezed,
    Object? closedReason = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      pollFormId: freezed == pollFormId
          ? _value.pollFormId
          : pollFormId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasResponse: freezed == hasResponse
          ? _value.hasResponse
          : hasResponse // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      closedReason: freezed == closedReason
          ? _value.closedReason
          : closedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseItemImplCopyWith<$Res>
    implements $ResponseItemCopyWith<$Res> {
  factory _$$ResponseItemImplCopyWith(
          _$ResponseItemImpl value, $Res Function(_$ResponseItemImpl) then) =
      __$$ResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PollFormID') int? pollFormId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'HasResponse') bool? hasResponse,
      @JsonKey(name: 'IsCompleted') bool? isCompleted,
      @JsonKey(name: 'CanEdit') bool? canEdit,
      @JsonKey(name: 'IsClosed') bool? isClosed,
      @JsonKey(name: 'ClosedReason') String? closedReason,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Response') String? response});
}

/// @nodoc
class __$$ResponseItemImplCopyWithImpl<$Res>
    extends _$ResponseItemCopyWithImpl<$Res, _$ResponseItemImpl>
    implements _$$ResponseItemImplCopyWith<$Res> {
  __$$ResponseItemImplCopyWithImpl(
      _$ResponseItemImpl _value, $Res Function(_$ResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollFormId = freezed,
    Object? employeeId = freezed,
    Object? hasResponse = freezed,
    Object? isCompleted = freezed,
    Object? canEdit = freezed,
    Object? isClosed = freezed,
    Object? closedReason = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? response = freezed,
  }) {
    return _then(_$ResponseItemImpl(
      pollFormId: freezed == pollFormId
          ? _value.pollFormId
          : pollFormId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasResponse: freezed == hasResponse
          ? _value.hasResponse
          : hasResponse // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      canEdit: freezed == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      closedReason: freezed == closedReason
          ? _value.closedReason
          : closedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseItemImpl implements _ResponseItem {
  const _$ResponseItemImpl(
      {@JsonKey(name: 'PollFormID') this.pollFormId,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'HasResponse') this.hasResponse,
      @JsonKey(name: 'IsCompleted') this.isCompleted,
      @JsonKey(name: 'CanEdit') this.canEdit,
      @JsonKey(name: 'IsClosed') this.isClosed,
      @JsonKey(name: 'ClosedReason') this.closedReason,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'Response') this.response});

  factory _$ResponseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseItemImplFromJson(json);

  @override
  @JsonKey(name: 'PollFormID')
  final int? pollFormId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'HasResponse')
  final bool? hasResponse;
  @override
  @JsonKey(name: 'IsCompleted')
  final bool? isCompleted;
  @override
  @JsonKey(name: 'CanEdit')
  final bool? canEdit;
  @override
  @JsonKey(name: 'IsClosed')
  final bool? isClosed;
  @override
  @JsonKey(name: 'ClosedReason')
  final String? closedReason;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'Response')
  final String? response;

  @override
  String toString() {
    return 'ResponseItem(pollFormId: $pollFormId, employeeId: $employeeId, hasResponse: $hasResponse, isCompleted: $isCompleted, canEdit: $canEdit, isClosed: $isClosed, closedReason: $closedReason, startDate: $startDate, endDate: $endDate, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseItemImpl &&
            (identical(other.pollFormId, pollFormId) ||
                other.pollFormId == pollFormId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.hasResponse, hasResponse) ||
                other.hasResponse == hasResponse) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.closedReason, closedReason) ||
                other.closedReason == closedReason) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pollFormId,
      employeeId,
      hasResponse,
      isCompleted,
      canEdit,
      isClosed,
      closedReason,
      startDate,
      endDate,
      response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseItemImplCopyWith<_$ResponseItemImpl> get copyWith =>
      __$$ResponseItemImplCopyWithImpl<_$ResponseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseItemImplToJson(
      this,
    );
  }
}

abstract class _ResponseItem implements ResponseItem {
  const factory _ResponseItem(
      {@JsonKey(name: 'PollFormID') final int? pollFormId,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'HasResponse') final bool? hasResponse,
      @JsonKey(name: 'IsCompleted') final bool? isCompleted,
      @JsonKey(name: 'CanEdit') final bool? canEdit,
      @JsonKey(name: 'IsClosed') final bool? isClosed,
      @JsonKey(name: 'ClosedReason') final String? closedReason,
      @JsonKey(name: 'StartDate') final DateTime? startDate,
      @JsonKey(name: 'EndDate') final DateTime? endDate,
      @JsonKey(name: 'Response') final String? response}) = _$ResponseItemImpl;

  factory _ResponseItem.fromJson(Map<String, dynamic> json) =
      _$ResponseItemImpl.fromJson;

  @override
  @JsonKey(name: 'PollFormID')
  int? get pollFormId;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'HasResponse')
  bool? get hasResponse;
  @override
  @JsonKey(name: 'IsCompleted')
  bool? get isCompleted;
  @override
  @JsonKey(name: 'CanEdit')
  bool? get canEdit;
  @override
  @JsonKey(name: 'IsClosed')
  bool? get isClosed;
  @override
  @JsonKey(name: 'ClosedReason')
  String? get closedReason;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'Response')
  String? get response;
  @override
  @JsonKey(ignore: true)
  _$$ResponseItemImplCopyWith<_$ResponseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
