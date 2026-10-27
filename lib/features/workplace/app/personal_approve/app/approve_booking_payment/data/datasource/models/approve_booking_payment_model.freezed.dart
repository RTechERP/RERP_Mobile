// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_booking_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApproveBookingPaymentStep _$ApproveBookingPaymentStepFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentStep.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentStep {
  @JsonKey(name: 'Step')
  int? get step => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'StepName')
  String? get stepName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApproverID')
  int? get approverId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentStepCopyWith<ApproveBookingPaymentStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentStepCopyWith<$Res> {
  factory $ApproveBookingPaymentStepCopyWith(ApproveBookingPaymentStep value,
          $Res Function(ApproveBookingPaymentStep) then) =
      _$ApproveBookingPaymentStepCopyWithImpl<$Res, ApproveBookingPaymentStep>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'StepName') String? stepName,
      @JsonKey(name: 'ApproverID') int? approverId});
}

/// @nodoc
class _$ApproveBookingPaymentStepCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentStep>
    implements $ApproveBookingPaymentStepCopyWith<$Res> {
  _$ApproveBookingPaymentStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? code = freezed,
    Object? stepName = freezed,
    Object? approverId = freezed,
  }) {
    return _then(_value.copyWith(
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      stepName: freezed == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String?,
      approverId: freezed == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentStepImplCopyWith<$Res>
    implements $ApproveBookingPaymentStepCopyWith<$Res> {
  factory _$$ApproveBookingPaymentStepImplCopyWith(
          _$ApproveBookingPaymentStepImpl value,
          $Res Function(_$ApproveBookingPaymentStepImpl) then) =
      __$$ApproveBookingPaymentStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'StepName') String? stepName,
      @JsonKey(name: 'ApproverID') int? approverId});
}

/// @nodoc
class __$$ApproveBookingPaymentStepImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentStepCopyWithImpl<$Res,
        _$ApproveBookingPaymentStepImpl>
    implements _$$ApproveBookingPaymentStepImplCopyWith<$Res> {
  __$$ApproveBookingPaymentStepImplCopyWithImpl(
      _$ApproveBookingPaymentStepImpl _value,
      $Res Function(_$ApproveBookingPaymentStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? code = freezed,
    Object? stepName = freezed,
    Object? approverId = freezed,
  }) {
    return _then(_$ApproveBookingPaymentStepImpl(
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      stepName: freezed == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String?,
      approverId: freezed == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentStepImpl implements _ApproveBookingPaymentStep {
  const _$ApproveBookingPaymentStepImpl(
      {@JsonKey(name: 'Step') this.step,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'StepName') this.stepName,
      @JsonKey(name: 'ApproverID') this.approverId});

  factory _$ApproveBookingPaymentStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentStepImplFromJson(json);

  @override
  @JsonKey(name: 'Step')
  final int? step;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'StepName')
  final String? stepName;
  @override
  @JsonKey(name: 'ApproverID')
  final int? approverId;

  @override
  String toString() {
    return 'ApproveBookingPaymentStep(step: $step, code: $code, stepName: $stepName, approverId: $approverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentStepImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.stepName, stepName) ||
                other.stepName == stepName) &&
            (identical(other.approverId, approverId) ||
                other.approverId == approverId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, step, code, stepName, approverId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentStepImplCopyWith<_$ApproveBookingPaymentStepImpl>
      get copyWith => __$$ApproveBookingPaymentStepImplCopyWithImpl<
          _$ApproveBookingPaymentStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentStepImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentStep implements ApproveBookingPaymentStep {
  const factory _ApproveBookingPaymentStep(
          {@JsonKey(name: 'Step') final int? step,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'StepName') final String? stepName,
          @JsonKey(name: 'ApproverID') final int? approverId}) =
      _$ApproveBookingPaymentStepImpl;

  factory _ApproveBookingPaymentStep.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentStepImpl.fromJson;

  @override
  @JsonKey(name: 'Step')
  int? get step;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'StepName')
  String? get stepName;
  @override
  @JsonKey(name: 'ApproverID')
  int? get approverId;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentStepImplCopyWith<_$ApproveBookingPaymentStepImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingPaymentItem _$ApproveBookingPaymentItemFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentItem.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentType')
  String? get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeName')
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeOrder')
  int? get typeOrder => throw _privateConstructorUsedError; // Người tạo
  @JsonKey(name: 'CreatedByEmployeeID')
  int? get createdByEmployeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError; // Tiền
  @JsonKey(name: 'TotalMoney')
  double? get totalMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalMoneyWithInvoice')
  double? get totalMoneyWithInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalAmountBeforeVAT')
  double? get totalAmountBeforeVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPayment')
  double? get totalPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeadlinePayment')
  DateTime? get deadlinePayment =>
      throw _privateConstructorUsedError; // Bước duyệt hiện tại
  @JsonKey(name: 'CurrentStep')
  int? get currentStep => throw _privateConstructorUsedError;
  @JsonKey(name: 'CurrentStepName')
  String? get currentStepName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CurrentStepCode')
  String? get currentStepCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CurrentStepIsApproved')
  int? get currentStepIsApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastApproverName')
  String? get lastApproverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastApprovedDate')
  DateTime? get lastApprovedDate =>
      throw _privateConstructorUsedError; // Ghi chú của kế toán thanh toán (KTTT) và kế toán trưởng (KTT)
  @JsonKey(name: 'NoteKTTT')
  String? get noteKttt => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoteKTT')
  String? get noteKtt =>
      throw _privateConstructorUsedError; // Phân trang (BE lặp lại trên từng dòng)
  @JsonKey(name: 'TotalRows')
  int? get totalRows => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPage')
  int? get totalPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentItemCopyWith<ApproveBookingPaymentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentItemCopyWith<$Res> {
  factory $ApproveBookingPaymentItemCopyWith(ApproveBookingPaymentItem value,
          $Res Function(ApproveBookingPaymentItem) then) =
      _$ApproveBookingPaymentItemCopyWithImpl<$Res, ApproveBookingPaymentItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'PaymentType') String? paymentType,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'TypeOrder') int? typeOrder,
      @JsonKey(name: 'CreatedByEmployeeID') int? createdByEmployeeId,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'TotalMoney') double? totalMoney,
      @JsonKey(name: 'TotalMoneyWithInvoice') double? totalMoneyWithInvoice,
      @JsonKey(name: 'TotalAmountBeforeVAT') double? totalAmountBeforeVat,
      @JsonKey(name: 'TotalPayment') double? totalPayment,
      @JsonKey(name: 'DeadlinePayment') DateTime? deadlinePayment,
      @JsonKey(name: 'CurrentStep') int? currentStep,
      @JsonKey(name: 'CurrentStepName') String? currentStepName,
      @JsonKey(name: 'CurrentStepCode') String? currentStepCode,
      @JsonKey(name: 'CurrentStepIsApproved') int? currentStepIsApproved,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'LastApproverName') String? lastApproverName,
      @JsonKey(name: 'LastApprovedDate') DateTime? lastApprovedDate,
      @JsonKey(name: 'NoteKTTT') String? noteKttt,
      @JsonKey(name: 'NoteKTT') String? noteKtt,
      @JsonKey(name: 'TotalRows') int? totalRows,
      @JsonKey(name: 'TotalPage') int? totalPage});
}

/// @nodoc
class _$ApproveBookingPaymentItemCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentItem>
    implements $ApproveBookingPaymentItemCopyWith<$Res> {
  _$ApproveBookingPaymentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? paymentType = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? reasonCancel = freezed,
    Object? typeName = freezed,
    Object? typeOrder = freezed,
    Object? createdByEmployeeId = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? totalMoney = freezed,
    Object? totalMoneyWithInvoice = freezed,
    Object? totalAmountBeforeVat = freezed,
    Object? totalPayment = freezed,
    Object? deadlinePayment = freezed,
    Object? currentStep = freezed,
    Object? currentStepName = freezed,
    Object? currentStepCode = freezed,
    Object? currentStepIsApproved = freezed,
    Object? isApprovedText = freezed,
    Object? lastApproverName = freezed,
    Object? lastApprovedDate = freezed,
    Object? noteKttt = freezed,
    Object? noteKtt = freezed,
    Object? totalRows = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      typeOrder: freezed == typeOrder
          ? _value.typeOrder
          : typeOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByEmployeeId: freezed == createdByEmployeeId
          ? _value.createdByEmployeeId
          : createdByEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      totalMoney: freezed == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMoneyWithInvoice: freezed == totalMoneyWithInvoice
          ? _value.totalMoneyWithInvoice
          : totalMoneyWithInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountBeforeVat: freezed == totalAmountBeforeVat
          ? _value.totalAmountBeforeVat
          : totalAmountBeforeVat // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPayment: freezed == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double?,
      deadlinePayment: freezed == deadlinePayment
          ? _value.deadlinePayment
          : deadlinePayment // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStepName: freezed == currentStepName
          ? _value.currentStepName
          : currentStepName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStepCode: freezed == currentStepCode
          ? _value.currentStepCode
          : currentStepCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStepIsApproved: freezed == currentStepIsApproved
          ? _value.currentStepIsApproved
          : currentStepIsApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      lastApproverName: freezed == lastApproverName
          ? _value.lastApproverName
          : lastApproverName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastApprovedDate: freezed == lastApprovedDate
          ? _value.lastApprovedDate
          : lastApprovedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noteKttt: freezed == noteKttt
          ? _value.noteKttt
          : noteKttt // ignore: cast_nullable_to_non_nullable
              as String?,
      noteKtt: freezed == noteKtt
          ? _value.noteKtt
          : noteKtt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRows: freezed == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentItemImplCopyWith<$Res>
    implements $ApproveBookingPaymentItemCopyWith<$Res> {
  factory _$$ApproveBookingPaymentItemImplCopyWith(
          _$ApproveBookingPaymentItemImpl value,
          $Res Function(_$ApproveBookingPaymentItemImpl) then) =
      __$$ApproveBookingPaymentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'PaymentType') String? paymentType,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'TypeOrder') int? typeOrder,
      @JsonKey(name: 'CreatedByEmployeeID') int? createdByEmployeeId,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'TotalMoney') double? totalMoney,
      @JsonKey(name: 'TotalMoneyWithInvoice') double? totalMoneyWithInvoice,
      @JsonKey(name: 'TotalAmountBeforeVAT') double? totalAmountBeforeVat,
      @JsonKey(name: 'TotalPayment') double? totalPayment,
      @JsonKey(name: 'DeadlinePayment') DateTime? deadlinePayment,
      @JsonKey(name: 'CurrentStep') int? currentStep,
      @JsonKey(name: 'CurrentStepName') String? currentStepName,
      @JsonKey(name: 'CurrentStepCode') String? currentStepCode,
      @JsonKey(name: 'CurrentStepIsApproved') int? currentStepIsApproved,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'LastApproverName') String? lastApproverName,
      @JsonKey(name: 'LastApprovedDate') DateTime? lastApprovedDate,
      @JsonKey(name: 'NoteKTTT') String? noteKttt,
      @JsonKey(name: 'NoteKTT') String? noteKtt,
      @JsonKey(name: 'TotalRows') int? totalRows,
      @JsonKey(name: 'TotalPage') int? totalPage});
}

/// @nodoc
class __$$ApproveBookingPaymentItemImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentItemCopyWithImpl<$Res,
        _$ApproveBookingPaymentItemImpl>
    implements _$$ApproveBookingPaymentItemImplCopyWith<$Res> {
  __$$ApproveBookingPaymentItemImplCopyWithImpl(
      _$ApproveBookingPaymentItemImpl _value,
      $Res Function(_$ApproveBookingPaymentItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? paymentType = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? reasonCancel = freezed,
    Object? typeName = freezed,
    Object? typeOrder = freezed,
    Object? createdByEmployeeId = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? totalMoney = freezed,
    Object? totalMoneyWithInvoice = freezed,
    Object? totalAmountBeforeVat = freezed,
    Object? totalPayment = freezed,
    Object? deadlinePayment = freezed,
    Object? currentStep = freezed,
    Object? currentStepName = freezed,
    Object? currentStepCode = freezed,
    Object? currentStepIsApproved = freezed,
    Object? isApprovedText = freezed,
    Object? lastApproverName = freezed,
    Object? lastApprovedDate = freezed,
    Object? noteKttt = freezed,
    Object? noteKtt = freezed,
    Object? totalRows = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_$ApproveBookingPaymentItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      typeOrder: freezed == typeOrder
          ? _value.typeOrder
          : typeOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByEmployeeId: freezed == createdByEmployeeId
          ? _value.createdByEmployeeId
          : createdByEmployeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      totalMoney: freezed == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMoneyWithInvoice: freezed == totalMoneyWithInvoice
          ? _value.totalMoneyWithInvoice
          : totalMoneyWithInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountBeforeVat: freezed == totalAmountBeforeVat
          ? _value.totalAmountBeforeVat
          : totalAmountBeforeVat // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPayment: freezed == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double?,
      deadlinePayment: freezed == deadlinePayment
          ? _value.deadlinePayment
          : deadlinePayment // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStepName: freezed == currentStepName
          ? _value.currentStepName
          : currentStepName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStepCode: freezed == currentStepCode
          ? _value.currentStepCode
          : currentStepCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStepIsApproved: freezed == currentStepIsApproved
          ? _value.currentStepIsApproved
          : currentStepIsApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      lastApproverName: freezed == lastApproverName
          ? _value.lastApproverName
          : lastApproverName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastApprovedDate: freezed == lastApprovedDate
          ? _value.lastApprovedDate
          : lastApprovedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noteKttt: freezed == noteKttt
          ? _value.noteKttt
          : noteKttt // ignore: cast_nullable_to_non_nullable
              as String?,
      noteKtt: freezed == noteKtt
          ? _value.noteKtt
          : noteKtt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRows: freezed == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentItemImpl implements _ApproveBookingPaymentItem {
  const _$ApproveBookingPaymentItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'PaymentType') this.paymentType,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'ReasonCancel') this.reasonCancel,
      @JsonKey(name: 'TypeName') this.typeName,
      @JsonKey(name: 'TypeOrder') this.typeOrder,
      @JsonKey(name: 'CreatedByEmployeeID') this.createdByEmployeeId,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'TotalMoney') this.totalMoney,
      @JsonKey(name: 'TotalMoneyWithInvoice') this.totalMoneyWithInvoice,
      @JsonKey(name: 'TotalAmountBeforeVAT') this.totalAmountBeforeVat,
      @JsonKey(name: 'TotalPayment') this.totalPayment,
      @JsonKey(name: 'DeadlinePayment') this.deadlinePayment,
      @JsonKey(name: 'CurrentStep') this.currentStep,
      @JsonKey(name: 'CurrentStepName') this.currentStepName,
      @JsonKey(name: 'CurrentStepCode') this.currentStepCode,
      @JsonKey(name: 'CurrentStepIsApproved') this.currentStepIsApproved,
      @JsonKey(name: 'IsApprovedText') this.isApprovedText,
      @JsonKey(name: 'LastApproverName') this.lastApproverName,
      @JsonKey(name: 'LastApprovedDate') this.lastApprovedDate,
      @JsonKey(name: 'NoteKTTT') this.noteKttt,
      @JsonKey(name: 'NoteKTT') this.noteKtt,
      @JsonKey(name: 'TotalRows') this.totalRows,
      @JsonKey(name: 'TotalPage') this.totalPage});

  factory _$ApproveBookingPaymentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'PaymentType')
  final String? paymentType;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'ReasonCancel')
  final String? reasonCancel;
  @override
  @JsonKey(name: 'TypeName')
  final String? typeName;
  @override
  @JsonKey(name: 'TypeOrder')
  final int? typeOrder;
// Người tạo
  @override
  @JsonKey(name: 'CreatedByEmployeeID')
  final int? createdByEmployeeId;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
// Tiền
  @override
  @JsonKey(name: 'TotalMoney')
  final double? totalMoney;
  @override
  @JsonKey(name: 'TotalMoneyWithInvoice')
  final double? totalMoneyWithInvoice;
  @override
  @JsonKey(name: 'TotalAmountBeforeVAT')
  final double? totalAmountBeforeVat;
  @override
  @JsonKey(name: 'TotalPayment')
  final double? totalPayment;
  @override
  @JsonKey(name: 'DeadlinePayment')
  final DateTime? deadlinePayment;
// Bước duyệt hiện tại
  @override
  @JsonKey(name: 'CurrentStep')
  final int? currentStep;
  @override
  @JsonKey(name: 'CurrentStepName')
  final String? currentStepName;
  @override
  @JsonKey(name: 'CurrentStepCode')
  final String? currentStepCode;
  @override
  @JsonKey(name: 'CurrentStepIsApproved')
  final int? currentStepIsApproved;
  @override
  @JsonKey(name: 'IsApprovedText')
  final String? isApprovedText;
  @override
  @JsonKey(name: 'LastApproverName')
  final String? lastApproverName;
  @override
  @JsonKey(name: 'LastApprovedDate')
  final DateTime? lastApprovedDate;
// Ghi chú của kế toán thanh toán (KTTT) và kế toán trưởng (KTT)
  @override
  @JsonKey(name: 'NoteKTTT')
  final String? noteKttt;
  @override
  @JsonKey(name: 'NoteKTT')
  final String? noteKtt;
// Phân trang (BE lặp lại trên từng dòng)
  @override
  @JsonKey(name: 'TotalRows')
  final int? totalRows;
  @override
  @JsonKey(name: 'TotalPage')
  final int? totalPage;

  @override
  String toString() {
    return 'ApproveBookingPaymentItem(id: $id, code: $code, paymentType: $paymentType, status: $status, reason: $reason, reasonCancel: $reasonCancel, typeName: $typeName, typeOrder: $typeOrder, createdByEmployeeId: $createdByEmployeeId, createdBy: $createdBy, createdDate: $createdDate, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName, totalMoney: $totalMoney, totalMoneyWithInvoice: $totalMoneyWithInvoice, totalAmountBeforeVat: $totalAmountBeforeVat, totalPayment: $totalPayment, deadlinePayment: $deadlinePayment, currentStep: $currentStep, currentStepName: $currentStepName, currentStepCode: $currentStepCode, currentStepIsApproved: $currentStepIsApproved, isApprovedText: $isApprovedText, lastApproverName: $lastApproverName, lastApprovedDate: $lastApprovedDate, noteKttt: $noteKttt, noteKtt: $noteKtt, totalRows: $totalRows, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.reasonCancel, reasonCancel) ||
                other.reasonCancel == reasonCancel) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.typeOrder, typeOrder) ||
                other.typeOrder == typeOrder) &&
            (identical(other.createdByEmployeeId, createdByEmployeeId) ||
                other.createdByEmployeeId == createdByEmployeeId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.totalMoney, totalMoney) ||
                other.totalMoney == totalMoney) &&
            (identical(other.totalMoneyWithInvoice, totalMoneyWithInvoice) ||
                other.totalMoneyWithInvoice == totalMoneyWithInvoice) &&
            (identical(other.totalAmountBeforeVat, totalAmountBeforeVat) ||
                other.totalAmountBeforeVat == totalAmountBeforeVat) &&
            (identical(other.totalPayment, totalPayment) ||
                other.totalPayment == totalPayment) &&
            (identical(other.deadlinePayment, deadlinePayment) ||
                other.deadlinePayment == deadlinePayment) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.currentStepName, currentStepName) ||
                other.currentStepName == currentStepName) &&
            (identical(other.currentStepCode, currentStepCode) ||
                other.currentStepCode == currentStepCode) &&
            (identical(other.currentStepIsApproved, currentStepIsApproved) ||
                other.currentStepIsApproved == currentStepIsApproved) &&
            (identical(other.isApprovedText, isApprovedText) ||
                other.isApprovedText == isApprovedText) &&
            (identical(other.lastApproverName, lastApproverName) ||
                other.lastApproverName == lastApproverName) &&
            (identical(other.lastApprovedDate, lastApprovedDate) ||
                other.lastApprovedDate == lastApprovedDate) &&
            (identical(other.noteKttt, noteKttt) ||
                other.noteKttt == noteKttt) &&
            (identical(other.noteKtt, noteKtt) || other.noteKtt == noteKtt) &&
            (identical(other.totalRows, totalRows) ||
                other.totalRows == totalRows) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        code,
        paymentType,
        status,
        reason,
        reasonCancel,
        typeName,
        typeOrder,
        createdByEmployeeId,
        createdBy,
        createdDate,
        fullName,
        departmentId,
        departmentName,
        totalMoney,
        totalMoneyWithInvoice,
        totalAmountBeforeVat,
        totalPayment,
        deadlinePayment,
        currentStep,
        currentStepName,
        currentStepCode,
        currentStepIsApproved,
        isApprovedText,
        lastApproverName,
        lastApprovedDate,
        noteKttt,
        noteKtt,
        totalRows,
        totalPage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentItemImplCopyWith<_$ApproveBookingPaymentItemImpl>
      get copyWith => __$$ApproveBookingPaymentItemImplCopyWithImpl<
          _$ApproveBookingPaymentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentItemImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentItem implements ApproveBookingPaymentItem {
  const factory _ApproveBookingPaymentItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'PaymentType') final String? paymentType,
      @JsonKey(name: 'Status') final int? status,
      @JsonKey(name: 'Reason') final String? reason,
      @JsonKey(name: 'ReasonCancel') final String? reasonCancel,
      @JsonKey(name: 'TypeName') final String? typeName,
      @JsonKey(name: 'TypeOrder') final int? typeOrder,
      @JsonKey(name: 'CreatedByEmployeeID') final int? createdByEmployeeId,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'DepartmentID') final int? departmentId,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'TotalMoney') final double? totalMoney,
      @JsonKey(name: 'TotalMoneyWithInvoice')
      final double? totalMoneyWithInvoice,
      @JsonKey(name: 'TotalAmountBeforeVAT') final double? totalAmountBeforeVat,
      @JsonKey(name: 'TotalPayment') final double? totalPayment,
      @JsonKey(name: 'DeadlinePayment') final DateTime? deadlinePayment,
      @JsonKey(name: 'CurrentStep') final int? currentStep,
      @JsonKey(name: 'CurrentStepName') final String? currentStepName,
      @JsonKey(name: 'CurrentStepCode') final String? currentStepCode,
      @JsonKey(name: 'CurrentStepIsApproved') final int? currentStepIsApproved,
      @JsonKey(name: 'IsApprovedText') final String? isApprovedText,
      @JsonKey(name: 'LastApproverName') final String? lastApproverName,
      @JsonKey(name: 'LastApprovedDate') final DateTime? lastApprovedDate,
      @JsonKey(name: 'NoteKTTT') final String? noteKttt,
      @JsonKey(name: 'NoteKTT') final String? noteKtt,
      @JsonKey(name: 'TotalRows') final int? totalRows,
      @JsonKey(name: 'TotalPage')
      final int? totalPage}) = _$ApproveBookingPaymentItemImpl;

  factory _ApproveBookingPaymentItem.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'PaymentType')
  String? get paymentType;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel;
  @override
  @JsonKey(name: 'TypeName')
  String? get typeName;
  @override
  @JsonKey(name: 'TypeOrder')
  int? get typeOrder;
  @override // Người tạo
  @JsonKey(name: 'CreatedByEmployeeID')
  int? get createdByEmployeeId;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override // Tiền
  @JsonKey(name: 'TotalMoney')
  double? get totalMoney;
  @override
  @JsonKey(name: 'TotalMoneyWithInvoice')
  double? get totalMoneyWithInvoice;
  @override
  @JsonKey(name: 'TotalAmountBeforeVAT')
  double? get totalAmountBeforeVat;
  @override
  @JsonKey(name: 'TotalPayment')
  double? get totalPayment;
  @override
  @JsonKey(name: 'DeadlinePayment')
  DateTime? get deadlinePayment;
  @override // Bước duyệt hiện tại
  @JsonKey(name: 'CurrentStep')
  int? get currentStep;
  @override
  @JsonKey(name: 'CurrentStepName')
  String? get currentStepName;
  @override
  @JsonKey(name: 'CurrentStepCode')
  String? get currentStepCode;
  @override
  @JsonKey(name: 'CurrentStepIsApproved')
  int? get currentStepIsApproved;
  @override
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText;
  @override
  @JsonKey(name: 'LastApproverName')
  String? get lastApproverName;
  @override
  @JsonKey(name: 'LastApprovedDate')
  DateTime? get lastApprovedDate;
  @override // Ghi chú của kế toán thanh toán (KTTT) và kế toán trưởng (KTT)
  @JsonKey(name: 'NoteKTTT')
  String? get noteKttt;
  @override
  @JsonKey(name: 'NoteKTT')
  String? get noteKtt;
  @override // Phân trang (BE lặp lại trên từng dòng)
  @JsonKey(name: 'TotalRows')
  int? get totalRows;
  @override
  @JsonKey(name: 'TotalPage')
  int? get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentItemImplCopyWith<_$ApproveBookingPaymentItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingPaymentDepartment _$ApproveBookingPaymentDepartmentFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentDepartment.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentDepartment {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentDepartmentCopyWith<ApproveBookingPaymentDepartment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentDepartmentCopyWith<$Res> {
  factory $ApproveBookingPaymentDepartmentCopyWith(
          ApproveBookingPaymentDepartment value,
          $Res Function(ApproveBookingPaymentDepartment) then) =
      _$ApproveBookingPaymentDepartmentCopyWithImpl<$Res,
          ApproveBookingPaymentDepartment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class _$ApproveBookingPaymentDepartmentCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentDepartment>
    implements $ApproveBookingPaymentDepartmentCopyWith<$Res> {
  _$ApproveBookingPaymentDepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentDepartmentImplCopyWith<$Res>
    implements $ApproveBookingPaymentDepartmentCopyWith<$Res> {
  factory _$$ApproveBookingPaymentDepartmentImplCopyWith(
          _$ApproveBookingPaymentDepartmentImpl value,
          $Res Function(_$ApproveBookingPaymentDepartmentImpl) then) =
      __$$ApproveBookingPaymentDepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name});
}

/// @nodoc
class __$$ApproveBookingPaymentDepartmentImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentDepartmentCopyWithImpl<$Res,
        _$ApproveBookingPaymentDepartmentImpl>
    implements _$$ApproveBookingPaymentDepartmentImplCopyWith<$Res> {
  __$$ApproveBookingPaymentDepartmentImplCopyWithImpl(
      _$ApproveBookingPaymentDepartmentImpl _value,
      $Res Function(_$ApproveBookingPaymentDepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ApproveBookingPaymentDepartmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentDepartmentImpl
    implements _ApproveBookingPaymentDepartment {
  const _$ApproveBookingPaymentDepartmentImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name});

  factory _$ApproveBookingPaymentDepartmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentDepartmentImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;

  @override
  String toString() {
    return 'ApproveBookingPaymentDepartment(id: $id, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentDepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentDepartmentImplCopyWith<
          _$ApproveBookingPaymentDepartmentImpl>
      get copyWith => __$$ApproveBookingPaymentDepartmentImplCopyWithImpl<
          _$ApproveBookingPaymentDepartmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentDepartmentImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentDepartment
    implements ApproveBookingPaymentDepartment {
  const factory _ApproveBookingPaymentDepartment(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name}) =
      _$ApproveBookingPaymentDepartmentImpl;

  factory _ApproveBookingPaymentDepartment.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentDepartmentImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentDepartmentImplCopyWith<
          _$ApproveBookingPaymentDepartmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingPaymentEmployee _$ApproveBookingPaymentEmployeeFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentEmployee.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentEmployee {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentEmployeeCopyWith<ApproveBookingPaymentEmployee>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentEmployeeCopyWith<$Res> {
  factory $ApproveBookingPaymentEmployeeCopyWith(
          ApproveBookingPaymentEmployee value,
          $Res Function(ApproveBookingPaymentEmployee) then) =
      _$ApproveBookingPaymentEmployeeCopyWithImpl<$Res,
          ApproveBookingPaymentEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class _$ApproveBookingPaymentEmployeeCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentEmployee>
    implements $ApproveBookingPaymentEmployeeCopyWith<$Res> {
  _$ApproveBookingPaymentEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentEmployeeImplCopyWith<$Res>
    implements $ApproveBookingPaymentEmployeeCopyWith<$Res> {
  factory _$$ApproveBookingPaymentEmployeeImplCopyWith(
          _$ApproveBookingPaymentEmployeeImpl value,
          $Res Function(_$ApproveBookingPaymentEmployeeImpl) then) =
      __$$ApproveBookingPaymentEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class __$$ApproveBookingPaymentEmployeeImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentEmployeeCopyWithImpl<$Res,
        _$ApproveBookingPaymentEmployeeImpl>
    implements _$$ApproveBookingPaymentEmployeeImplCopyWith<$Res> {
  __$$ApproveBookingPaymentEmployeeImplCopyWithImpl(
      _$ApproveBookingPaymentEmployeeImpl _value,
      $Res Function(_$ApproveBookingPaymentEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_$ApproveBookingPaymentEmployeeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentEmployeeImpl
    implements _ApproveBookingPaymentEmployee {
  const _$ApproveBookingPaymentEmployeeImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentName') this.departmentName});

  factory _$ApproveBookingPaymentEmployeeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentEmployeeImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
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
  String toString() {
    return 'ApproveBookingPaymentEmployee(id: $id, code: $code, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentEmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, fullName, departmentId, departmentName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentEmployeeImplCopyWith<
          _$ApproveBookingPaymentEmployeeImpl>
      get copyWith => __$$ApproveBookingPaymentEmployeeImplCopyWithImpl<
          _$ApproveBookingPaymentEmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentEmployeeImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentEmployee
    implements ApproveBookingPaymentEmployee {
  const factory _ApproveBookingPaymentEmployee(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'DepartmentName') final String? departmentName}) =
      _$ApproveBookingPaymentEmployeeImpl;

  factory _ApproveBookingPaymentEmployee.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentEmployeeImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
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
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentEmployeeImplCopyWith<
          _$ApproveBookingPaymentEmployeeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingPaymentFile _$ApproveBookingPaymentFileFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentFile.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentFile {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileType')
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileSize')
  int? get fileSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentFileCopyWith<ApproveBookingPaymentFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentFileCopyWith<$Res> {
  factory $ApproveBookingPaymentFileCopyWith(ApproveBookingPaymentFile value,
          $Res Function(ApproveBookingPaymentFile) then) =
      _$ApproveBookingPaymentFileCopyWithImpl<$Res, ApproveBookingPaymentFile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'Url') String? url,
      @JsonKey(name: 'FileSize') int? fileSize});
}

/// @nodoc
class _$ApproveBookingPaymentFileCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentFile>
    implements $ApproveBookingPaymentFileCopyWith<$Res> {
  _$ApproveBookingPaymentFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileType = freezed,
    Object? fileName = freezed,
    Object? url = freezed,
    Object? fileSize = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentFileImplCopyWith<$Res>
    implements $ApproveBookingPaymentFileCopyWith<$Res> {
  factory _$$ApproveBookingPaymentFileImplCopyWith(
          _$ApproveBookingPaymentFileImpl value,
          $Res Function(_$ApproveBookingPaymentFileImpl) then) =
      __$$ApproveBookingPaymentFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FileType') String? fileType,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'Url') String? url,
      @JsonKey(name: 'FileSize') int? fileSize});
}

/// @nodoc
class __$$ApproveBookingPaymentFileImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentFileCopyWithImpl<$Res,
        _$ApproveBookingPaymentFileImpl>
    implements _$$ApproveBookingPaymentFileImplCopyWith<$Res> {
  __$$ApproveBookingPaymentFileImplCopyWithImpl(
      _$ApproveBookingPaymentFileImpl _value,
      $Res Function(_$ApproveBookingPaymentFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileType = freezed,
    Object? fileName = freezed,
    Object? url = freezed,
    Object? fileSize = freezed,
  }) {
    return _then(_$ApproveBookingPaymentFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentFileImpl implements _ApproveBookingPaymentFile {
  const _$ApproveBookingPaymentFileImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'FileType') this.fileType,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'Url') this.url,
      @JsonKey(name: 'FileSize') this.fileSize});

  factory _$ApproveBookingPaymentFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentFileImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'FileType')
  final String? fileType;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'Url')
  final String? url;
  @override
  @JsonKey(name: 'FileSize')
  final int? fileSize;

  @override
  String toString() {
    return 'ApproveBookingPaymentFile(id: $id, fileType: $fileType, fileName: $fileName, url: $url, fileSize: $fileSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fileType, fileName, url, fileSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentFileImplCopyWith<_$ApproveBookingPaymentFileImpl>
      get copyWith => __$$ApproveBookingPaymentFileImplCopyWithImpl<
          _$ApproveBookingPaymentFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentFileImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentFile implements ApproveBookingPaymentFile {
  const factory _ApproveBookingPaymentFile(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'FileType') final String? fileType,
          @JsonKey(name: 'FileName') final String? fileName,
          @JsonKey(name: 'Url') final String? url,
          @JsonKey(name: 'FileSize') final int? fileSize}) =
      _$ApproveBookingPaymentFileImpl;

  factory _ApproveBookingPaymentFile.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentFileImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'FileType')
  String? get fileType;
  @override
  @JsonKey(name: 'FileName')
  String? get fileName;
  @override
  @JsonKey(name: 'Url')
  String? get url;
  @override
  @JsonKey(name: 'FileSize')
  int? get fileSize;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentFileImplCopyWith<_$ApproveBookingPaymentFileImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingPaymentDetailLine _$ApproveBookingPaymentDetailLineFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentDetailLine.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentDetailLine {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Files')
  List<ApproveBookingPaymentFile> get files =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'RecipientName')
  String? get recipientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartLocation')
  String? get startLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndLocation')
  String? get endLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'BankAccount')
  String? get bankAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'BankName')
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransferType')
  int? get transferType => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalAmount')
  double? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalAmountWithInvoice')
  double? get totalAmountWithInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'AmountBeforeVAT')
  double? get amountBeforeVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoiceNumber')
  String? get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransportCompanyName')
  String? get transportCompanyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransportCompanyTaxCode')
  String? get transportCompanyTaxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChunDongPhuongTien')
  bool? get isChunDongPhuongTien => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBill')
  bool? get isBill =>
      throw _privateConstructorUsedError; // Riêng phiếu Công tác phí (nhà nghỉ)
  @JsonKey(name: 'HotelName')
  String? get hotelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'HotelTaxCode')
  String? get hotelTaxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentDetailLineCopyWith<ApproveBookingPaymentDetailLine>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentDetailLineCopyWith<$Res> {
  factory $ApproveBookingPaymentDetailLineCopyWith(
          ApproveBookingPaymentDetailLine value,
          $Res Function(ApproveBookingPaymentDetailLine) then) =
      _$ApproveBookingPaymentDetailLineCopyWithImpl<$Res,
          ApproveBookingPaymentDetailLine>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Files') List<ApproveBookingPaymentFile> files,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'RecipientName') String? recipientName,
      @JsonKey(name: 'StartLocation') String? startLocation,
      @JsonKey(name: 'EndLocation') String? endLocation,
      @JsonKey(name: 'BankAccount') String? bankAccount,
      @JsonKey(name: 'BankName') String? bankName,
      @JsonKey(name: 'TransferType') int? transferType,
      @JsonKey(name: 'TotalAmount') double? totalAmount,
      @JsonKey(name: 'TotalAmountWithInvoice') double? totalAmountWithInvoice,
      @JsonKey(name: 'AmountBeforeVAT') double? amountBeforeVat,
      @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,
      @JsonKey(name: 'TransportCompanyName') String? transportCompanyName,
      @JsonKey(name: 'TransportCompanyTaxCode') String? transportCompanyTaxCode,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsChunDongPhuongTien') bool? isChunDongPhuongTien,
      @JsonKey(name: 'IsBill') bool? isBill,
      @JsonKey(name: 'HotelName') String? hotelName,
      @JsonKey(name: 'HotelTaxCode') String? hotelTaxCode,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate});
}

/// @nodoc
class _$ApproveBookingPaymentDetailLineCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentDetailLine>
    implements $ApproveBookingPaymentDetailLineCopyWith<$Res> {
  _$ApproveBookingPaymentDetailLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? files = null,
    Object? projectCode = freezed,
    Object? recipientName = freezed,
    Object? startLocation = freezed,
    Object? endLocation = freezed,
    Object? bankAccount = freezed,
    Object? bankName = freezed,
    Object? transferType = freezed,
    Object? totalAmount = freezed,
    Object? totalAmountWithInvoice = freezed,
    Object? amountBeforeVat = freezed,
    Object? invoiceNumber = freezed,
    Object? transportCompanyName = freezed,
    Object? transportCompanyTaxCode = freezed,
    Object? companyName = freezed,
    Object? departmentName = freezed,
    Object? reason = freezed,
    Object? note = freezed,
    Object? isChunDongPhuongTien = freezed,
    Object? isBill = freezed,
    Object? hotelName = freezed,
    Object? hotelTaxCode = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<ApproveBookingPaymentFile>,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: freezed == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: freezed == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      transferType: freezed == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountWithInvoice: freezed == totalAmountWithInvoice
          ? _value.totalAmountWithInvoice
          : totalAmountWithInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      amountBeforeVat: freezed == amountBeforeVat
          ? _value.amountBeforeVat
          : amountBeforeVat // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transportCompanyName: freezed == transportCompanyName
          ? _value.transportCompanyName
          : transportCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      transportCompanyTaxCode: freezed == transportCompanyTaxCode
          ? _value.transportCompanyTaxCode
          : transportCompanyTaxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isChunDongPhuongTien: freezed == isChunDongPhuongTien
          ? _value.isChunDongPhuongTien
          : isChunDongPhuongTien // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBill: freezed == isBill
          ? _value.isBill
          : isBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      hotelName: freezed == hotelName
          ? _value.hotelName
          : hotelName // ignore: cast_nullable_to_non_nullable
              as String?,
      hotelTaxCode: freezed == hotelTaxCode
          ? _value.hotelTaxCode
          : hotelTaxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentDetailLineImplCopyWith<$Res>
    implements $ApproveBookingPaymentDetailLineCopyWith<$Res> {
  factory _$$ApproveBookingPaymentDetailLineImplCopyWith(
          _$ApproveBookingPaymentDetailLineImpl value,
          $Res Function(_$ApproveBookingPaymentDetailLineImpl) then) =
      __$$ApproveBookingPaymentDetailLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Files') List<ApproveBookingPaymentFile> files,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'RecipientName') String? recipientName,
      @JsonKey(name: 'StartLocation') String? startLocation,
      @JsonKey(name: 'EndLocation') String? endLocation,
      @JsonKey(name: 'BankAccount') String? bankAccount,
      @JsonKey(name: 'BankName') String? bankName,
      @JsonKey(name: 'TransferType') int? transferType,
      @JsonKey(name: 'TotalAmount') double? totalAmount,
      @JsonKey(name: 'TotalAmountWithInvoice') double? totalAmountWithInvoice,
      @JsonKey(name: 'AmountBeforeVAT') double? amountBeforeVat,
      @JsonKey(name: 'InvoiceNumber') String? invoiceNumber,
      @JsonKey(name: 'TransportCompanyName') String? transportCompanyName,
      @JsonKey(name: 'TransportCompanyTaxCode') String? transportCompanyTaxCode,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsChunDongPhuongTien') bool? isChunDongPhuongTien,
      @JsonKey(name: 'IsBill') bool? isBill,
      @JsonKey(name: 'HotelName') String? hotelName,
      @JsonKey(name: 'HotelTaxCode') String? hotelTaxCode,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate});
}

/// @nodoc
class __$$ApproveBookingPaymentDetailLineImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentDetailLineCopyWithImpl<$Res,
        _$ApproveBookingPaymentDetailLineImpl>
    implements _$$ApproveBookingPaymentDetailLineImplCopyWith<$Res> {
  __$$ApproveBookingPaymentDetailLineImplCopyWithImpl(
      _$ApproveBookingPaymentDetailLineImpl _value,
      $Res Function(_$ApproveBookingPaymentDetailLineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? files = null,
    Object? projectCode = freezed,
    Object? recipientName = freezed,
    Object? startLocation = freezed,
    Object? endLocation = freezed,
    Object? bankAccount = freezed,
    Object? bankName = freezed,
    Object? transferType = freezed,
    Object? totalAmount = freezed,
    Object? totalAmountWithInvoice = freezed,
    Object? amountBeforeVat = freezed,
    Object? invoiceNumber = freezed,
    Object? transportCompanyName = freezed,
    Object? transportCompanyTaxCode = freezed,
    Object? companyName = freezed,
    Object? departmentName = freezed,
    Object? reason = freezed,
    Object? note = freezed,
    Object? isChunDongPhuongTien = freezed,
    Object? isBill = freezed,
    Object? hotelName = freezed,
    Object? hotelTaxCode = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
  }) {
    return _then(_$ApproveBookingPaymentDetailLineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<ApproveBookingPaymentFile>,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: freezed == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: freezed == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      transferType: freezed == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmountWithInvoice: freezed == totalAmountWithInvoice
          ? _value.totalAmountWithInvoice
          : totalAmountWithInvoice // ignore: cast_nullable_to_non_nullable
              as double?,
      amountBeforeVat: freezed == amountBeforeVat
          ? _value.amountBeforeVat
          : amountBeforeVat // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transportCompanyName: freezed == transportCompanyName
          ? _value.transportCompanyName
          : transportCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      transportCompanyTaxCode: freezed == transportCompanyTaxCode
          ? _value.transportCompanyTaxCode
          : transportCompanyTaxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isChunDongPhuongTien: freezed == isChunDongPhuongTien
          ? _value.isChunDongPhuongTien
          : isChunDongPhuongTien // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBill: freezed == isBill
          ? _value.isBill
          : isBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      hotelName: freezed == hotelName
          ? _value.hotelName
          : hotelName // ignore: cast_nullable_to_non_nullable
              as String?,
      hotelTaxCode: freezed == hotelTaxCode
          ? _value.hotelTaxCode
          : hotelTaxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentDetailLineImpl
    implements _ApproveBookingPaymentDetailLine {
  const _$ApproveBookingPaymentDetailLineImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Files') final List<ApproveBookingPaymentFile> files =
          const <ApproveBookingPaymentFile>[],
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'RecipientName') this.recipientName,
      @JsonKey(name: 'StartLocation') this.startLocation,
      @JsonKey(name: 'EndLocation') this.endLocation,
      @JsonKey(name: 'BankAccount') this.bankAccount,
      @JsonKey(name: 'BankName') this.bankName,
      @JsonKey(name: 'TransferType') this.transferType,
      @JsonKey(name: 'TotalAmount') this.totalAmount,
      @JsonKey(name: 'TotalAmountWithInvoice') this.totalAmountWithInvoice,
      @JsonKey(name: 'AmountBeforeVAT') this.amountBeforeVat,
      @JsonKey(name: 'InvoiceNumber') this.invoiceNumber,
      @JsonKey(name: 'TransportCompanyName') this.transportCompanyName,
      @JsonKey(name: 'TransportCompanyTaxCode') this.transportCompanyTaxCode,
      @JsonKey(name: 'CompanyName') this.companyName,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsChunDongPhuongTien') this.isChunDongPhuongTien,
      @JsonKey(name: 'IsBill') this.isBill,
      @JsonKey(name: 'HotelName') this.hotelName,
      @JsonKey(name: 'HotelTaxCode') this.hotelTaxCode,
      @JsonKey(name: 'CheckInDate') this.checkInDate,
      @JsonKey(name: 'CheckOutDate') this.checkOutDate})
      : _files = files;

  factory _$ApproveBookingPaymentDetailLineImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentDetailLineImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  final List<ApproveBookingPaymentFile> _files;
  @override
  @JsonKey(name: 'Files')
  List<ApproveBookingPaymentFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'RecipientName')
  final String? recipientName;
  @override
  @JsonKey(name: 'StartLocation')
  final String? startLocation;
  @override
  @JsonKey(name: 'EndLocation')
  final String? endLocation;
  @override
  @JsonKey(name: 'BankAccount')
  final String? bankAccount;
  @override
  @JsonKey(name: 'BankName')
  final String? bankName;
  @override
  @JsonKey(name: 'TransferType')
  final int? transferType;
  @override
  @JsonKey(name: 'TotalAmount')
  final double? totalAmount;
  @override
  @JsonKey(name: 'TotalAmountWithInvoice')
  final double? totalAmountWithInvoice;
  @override
  @JsonKey(name: 'AmountBeforeVAT')
  final double? amountBeforeVat;
  @override
  @JsonKey(name: 'InvoiceNumber')
  final String? invoiceNumber;
  @override
  @JsonKey(name: 'TransportCompanyName')
  final String? transportCompanyName;
  @override
  @JsonKey(name: 'TransportCompanyTaxCode')
  final String? transportCompanyTaxCode;
  @override
  @JsonKey(name: 'CompanyName')
  final String? companyName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsChunDongPhuongTien')
  final bool? isChunDongPhuongTien;
  @override
  @JsonKey(name: 'IsBill')
  final bool? isBill;
// Riêng phiếu Công tác phí (nhà nghỉ)
  @override
  @JsonKey(name: 'HotelName')
  final String? hotelName;
  @override
  @JsonKey(name: 'HotelTaxCode')
  final String? hotelTaxCode;
  @override
  @JsonKey(name: 'CheckInDate')
  final DateTime? checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  final DateTime? checkOutDate;

  @override
  String toString() {
    return 'ApproveBookingPaymentDetailLine(id: $id, files: $files, projectCode: $projectCode, recipientName: $recipientName, startLocation: $startLocation, endLocation: $endLocation, bankAccount: $bankAccount, bankName: $bankName, transferType: $transferType, totalAmount: $totalAmount, totalAmountWithInvoice: $totalAmountWithInvoice, amountBeforeVat: $amountBeforeVat, invoiceNumber: $invoiceNumber, transportCompanyName: $transportCompanyName, transportCompanyTaxCode: $transportCompanyTaxCode, companyName: $companyName, departmentName: $departmentName, reason: $reason, note: $note, isChunDongPhuongTien: $isChunDongPhuongTien, isBill: $isBill, hotelName: $hotelName, hotelTaxCode: $hotelTaxCode, checkInDate: $checkInDate, checkOutDate: $checkOutDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentDetailLineImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.startLocation, startLocation) ||
                other.startLocation == startLocation) &&
            (identical(other.endLocation, endLocation) ||
                other.endLocation == endLocation) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalAmountWithInvoice, totalAmountWithInvoice) ||
                other.totalAmountWithInvoice == totalAmountWithInvoice) &&
            (identical(other.amountBeforeVat, amountBeforeVat) ||
                other.amountBeforeVat == amountBeforeVat) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.transportCompanyName, transportCompanyName) ||
                other.transportCompanyName == transportCompanyName) &&
            (identical(
                    other.transportCompanyTaxCode, transportCompanyTaxCode) ||
                other.transportCompanyTaxCode == transportCompanyTaxCode) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isChunDongPhuongTien, isChunDongPhuongTien) ||
                other.isChunDongPhuongTien == isChunDongPhuongTien) &&
            (identical(other.isBill, isBill) || other.isBill == isBill) &&
            (identical(other.hotelName, hotelName) ||
                other.hotelName == hotelName) &&
            (identical(other.hotelTaxCode, hotelTaxCode) ||
                other.hotelTaxCode == hotelTaxCode) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_files),
        projectCode,
        recipientName,
        startLocation,
        endLocation,
        bankAccount,
        bankName,
        transferType,
        totalAmount,
        totalAmountWithInvoice,
        amountBeforeVat,
        invoiceNumber,
        transportCompanyName,
        transportCompanyTaxCode,
        companyName,
        departmentName,
        reason,
        note,
        isChunDongPhuongTien,
        isBill,
        hotelName,
        hotelTaxCode,
        checkInDate,
        checkOutDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentDetailLineImplCopyWith<
          _$ApproveBookingPaymentDetailLineImpl>
      get copyWith => __$$ApproveBookingPaymentDetailLineImplCopyWithImpl<
          _$ApproveBookingPaymentDetailLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentDetailLineImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentDetailLine
    implements ApproveBookingPaymentDetailLine {
  const factory _ApproveBookingPaymentDetailLine(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'Files') final List<ApproveBookingPaymentFile> files,
      @JsonKey(name: 'ProjectCode') final String? projectCode,
      @JsonKey(name: 'RecipientName') final String? recipientName,
      @JsonKey(name: 'StartLocation') final String? startLocation,
      @JsonKey(name: 'EndLocation') final String? endLocation,
      @JsonKey(name: 'BankAccount') final String? bankAccount,
      @JsonKey(name: 'BankName') final String? bankName,
      @JsonKey(name: 'TransferType') final int? transferType,
      @JsonKey(name: 'TotalAmount') final double? totalAmount,
      @JsonKey(name: 'TotalAmountWithInvoice')
      final double? totalAmountWithInvoice,
      @JsonKey(name: 'AmountBeforeVAT') final double? amountBeforeVat,
      @JsonKey(name: 'InvoiceNumber') final String? invoiceNumber,
      @JsonKey(name: 'TransportCompanyName') final String? transportCompanyName,
      @JsonKey(name: 'TransportCompanyTaxCode')
      final String? transportCompanyTaxCode,
      @JsonKey(name: 'CompanyName') final String? companyName,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'Reason') final String? reason,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsChunDongPhuongTien') final bool? isChunDongPhuongTien,
      @JsonKey(name: 'IsBill') final bool? isBill,
      @JsonKey(name: 'HotelName') final String? hotelName,
      @JsonKey(name: 'HotelTaxCode') final String? hotelTaxCode,
      @JsonKey(name: 'CheckInDate') final DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate')
      final DateTime? checkOutDate}) = _$ApproveBookingPaymentDetailLineImpl;

  factory _ApproveBookingPaymentDetailLine.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentDetailLineImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Files')
  List<ApproveBookingPaymentFile> get files;
  @override
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'RecipientName')
  String? get recipientName;
  @override
  @JsonKey(name: 'StartLocation')
  String? get startLocation;
  @override
  @JsonKey(name: 'EndLocation')
  String? get endLocation;
  @override
  @JsonKey(name: 'BankAccount')
  String? get bankAccount;
  @override
  @JsonKey(name: 'BankName')
  String? get bankName;
  @override
  @JsonKey(name: 'TransferType')
  int? get transferType;
  @override
  @JsonKey(name: 'TotalAmount')
  double? get totalAmount;
  @override
  @JsonKey(name: 'TotalAmountWithInvoice')
  double? get totalAmountWithInvoice;
  @override
  @JsonKey(name: 'AmountBeforeVAT')
  double? get amountBeforeVat;
  @override
  @JsonKey(name: 'InvoiceNumber')
  String? get invoiceNumber;
  @override
  @JsonKey(name: 'TransportCompanyName')
  String? get transportCompanyName;
  @override
  @JsonKey(name: 'TransportCompanyTaxCode')
  String? get transportCompanyTaxCode;
  @override
  @JsonKey(name: 'CompanyName')
  String? get companyName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsChunDongPhuongTien')
  bool? get isChunDongPhuongTien;
  @override
  @JsonKey(name: 'IsBill')
  bool? get isBill;
  @override // Riêng phiếu Công tác phí (nhà nghỉ)
  @JsonKey(name: 'HotelName')
  String? get hotelName;
  @override
  @JsonKey(name: 'HotelTaxCode')
  String? get hotelTaxCode;
  @override
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentDetailLineImplCopyWith<
          _$ApproveBookingPaymentDetailLineImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingPaymentDetail _$ApproveBookingPaymentDetailFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentDetail.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentDetail {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'Deadline')
  DateTime? get deadline =>
      throw _privateConstructorUsedError; // Trạng thái xử lý sau duyệt: đã tiếp nhận chứng từ / đã thanh toán.
  @JsonKey(name: 'IsReceived')
  bool? get isReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReceivedDate')
  DateTime? get receivedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsPaid')
  bool? get isPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaidDate')
  DateTime? get paidDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Details')
  List<ApproveBookingPaymentDetailLine> get details =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentDetailCopyWith<ApproveBookingPaymentDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentDetailCopyWith<$Res> {
  factory $ApproveBookingPaymentDetailCopyWith(
          ApproveBookingPaymentDetail value,
          $Res Function(ApproveBookingPaymentDetail) then) =
      _$ApproveBookingPaymentDetailCopyWithImpl<$Res,
          ApproveBookingPaymentDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Deadline') DateTime? deadline,
      @JsonKey(name: 'IsReceived') bool? isReceived,
      @JsonKey(name: 'ReceivedDate') DateTime? receivedDate,
      @JsonKey(name: 'IsPaid') bool? isPaid,
      @JsonKey(name: 'PaidDate') DateTime? paidDate,
      @JsonKey(name: 'Details') List<ApproveBookingPaymentDetailLine> details});
}

/// @nodoc
class _$ApproveBookingPaymentDetailCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentDetail>
    implements $ApproveBookingPaymentDetailCopyWith<$Res> {
  _$ApproveBookingPaymentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? deadline = freezed,
    Object? isReceived = freezed,
    Object? receivedDate = freezed,
    Object? isPaid = freezed,
    Object? paidDate = freezed,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isReceived: freezed == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool?,
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidDate: freezed == paidDate
          ? _value.paidDate
          : paidDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<ApproveBookingPaymentDetailLine>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentDetailImplCopyWith<$Res>
    implements $ApproveBookingPaymentDetailCopyWith<$Res> {
  factory _$$ApproveBookingPaymentDetailImplCopyWith(
          _$ApproveBookingPaymentDetailImpl value,
          $Res Function(_$ApproveBookingPaymentDetailImpl) then) =
      __$$ApproveBookingPaymentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Deadline') DateTime? deadline,
      @JsonKey(name: 'IsReceived') bool? isReceived,
      @JsonKey(name: 'ReceivedDate') DateTime? receivedDate,
      @JsonKey(name: 'IsPaid') bool? isPaid,
      @JsonKey(name: 'PaidDate') DateTime? paidDate,
      @JsonKey(name: 'Details') List<ApproveBookingPaymentDetailLine> details});
}

/// @nodoc
class __$$ApproveBookingPaymentDetailImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentDetailCopyWithImpl<$Res,
        _$ApproveBookingPaymentDetailImpl>
    implements _$$ApproveBookingPaymentDetailImplCopyWith<$Res> {
  __$$ApproveBookingPaymentDetailImplCopyWithImpl(
      _$ApproveBookingPaymentDetailImpl _value,
      $Res Function(_$ApproveBookingPaymentDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? deadline = freezed,
    Object? isReceived = freezed,
    Object? receivedDate = freezed,
    Object? isPaid = freezed,
    Object? paidDate = freezed,
    Object? details = null,
  }) {
    return _then(_$ApproveBookingPaymentDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isReceived: freezed == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool?,
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidDate: freezed == paidDate
          ? _value.paidDate
          : paidDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<ApproveBookingPaymentDetailLine>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentDetailImpl
    implements _ApproveBookingPaymentDetail {
  const _$ApproveBookingPaymentDetailImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'Deadline') this.deadline,
      @JsonKey(name: 'IsReceived') this.isReceived,
      @JsonKey(name: 'ReceivedDate') this.receivedDate,
      @JsonKey(name: 'IsPaid') this.isPaid,
      @JsonKey(name: 'PaidDate') this.paidDate,
      @JsonKey(name: 'Details')
      final List<ApproveBookingPaymentDetailLine> details =
          const <ApproveBookingPaymentDetailLine>[]})
      : _details = details;

  factory _$ApproveBookingPaymentDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentDetailImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'Deadline')
  final DateTime? deadline;
// Trạng thái xử lý sau duyệt: đã tiếp nhận chứng từ / đã thanh toán.
  @override
  @JsonKey(name: 'IsReceived')
  final bool? isReceived;
  @override
  @JsonKey(name: 'ReceivedDate')
  final DateTime? receivedDate;
  @override
  @JsonKey(name: 'IsPaid')
  final bool? isPaid;
  @override
  @JsonKey(name: 'PaidDate')
  final DateTime? paidDate;
  final List<ApproveBookingPaymentDetailLine> _details;
  @override
  @JsonKey(name: 'Details')
  List<ApproveBookingPaymentDetailLine> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'ApproveBookingPaymentDetail(id: $id, code: $code, status: $status, note: $note, deadline: $deadline, isReceived: $isReceived, receivedDate: $receivedDate, isPaid: $isPaid, paidDate: $paidDate, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isReceived, isReceived) ||
                other.isReceived == isReceived) &&
            (identical(other.receivedDate, receivedDate) ||
                other.receivedDate == receivedDate) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paidDate, paidDate) ||
                other.paidDate == paidDate) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      status,
      note,
      deadline,
      isReceived,
      receivedDate,
      isPaid,
      paidDate,
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentDetailImplCopyWith<_$ApproveBookingPaymentDetailImpl>
      get copyWith => __$$ApproveBookingPaymentDetailImplCopyWithImpl<
          _$ApproveBookingPaymentDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentDetailImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentDetail
    implements ApproveBookingPaymentDetail {
  const factory _ApproveBookingPaymentDetail(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'Deadline') final DateTime? deadline,
          @JsonKey(name: 'IsReceived') final bool? isReceived,
          @JsonKey(name: 'ReceivedDate') final DateTime? receivedDate,
          @JsonKey(name: 'IsPaid') final bool? isPaid,
          @JsonKey(name: 'PaidDate') final DateTime? paidDate,
          @JsonKey(name: 'Details')
          final List<ApproveBookingPaymentDetailLine> details}) =
      _$ApproveBookingPaymentDetailImpl;

  factory _ApproveBookingPaymentDetail.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentDetailImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'Deadline')
  DateTime? get deadline;
  @override // Trạng thái xử lý sau duyệt: đã tiếp nhận chứng từ / đã thanh toán.
  @JsonKey(name: 'IsReceived')
  bool? get isReceived;
  @override
  @JsonKey(name: 'ReceivedDate')
  DateTime? get receivedDate;
  @override
  @JsonKey(name: 'IsPaid')
  bool? get isPaid;
  @override
  @JsonKey(name: 'PaidDate')
  DateTime? get paidDate;
  @override
  @JsonKey(name: 'Details')
  List<ApproveBookingPaymentDetailLine> get details;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentDetailImplCopyWith<_$ApproveBookingPaymentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApproveBookingPaymentLog _$ApproveBookingPaymentLogFromJson(
    Map<String, dynamic> json) {
  return _ApproveBookingPaymentLog.fromJson(json);
}

/// @nodoc
mixin _$ApproveBookingPaymentLog {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Step')
  int? get step => throw _privateConstructorUsedError;
  @JsonKey(name: 'StepName')
  String? get stepName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  int? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContentLog')
  String? get contentLog => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveBookingPaymentLogCopyWith<ApproveBookingPaymentLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveBookingPaymentLogCopyWith<$Res> {
  factory $ApproveBookingPaymentLogCopyWith(ApproveBookingPaymentLog value,
          $Res Function(ApproveBookingPaymentLog) then) =
      _$ApproveBookingPaymentLogCopyWithImpl<$Res, ApproveBookingPaymentLog>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'StepName') String? stepName,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsApproved') int? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'ContentLog') String? contentLog});
}

/// @nodoc
class _$ApproveBookingPaymentLogCopyWithImpl<$Res,
        $Val extends ApproveBookingPaymentLog>
    implements $ApproveBookingPaymentLogCopyWith<$Res> {
  _$ApproveBookingPaymentLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? step = freezed,
    Object? stepName = freezed,
    Object? code = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? reasonCancel = freezed,
    Object? contentLog = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      stepName: freezed == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      contentLog: freezed == contentLog
          ? _value.contentLog
          : contentLog // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApproveBookingPaymentLogImplCopyWith<$Res>
    implements $ApproveBookingPaymentLogCopyWith<$Res> {
  factory _$$ApproveBookingPaymentLogImplCopyWith(
          _$ApproveBookingPaymentLogImpl value,
          $Res Function(_$ApproveBookingPaymentLogImpl) then) =
      __$$ApproveBookingPaymentLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Step') int? step,
      @JsonKey(name: 'StepName') String? stepName,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsApproved') int? isApproved,
      @JsonKey(name: 'DateApproved') DateTime? dateApproved,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'ContentLog') String? contentLog});
}

/// @nodoc
class __$$ApproveBookingPaymentLogImplCopyWithImpl<$Res>
    extends _$ApproveBookingPaymentLogCopyWithImpl<$Res,
        _$ApproveBookingPaymentLogImpl>
    implements _$$ApproveBookingPaymentLogImplCopyWith<$Res> {
  __$$ApproveBookingPaymentLogImplCopyWithImpl(
      _$ApproveBookingPaymentLogImpl _value,
      $Res Function(_$ApproveBookingPaymentLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? step = freezed,
    Object? stepName = freezed,
    Object? code = freezed,
    Object? isApproved = freezed,
    Object? dateApproved = freezed,
    Object? reasonCancel = freezed,
    Object? contentLog = freezed,
  }) {
    return _then(_$ApproveBookingPaymentLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      stepName: freezed == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      contentLog: freezed == contentLog
          ? _value.contentLog
          : contentLog // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveBookingPaymentLogImpl implements _ApproveBookingPaymentLog {
  const _$ApproveBookingPaymentLogImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Step') this.step,
      @JsonKey(name: 'StepName') this.stepName,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'DateApproved') this.dateApproved,
      @JsonKey(name: 'ReasonCancel') this.reasonCancel,
      @JsonKey(name: 'ContentLog') this.contentLog});

  factory _$ApproveBookingPaymentLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveBookingPaymentLogImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Step')
  final int? step;
  @override
  @JsonKey(name: 'StepName')
  final String? stepName;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'IsApproved')
  final int? isApproved;
  @override
  @JsonKey(name: 'DateApproved')
  final DateTime? dateApproved;
  @override
  @JsonKey(name: 'ReasonCancel')
  final String? reasonCancel;
  @override
  @JsonKey(name: 'ContentLog')
  final String? contentLog;

  @override
  String toString() {
    return 'ApproveBookingPaymentLog(id: $id, step: $step, stepName: $stepName, code: $code, isApproved: $isApproved, dateApproved: $dateApproved, reasonCancel: $reasonCancel, contentLog: $contentLog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveBookingPaymentLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.stepName, stepName) ||
                other.stepName == stepName) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.dateApproved, dateApproved) ||
                other.dateApproved == dateApproved) &&
            (identical(other.reasonCancel, reasonCancel) ||
                other.reasonCancel == reasonCancel) &&
            (identical(other.contentLog, contentLog) ||
                other.contentLog == contentLog));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, step, stepName, code,
      isApproved, dateApproved, reasonCancel, contentLog);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveBookingPaymentLogImplCopyWith<_$ApproveBookingPaymentLogImpl>
      get copyWith => __$$ApproveBookingPaymentLogImplCopyWithImpl<
          _$ApproveBookingPaymentLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveBookingPaymentLogImplToJson(
      this,
    );
  }
}

abstract class _ApproveBookingPaymentLog implements ApproveBookingPaymentLog {
  const factory _ApproveBookingPaymentLog(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Step') final int? step,
          @JsonKey(name: 'StepName') final String? stepName,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'IsApproved') final int? isApproved,
          @JsonKey(name: 'DateApproved') final DateTime? dateApproved,
          @JsonKey(name: 'ReasonCancel') final String? reasonCancel,
          @JsonKey(name: 'ContentLog') final String? contentLog}) =
      _$ApproveBookingPaymentLogImpl;

  factory _ApproveBookingPaymentLog.fromJson(Map<String, dynamic> json) =
      _$ApproveBookingPaymentLogImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Step')
  int? get step;
  @override
  @JsonKey(name: 'StepName')
  String? get stepName;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'IsApproved')
  int? get isApproved;
  @override
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved;
  @override
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel;
  @override
  @JsonKey(name: 'ContentLog')
  String? get contentLog;
  @override
  @JsonKey(ignore: true)
  _$$ApproveBookingPaymentLogImplCopyWith<_$ApproveBookingPaymentLogImpl>
      get copyWith => throw _privateConstructorUsedError;
}
