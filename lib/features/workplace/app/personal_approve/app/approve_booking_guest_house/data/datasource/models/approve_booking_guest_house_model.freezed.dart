// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_booking_guest_house_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApproveBookingGuestHouseItem _$ApproveBookingGuestHouseItemFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingGuestHouseItem.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingGuestHouseItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterID')
  int? get registerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId =>
      throw _privateConstructorUsedError; // Thông tin nhân viên đặt
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SDTCaNhan')
  String? get sdtCaNhan =>
      throw _privateConstructorUsedError; // Thông tin dự án
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError; // Địa điểm
  @JsonKey(name: 'ProvinceID')
  int? get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceName')
  String? get provinceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError; // Thời gian
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError; // Ghi chú
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError; // Người cùng phòng
  @JsonKey(name: 'Roommates')
  String? get roommates => throw _privateConstructorUsedError; // Audit
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError; // Duyệt TBP
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBP')
  dynamic get approvedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBPDate')
  DateTime? get approvedTBPDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullNameTBP')
  String? get fullNameTBP => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingGuestHouseItemCopyWith<ApproveBookingGuestHouseItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingGuestHouseItemCopyWith<$Res> {
  factory $ApproveBookingGuestHouseItemCopyWith(
          ApproveBookingGuestHouseItem value,
          $Res Function(ApproveBookingGuestHouseItem) then) =
      _$ApproveBookingGuestHouseItemCopyWithImpl<$Res,
          ApproveBookingGuestHouseItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'RegisterID') int? registerId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProvinceID') int? provinceId,
      @JsonKey(name: 'ProvinceName') String? provinceName,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Roommates') String? roommates,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'ApprovedTBP') dynamic approvedTBP,
      @JsonKey(name: 'ApprovedTBPDate') DateTime? approvedTBPDate,
      @JsonKey(name: 'FullNameTBP') String? fullNameTBP});
}

/// @nodoc
class _$ApproveBookingGuestHouseItemCopyWithImpl<$Res,
        $Val extends ApproveBookingGuestHouseItem>
    implements $ApproveBookingGuestHouseItemCopyWith<$Res> {
  _$ApproveBookingGuestHouseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? registerId = freezed,
    Object? projectId = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? sdtCaNhan = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? provinceId = freezed,
    Object? provinceName = freezed,
    Object? address = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? note = freezed,
    Object? roommates = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? isApprovedTBP = freezed,
    Object? approvedTBP = freezed,
    Object? approvedTBPDate = freezed,
    Object? fullNameTBP = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      registerId: freezed == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCaNhan: freezed == sdtCaNhan
          ? _value.sdtCaNhan
          : sdtCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      roommates: freezed == roommates
          ? _value.roommates
          : roommates // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedTBP: freezed == approvedTBP
          ? _value.approvedTBP
          : approvedTBP // ignore: cast_nullable_to_non_nullable
              as dynamic,
      approvedTBPDate: freezed == approvedTBPDate
          ? _value.approvedTBPDate
          : approvedTBPDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fullNameTBP: freezed == fullNameTBP
          ? _value.fullNameTBP
          : fullNameTBP // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingGuestHouseItemImplCopyWith<$Res>
    implements $ApproveBookingGuestHouseItemCopyWith<$Res> {
  factory _$$ApproveBookingGuestHouseItemImplCopyWith(
          _$ApproveBookingGuestHouseItemImpl value,
          $Res Function(_$ApproveBookingGuestHouseItemImpl) then) =
      __$$ApproveBookingGuestHouseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'RegisterID') int? registerId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProvinceID') int? provinceId,
      @JsonKey(name: 'ProvinceName') String? provinceName,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Roommates') String? roommates,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'ApprovedTBP') dynamic approvedTBP,
      @JsonKey(name: 'ApprovedTBPDate') DateTime? approvedTBPDate,
      @JsonKey(name: 'FullNameTBP') String? fullNameTBP});
}

/// @nodoc
class __$$ApproveBookingGuestHouseItemImplCopyWithImpl<$Res>
    extends _$ApproveBookingGuestHouseItemCopyWithImpl<$Res,
        _$ApproveBookingGuestHouseItemImpl>
    implements _$$ApproveBookingGuestHouseItemImplCopyWith<$Res> {
  __$$ApproveBookingGuestHouseItemImplCopyWithImpl(
      _$ApproveBookingGuestHouseItemImpl _value,
      $Res Function(_$ApproveBookingGuestHouseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? registerId = freezed,
    Object? projectId = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? sdtCaNhan = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? provinceId = freezed,
    Object? provinceName = freezed,
    Object? address = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? note = freezed,
    Object? roommates = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? isApprovedTBP = freezed,
    Object? approvedTBP = freezed,
    Object? approvedTBPDate = freezed,
    Object? fullNameTBP = freezed,
  }) {
    return _then(_$ApproveBookingGuestHouseItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      registerId: freezed == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCaNhan: freezed == sdtCaNhan
          ? _value.sdtCaNhan
          : sdtCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      roommates: freezed == roommates
          ? _value.roommates
          : roommates // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedTBP: freezed == approvedTBP
          ? _value.approvedTBP
          : approvedTBP // ignore: cast_nullable_to_non_nullable
              as dynamic,
      approvedTBPDate: freezed == approvedTBPDate
          ? _value.approvedTBPDate
          : approvedTBPDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fullNameTBP: freezed == fullNameTBP
          ? _value.fullNameTBP
          : fullNameTBP // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingGuestHouseItemImpl
    implements _ApproveBookingGuestHouseItem {
  const _$ApproveBookingGuestHouseItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'RegisterID') this.registerId,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'SDTCaNhan') this.sdtCaNhan,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ProvinceID') this.provinceId,
      @JsonKey(name: 'ProvinceName') this.provinceName,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'Roommates') this.roommates,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTBP,
      @JsonKey(name: 'ApprovedTBP') this.approvedTBP,
      @JsonKey(name: 'ApprovedTBPDate') this.approvedTBPDate,
      @JsonKey(name: 'FullNameTBP') this.fullNameTBP});

  factory _$ApproveBookingGuestHouseItemImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApproveBookingGuestHouseItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'RegisterID')
  final int? registerId;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
// Thông tin nhân viên đặt
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'SDTCaNhan')
  final String? sdtCaNhan;
// Thông tin dự án
  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
// Địa điểm
  @override
  @JsonKey(name: 'ProvinceID')
  final int? provinceId;
  @override
  @JsonKey(name: 'ProvinceName')
  final String? provinceName;
  @override
  @JsonKey(name: 'Address')
  final String? address;
// Thời gian
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
// Ghi chú
  @override
  @JsonKey(name: 'Note')
  final String? note;
// Người cùng phòng
  @override
  @JsonKey(name: 'Roommates')
  final String? roommates;
// Audit
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
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
// Duyệt TBP
  @override
  @JsonKey(name: 'IsApprovedTBP')
  final bool? isApprovedTBP;
  @override
  @JsonKey(name: 'ApprovedTBP')
  final dynamic approvedTBP;
  @override
  @JsonKey(name: 'ApprovedTBPDate')
  final DateTime? approvedTBPDate;
  @override
  @JsonKey(name: 'FullNameTBP')
  final String? fullNameTBP;

  @override
  String toString() {
    return 'ApproveBookingGuestHouseItem(id: $id, registerId: $registerId, projectId: $projectId, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName, sdtCaNhan: $sdtCaNhan, projectCode: $projectCode, projectName: $projectName, provinceId: $provinceId, provinceName: $provinceName, address: $address, startDate: $startDate, endDate: $endDate, note: $note, roommates: $roommates, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, isApprovedTBP: $isApprovedTBP, approvedTBP: $approvedTBP, approvedTBPDate: $approvedTBPDate, fullNameTBP: $fullNameTBP)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingGuestHouseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerId, registerId) ||
                other.registerId == registerId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.sdtCaNhan, sdtCaNhan) ||
                other.sdtCaNhan == sdtCaNhan) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.roommates, roommates) ||
                other.roommates == roommates) &&
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
            (identical(other.isApprovedTBP, isApprovedTBP) ||
                other.isApprovedTBP == isApprovedTBP) &&
            const DeepCollectionEquality()
                .equals(other.approvedTBP, approvedTBP) &&
            (identical(other.approvedTBPDate, approvedTBPDate) ||
                other.approvedTBPDate == approvedTBPDate) &&
            (identical(other.fullNameTBP, fullNameTBP) ||
                other.fullNameTBP == fullNameTBP));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        registerId,
        projectId,
        fullName,
        departmentId,
        departmentName,
        sdtCaNhan,
        projectCode,
        projectName,
        provinceId,
        provinceName,
        address,
        startDate,
        endDate,
        note,
        roommates,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        isDeleted,
        isApprovedTBP,
        const DeepCollectionEquality().hash(approvedTBP),
        approvedTBPDate,
        fullNameTBP
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingGuestHouseItemImplCopyWith<
          _$ApproveBookingGuestHouseItemImpl>
      get copyWith => __$$ApproveBookingGuestHouseItemImplCopyWithImpl<
          _$ApproveBookingGuestHouseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingGuestHouseItemImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingGuestHouseItem
    implements ApproveBookingGuestHouseItem {
  const factory _ApproveBookingGuestHouseItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'RegisterID') final int? registerId,
          @JsonKey(name: 'ProjectID') final int? projectId,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'SDTCaNhan') final String? sdtCaNhan,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'ProvinceID') final int? provinceId,
          @JsonKey(name: 'ProvinceName') final String? provinceName,
          @JsonKey(name: 'Address') final String? address,
          @JsonKey(name: 'StartDate') final DateTime? startDate,
          @JsonKey(name: 'EndDate') final DateTime? endDate,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'Roommates') final String? roommates,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTBP,
          @JsonKey(name: 'ApprovedTBP') final dynamic approvedTBP,
          @JsonKey(name: 'ApprovedTBPDate') final DateTime? approvedTBPDate,
          @JsonKey(name: 'FullNameTBP') final String? fullNameTBP}) =
      _$ApproveBookingGuestHouseItemImpl;

  factory _ApproveBookingGuestHouseItem.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingGuestHouseItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'RegisterID')
  int? get registerId;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override // Thông tin nhân viên đặt
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'SDTCaNhan')
  String? get sdtCaNhan;
  @override // Thông tin dự án
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override // Địa điểm
  @JsonKey(name: 'ProvinceID')
  int? get provinceId;
  @override
  @JsonKey(name: 'ProvinceName')
  String? get provinceName;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override // Thời gian
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override // Ghi chú
  @JsonKey(name: 'Note')
  String? get note;
  @override // Người cùng phòng
  @JsonKey(name: 'Roommates')
  String? get roommates;
  @override // Audit
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
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override // Duyệt TBP
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP;
  @override
  @JsonKey(name: 'ApprovedTBP')
  dynamic get approvedTBP;
  @override
  @JsonKey(name: 'ApprovedTBPDate')
  DateTime? get approvedTBPDate;
  @override
  @JsonKey(name: 'FullNameTBP')
  String? get fullNameTBP;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingGuestHouseItemImplCopyWith<
          _$ApproveBookingGuestHouseItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveProjectFilterItem _$ApproveProjectFilterItemFromJson(
    Map<String, dynamic> json) {
  return _ApproveProjectFilterItem.fromJson(json);
}

/// @nodoc
mixin _$ApproveProjectFilterItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveProjectFilterItemCopyWith<ApproveProjectFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveProjectFilterItemCopyWith<$Res> {
  factory $ApproveProjectFilterItemCopyWith(ApproveProjectFilterItem value,
          $Res Function(ApproveProjectFilterItem) then) =
      _$ApproveProjectFilterItemCopyWithImpl<$Res, ApproveProjectFilterItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName});
}

/// @nodoc
class _$ApproveProjectFilterItemCopyWithImpl<$Res,
        $Val extends ApproveProjectFilterItem>
    implements $ApproveProjectFilterItemCopyWith<$Res> {
  _$ApproveProjectFilterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveProjectFilterItemImplCopyWith<$Res>
    implements $ApproveProjectFilterItemCopyWith<$Res> {
  factory _$$ApproveProjectFilterItemImplCopyWith(
          _$ApproveProjectFilterItemImpl value,
          $Res Function(_$ApproveProjectFilterItemImpl) then) =
      __$$ApproveProjectFilterItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName});
}

/// @nodoc
class __$$ApproveProjectFilterItemImplCopyWithImpl<$Res>
    extends _$ApproveProjectFilterItemCopyWithImpl<$Res,
        _$ApproveProjectFilterItemImpl>
    implements _$$ApproveProjectFilterItemImplCopyWith<$Res> {
  __$$ApproveProjectFilterItemImplCopyWithImpl(
      _$ApproveProjectFilterItemImpl _value,
      $Res Function(_$ApproveProjectFilterItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
  }) {
    return _then(_$ApproveProjectFilterItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveProjectFilterItemImpl implements _ApproveProjectFilterItem {
  const _$ApproveProjectFilterItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName});

  factory _$ApproveProjectFilterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveProjectFilterItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;

  @override
  String toString() {
    return 'ApproveProjectFilterItem(id: $id, projectCode: $projectCode, projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveProjectFilterItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, projectCode, projectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveProjectFilterItemImplCopyWith<_$ApproveProjectFilterItemImpl>
      get copyWith => __$$ApproveProjectFilterItemImplCopyWithImpl<
          _$ApproveProjectFilterItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveProjectFilterItemImplToJson(
      this,
    );
  }
}

abstract class _ApproveProjectFilterItem implements ApproveProjectFilterItem {
  const factory _ApproveProjectFilterItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName}) =
      _$ApproveProjectFilterItemImpl;

  factory _ApproveProjectFilterItem.fromJson(Map<String, dynamic> json) =
      _$ApproveProjectFilterItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(ignore: true)
  _$$ApproveProjectFilterItemImplCopyWith<_$ApproveProjectFilterItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveEmployeeFilterItem _$ApproveEmployeeFilterItemFromJson(
    Map<String, dynamic> json) {
  return _ApproveEmployeeFilterItem.fromJson(json);
}

/// @nodoc
mixin _$ApproveEmployeeFilterItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SDTCaNhan')
  String? get sdtCaNhan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveEmployeeFilterItemCopyWith<ApproveEmployeeFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveEmployeeFilterItemCopyWith<$Res> {
  factory $ApproveEmployeeFilterItemCopyWith(ApproveEmployeeFilterItem value,
          $Res Function(ApproveEmployeeFilterItem) then) =
      _$ApproveEmployeeFilterItemCopyWithImpl<$Res, ApproveEmployeeFilterItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan});
}

/// @nodoc
class _$ApproveEmployeeFilterItemCopyWithImpl<$Res,
        $Val extends ApproveEmployeeFilterItem>
    implements $ApproveEmployeeFilterItemCopyWith<$Res> {
  _$ApproveEmployeeFilterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? sdtCaNhan = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCaNhan: freezed == sdtCaNhan
          ? _value.sdtCaNhan
          : sdtCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveEmployeeFilterItemImplCopyWith<$Res>
    implements $ApproveEmployeeFilterItemCopyWith<$Res> {
  factory _$$ApproveEmployeeFilterItemImplCopyWith(
          _$ApproveEmployeeFilterItemImpl value,
          $Res Function(_$ApproveEmployeeFilterItemImpl) then) =
      __$$ApproveEmployeeFilterItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan});
}

/// @nodoc
class __$$ApproveEmployeeFilterItemImplCopyWithImpl<$Res>
    extends _$ApproveEmployeeFilterItemCopyWithImpl<$Res,
        _$ApproveEmployeeFilterItemImpl>
    implements _$$ApproveEmployeeFilterItemImplCopyWith<$Res> {
  __$$ApproveEmployeeFilterItemImplCopyWithImpl(
      _$ApproveEmployeeFilterItemImpl _value,
      $Res Function(_$ApproveEmployeeFilterItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? sdtCaNhan = freezed,
  }) {
    return _then(_$ApproveEmployeeFilterItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCaNhan: freezed == sdtCaNhan
          ? _value.sdtCaNhan
          : sdtCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveEmployeeFilterItemImpl implements _ApproveEmployeeFilterItem {
  const _$ApproveEmployeeFilterItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'UserID') this.userId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'SDTCaNhan') this.sdtCaNhan});

  factory _$ApproveEmployeeFilterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveEmployeeFilterItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'UserID')
  final int? userId;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'SDTCaNhan')
  final String? sdtCaNhan;

  @override
  String toString() {
    return 'ApproveEmployeeFilterItem(id: $id, userId: $userId, code: $code, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName, sdtCaNhan: $sdtCaNhan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveEmployeeFilterItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.sdtCaNhan, sdtCaNhan) ||
                other.sdtCaNhan == sdtCaNhan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, code, fullName,
      departmentId, departmentName, sdtCaNhan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveEmployeeFilterItemImplCopyWith<_$ApproveEmployeeFilterItemImpl>
      get copyWith => __$$ApproveEmployeeFilterItemImplCopyWithImpl<
          _$ApproveEmployeeFilterItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveEmployeeFilterItemImplToJson(
      this,
    );
  }
}

abstract class _ApproveEmployeeFilterItem implements ApproveEmployeeFilterItem {
  const factory _ApproveEmployeeFilterItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'UserID') final int? userId,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'SDTCaNhan') final String? sdtCaNhan}) =
      _$ApproveEmployeeFilterItemImpl;

  factory _ApproveEmployeeFilterItem.fromJson(Map<String, dynamic> json) =
      _$ApproveEmployeeFilterItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'UserID')
  int? get userId;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'SDTCaNhan')
  String? get sdtCaNhan;
  @override
  @JsonKey(ignore: true)
  _$$ApproveEmployeeFilterItemImplCopyWith<_$ApproveEmployeeFilterItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
