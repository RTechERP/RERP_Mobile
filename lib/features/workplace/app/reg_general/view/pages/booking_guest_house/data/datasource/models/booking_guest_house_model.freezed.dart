// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_guest_house_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingGuestHouseItem _$BookingGuestHouseItemFromJson(
    Map<String, dynamic> json) {
  return _BookingGuestHouseItem.fromJson(json);
}

/// @nodoc
mixin _$BookingGuestHouseItem {
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
  String? get fullNameTBP => throw _privateConstructorUsedError; // Thanh toán
  @JsonKey(name: 'PaymentApprovedTBPID')
  int? get paymentApprovedTBPId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentFullNameTBP')
  String? get paymentFullNameTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentDetailStatus')
  int? get paymentDetailStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentRecipientName')
  String? get paymentRecipientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentBankName')
  String? get paymentBankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentBankAccount')
  String? get paymentBankAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentHotelName')
  String? get paymentHotelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentCompanyID')
  int? get paymentCompanyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentCompanyName')
  String? get paymentCompanyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentTotalAmount')
  num? get paymentTotalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentTotalAmountWithInvoice')
  num? get paymentTotalAmountWithInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentInvoiceNumber')
  String? get paymentInvoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentReason')
  String? get paymentReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentNote')
  String? get paymentNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentInvoiceFileCount')
  int? get paymentInvoiceFileCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentBillCKFileCount')
  int? get paymentBillCkFileCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingGuestHouseItemCopyWith<BookingGuestHouseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingGuestHouseItemCopyWith<$Res> {
  factory $BookingGuestHouseItemCopyWith(BookingGuestHouseItem value,
          $Res Function(BookingGuestHouseItem) then) =
      _$BookingGuestHouseItemCopyWithImpl<$Res, BookingGuestHouseItem>;
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
      @JsonKey(name: 'FullNameTBP') String? fullNameTBP,
      @JsonKey(name: 'PaymentApprovedTBPID') int? paymentApprovedTBPId,
      @JsonKey(name: 'PaymentFullNameTBP') String? paymentFullNameTBP,
      @JsonKey(name: 'PaymentDetailStatus') int? paymentDetailStatus,
      @JsonKey(name: 'PaymentRecipientName') String? paymentRecipientName,
      @JsonKey(name: 'PaymentBankName') String? paymentBankName,
      @JsonKey(name: 'PaymentBankAccount') String? paymentBankAccount,
      @JsonKey(name: 'PaymentHotelName') String? paymentHotelName,
      @JsonKey(name: 'PaymentCompanyID') int? paymentCompanyId,
      @JsonKey(name: 'PaymentCompanyName') String? paymentCompanyName,
      @JsonKey(name: 'PaymentTotalAmount') num? paymentTotalAmount,
      @JsonKey(name: 'PaymentTotalAmountWithInvoice')
      num? paymentTotalAmountWithInvoice,
      @JsonKey(name: 'PaymentInvoiceNumber') String? paymentInvoiceNumber,
      @JsonKey(name: 'PaymentReason') String? paymentReason,
      @JsonKey(name: 'PaymentNote') String? paymentNote,
      @JsonKey(name: 'PaymentInvoiceFileCount') int? paymentInvoiceFileCount,
      @JsonKey(name: 'PaymentBillCKFileCount') int? paymentBillCkFileCount});
}

/// @nodoc
class _$BookingGuestHouseItemCopyWithImpl<$Res,
        $Val extends BookingGuestHouseItem>
    implements $BookingGuestHouseItemCopyWith<$Res> {
  _$BookingGuestHouseItemCopyWithImpl(this._value, this._then);

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
    Object? paymentApprovedTBPId = freezed,
    Object? paymentFullNameTBP = freezed,
    Object? paymentDetailStatus = freezed,
    Object? paymentRecipientName = freezed,
    Object? paymentBankName = freezed,
    Object? paymentBankAccount = freezed,
    Object? paymentHotelName = freezed,
    Object? paymentCompanyId = freezed,
    Object? paymentCompanyName = freezed,
    Object? paymentTotalAmount = freezed,
    Object? paymentTotalAmountWithInvoice = freezed,
    Object? paymentInvoiceNumber = freezed,
    Object? paymentReason = freezed,
    Object? paymentNote = freezed,
    Object? paymentInvoiceFileCount = freezed,
    Object? paymentBillCkFileCount = freezed,
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
      paymentApprovedTBPId: freezed == paymentApprovedTBPId
          ? _value.paymentApprovedTBPId
          : paymentApprovedTBPId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentFullNameTBP: freezed == paymentFullNameTBP
          ? _value.paymentFullNameTBP
          : paymentFullNameTBP // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDetailStatus: freezed == paymentDetailStatus
          ? _value.paymentDetailStatus
          : paymentDetailStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentRecipientName: freezed == paymentRecipientName
          ? _value.paymentRecipientName
          : paymentRecipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentBankName: freezed == paymentBankName
          ? _value.paymentBankName
          : paymentBankName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentBankAccount: freezed == paymentBankAccount
          ? _value.paymentBankAccount
          : paymentBankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentHotelName: freezed == paymentHotelName
          ? _value.paymentHotelName
          : paymentHotelName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentCompanyId: freezed == paymentCompanyId
          ? _value.paymentCompanyId
          : paymentCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentCompanyName: freezed == paymentCompanyName
          ? _value.paymentCompanyName
          : paymentCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTotalAmount: freezed == paymentTotalAmount
          ? _value.paymentTotalAmount
          : paymentTotalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentTotalAmountWithInvoice: freezed == paymentTotalAmountWithInvoice
          ? _value.paymentTotalAmountWithInvoice
          : paymentTotalAmountWithInvoice // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentInvoiceNumber: freezed == paymentInvoiceNumber
          ? _value.paymentInvoiceNumber
          : paymentInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReason: freezed == paymentReason
          ? _value.paymentReason
          : paymentReason // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentNote: freezed == paymentNote
          ? _value.paymentNote
          : paymentNote // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInvoiceFileCount: freezed == paymentInvoiceFileCount
          ? _value.paymentInvoiceFileCount
          : paymentInvoiceFileCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentBillCkFileCount: freezed == paymentBillCkFileCount
          ? _value.paymentBillCkFileCount
          : paymentBillCkFileCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingGuestHouseItemImplCopyWith<$Res>
    implements $BookingGuestHouseItemCopyWith<$Res> {
  factory _$$BookingGuestHouseItemImplCopyWith(
          _$BookingGuestHouseItemImpl value,
          $Res Function(_$BookingGuestHouseItemImpl) then) =
      __$$BookingGuestHouseItemImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'FullNameTBP') String? fullNameTBP,
      @JsonKey(name: 'PaymentApprovedTBPID') int? paymentApprovedTBPId,
      @JsonKey(name: 'PaymentFullNameTBP') String? paymentFullNameTBP,
      @JsonKey(name: 'PaymentDetailStatus') int? paymentDetailStatus,
      @JsonKey(name: 'PaymentRecipientName') String? paymentRecipientName,
      @JsonKey(name: 'PaymentBankName') String? paymentBankName,
      @JsonKey(name: 'PaymentBankAccount') String? paymentBankAccount,
      @JsonKey(name: 'PaymentHotelName') String? paymentHotelName,
      @JsonKey(name: 'PaymentCompanyID') int? paymentCompanyId,
      @JsonKey(name: 'PaymentCompanyName') String? paymentCompanyName,
      @JsonKey(name: 'PaymentTotalAmount') num? paymentTotalAmount,
      @JsonKey(name: 'PaymentTotalAmountWithInvoice')
      num? paymentTotalAmountWithInvoice,
      @JsonKey(name: 'PaymentInvoiceNumber') String? paymentInvoiceNumber,
      @JsonKey(name: 'PaymentReason') String? paymentReason,
      @JsonKey(name: 'PaymentNote') String? paymentNote,
      @JsonKey(name: 'PaymentInvoiceFileCount') int? paymentInvoiceFileCount,
      @JsonKey(name: 'PaymentBillCKFileCount') int? paymentBillCkFileCount});
}

/// @nodoc
class __$$BookingGuestHouseItemImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseItemCopyWithImpl<$Res,
        _$BookingGuestHouseItemImpl>
    implements _$$BookingGuestHouseItemImplCopyWith<$Res> {
  __$$BookingGuestHouseItemImplCopyWithImpl(_$BookingGuestHouseItemImpl _value,
      $Res Function(_$BookingGuestHouseItemImpl) _then)
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
    Object? paymentApprovedTBPId = freezed,
    Object? paymentFullNameTBP = freezed,
    Object? paymentDetailStatus = freezed,
    Object? paymentRecipientName = freezed,
    Object? paymentBankName = freezed,
    Object? paymentBankAccount = freezed,
    Object? paymentHotelName = freezed,
    Object? paymentCompanyId = freezed,
    Object? paymentCompanyName = freezed,
    Object? paymentTotalAmount = freezed,
    Object? paymentTotalAmountWithInvoice = freezed,
    Object? paymentInvoiceNumber = freezed,
    Object? paymentReason = freezed,
    Object? paymentNote = freezed,
    Object? paymentInvoiceFileCount = freezed,
    Object? paymentBillCkFileCount = freezed,
  }) {
    return _then(_$BookingGuestHouseItemImpl(
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
      paymentApprovedTBPId: freezed == paymentApprovedTBPId
          ? _value.paymentApprovedTBPId
          : paymentApprovedTBPId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentFullNameTBP: freezed == paymentFullNameTBP
          ? _value.paymentFullNameTBP
          : paymentFullNameTBP // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDetailStatus: freezed == paymentDetailStatus
          ? _value.paymentDetailStatus
          : paymentDetailStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentRecipientName: freezed == paymentRecipientName
          ? _value.paymentRecipientName
          : paymentRecipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentBankName: freezed == paymentBankName
          ? _value.paymentBankName
          : paymentBankName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentBankAccount: freezed == paymentBankAccount
          ? _value.paymentBankAccount
          : paymentBankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentHotelName: freezed == paymentHotelName
          ? _value.paymentHotelName
          : paymentHotelName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentCompanyId: freezed == paymentCompanyId
          ? _value.paymentCompanyId
          : paymentCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentCompanyName: freezed == paymentCompanyName
          ? _value.paymentCompanyName
          : paymentCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTotalAmount: freezed == paymentTotalAmount
          ? _value.paymentTotalAmount
          : paymentTotalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentTotalAmountWithInvoice: freezed == paymentTotalAmountWithInvoice
          ? _value.paymentTotalAmountWithInvoice
          : paymentTotalAmountWithInvoice // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentInvoiceNumber: freezed == paymentInvoiceNumber
          ? _value.paymentInvoiceNumber
          : paymentInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReason: freezed == paymentReason
          ? _value.paymentReason
          : paymentReason // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentNote: freezed == paymentNote
          ? _value.paymentNote
          : paymentNote // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInvoiceFileCount: freezed == paymentInvoiceFileCount
          ? _value.paymentInvoiceFileCount
          : paymentInvoiceFileCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentBillCkFileCount: freezed == paymentBillCkFileCount
          ? _value.paymentBillCkFileCount
          : paymentBillCkFileCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingGuestHouseItemImpl implements _BookingGuestHouseItem {
  const _$BookingGuestHouseItemImpl(
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
      @JsonKey(name: 'FullNameTBP') this.fullNameTBP,
      @JsonKey(name: 'PaymentApprovedTBPID') this.paymentApprovedTBPId,
      @JsonKey(name: 'PaymentFullNameTBP') this.paymentFullNameTBP,
      @JsonKey(name: 'PaymentDetailStatus') this.paymentDetailStatus,
      @JsonKey(name: 'PaymentRecipientName') this.paymentRecipientName,
      @JsonKey(name: 'PaymentBankName') this.paymentBankName,
      @JsonKey(name: 'PaymentBankAccount') this.paymentBankAccount,
      @JsonKey(name: 'PaymentHotelName') this.paymentHotelName,
      @JsonKey(name: 'PaymentCompanyID') this.paymentCompanyId,
      @JsonKey(name: 'PaymentCompanyName') this.paymentCompanyName,
      @JsonKey(name: 'PaymentTotalAmount') this.paymentTotalAmount,
      @JsonKey(name: 'PaymentTotalAmountWithInvoice')
      this.paymentTotalAmountWithInvoice,
      @JsonKey(name: 'PaymentInvoiceNumber') this.paymentInvoiceNumber,
      @JsonKey(name: 'PaymentReason') this.paymentReason,
      @JsonKey(name: 'PaymentNote') this.paymentNote,
      @JsonKey(name: 'PaymentInvoiceFileCount') this.paymentInvoiceFileCount,
      @JsonKey(name: 'PaymentBillCKFileCount') this.paymentBillCkFileCount});

  factory _$BookingGuestHouseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingGuestHouseItemImplFromJson(json);

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
// Thanh toán
  @override
  @JsonKey(name: 'PaymentApprovedTBPID')
  final int? paymentApprovedTBPId;
  @override
  @JsonKey(name: 'PaymentFullNameTBP')
  final String? paymentFullNameTBP;
  @override
  @JsonKey(name: 'PaymentDetailStatus')
  final int? paymentDetailStatus;
  @override
  @JsonKey(name: 'PaymentRecipientName')
  final String? paymentRecipientName;
  @override
  @JsonKey(name: 'PaymentBankName')
  final String? paymentBankName;
  @override
  @JsonKey(name: 'PaymentBankAccount')
  final String? paymentBankAccount;
  @override
  @JsonKey(name: 'PaymentHotelName')
  final String? paymentHotelName;
  @override
  @JsonKey(name: 'PaymentCompanyID')
  final int? paymentCompanyId;
  @override
  @JsonKey(name: 'PaymentCompanyName')
  final String? paymentCompanyName;
  @override
  @JsonKey(name: 'PaymentTotalAmount')
  final num? paymentTotalAmount;
  @override
  @JsonKey(name: 'PaymentTotalAmountWithInvoice')
  final num? paymentTotalAmountWithInvoice;
  @override
  @JsonKey(name: 'PaymentInvoiceNumber')
  final String? paymentInvoiceNumber;
  @override
  @JsonKey(name: 'PaymentReason')
  final String? paymentReason;
  @override
  @JsonKey(name: 'PaymentNote')
  final String? paymentNote;
  @override
  @JsonKey(name: 'PaymentInvoiceFileCount')
  final int? paymentInvoiceFileCount;
  @override
  @JsonKey(name: 'PaymentBillCKFileCount')
  final int? paymentBillCkFileCount;

  @override
  String toString() {
    return 'BookingGuestHouseItem(id: $id, registerId: $registerId, projectId: $projectId, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName, sdtCaNhan: $sdtCaNhan, projectCode: $projectCode, projectName: $projectName, provinceId: $provinceId, provinceName: $provinceName, address: $address, startDate: $startDate, endDate: $endDate, note: $note, roommates: $roommates, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, isApprovedTBP: $isApprovedTBP, approvedTBP: $approvedTBP, approvedTBPDate: $approvedTBPDate, fullNameTBP: $fullNameTBP, paymentApprovedTBPId: $paymentApprovedTBPId, paymentFullNameTBP: $paymentFullNameTBP, paymentDetailStatus: $paymentDetailStatus, paymentRecipientName: $paymentRecipientName, paymentBankName: $paymentBankName, paymentBankAccount: $paymentBankAccount, paymentHotelName: $paymentHotelName, paymentCompanyId: $paymentCompanyId, paymentCompanyName: $paymentCompanyName, paymentTotalAmount: $paymentTotalAmount, paymentTotalAmountWithInvoice: $paymentTotalAmountWithInvoice, paymentInvoiceNumber: $paymentInvoiceNumber, paymentReason: $paymentReason, paymentNote: $paymentNote, paymentInvoiceFileCount: $paymentInvoiceFileCount, paymentBillCkFileCount: $paymentBillCkFileCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingGuestHouseItemImpl &&
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
                other.fullNameTBP == fullNameTBP) &&
            (identical(other.paymentApprovedTBPId, paymentApprovedTBPId) ||
                other.paymentApprovedTBPId == paymentApprovedTBPId) &&
            (identical(other.paymentFullNameTBP, paymentFullNameTBP) ||
                other.paymentFullNameTBP == paymentFullNameTBP) &&
            (identical(other.paymentDetailStatus, paymentDetailStatus) ||
                other.paymentDetailStatus == paymentDetailStatus) &&
            (identical(other.paymentRecipientName, paymentRecipientName) ||
                other.paymentRecipientName == paymentRecipientName) &&
            (identical(other.paymentBankName, paymentBankName) ||
                other.paymentBankName == paymentBankName) &&
            (identical(other.paymentBankAccount, paymentBankAccount) ||
                other.paymentBankAccount == paymentBankAccount) &&
            (identical(other.paymentHotelName, paymentHotelName) ||
                other.paymentHotelName == paymentHotelName) &&
            (identical(other.paymentCompanyId, paymentCompanyId) ||
                other.paymentCompanyId == paymentCompanyId) &&
            (identical(other.paymentCompanyName, paymentCompanyName) ||
                other.paymentCompanyName == paymentCompanyName) &&
            (identical(other.paymentTotalAmount, paymentTotalAmount) ||
                other.paymentTotalAmount == paymentTotalAmount) &&
            (identical(other.paymentTotalAmountWithInvoice,
                    paymentTotalAmountWithInvoice) ||
                other.paymentTotalAmountWithInvoice ==
                    paymentTotalAmountWithInvoice) &&
            (identical(other.paymentInvoiceNumber, paymentInvoiceNumber) ||
                other.paymentInvoiceNumber == paymentInvoiceNumber) &&
            (identical(other.paymentReason, paymentReason) ||
                other.paymentReason == paymentReason) &&
            (identical(other.paymentNote, paymentNote) ||
                other.paymentNote == paymentNote) &&
            (identical(
                    other.paymentInvoiceFileCount, paymentInvoiceFileCount) ||
                other.paymentInvoiceFileCount == paymentInvoiceFileCount) &&
            (identical(other.paymentBillCkFileCount, paymentBillCkFileCount) ||
                other.paymentBillCkFileCount == paymentBillCkFileCount));
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
        fullNameTBP,
        paymentApprovedTBPId,
        paymentFullNameTBP,
        paymentDetailStatus,
        paymentRecipientName,
        paymentBankName,
        paymentBankAccount,
        paymentHotelName,
        paymentCompanyId,
        paymentCompanyName,
        paymentTotalAmount,
        paymentTotalAmountWithInvoice,
        paymentInvoiceNumber,
        paymentReason,
        paymentNote,
        paymentInvoiceFileCount,
        paymentBillCkFileCount
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingGuestHouseItemImplCopyWith<_$BookingGuestHouseItemImpl>
      get copyWith => __$$BookingGuestHouseItemImplCopyWithImpl<
          _$BookingGuestHouseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingGuestHouseItemImplToJson(
      this,
    );
  }
}

abstract class _BookingGuestHouseItem implements BookingGuestHouseItem {
  const factory _BookingGuestHouseItem(
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
      @JsonKey(name: 'FullNameTBP') final String? fullNameTBP,
      @JsonKey(name: 'PaymentApprovedTBPID') final int? paymentApprovedTBPId,
      @JsonKey(name: 'PaymentFullNameTBP') final String? paymentFullNameTBP,
      @JsonKey(name: 'PaymentDetailStatus') final int? paymentDetailStatus,
      @JsonKey(name: 'PaymentRecipientName') final String? paymentRecipientName,
      @JsonKey(name: 'PaymentBankName') final String? paymentBankName,
      @JsonKey(name: 'PaymentBankAccount') final String? paymentBankAccount,
      @JsonKey(name: 'PaymentHotelName') final String? paymentHotelName,
      @JsonKey(name: 'PaymentCompanyID') final int? paymentCompanyId,
      @JsonKey(name: 'PaymentCompanyName') final String? paymentCompanyName,
      @JsonKey(name: 'PaymentTotalAmount') final num? paymentTotalAmount,
      @JsonKey(name: 'PaymentTotalAmountWithInvoice')
      final num? paymentTotalAmountWithInvoice,
      @JsonKey(name: 'PaymentInvoiceNumber') final String? paymentInvoiceNumber,
      @JsonKey(name: 'PaymentReason') final String? paymentReason,
      @JsonKey(name: 'PaymentNote') final String? paymentNote,
      @JsonKey(name: 'PaymentInvoiceFileCount')
      final int? paymentInvoiceFileCount,
      @JsonKey(name: 'PaymentBillCKFileCount')
      final int? paymentBillCkFileCount}) = _$BookingGuestHouseItemImpl;

  factory _BookingGuestHouseItem.fromJson(Map<String, dynamic> json) =
      _$BookingGuestHouseItemImpl.fromJson;

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
  @override // Thanh toán
  @JsonKey(name: 'PaymentApprovedTBPID')
  int? get paymentApprovedTBPId;
  @override
  @JsonKey(name: 'PaymentFullNameTBP')
  String? get paymentFullNameTBP;
  @override
  @JsonKey(name: 'PaymentDetailStatus')
  int? get paymentDetailStatus;
  @override
  @JsonKey(name: 'PaymentRecipientName')
  String? get paymentRecipientName;
  @override
  @JsonKey(name: 'PaymentBankName')
  String? get paymentBankName;
  @override
  @JsonKey(name: 'PaymentBankAccount')
  String? get paymentBankAccount;
  @override
  @JsonKey(name: 'PaymentHotelName')
  String? get paymentHotelName;
  @override
  @JsonKey(name: 'PaymentCompanyID')
  int? get paymentCompanyId;
  @override
  @JsonKey(name: 'PaymentCompanyName')
  String? get paymentCompanyName;
  @override
  @JsonKey(name: 'PaymentTotalAmount')
  num? get paymentTotalAmount;
  @override
  @JsonKey(name: 'PaymentTotalAmountWithInvoice')
  num? get paymentTotalAmountWithInvoice;
  @override
  @JsonKey(name: 'PaymentInvoiceNumber')
  String? get paymentInvoiceNumber;
  @override
  @JsonKey(name: 'PaymentReason')
  String? get paymentReason;
  @override
  @JsonKey(name: 'PaymentNote')
  String? get paymentNote;
  @override
  @JsonKey(name: 'PaymentInvoiceFileCount')
  int? get paymentInvoiceFileCount;
  @override
  @JsonKey(name: 'PaymentBillCKFileCount')
  int? get paymentBillCkFileCount;
  @override
  @JsonKey(ignore: true)
  _$$BookingGuestHouseItemImplCopyWith<_$BookingGuestHouseItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectFilterItem _$ProjectFilterItemFromJson(Map<String, dynamic> json) {
  return _ProjectFilterItem.fromJson(json);
}

/// @nodoc
mixin _$ProjectFilterItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectFilterItemCopyWith<ProjectFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectFilterItemCopyWith<$Res> {
  factory $ProjectFilterItemCopyWith(
          ProjectFilterItem value, $Res Function(ProjectFilterItem) then) =
      _$ProjectFilterItemCopyWithImpl<$Res, ProjectFilterItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName});
}

/// @nodoc
class _$ProjectFilterItemCopyWithImpl<$Res, $Val extends ProjectFilterItem>
    implements $ProjectFilterItemCopyWith<$Res> {
  _$ProjectFilterItemCopyWithImpl(this._value, this._then);

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
abstract class _$$ProjectFilterItemImplCopyWith<$Res>
    implements $ProjectFilterItemCopyWith<$Res> {
  factory _$$ProjectFilterItemImplCopyWith(_$ProjectFilterItemImpl value,
          $Res Function(_$ProjectFilterItemImpl) then) =
      __$$ProjectFilterItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName});
}

/// @nodoc
class __$$ProjectFilterItemImplCopyWithImpl<$Res>
    extends _$ProjectFilterItemCopyWithImpl<$Res, _$ProjectFilterItemImpl>
    implements _$$ProjectFilterItemImplCopyWith<$Res> {
  __$$ProjectFilterItemImplCopyWithImpl(_$ProjectFilterItemImpl _value,
      $Res Function(_$ProjectFilterItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
  }) {
    return _then(_$ProjectFilterItemImpl(
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
class _$ProjectFilterItemImpl implements _ProjectFilterItem {
  const _$ProjectFilterItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName});

  factory _$ProjectFilterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectFilterItemImplFromJson(json);

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
    return 'ProjectFilterItem(id: $id, projectCode: $projectCode, projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFilterItemImpl &&
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
  _$$ProjectFilterItemImplCopyWith<_$ProjectFilterItemImpl> get copyWith =>
      __$$ProjectFilterItemImplCopyWithImpl<_$ProjectFilterItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectFilterItemImplToJson(
      this,
    );
  }
}

abstract class _ProjectFilterItem implements ProjectFilterItem {
  const factory _ProjectFilterItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName}) =
      _$ProjectFilterItemImpl;

  factory _ProjectFilterItem.fromJson(Map<String, dynamic> json) =
      _$ProjectFilterItemImpl.fromJson;

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
  _$$ProjectFilterItemImplCopyWith<_$ProjectFilterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmployeeFilterItem _$EmployeeFilterItemFromJson(Map<String, dynamic> json) {
  return _EmployeeFilterItem.fromJson(json);
}

/// @nodoc
mixin _$EmployeeFilterItem {
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
  $EmployeeFilterItemCopyWith<EmployeeFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeFilterItemCopyWith<$Res> {
  factory $EmployeeFilterItemCopyWith(
          EmployeeFilterItem value, $Res Function(EmployeeFilterItem) then) =
      _$EmployeeFilterItemCopyWithImpl<$Res, EmployeeFilterItem>;
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
class _$EmployeeFilterItemCopyWithImpl<$Res, $Val extends EmployeeFilterItem>
    implements $EmployeeFilterItemCopyWith<$Res> {
  _$EmployeeFilterItemCopyWithImpl(this._value, this._then);

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
abstract class _$$EmployeeFilterItemImplCopyWith<$Res>
    implements $EmployeeFilterItemCopyWith<$Res> {
  factory _$$EmployeeFilterItemImplCopyWith(_$EmployeeFilterItemImpl value,
          $Res Function(_$EmployeeFilterItemImpl) then) =
      __$$EmployeeFilterItemImplCopyWithImpl<$Res>;
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
class __$$EmployeeFilterItemImplCopyWithImpl<$Res>
    extends _$EmployeeFilterItemCopyWithImpl<$Res, _$EmployeeFilterItemImpl>
    implements _$$EmployeeFilterItemImplCopyWith<$Res> {
  __$$EmployeeFilterItemImplCopyWithImpl(_$EmployeeFilterItemImpl _value,
      $Res Function(_$EmployeeFilterItemImpl) _then)
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
    return _then(_$EmployeeFilterItemImpl(
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
class _$EmployeeFilterItemImpl implements _EmployeeFilterItem {
  const _$EmployeeFilterItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'UserID') this.userId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'SDTCaNhan') this.sdtCaNhan});

  factory _$EmployeeFilterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeFilterItemImplFromJson(json);

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
    return 'EmployeeFilterItem(id: $id, userId: $userId, code: $code, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName, sdtCaNhan: $sdtCaNhan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeFilterItemImpl &&
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
  _$$EmployeeFilterItemImplCopyWith<_$EmployeeFilterItemImpl> get copyWith =>
      __$$EmployeeFilterItemImplCopyWithImpl<_$EmployeeFilterItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeFilterItemImplToJson(
      this,
    );
  }
}

abstract class _EmployeeFilterItem implements EmployeeFilterItem {
  const factory _EmployeeFilterItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'UserID') final int? userId,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'SDTCaNhan') final String? sdtCaNhan}) =
      _$EmployeeFilterItemImpl;

  factory _EmployeeFilterItem.fromJson(Map<String, dynamic> json) =
      _$EmployeeFilterItemImpl.fromJson;

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
  _$$EmployeeFilterItemImplCopyWith<_$EmployeeFilterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProvinceFilterItem _$ProvinceFilterItemFromJson(Map<String, dynamic> json) {
  return _ProvinceFilterItem.fromJson(json);
}

/// @nodoc
mixin _$ProvinceFilterItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceName')
  String? get provinceName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProvinceFilterItemCopyWith<ProvinceFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceFilterItemCopyWith<$Res> {
  factory $ProvinceFilterItemCopyWith(
          ProvinceFilterItem value, $Res Function(ProvinceFilterItem) then) =
      _$ProvinceFilterItemCopyWithImpl<$Res, ProvinceFilterItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProvinceName') String? provinceName});
}

/// @nodoc
class _$ProvinceFilterItemCopyWithImpl<$Res, $Val extends ProvinceFilterItem>
    implements $ProvinceFilterItemCopyWith<$Res> {
  _$ProvinceFilterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? provinceName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvinceFilterItemImplCopyWith<$Res>
    implements $ProvinceFilterItemCopyWith<$Res> {
  factory _$$ProvinceFilterItemImplCopyWith(_$ProvinceFilterItemImpl value,
          $Res Function(_$ProvinceFilterItemImpl) then) =
      __$$ProvinceFilterItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'ProvinceName') String? provinceName});
}

/// @nodoc
class __$$ProvinceFilterItemImplCopyWithImpl<$Res>
    extends _$ProvinceFilterItemCopyWithImpl<$Res, _$ProvinceFilterItemImpl>
    implements _$$ProvinceFilterItemImplCopyWith<$Res> {
  __$$ProvinceFilterItemImplCopyWithImpl(_$ProvinceFilterItemImpl _value,
      $Res Function(_$ProvinceFilterItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? provinceName = freezed,
  }) {
    return _then(_$ProvinceFilterItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceFilterItemImpl implements _ProvinceFilterItem {
  const _$ProvinceFilterItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'ProvinceName') this.provinceName});

  factory _$ProvinceFilterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceFilterItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'ProvinceName')
  final String? provinceName;

  @override
  String toString() {
    return 'ProvinceFilterItem(id: $id, provinceName: $provinceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceFilterItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, provinceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceFilterItemImplCopyWith<_$ProvinceFilterItemImpl> get copyWith =>
      __$$ProvinceFilterItemImplCopyWithImpl<_$ProvinceFilterItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceFilterItemImplToJson(
      this,
    );
  }
}

abstract class _ProvinceFilterItem implements ProvinceFilterItem {
  const factory _ProvinceFilterItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'ProvinceName') final String? provinceName}) =
      _$ProvinceFilterItemImpl;

  factory _ProvinceFilterItem.fromJson(Map<String, dynamic> json) =
      _$ProvinceFilterItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'ProvinceName')
  String? get provinceName;
  @override
  @JsonKey(ignore: true)
  _$$ProvinceFilterItemImplCopyWith<_$ProvinceFilterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingGuestHouseDetailItem _$BookingGuestHouseDetailItemFromJson(
    Map<String, dynamic> json) {
  return _BookingGuestHouseDetailItem.fromJson(json);
}

/// @nodoc
mixin _$BookingGuestHouseDetailItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'AccommodationBookingID')
  int? get accommodationBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingGuestHouseDetailItemCopyWith<BookingGuestHouseDetailItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingGuestHouseDetailItemCopyWith<$Res> {
  factory $BookingGuestHouseDetailItemCopyWith(
          BookingGuestHouseDetailItem value,
          $Res Function(BookingGuestHouseDetailItem) then) =
      _$BookingGuestHouseDetailItemCopyWithImpl<$Res,
          BookingGuestHouseDetailItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'PhoneNumber') String? phoneNumber,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'EmployeeCode') String? employeeCode});
}

/// @nodoc
class _$BookingGuestHouseDetailItemCopyWithImpl<$Res,
        $Val extends BookingGuestHouseDetailItem>
    implements $BookingGuestHouseDetailItemCopyWith<$Res> {
  _$BookingGuestHouseDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accommodationBookingId = freezed,
    Object? employeeId = freezed,
    Object? phoneNumber = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? note = freezed,
    Object? employeeCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accommodationBookingId: freezed == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingGuestHouseDetailItemImplCopyWith<$Res>
    implements $BookingGuestHouseDetailItemCopyWith<$Res> {
  factory _$$BookingGuestHouseDetailItemImplCopyWith(
          _$BookingGuestHouseDetailItemImpl value,
          $Res Function(_$BookingGuestHouseDetailItemImpl) then) =
      __$$BookingGuestHouseDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'PhoneNumber') String? phoneNumber,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'EmployeeCode') String? employeeCode});
}

/// @nodoc
class __$$BookingGuestHouseDetailItemImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseDetailItemCopyWithImpl<$Res,
        _$BookingGuestHouseDetailItemImpl>
    implements _$$BookingGuestHouseDetailItemImplCopyWith<$Res> {
  __$$BookingGuestHouseDetailItemImplCopyWithImpl(
      _$BookingGuestHouseDetailItemImpl _value,
      $Res Function(_$BookingGuestHouseDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accommodationBookingId = freezed,
    Object? employeeId = freezed,
    Object? phoneNumber = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? note = freezed,
    Object? employeeCode = freezed,
  }) {
    return _then(_$BookingGuestHouseDetailItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accommodationBookingId: freezed == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingGuestHouseDetailItemImpl
    implements _BookingGuestHouseDetailItem {
  const _$BookingGuestHouseDetailItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'AccommodationBookingID') this.accommodationBookingId,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'PhoneNumber') this.phoneNumber,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'EmployeeCode') this.employeeCode});

  factory _$BookingGuestHouseDetailItemImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BookingGuestHouseDetailItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'AccommodationBookingID')
  final int? accommodationBookingId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'EmployeeCode')
  final String? employeeCode;

  @override
  String toString() {
    return 'BookingGuestHouseDetailItem(id: $id, accommodationBookingId: $accommodationBookingId, employeeId: $employeeId, phoneNumber: $phoneNumber, fullName: $fullName, departmentName: $departmentName, note: $note, employeeCode: $employeeCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingGuestHouseDetailItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accommodationBookingId, accommodationBookingId) ||
                other.accommodationBookingId == accommodationBookingId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.employeeCode, employeeCode) ||
                other.employeeCode == employeeCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, accommodationBookingId,
      employeeId, phoneNumber, fullName, departmentName, note, employeeCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingGuestHouseDetailItemImplCopyWith<_$BookingGuestHouseDetailItemImpl>
      get copyWith => __$$BookingGuestHouseDetailItemImplCopyWithImpl<
          _$BookingGuestHouseDetailItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingGuestHouseDetailItemImplToJson(
      this,
    );
  }
}

abstract class _BookingGuestHouseDetailItem
    implements BookingGuestHouseDetailItem {
  const factory _BookingGuestHouseDetailItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'AccommodationBookingID')
          final int? accommodationBookingId,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'PhoneNumber') final String? phoneNumber,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'EmployeeCode') final String? employeeCode}) =
      _$BookingGuestHouseDetailItemImpl;

  factory _BookingGuestHouseDetailItem.fromJson(Map<String, dynamic> json) =
      _$BookingGuestHouseDetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'AccommodationBookingID')
  int? get accommodationBookingId;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode;
  @override
  @JsonKey(ignore: true)
  _$$BookingGuestHouseDetailItemImplCopyWith<_$BookingGuestHouseDetailItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AccommodationBookingPayload _$AccommodationBookingPayloadFromJson(
    Map<String, dynamic> json) {
  return _AccommodationBookingPayload.fromJson(json);
}

/// @nodoc
mixin _$AccommodationBookingPayload {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterID')
  int? get registerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceID')
  int? get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBP')
  int? get approvedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'SpecificDestinationAddress')
  String? get specificDestinationAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccommodationBookingPayloadCopyWith<AccommodationBookingPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccommodationBookingPayloadCopyWith<$Res> {
  factory $AccommodationBookingPayloadCopyWith(
          AccommodationBookingPayload value,
          $Res Function(AccommodationBookingPayload) then) =
      _$AccommodationBookingPayloadCopyWithImpl<$Res,
          AccommodationBookingPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterID') int? registerId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ProvinceID') int? provinceId,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ApprovedTBP') int? approvedTBP,
      @JsonKey(name: 'SpecificDestinationAddress')
      String? specificDestinationAddress,
      @JsonKey(name: 'Address') String? address});
}

/// @nodoc
class _$AccommodationBookingPayloadCopyWithImpl<$Res,
        $Val extends AccommodationBookingPayload>
    implements $AccommodationBookingPayloadCopyWith<$Res> {
  _$AccommodationBookingPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerId = freezed,
    Object? projectId = freezed,
    Object? provinceId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? note = freezed,
    Object? approvedTBP = freezed,
    Object? specificDestinationAddress = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerId: freezed == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      approvedTBP: freezed == approvedTBP
          ? _value.approvedTBP
          : approvedTBP // ignore: cast_nullable_to_non_nullable
              as int?,
      specificDestinationAddress: freezed == specificDestinationAddress
          ? _value.specificDestinationAddress
          : specificDestinationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccommodationBookingPayloadImplCopyWith<$Res>
    implements $AccommodationBookingPayloadCopyWith<$Res> {
  factory _$$AccommodationBookingPayloadImplCopyWith(
          _$AccommodationBookingPayloadImpl value,
          $Res Function(_$AccommodationBookingPayloadImpl) then) =
      __$$AccommodationBookingPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'RegisterID') int? registerId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ProvinceID') int? provinceId,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ApprovedTBP') int? approvedTBP,
      @JsonKey(name: 'SpecificDestinationAddress')
      String? specificDestinationAddress,
      @JsonKey(name: 'Address') String? address});
}

/// @nodoc
class __$$AccommodationBookingPayloadImplCopyWithImpl<$Res>
    extends _$AccommodationBookingPayloadCopyWithImpl<$Res,
        _$AccommodationBookingPayloadImpl>
    implements _$$AccommodationBookingPayloadImplCopyWith<$Res> {
  __$$AccommodationBookingPayloadImplCopyWithImpl(
      _$AccommodationBookingPayloadImpl _value,
      $Res Function(_$AccommodationBookingPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registerId = freezed,
    Object? projectId = freezed,
    Object? provinceId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? note = freezed,
    Object? approvedTBP = freezed,
    Object? specificDestinationAddress = freezed,
    Object? address = freezed,
  }) {
    return _then(_$AccommodationBookingPayloadImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registerId: freezed == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      approvedTBP: freezed == approvedTBP
          ? _value.approvedTBP
          : approvedTBP // ignore: cast_nullable_to_non_nullable
              as int?,
      specificDestinationAddress: freezed == specificDestinationAddress
          ? _value.specificDestinationAddress
          : specificDestinationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccommodationBookingPayloadImpl
    implements _AccommodationBookingPayload {
  const _$AccommodationBookingPayloadImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'RegisterID') this.registerId,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'ProvinceID') this.provinceId,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'ApprovedTBP') this.approvedTBP,
      @JsonKey(name: 'SpecificDestinationAddress')
      this.specificDestinationAddress,
      @JsonKey(name: 'Address') this.address});

  factory _$AccommodationBookingPayloadImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccommodationBookingPayloadImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'RegisterID')
  final int? registerId;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
  @override
  @JsonKey(name: 'ProvinceID')
  final int? provinceId;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'ApprovedTBP')
  final int? approvedTBP;
  @override
  @JsonKey(name: 'SpecificDestinationAddress')
  final String? specificDestinationAddress;
  @override
  @JsonKey(name: 'Address')
  final String? address;

  @override
  String toString() {
    return 'AccommodationBookingPayload(id: $id, registerId: $registerId, projectId: $projectId, provinceId: $provinceId, startDate: $startDate, endDate: $endDate, note: $note, approvedTBP: $approvedTBP, specificDestinationAddress: $specificDestinationAddress, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccommodationBookingPayloadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerId, registerId) ||
                other.registerId == registerId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.approvedTBP, approvedTBP) ||
                other.approvedTBP == approvedTBP) &&
            (identical(other.specificDestinationAddress,
                    specificDestinationAddress) ||
                other.specificDestinationAddress ==
                    specificDestinationAddress) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      registerId,
      projectId,
      provinceId,
      startDate,
      endDate,
      note,
      approvedTBP,
      specificDestinationAddress,
      address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccommodationBookingPayloadImplCopyWith<_$AccommodationBookingPayloadImpl>
      get copyWith => __$$AccommodationBookingPayloadImplCopyWithImpl<
          _$AccommodationBookingPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccommodationBookingPayloadImplToJson(
      this,
    );
  }
}

abstract class _AccommodationBookingPayload
    implements AccommodationBookingPayload {
  const factory _AccommodationBookingPayload(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'RegisterID') final int? registerId,
          @JsonKey(name: 'ProjectID') final int? projectId,
          @JsonKey(name: 'ProvinceID') final int? provinceId,
          @JsonKey(name: 'StartDate') final DateTime? startDate,
          @JsonKey(name: 'EndDate') final DateTime? endDate,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'ApprovedTBP') final int? approvedTBP,
          @JsonKey(name: 'SpecificDestinationAddress')
          final String? specificDestinationAddress,
          @JsonKey(name: 'Address') final String? address}) =
      _$AccommodationBookingPayloadImpl;

  factory _AccommodationBookingPayload.fromJson(Map<String, dynamic> json) =
      _$AccommodationBookingPayloadImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'RegisterID')
  int? get registerId;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override
  @JsonKey(name: 'ProvinceID')
  int? get provinceId;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'ApprovedTBP')
  int? get approvedTBP;
  @override
  @JsonKey(name: 'SpecificDestinationAddress')
  String? get specificDestinationAddress;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$AccommodationBookingPayloadImplCopyWith<_$AccommodationBookingPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookingGuestHouseDetailData _$BookingGuestHouseDetailDataFromJson(
    Map<String, dynamic> json) {
  return _BookingGuestHouseDetailData.fromJson(json);
}

/// @nodoc
mixin _$BookingGuestHouseDetailData {
  @JsonKey(name: 'accommodationBooking')
  BookingDetail get info => throw _privateConstructorUsedError;
  @JsonKey(name: 'accommodationBookingDetail')
  List<BookingDetailPerson> get persons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingGuestHouseDetailDataCopyWith<BookingGuestHouseDetailData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingGuestHouseDetailDataCopyWith<$Res> {
  factory $BookingGuestHouseDetailDataCopyWith(
          BookingGuestHouseDetailData value,
          $Res Function(BookingGuestHouseDetailData) then) =
      _$BookingGuestHouseDetailDataCopyWithImpl<$Res,
          BookingGuestHouseDetailData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'accommodationBooking') BookingDetail info,
      @JsonKey(name: 'accommodationBookingDetail')
      List<BookingDetailPerson> persons});

  $BookingDetailCopyWith<$Res> get info;
}

/// @nodoc
class _$BookingGuestHouseDetailDataCopyWithImpl<$Res,
        $Val extends BookingGuestHouseDetailData>
    implements $BookingGuestHouseDetailDataCopyWith<$Res> {
  _$BookingGuestHouseDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? persons = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as BookingDetail,
      persons: null == persons
          ? _value.persons
          : persons // ignore: cast_nullable_to_non_nullable
              as List<BookingDetailPerson>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookingDetailCopyWith<$Res> get info {
    return $BookingDetailCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingGuestHouseDetailDataImplCopyWith<$Res>
    implements $BookingGuestHouseDetailDataCopyWith<$Res> {
  factory _$$BookingGuestHouseDetailDataImplCopyWith(
          _$BookingGuestHouseDetailDataImpl value,
          $Res Function(_$BookingGuestHouseDetailDataImpl) then) =
      __$$BookingGuestHouseDetailDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'accommodationBooking') BookingDetail info,
      @JsonKey(name: 'accommodationBookingDetail')
      List<BookingDetailPerson> persons});

  @override
  $BookingDetailCopyWith<$Res> get info;
}

/// @nodoc
class __$$BookingGuestHouseDetailDataImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseDetailDataCopyWithImpl<$Res,
        _$BookingGuestHouseDetailDataImpl>
    implements _$$BookingGuestHouseDetailDataImplCopyWith<$Res> {
  __$$BookingGuestHouseDetailDataImplCopyWithImpl(
      _$BookingGuestHouseDetailDataImpl _value,
      $Res Function(_$BookingGuestHouseDetailDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? persons = null,
  }) {
    return _then(_$BookingGuestHouseDetailDataImpl(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as BookingDetail,
      persons: null == persons
          ? _value._persons
          : persons // ignore: cast_nullable_to_non_nullable
              as List<BookingDetailPerson>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingGuestHouseDetailDataImpl
    implements _BookingGuestHouseDetailData {
  const _$BookingGuestHouseDetailDataImpl(
      {@JsonKey(name: 'accommodationBooking') required this.info,
      @JsonKey(name: 'accommodationBookingDetail')
      required final List<BookingDetailPerson> persons})
      : _persons = persons;

  factory _$BookingGuestHouseDetailDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BookingGuestHouseDetailDataImplFromJson(json);

  @override
  @JsonKey(name: 'accommodationBooking')
  final BookingDetail info;
  final List<BookingDetailPerson> _persons;
  @override
  @JsonKey(name: 'accommodationBookingDetail')
  List<BookingDetailPerson> get persons {
    if (_persons is EqualUnmodifiableListView) return _persons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_persons);
  }

  @override
  String toString() {
    return 'BookingGuestHouseDetailData(info: $info, persons: $persons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingGuestHouseDetailDataImpl &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._persons, _persons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_persons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingGuestHouseDetailDataImplCopyWith<_$BookingGuestHouseDetailDataImpl>
      get copyWith => __$$BookingGuestHouseDetailDataImplCopyWithImpl<
          _$BookingGuestHouseDetailDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingGuestHouseDetailDataImplToJson(
      this,
    );
  }
}

abstract class _BookingGuestHouseDetailData
    implements BookingGuestHouseDetailData {
  const factory _BookingGuestHouseDetailData(
      {@JsonKey(name: 'accommodationBooking') required final BookingDetail info,
      @JsonKey(name: 'accommodationBookingDetail')
      required final List<BookingDetailPerson>
          persons}) = _$BookingGuestHouseDetailDataImpl;

  factory _BookingGuestHouseDetailData.fromJson(Map<String, dynamic> json) =
      _$BookingGuestHouseDetailDataImpl.fromJson;

  @override
  @JsonKey(name: 'accommodationBooking')
  BookingDetail get info;
  @override
  @JsonKey(name: 'accommodationBookingDetail')
  List<BookingDetailPerson> get persons;
  @override
  @JsonKey(ignore: true)
  _$$BookingGuestHouseDetailDataImplCopyWith<_$BookingGuestHouseDetailDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookingDetail _$BookingDetailFromJson(Map<String, dynamic> json) {
  return _BookingDetail.fromJson(json);
}

/// @nodoc
mixin _$BookingDetail {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterID')
  int? get registerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceID')
  int? get provinceId => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBP')
  int? get approvedTBP => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBPDate')
  DateTime? get approvedTBPDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDetailCopyWith<BookingDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDetailCopyWith<$Res> {
  factory $BookingDetailCopyWith(
          BookingDetail value, $Res Function(BookingDetail) then) =
      _$BookingDetailCopyWithImpl<$Res, BookingDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'RegisterID') int? registerId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ProvinceID') int? provinceId,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'ApprovedTBP') int? approvedTBP,
      @JsonKey(name: 'ApprovedTBPDate') DateTime? approvedTBPDate});
}

/// @nodoc
class _$BookingDetailCopyWithImpl<$Res, $Val extends BookingDetail>
    implements $BookingDetailCopyWith<$Res> {
  _$BookingDetailCopyWithImpl(this._value, this._then);

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
    Object? provinceId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? note = freezed,
    Object? address = freezed,
    Object? isApprovedTBP = freezed,
    Object? approvedTBP = freezed,
    Object? approvedTBPDate = freezed,
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
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedTBP: freezed == approvedTBP
          ? _value.approvedTBP
          : approvedTBP // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedTBPDate: freezed == approvedTBPDate
          ? _value.approvedTBPDate
          : approvedTBPDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDetailImplCopyWith<$Res>
    implements $BookingDetailCopyWith<$Res> {
  factory _$$BookingDetailImplCopyWith(
          _$BookingDetailImpl value, $Res Function(_$BookingDetailImpl) then) =
      __$$BookingDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'RegisterID') int? registerId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ProvinceID') int? provinceId,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
      @JsonKey(name: 'ApprovedTBP') int? approvedTBP,
      @JsonKey(name: 'ApprovedTBPDate') DateTime? approvedTBPDate});
}

/// @nodoc
class __$$BookingDetailImplCopyWithImpl<$Res>
    extends _$BookingDetailCopyWithImpl<$Res, _$BookingDetailImpl>
    implements _$$BookingDetailImplCopyWith<$Res> {
  __$$BookingDetailImplCopyWithImpl(
      _$BookingDetailImpl _value, $Res Function(_$BookingDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? registerId = freezed,
    Object? projectId = freezed,
    Object? provinceId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? note = freezed,
    Object? address = freezed,
    Object? isApprovedTBP = freezed,
    Object? approvedTBP = freezed,
    Object? approvedTBPDate = freezed,
  }) {
    return _then(_$BookingDetailImpl(
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
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedTBP: freezed == isApprovedTBP
          ? _value.isApprovedTBP
          : isApprovedTBP // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedTBP: freezed == approvedTBP
          ? _value.approvedTBP
          : approvedTBP // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedTBPDate: freezed == approvedTBPDate
          ? _value.approvedTBPDate
          : approvedTBPDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDetailImpl implements _BookingDetail {
  const _$BookingDetailImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'RegisterID') this.registerId,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'ProvinceID') this.provinceId,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTBP,
      @JsonKey(name: 'ApprovedTBP') this.approvedTBP,
      @JsonKey(name: 'ApprovedTBPDate') this.approvedTBPDate});

  factory _$BookingDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDetailImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'RegisterID')
  final int? registerId;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
  @override
  @JsonKey(name: 'ProvinceID')
  final int? provinceId;
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
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'Address')
  final String? address;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  final bool? isApprovedTBP;
  @override
  @JsonKey(name: 'ApprovedTBP')
  final int? approvedTBP;
  @override
  @JsonKey(name: 'ApprovedTBPDate')
  final DateTime? approvedTBPDate;

  @override
  String toString() {
    return 'BookingDetail(id: $id, registerId: $registerId, projectId: $projectId, provinceId: $provinceId, startDate: $startDate, endDate: $endDate, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, note: $note, address: $address, isApprovedTBP: $isApprovedTBP, approvedTBP: $approvedTBP, approvedTBPDate: $approvedTBPDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registerId, registerId) ||
                other.registerId == registerId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
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
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isApprovedTBP, isApprovedTBP) ||
                other.isApprovedTBP == isApprovedTBP) &&
            (identical(other.approvedTBP, approvedTBP) ||
                other.approvedTBP == approvedTBP) &&
            (identical(other.approvedTBPDate, approvedTBPDate) ||
                other.approvedTBPDate == approvedTBPDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      registerId,
      projectId,
      provinceId,
      startDate,
      endDate,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      isDeleted,
      note,
      address,
      isApprovedTBP,
      approvedTBP,
      approvedTBPDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDetailImplCopyWith<_$BookingDetailImpl> get copyWith =>
      __$$BookingDetailImplCopyWithImpl<_$BookingDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDetailImplToJson(
      this,
    );
  }
}

abstract class _BookingDetail implements BookingDetail {
  const factory _BookingDetail(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'RegisterID') final int? registerId,
          @JsonKey(name: 'ProjectID') final int? projectId,
          @JsonKey(name: 'ProvinceID') final int? provinceId,
          @JsonKey(name: 'StartDate') final DateTime? startDate,
          @JsonKey(name: 'EndDate') final DateTime? endDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'Address') final String? address,
          @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTBP,
          @JsonKey(name: 'ApprovedTBP') final int? approvedTBP,
          @JsonKey(name: 'ApprovedTBPDate') final DateTime? approvedTBPDate}) =
      _$BookingDetailImpl;

  factory _BookingDetail.fromJson(Map<String, dynamic> json) =
      _$BookingDetailImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'RegisterID')
  int? get registerId;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override
  @JsonKey(name: 'ProvinceID')
  int? get provinceId;
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
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTBP;
  @override
  @JsonKey(name: 'ApprovedTBP')
  int? get approvedTBP;
  @override
  @JsonKey(name: 'ApprovedTBPDate')
  DateTime? get approvedTBPDate;
  @override
  @JsonKey(ignore: true)
  _$$BookingDetailImplCopyWith<_$BookingDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingDetailPerson _$BookingDetailPersonFromJson(Map<String, dynamic> json) {
  return _BookingDetailPerson.fromJson(json);
}

/// @nodoc
mixin _$BookingDetailPerson {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'AccommodationBookingID')
  int? get accommodationBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  dynamic get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDetailPersonCopyWith<BookingDetailPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDetailPersonCopyWith<$Res> {
  factory $BookingDetailPersonCopyWith(
          BookingDetailPerson value, $Res Function(BookingDetailPerson) then) =
      _$BookingDetailPersonCopyWithImpl<$Res, BookingDetailPerson>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'PhoneNumber') dynamic phoneNumber,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'EmployeeCode') String? employeeCode});
}

/// @nodoc
class _$BookingDetailPersonCopyWithImpl<$Res, $Val extends BookingDetailPerson>
    implements $BookingDetailPersonCopyWith<$Res> {
  _$BookingDetailPersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accommodationBookingId = freezed,
    Object? employeeId = freezed,
    Object? phoneNumber = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? note = freezed,
    Object? employeeCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accommodationBookingId: freezed == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDetailPersonImplCopyWith<$Res>
    implements $BookingDetailPersonCopyWith<$Res> {
  factory _$$BookingDetailPersonImplCopyWith(_$BookingDetailPersonImpl value,
          $Res Function(_$BookingDetailPersonImpl) then) =
      __$$BookingDetailPersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'PhoneNumber') dynamic phoneNumber,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'EmployeeCode') String? employeeCode});
}

/// @nodoc
class __$$BookingDetailPersonImplCopyWithImpl<$Res>
    extends _$BookingDetailPersonCopyWithImpl<$Res, _$BookingDetailPersonImpl>
    implements _$$BookingDetailPersonImplCopyWith<$Res> {
  __$$BookingDetailPersonImplCopyWithImpl(_$BookingDetailPersonImpl _value,
      $Res Function(_$BookingDetailPersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accommodationBookingId = freezed,
    Object? employeeId = freezed,
    Object? phoneNumber = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? fullName = freezed,
    Object? departmentName = freezed,
    Object? note = freezed,
    Object? employeeCode = freezed,
  }) {
    return _then(_$BookingDetailPersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accommodationBookingId: freezed == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCode: freezed == employeeCode
          ? _value.employeeCode
          : employeeCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDetailPersonImpl implements _BookingDetailPerson {
  const _$BookingDetailPersonImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'AccommodationBookingID') this.accommodationBookingId,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'PhoneNumber') this.phoneNumber,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'EmployeeCode') this.employeeCode});

  factory _$BookingDetailPersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDetailPersonImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'AccommodationBookingID')
  final int? accommodationBookingId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'PhoneNumber')
  final dynamic phoneNumber;
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
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'EmployeeCode')
  final String? employeeCode;

  @override
  String toString() {
    return 'BookingDetailPerson(id: $id, accommodationBookingId: $accommodationBookingId, employeeId: $employeeId, phoneNumber: $phoneNumber, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, fullName: $fullName, departmentName: $departmentName, note: $note, employeeCode: $employeeCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDetailPersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accommodationBookingId, accommodationBookingId) ||
                other.accommodationBookingId == accommodationBookingId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
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
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.employeeCode, employeeCode) ||
                other.employeeCode == employeeCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accommodationBookingId,
      employeeId,
      const DeepCollectionEquality().hash(phoneNumber),
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      isDeleted,
      fullName,
      departmentName,
      note,
      employeeCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDetailPersonImplCopyWith<_$BookingDetailPersonImpl> get copyWith =>
      __$$BookingDetailPersonImplCopyWithImpl<_$BookingDetailPersonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDetailPersonImplToJson(
      this,
    );
  }
}

abstract class _BookingDetailPerson implements BookingDetailPerson {
  const factory _BookingDetailPerson(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'AccommodationBookingID')
          final int? accommodationBookingId,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'PhoneNumber') final dynamic phoneNumber,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'EmployeeCode') final String? employeeCode}) =
      _$BookingDetailPersonImpl;

  factory _BookingDetailPerson.fromJson(Map<String, dynamic> json) =
      _$BookingDetailPersonImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'AccommodationBookingID')
  int? get accommodationBookingId;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'PhoneNumber')
  dynamic get phoneNumber;
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
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'EmployeeCode')
  String? get employeeCode;
  @override
  @JsonKey(ignore: true)
  _$$BookingDetailPersonImplCopyWith<_$BookingDetailPersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingGuestHouseSaveResponse _$BookingGuestHouseSaveResponseFromJson(
    Map<String, dynamic> json) {
  return _BookingGuestHouseSaveResponse.fromJson(json);
}

/// @nodoc
mixin _$BookingGuestHouseSaveResponse {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingGuestHouseSaveResponseCopyWith<BookingGuestHouseSaveResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingGuestHouseSaveResponseCopyWith<$Res> {
  factory $BookingGuestHouseSaveResponseCopyWith(
          BookingGuestHouseSaveResponse value,
          $Res Function(BookingGuestHouseSaveResponse) then) =
      _$BookingGuestHouseSaveResponseCopyWithImpl<$Res,
          BookingGuestHouseSaveResponse>;
  @useResult
  $Res call({@JsonKey(name: 'ID') int? id});
}

/// @nodoc
class _$BookingGuestHouseSaveResponseCopyWithImpl<$Res,
        $Val extends BookingGuestHouseSaveResponse>
    implements $BookingGuestHouseSaveResponseCopyWith<$Res> {
  _$BookingGuestHouseSaveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingGuestHouseSaveResponseImplCopyWith<$Res>
    implements $BookingGuestHouseSaveResponseCopyWith<$Res> {
  factory _$$BookingGuestHouseSaveResponseImplCopyWith(
          _$BookingGuestHouseSaveResponseImpl value,
          $Res Function(_$BookingGuestHouseSaveResponseImpl) then) =
      __$$BookingGuestHouseSaveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'ID') int? id});
}

/// @nodoc
class __$$BookingGuestHouseSaveResponseImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseSaveResponseCopyWithImpl<$Res,
        _$BookingGuestHouseSaveResponseImpl>
    implements _$$BookingGuestHouseSaveResponseImplCopyWith<$Res> {
  __$$BookingGuestHouseSaveResponseImplCopyWithImpl(
      _$BookingGuestHouseSaveResponseImpl _value,
      $Res Function(_$BookingGuestHouseSaveResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$BookingGuestHouseSaveResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingGuestHouseSaveResponseImpl
    implements _BookingGuestHouseSaveResponse {
  const _$BookingGuestHouseSaveResponseImpl({@JsonKey(name: 'ID') this.id});

  factory _$BookingGuestHouseSaveResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BookingGuestHouseSaveResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;

  @override
  String toString() {
    return 'BookingGuestHouseSaveResponse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingGuestHouseSaveResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingGuestHouseSaveResponseImplCopyWith<
          _$BookingGuestHouseSaveResponseImpl>
      get copyWith => __$$BookingGuestHouseSaveResponseImplCopyWithImpl<
          _$BookingGuestHouseSaveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingGuestHouseSaveResponseImplToJson(
      this,
    );
  }
}

abstract class _BookingGuestHouseSaveResponse
    implements BookingGuestHouseSaveResponse {
  const factory _BookingGuestHouseSaveResponse(
          {@JsonKey(name: 'ID') final int? id}) =
      _$BookingGuestHouseSaveResponseImpl;

  factory _BookingGuestHouseSaveResponse.fromJson(Map<String, dynamic> json) =
      _$BookingGuestHouseSaveResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$BookingGuestHouseSaveResponseImplCopyWith<
          _$BookingGuestHouseSaveResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
