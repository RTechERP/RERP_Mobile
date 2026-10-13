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
  @JsonKey(name: 'AccommodationBookingPaymentOrderID')
  int? get accommodationBookingPaymentOrderId =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'AccommodationBookingID')
  int? get accommodationBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DetailStatus')
  int? get detailStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError; // Người đăng ký
  @JsonKey(name: 'RecipientName')
  String? get recipientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegisterFullName')
  String? get registerFullName =>
      throw _privateConstructorUsedError; // Ngân hàng
  @JsonKey(name: 'BankAccount')
  String? get bankAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'BankName')
  String? get bankName =>
      throw _privateConstructorUsedError; // Khách sạn / công ty / phòng ban
  @JsonKey(name: 'HotelName')
  String? get hotelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName')
  String? get companyName => throw _privateConstructorUsedError; // Tiền
  @JsonKey(name: 'TotalAmount')
  double? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalAmountWithInvoice')
  double? get totalAmountWithInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoiceNumber')
  String? get invoiceNumber => throw _privateConstructorUsedError; // Audit
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubmitDate')
  DateTime? get submitDate => throw _privateConstructorUsedError; // Thời gian ở
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate => throw _privateConstructorUsedError; // Loại
  @JsonKey(name: 'Type')
  String? get type => throw _privateConstructorUsedError; // Files đính kèm
  @JsonKey(name: 'Files')
  List<ApproveBookingFile>? get files => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'AccommodationBookingPaymentOrderID')
      int? accommodationBookingPaymentOrderId,
      @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
      @JsonKey(name: 'DetailStatus') int? detailStatus,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'RecipientName') String? recipientName,
      @JsonKey(name: 'RegisterFullName') String? registerFullName,
      @JsonKey(name: 'BankAccount') String? bankAccount,
      @JsonKey(name: 'BankName') String? bankName,
      @JsonKey(name: 'HotelName') String? hotelName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'TotalAmount') double? totalAmount,
      @JsonKey(name: 'TotalAmountWithInvoice') double? totalAmountWithInvoice,
      @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'SubmitDate') DateTime? submitDate,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'Files') List<ApproveBookingFile>? files});
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
    Object? accommodationBookingPaymentOrderId = freezed,
    Object? accommodationBookingId = freezed,
    Object? detailStatus = freezed,
    Object? reason = freezed,
    Object? recipientName = freezed,
    Object? registerFullName = freezed,
    Object? bankAccount = freezed,
    Object? bankName = freezed,
    Object? hotelName = freezed,
    Object? departmentName = freezed,
    Object? companyName = freezed,
    Object? totalAmount = freezed,
    Object? totalAmountWithInvoice = freezed,
    Object? invoiceNumber = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? submitDate = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? type = freezed,
    Object? files = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accommodationBookingPaymentOrderId: freezed ==
              accommodationBookingPaymentOrderId
          ? _value.accommodationBookingPaymentOrderId
          : accommodationBookingPaymentOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      accommodationBookingId: freezed == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      detailStatus: freezed == detailStatus
          ? _value.detailStatus
          : detailStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      registerFullName: freezed == registerFullName
          ? _value.registerFullName
          : registerFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      hotelName: freezed == hotelName
          ? _value.hotelName
          : hotelName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountWithInvoice: freezed == totalAmountWithInvoice
          ? _value.totalAmountWithInvoice
          : totalAmountWithInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      submitDate: freezed == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<ApproveBookingFile>?,
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
      @JsonKey(name: 'AccommodationBookingPaymentOrderID')
      int? accommodationBookingPaymentOrderId,
      @JsonKey(name: 'AccommodationBookingID') int? accommodationBookingId,
      @JsonKey(name: 'DetailStatus') int? detailStatus,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'RecipientName') String? recipientName,
      @JsonKey(name: 'RegisterFullName') String? registerFullName,
      @JsonKey(name: 'BankAccount') String? bankAccount,
      @JsonKey(name: 'BankName') String? bankName,
      @JsonKey(name: 'HotelName') String? hotelName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'TotalAmount') double? totalAmount,
      @JsonKey(name: 'TotalAmountWithInvoice') double? totalAmountWithInvoice,
      @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'SubmitDate') DateTime? submitDate,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'Files') List<ApproveBookingFile>? files});
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
    Object? accommodationBookingPaymentOrderId = freezed,
    Object? accommodationBookingId = freezed,
    Object? detailStatus = freezed,
    Object? reason = freezed,
    Object? recipientName = freezed,
    Object? registerFullName = freezed,
    Object? bankAccount = freezed,
    Object? bankName = freezed,
    Object? hotelName = freezed,
    Object? departmentName = freezed,
    Object? companyName = freezed,
    Object? totalAmount = freezed,
    Object? totalAmountWithInvoice = freezed,
    Object? invoiceNumber = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? submitDate = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? type = freezed,
    Object? files = freezed,
  }) {
    return _then(_$ApproveBookingGuestHouseItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accommodationBookingPaymentOrderId: freezed ==
              accommodationBookingPaymentOrderId
          ? _value.accommodationBookingPaymentOrderId
          : accommodationBookingPaymentOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      accommodationBookingId: freezed == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      detailStatus: freezed == detailStatus
          ? _value.detailStatus
          : detailStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      registerFullName: freezed == registerFullName
          ? _value.registerFullName
          : registerFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      hotelName: freezed == hotelName
          ? _value.hotelName
          : hotelName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountWithInvoice: freezed == totalAmountWithInvoice
          ? _value.totalAmountWithInvoice
          : totalAmountWithInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      submitDate: freezed == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<ApproveBookingFile>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingGuestHouseItemImpl
    implements _ApproveBookingGuestHouseItem {
  const _$ApproveBookingGuestHouseItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'AccommodationBookingPaymentOrderID')
      this.accommodationBookingPaymentOrderId,
      @JsonKey(name: 'AccommodationBookingID') this.accommodationBookingId,
      @JsonKey(name: 'DetailStatus') this.detailStatus,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'RecipientName') this.recipientName,
      @JsonKey(name: 'RegisterFullName') this.registerFullName,
      @JsonKey(name: 'BankAccount') this.bankAccount,
      @JsonKey(name: 'BankName') this.bankName,
      @JsonKey(name: 'HotelName') this.hotelName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'CompanyName') this.companyName,
      @JsonKey(name: 'TotalAmount') this.totalAmount,
      @JsonKey(name: 'TotalAmountWithInvoice') this.totalAmountWithInvoice,
      @JsonKey(name: 'InvoiceNumber') this.invoiceNumber,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'SubmitDate') this.submitDate,
      @JsonKey(name: 'CheckInDate') this.checkInDate,
      @JsonKey(name: 'CheckOutDate') this.checkOutDate,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'Files') final List<ApproveBookingFile>? files})
      : _files = files;

  factory _$ApproveBookingGuestHouseItemImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApproveBookingGuestHouseItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'AccommodationBookingPaymentOrderID')
  final int? accommodationBookingPaymentOrderId;
  @override
  @JsonKey(name: 'AccommodationBookingID')
  final int? accommodationBookingId;
  @override
  @JsonKey(name: 'DetailStatus')
  final int? detailStatus;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
// Người đăng ký
  @override
  @JsonKey(name: 'RecipientName')
  final String? recipientName;
  @override
  @JsonKey(name: 'RegisterFullName')
  final String? registerFullName;
// Ngân hàng
  @override
  @JsonKey(name: 'BankAccount')
  final String? bankAccount;
  @override
  @JsonKey(name: 'BankName')
  final String? bankName;
// Khách sạn / công ty / phòng ban
  @override
  @JsonKey(name: 'HotelName')
  final String? hotelName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'CompanyName')
  final String? companyName;
// Tiền
  @override
  @JsonKey(name: 'TotalAmount')
  final double? totalAmount;
  @override
  @JsonKey(name: 'TotalAmountWithInvoice')
  final double? totalAmountWithInvoice;
  @override
  @JsonKey(name: 'InvoiceNumber')
  final String? invoiceNumber;
// Audit
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'SubmitDate')
  final DateTime? submitDate;
// Thời gian ở
  @override
  @JsonKey(name: 'CheckInDate')
  final DateTime? checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  final DateTime? checkOutDate;
// Loại
  @override
  @JsonKey(name: 'Type')
  final String? type;
// Files đính kèm
  final List<ApproveBookingFile>? _files;
// Files đính kèm
  @override
  @JsonKey(name: 'Files')
  List<ApproveBookingFile>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ApproveBookingGuestHouseItem(id: $id, accommodationBookingPaymentOrderId: $accommodationBookingPaymentOrderId, accommodationBookingId: $accommodationBookingId, detailStatus: $detailStatus, reason: $reason, recipientName: $recipientName, registerFullName: $registerFullName, bankAccount: $bankAccount, bankName: $bankName, hotelName: $hotelName, departmentName: $departmentName, companyName: $companyName, totalAmount: $totalAmount, totalAmountWithInvoice: $totalAmountWithInvoice, invoiceNumber: $invoiceNumber, createdBy: $createdBy, createdDate: $createdDate, submitDate: $submitDate, checkInDate: $checkInDate, checkOutDate: $checkOutDate, type: $type, files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingGuestHouseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accommodationBookingPaymentOrderId,
                    accommodationBookingPaymentOrderId) ||
                other.accommodationBookingPaymentOrderId ==
                    accommodationBookingPaymentOrderId) &&
            (identical(other.accommodationBookingId, accommodationBookingId) ||
                other.accommodationBookingId == accommodationBookingId) &&
            (identical(other.detailStatus, detailStatus) ||
                other.detailStatus == detailStatus) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.registerFullName, registerFullName) ||
                other.registerFullName == registerFullName) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.hotelName, hotelName) ||
                other.hotelName == hotelName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalAmountWithInvoice, totalAmountWithInvoice) ||
                other.totalAmountWithInvoice == totalAmountWithInvoice) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.submitDate, submitDate) ||
                other.submitDate == submitDate) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        accommodationBookingPaymentOrderId,
        accommodationBookingId,
        detailStatus,
        reason,
        recipientName,
        registerFullName,
        bankAccount,
        bankName,
        hotelName,
        departmentName,
        companyName,
        totalAmount,
        totalAmountWithInvoice,
        invoiceNumber,
        createdBy,
        createdDate,
        submitDate,
        checkInDate,
        checkOutDate,
        type,
        const DeepCollectionEquality().hash(_files)
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
          @JsonKey(name: 'AccommodationBookingPaymentOrderID')
          final int? accommodationBookingPaymentOrderId,
          @JsonKey(name: 'AccommodationBookingID')
          final int? accommodationBookingId,
          @JsonKey(name: 'DetailStatus') final int? detailStatus,
          @JsonKey(name: 'Reason') final String? reason,
          @JsonKey(name: 'RecipientName') final String? recipientName,
          @JsonKey(name: 'RegisterFullName') final String? registerFullName,
          @JsonKey(name: 'BankAccount') final String? bankAccount,
          @JsonKey(name: 'BankName') final String? bankName,
          @JsonKey(name: 'HotelName') final String? hotelName,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'CompanyName') final String? companyName,
          @JsonKey(name: 'TotalAmount') final double? totalAmount,
          @JsonKey(name: 'TotalAmountWithInvoice')
          final double? totalAmountWithInvoice,
          @JsonKey(name: 'InvoiceNumber') final String? invoiceNumber,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'SubmitDate') final DateTime? submitDate,
          @JsonKey(name: 'CheckInDate') final DateTime? checkInDate,
          @JsonKey(name: 'CheckOutDate') final DateTime? checkOutDate,
          @JsonKey(name: 'Type') final String? type,
          @JsonKey(name: 'Files') final List<ApproveBookingFile>? files}) =
      _$ApproveBookingGuestHouseItemImpl;

  factory _ApproveBookingGuestHouseItem.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingGuestHouseItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'AccommodationBookingPaymentOrderID')
  int? get accommodationBookingPaymentOrderId;
  @override
  @JsonKey(name: 'AccommodationBookingID')
  int? get accommodationBookingId;
  @override
  @JsonKey(name: 'DetailStatus')
  int? get detailStatus;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override // Người đăng ký
  @JsonKey(name: 'RecipientName')
  String? get recipientName;
  @override
  @JsonKey(name: 'RegisterFullName')
  String? get registerFullName;
  @override // Ngân hàng
  @JsonKey(name: 'BankAccount')
  String? get bankAccount;
  @override
  @JsonKey(name: 'BankName')
  String? get bankName;
  @override // Khách sạn / công ty / phòng ban
  @JsonKey(name: 'HotelName')
  String? get hotelName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'CompanyName')
  String? get companyName;
  @override // Tiền
  @JsonKey(name: 'TotalAmount')
  double? get totalAmount;
  @override
  @JsonKey(name: 'TotalAmountWithInvoice')
  double? get totalAmountWithInvoice;
  @override
  @JsonKey(name: 'InvoiceNumber')
  String? get invoiceNumber;
  @override // Audit
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'SubmitDate')
  DateTime? get submitDate;
  @override // Thời gian ở
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate;
  @override // Loại
  @JsonKey(name: 'Type')
  String? get type;
  @override // Files đính kèm
  @JsonKey(name: 'Files')
  List<ApproveBookingFile>? get files;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingGuestHouseItemImplCopyWith<
          _$ApproveBookingGuestHouseItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingFile _$ApproveBookingFileFromJson(Map<String, dynamic> json) {
  return _ApproveBookingFile.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingFile {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileType')
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Url')
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingFileCopyWith<ApproveBookingFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingFileCopyWith<$Res> {
  factory $ApproveBookingFileCopyWith(
          ApproveBookingFile value, $Res Function(ApproveBookingFile) then) =
      _$ApproveBookingFileCopyWithImpl<$Res, ApproveBookingFile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'Url') String? url});
}

/// @nodoc
class _$ApproveBookingFileCopyWithImpl<$Res, $Val extends ApproveBookingFile>
    implements $ApproveBookingFileCopyWith<$Res> {
  _$ApproveBookingFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileName = freezed,
    Object? fileType = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingFileImplCopyWith<$Res>
    implements $ApproveBookingFileCopyWith<$Res> {
  factory _$$ApproveBookingFileImplCopyWith(_$ApproveBookingFileImpl value,
          $Res Function(_$ApproveBookingFileImpl) then) =
      __$$ApproveBookingFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'Url') String? url});
}

/// @nodoc
class __$$ApproveBookingFileImplCopyWithImpl<$Res>
    extends _$ApproveBookingFileCopyWithImpl<$Res, _$ApproveBookingFileImpl>
    implements _$$ApproveBookingFileImplCopyWith<$Res> {
  __$$ApproveBookingFileImplCopyWithImpl(_$ApproveBookingFileImpl _value,
      $Res Function(_$ApproveBookingFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileName = freezed,
    Object? fileType = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ApproveBookingFileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingFileImpl implements _ApproveBookingFile {
  const _$ApproveBookingFileImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'FileType') this.fileType,
      @JsonKey(name: 'Url') this.url});

  factory _$ApproveBookingFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveBookingFileImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'FileType')
  final String? fileType;
  @override
  @JsonKey(name: 'Url')
  final String? url;

  @override
  String toString() {
    return 'ApproveBookingFile(id: $id, fileName: $fileName, fileType: $fileType, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, fileType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingFileImplCopyWith<_$ApproveBookingFileImpl> get copyWith =>
      __$$ApproveBookingFileImplCopyWithImpl<_$ApproveBookingFileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingFileImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingFile implements ApproveBookingFile {
  const factory _ApproveBookingFile(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'FileName') final String? fileName,
      @JsonKey(name: 'FileType') final String? fileType,
      @JsonKey(name: 'Url') final String? url}) = _$ApproveBookingFileImpl;

  factory _ApproveBookingFile.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingFileImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'FileName')
  String? get fileName;
  @override
  @JsonKey(name: 'FileType')
  String? get fileType;
  @override
  @JsonKey(name: 'Url')
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingFileImplCopyWith<_$ApproveBookingFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
