// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_guest_house_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingGuestHouseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingGuestHouseEventCopyWith<$Res> {
  factory $BookingGuestHouseEventCopyWith(BookingGuestHouseEvent value,
          $Res Function(BookingGuestHouseEvent) then) =
      _$BookingGuestHouseEventCopyWithImpl<$Res, BookingGuestHouseEvent>;
}

/// @nodoc
class _$BookingGuestHouseEventCopyWithImpl<$Res,
        $Val extends BookingGuestHouseEvent>
    implements $BookingGuestHouseEventCopyWith<$Res> {
  _$BookingGuestHouseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? dateStart, DateTime? dateEnd});
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
  }) {
    return _then(_$InitImpl(
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl({this.dateStart, this.dateEnd});

  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.init(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return init(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return init?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements BookingGuestHouseEvent {
  const factory _Init({final DateTime? dateStart, final DateTime? dateEnd}) =
      _$InitImpl;

  DateTime? get dateStart;
  DateTime? get dateEnd;
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDateRangeImplCopyWith<$Res> {
  factory _$$ChangeDateRangeImplCopyWith(_$ChangeDateRangeImpl value,
          $Res Function(_$ChangeDateRangeImpl) then) =
      __$$ChangeDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateStart, DateTime dateEnd});
}

/// @nodoc
class __$$ChangeDateRangeImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$ChangeDateRangeImpl>
    implements _$$ChangeDateRangeImplCopyWith<$Res> {
  __$$ChangeDateRangeImplCopyWithImpl(
      _$ChangeDateRangeImpl _value, $Res Function(_$ChangeDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
  }) {
    return _then(_$ChangeDateRangeImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeDateRangeImpl implements _ChangeDateRange {
  const _$ChangeDateRangeImpl({required this.dateStart, required this.dateEnd});

  @override
  final DateTime dateStart;
  @override
  final DateTime dateEnd;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.changeDateRange(dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateRangeImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      __$$ChangeDateRangeImplCopyWithImpl<_$ChangeDateRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return changeDateRange(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return changeDateRange?.call(dateStart, dateEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(dateStart, dateEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return changeDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return changeDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeDateRange != null) {
      return changeDateRange(this);
    }
    return orElse();
  }
}

abstract class _ChangeDateRange implements BookingGuestHouseEvent {
  const factory _ChangeDateRange(
      {required final DateTime dateStart,
      required final DateTime dateEnd}) = _$ChangeDateRangeImpl;

  DateTime get dateStart;
  DateTime get dateEnd;
  @JsonKey(ignore: true)
  _$$ChangeDateRangeImplCopyWith<_$ChangeDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeFilterTextImplCopyWith<$Res> {
  factory _$$ChangeFilterTextImplCopyWith(_$ChangeFilterTextImpl value,
          $Res Function(_$ChangeFilterTextImpl) then) =
      __$$ChangeFilterTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filterText});
}

/// @nodoc
class __$$ChangeFilterTextImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$ChangeFilterTextImpl>
    implements _$$ChangeFilterTextImplCopyWith<$Res> {
  __$$ChangeFilterTextImplCopyWithImpl(_$ChangeFilterTextImpl _value,
      $Res Function(_$ChangeFilterTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterText = null,
  }) {
    return _then(_$ChangeFilterTextImpl(
      filterText: null == filterText
          ? _value.filterText
          : filterText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeFilterTextImpl implements _ChangeFilterText {
  const _$ChangeFilterTextImpl({required this.filterText});

  @override
  final String filterText;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.changeFilterText(filterText: $filterText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFilterTextImpl &&
            (identical(other.filterText, filterText) ||
                other.filterText == filterText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFilterTextImplCopyWith<_$ChangeFilterTextImpl> get copyWith =>
      __$$ChangeFilterTextImplCopyWithImpl<_$ChangeFilterTextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return changeFilterText(filterText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return changeFilterText?.call(filterText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeFilterText != null) {
      return changeFilterText(filterText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return changeFilterText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return changeFilterText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeFilterText != null) {
      return changeFilterText(this);
    }
    return orElse();
  }
}

abstract class _ChangeFilterText implements BookingGuestHouseEvent {
  const factory _ChangeFilterText({required final String filterText}) =
      _$ChangeFilterTextImpl;

  String get filterText;
  @JsonKey(ignore: true)
  _$$ChangeFilterTextImplCopyWith<_$ChangeFilterTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'BookingGuestHouseEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements BookingGuestHouseEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$LoadFiltersImplCopyWith<$Res> {
  factory _$$LoadFiltersImplCopyWith(
          _$LoadFiltersImpl value, $Res Function(_$LoadFiltersImpl) then) =
      __$$LoadFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFiltersImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$LoadFiltersImpl>
    implements _$$LoadFiltersImplCopyWith<$Res> {
  __$$LoadFiltersImplCopyWithImpl(
      _$LoadFiltersImpl _value, $Res Function(_$LoadFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFiltersImpl implements _LoadFilters {
  const _$LoadFiltersImpl();

  @override
  String toString() {
    return 'BookingGuestHouseEvent.loadFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return loadFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return loadFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (loadFilters != null) {
      return loadFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return loadFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return loadFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (loadFilters != null) {
      return loadFilters(this);
    }
    return orElse();
  }
}

abstract class _LoadFilters implements BookingGuestHouseEvent {
  const factory _LoadFilters() = _$LoadFiltersImpl;
}

/// @nodoc
abstract class _$$ChangeProjectFilterImplCopyWith<$Res> {
  factory _$$ChangeProjectFilterImplCopyWith(_$ChangeProjectFilterImpl value,
          $Res Function(_$ChangeProjectFilterImpl) then) =
      __$$ChangeProjectFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectFilterItem? project});

  $ProjectFilterItemCopyWith<$Res>? get project;
}

/// @nodoc
class __$$ChangeProjectFilterImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res,
        _$ChangeProjectFilterImpl>
    implements _$$ChangeProjectFilterImplCopyWith<$Res> {
  __$$ChangeProjectFilterImplCopyWithImpl(_$ChangeProjectFilterImpl _value,
      $Res Function(_$ChangeProjectFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ChangeProjectFilterImpl(
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectFilterItem?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectFilterItemCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ProjectFilterItemCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc

class _$ChangeProjectFilterImpl implements _ChangeProjectFilter {
  const _$ChangeProjectFilterImpl({required this.project});

  @override
  final ProjectFilterItem? project;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.changeProjectFilter(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeProjectFilterImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeProjectFilterImplCopyWith<_$ChangeProjectFilterImpl> get copyWith =>
      __$$ChangeProjectFilterImplCopyWithImpl<_$ChangeProjectFilterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return changeProjectFilter(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return changeProjectFilter?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeProjectFilter != null) {
      return changeProjectFilter(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return changeProjectFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return changeProjectFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeProjectFilter != null) {
      return changeProjectFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeProjectFilter implements BookingGuestHouseEvent {
  const factory _ChangeProjectFilter(
      {required final ProjectFilterItem? project}) = _$ChangeProjectFilterImpl;

  ProjectFilterItem? get project;
  @JsonKey(ignore: true)
  _$$ChangeProjectFilterImplCopyWith<_$ChangeProjectFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeEmployeeFilterImplCopyWith<$Res> {
  factory _$$ChangeEmployeeFilterImplCopyWith(_$ChangeEmployeeFilterImpl value,
          $Res Function(_$ChangeEmployeeFilterImpl) then) =
      __$$ChangeEmployeeFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmployeeFilterItem? employee});

  $EmployeeFilterItemCopyWith<$Res>? get employee;
}

/// @nodoc
class __$$ChangeEmployeeFilterImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res,
        _$ChangeEmployeeFilterImpl>
    implements _$$ChangeEmployeeFilterImplCopyWith<$Res> {
  __$$ChangeEmployeeFilterImplCopyWithImpl(_$ChangeEmployeeFilterImpl _value,
      $Res Function(_$ChangeEmployeeFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = freezed,
  }) {
    return _then(_$ChangeEmployeeFilterImpl(
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeFilterItem?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EmployeeFilterItemCopyWith<$Res>? get employee {
    if (_value.employee == null) {
      return null;
    }

    return $EmployeeFilterItemCopyWith<$Res>(_value.employee!, (value) {
      return _then(_value.copyWith(employee: value));
    });
  }
}

/// @nodoc

class _$ChangeEmployeeFilterImpl implements _ChangeEmployeeFilter {
  const _$ChangeEmployeeFilterImpl({required this.employee});

  @override
  final EmployeeFilterItem? employee;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.changeEmployeeFilter(employee: $employee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeEmployeeFilterImpl &&
            (identical(other.employee, employee) ||
                other.employee == employee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeEmployeeFilterImplCopyWith<_$ChangeEmployeeFilterImpl>
      get copyWith =>
          __$$ChangeEmployeeFilterImplCopyWithImpl<_$ChangeEmployeeFilterImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return changeEmployeeFilter(employee);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return changeEmployeeFilter?.call(employee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeEmployeeFilter != null) {
      return changeEmployeeFilter(employee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return changeEmployeeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return changeEmployeeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (changeEmployeeFilter != null) {
      return changeEmployeeFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeEmployeeFilter implements BookingGuestHouseEvent {
  const factory _ChangeEmployeeFilter(
          {required final EmployeeFilterItem? employee}) =
      _$ChangeEmployeeFilterImpl;

  EmployeeFilterItem? get employee;
  @JsonKey(ignore: true)
  _$$ChangeEmployeeFilterImplCopyWith<_$ChangeEmployeeFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$SubmitImpl(
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl({required final Map<String, dynamic> payload})
      : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'BookingGuestHouseEvent.submit(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return submit(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return submit?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements BookingGuestHouseEvent {
  const factory _Submit({required final Map<String, dynamic> payload}) =
      _$SubmitImpl;

  Map<String, dynamic> get payload;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBookingImplCopyWith<$Res> {
  factory _$$DeleteBookingImplCopyWith(
          _$DeleteBookingImpl value, $Res Function(_$DeleteBookingImpl) then) =
      __$$DeleteBookingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteBookingImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$DeleteBookingImpl>
    implements _$$DeleteBookingImplCopyWith<$Res> {
  __$$DeleteBookingImplCopyWithImpl(
      _$DeleteBookingImpl _value, $Res Function(_$DeleteBookingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteBookingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteBookingImpl implements _DeleteBooking {
  const _$DeleteBookingImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.deleteBooking(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBookingImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBookingImplCopyWith<_$DeleteBookingImpl> get copyWith =>
      __$$DeleteBookingImplCopyWithImpl<_$DeleteBookingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return deleteBooking(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return deleteBooking?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (deleteBooking != null) {
      return deleteBooking(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return deleteBooking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return deleteBooking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (deleteBooking != null) {
      return deleteBooking(this);
    }
    return orElse();
  }
}

abstract class _DeleteBooking implements BookingGuestHouseEvent {
  const factory _DeleteBooking({required final int id}) = _$DeleteBookingImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteBookingImplCopyWith<_$DeleteBookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadDetailImplCopyWith<$Res> {
  factory _$$LoadDetailImplCopyWith(
          _$LoadDetailImpl value, $Res Function(_$LoadDetailImpl) then) =
      __$$LoadDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadDetailImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadDetailImpl implements _LoadDetail {
  const _$LoadDetailImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.loadDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      __$$LoadDetailImplCopyWithImpl<_$LoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return loadDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return loadDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return loadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return loadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements BookingGuestHouseEvent {
  const factory _LoadDetail({required final int id}) = _$LoadDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadPaymentDetailImplCopyWith<$Res> {
  factory _$$LoadPaymentDetailImplCopyWith(_$LoadPaymentDetailImpl value,
          $Res Function(_$LoadPaymentDetailImpl) then) =
      __$$LoadPaymentDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadPaymentDetailImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$LoadPaymentDetailImpl>
    implements _$$LoadPaymentDetailImplCopyWith<$Res> {
  __$$LoadPaymentDetailImplCopyWithImpl(_$LoadPaymentDetailImpl _value,
      $Res Function(_$LoadPaymentDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadPaymentDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadPaymentDetailImpl implements _LoadPaymentDetail {
  const _$LoadPaymentDetailImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.loadPaymentDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPaymentDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPaymentDetailImplCopyWith<_$LoadPaymentDetailImpl> get copyWith =>
      __$$LoadPaymentDetailImplCopyWithImpl<_$LoadPaymentDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return loadPaymentDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return loadPaymentDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (loadPaymentDetail != null) {
      return loadPaymentDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return loadPaymentDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return loadPaymentDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (loadPaymentDetail != null) {
      return loadPaymentDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadPaymentDetail implements BookingGuestHouseEvent {
  const factory _LoadPaymentDetail({required final int id}) =
      _$LoadPaymentDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$LoadPaymentDetailImplCopyWith<_$LoadPaymentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearPaymentDetailImplCopyWith<$Res> {
  factory _$$ClearPaymentDetailImplCopyWith(_$ClearPaymentDetailImpl value,
          $Res Function(_$ClearPaymentDetailImpl) then) =
      __$$ClearPaymentDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearPaymentDetailImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$ClearPaymentDetailImpl>
    implements _$$ClearPaymentDetailImplCopyWith<$Res> {
  __$$ClearPaymentDetailImplCopyWithImpl(_$ClearPaymentDetailImpl _value,
      $Res Function(_$ClearPaymentDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearPaymentDetailImpl implements _ClearPaymentDetail {
  const _$ClearPaymentDetailImpl();

  @override
  String toString() {
    return 'BookingGuestHouseEvent.clearPaymentDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearPaymentDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return clearPaymentDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return clearPaymentDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (clearPaymentDetail != null) {
      return clearPaymentDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return clearPaymentDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return clearPaymentDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (clearPaymentDetail != null) {
      return clearPaymentDetail(this);
    }
    return orElse();
  }
}

abstract class _ClearPaymentDetail implements BookingGuestHouseEvent {
  const factory _ClearPaymentDetail() = _$ClearPaymentDetailImpl;
}

/// @nodoc
abstract class _$$SubmitAdvanceImplCopyWith<$Res> {
  factory _$$SubmitAdvanceImplCopyWith(
          _$SubmitAdvanceImpl value, $Res Function(_$SubmitAdvanceImpl) then) =
      __$$SubmitAdvanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$SubmitAdvanceImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$SubmitAdvanceImpl>
    implements _$$SubmitAdvanceImplCopyWith<$Res> {
  __$$SubmitAdvanceImplCopyWithImpl(
      _$SubmitAdvanceImpl _value, $Res Function(_$SubmitAdvanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$SubmitAdvanceImpl(
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SubmitAdvanceImpl implements _SubmitAdvance {
  const _$SubmitAdvanceImpl({required final Map<String, dynamic> payload})
      : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'BookingGuestHouseEvent.submitAdvance(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitAdvanceImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitAdvanceImplCopyWith<_$SubmitAdvanceImpl> get copyWith =>
      __$$SubmitAdvanceImplCopyWithImpl<_$SubmitAdvanceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return submitAdvance(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return submitAdvance?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submitAdvance != null) {
      return submitAdvance(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return submitAdvance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return submitAdvance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submitAdvance != null) {
      return submitAdvance(this);
    }
    return orElse();
  }
}

abstract class _SubmitAdvance implements BookingGuestHouseEvent {
  const factory _SubmitAdvance({required final Map<String, dynamic> payload}) =
      _$SubmitAdvanceImpl;

  Map<String, dynamic> get payload;
  @JsonKey(ignore: true)
  _$$SubmitAdvanceImplCopyWith<_$SubmitAdvanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitAdvanceFormImplCopyWith<$Res> {
  factory _$$SubmitAdvanceFormImplCopyWith(_$SubmitAdvanceFormImpl value,
          $Res Function(_$SubmitAdvanceFormImpl) then) =
      __$$SubmitAdvanceFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int accommodationBookingId,
      int? approvedTbpId,
      int? projectId,
      int? companyId,
      String companyName,
      String departmentName,
      String reason,
      int transferType,
      String bankAccount,
      int bankListId,
      String bankName,
      int totalAmount,
      String? note});
}

/// @nodoc
class __$$SubmitAdvanceFormImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res, _$SubmitAdvanceFormImpl>
    implements _$$SubmitAdvanceFormImplCopyWith<$Res> {
  __$$SubmitAdvanceFormImplCopyWithImpl(_$SubmitAdvanceFormImpl _value,
      $Res Function(_$SubmitAdvanceFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accommodationBookingId = null,
    Object? approvedTbpId = freezed,
    Object? projectId = freezed,
    Object? companyId = freezed,
    Object? companyName = null,
    Object? departmentName = null,
    Object? reason = null,
    Object? transferType = null,
    Object? bankAccount = null,
    Object? bankListId = null,
    Object? bankName = null,
    Object? totalAmount = null,
    Object? note = freezed,
  }) {
    return _then(_$SubmitAdvanceFormImpl(
      accommodationBookingId: null == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      approvedTbpId: freezed == approvedTbpId
          ? _value.approvedTbpId
          : approvedTbpId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccount: null == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String,
      bankListId: null == bankListId
          ? _value.bankListId
          : bankListId // ignore: cast_nullable_to_non_nullable
              as int,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubmitAdvanceFormImpl implements _SubmitAdvanceForm {
  const _$SubmitAdvanceFormImpl(
      {required this.accommodationBookingId,
      this.approvedTbpId,
      this.projectId,
      this.companyId,
      required this.companyName,
      required this.departmentName,
      required this.reason,
      required this.transferType,
      required this.bankAccount,
      required this.bankListId,
      required this.bankName,
      required this.totalAmount,
      this.note});

  /// ID phiếu đặt phòng — UI lấy từ `widget.id`.
  @override
  final int accommodationBookingId;

  /// ID TBP duyệt (ưu tiên). Null → bloc fallback `detail.info.approvedTBP`.
  @override
  final int? approvedTbpId;

  /// ID dự án (ưu tiên). Null → bloc fallback `detail.info.projectId`.
  @override
  final int? projectId;

  /// ID công ty. Null → bloc fallback `currentUser.taxCompanyId`.
  @override
  final int? companyId;

  /// Tên công ty (auto-fill từ currentUser + lookup state.taxCompanies).
  @override
  final String companyName;

  /// Tên bộ phận (auto-fill từ currentUser).
  @override
  final String departmentName;

  /// Lý do tạm ứng.
  @override
  final String reason;

  /// Loại chuyển khoản (1..6 theo enum `TransferType`).
  @override
  final int transferType;

  /// Số tài khoản ngân hàng (chỉ chữ số).
  @override
  final String bankAccount;

  /// ID ngân hàng; bloc lookup `BankName` chuẩn hoá từ `state.banks`.
  @override
  final int bankListId;

  /// Tên ngân hàng (text hiển thị — fallback khi không lookup được).
  @override
  final String bankName;

  /// Số tiền tạm ứng (đã parse từ "x.xxx.xxx" → int).
  @override
  final int totalAmount;

  /// Ghi chú (optional).
  @override
  final String? note;

  @override
  String toString() {
    return 'BookingGuestHouseEvent.submitAdvanceForm(accommodationBookingId: $accommodationBookingId, approvedTbpId: $approvedTbpId, projectId: $projectId, companyId: $companyId, companyName: $companyName, departmentName: $departmentName, reason: $reason, transferType: $transferType, bankAccount: $bankAccount, bankListId: $bankListId, bankName: $bankName, totalAmount: $totalAmount, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitAdvanceFormImpl &&
            (identical(other.accommodationBookingId, accommodationBookingId) ||
                other.accommodationBookingId == accommodationBookingId) &&
            (identical(other.approvedTbpId, approvedTbpId) ||
                other.approvedTbpId == approvedTbpId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.bankListId, bankListId) ||
                other.bankListId == bankListId) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      accommodationBookingId,
      approvedTbpId,
      projectId,
      companyId,
      companyName,
      departmentName,
      reason,
      transferType,
      bankAccount,
      bankListId,
      bankName,
      totalAmount,
      note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitAdvanceFormImplCopyWith<_$SubmitAdvanceFormImpl> get copyWith =>
      __$$SubmitAdvanceFormImplCopyWithImpl<_$SubmitAdvanceFormImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return submitAdvanceForm(
        accommodationBookingId,
        approvedTbpId,
        projectId,
        companyId,
        companyName,
        departmentName,
        reason,
        transferType,
        bankAccount,
        bankListId,
        bankName,
        totalAmount,
        note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return submitAdvanceForm?.call(
        accommodationBookingId,
        approvedTbpId,
        projectId,
        companyId,
        companyName,
        departmentName,
        reason,
        transferType,
        bankAccount,
        bankListId,
        bankName,
        totalAmount,
        note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submitAdvanceForm != null) {
      return submitAdvanceForm(
          accommodationBookingId,
          approvedTbpId,
          projectId,
          companyId,
          companyName,
          departmentName,
          reason,
          transferType,
          bankAccount,
          bankListId,
          bankName,
          totalAmount,
          note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return submitAdvanceForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return submitAdvanceForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submitAdvanceForm != null) {
      return submitAdvanceForm(this);
    }
    return orElse();
  }
}

abstract class _SubmitAdvanceForm implements BookingGuestHouseEvent {
  const factory _SubmitAdvanceForm(
      {required final int accommodationBookingId,
      final int? approvedTbpId,
      final int? projectId,
      final int? companyId,
      required final String companyName,
      required final String departmentName,
      required final String reason,
      required final int transferType,
      required final String bankAccount,
      required final int bankListId,
      required final String bankName,
      required final int totalAmount,
      final String? note}) = _$SubmitAdvanceFormImpl;

  /// ID phiếu đặt phòng — UI lấy từ `widget.id`.
  int get accommodationBookingId;

  /// ID TBP duyệt (ưu tiên). Null → bloc fallback `detail.info.approvedTBP`.
  int? get approvedTbpId;

  /// ID dự án (ưu tiên). Null → bloc fallback `detail.info.projectId`.
  int? get projectId;

  /// ID công ty. Null → bloc fallback `currentUser.taxCompanyId`.
  int? get companyId;

  /// Tên công ty (auto-fill từ currentUser + lookup state.taxCompanies).
  String get companyName;

  /// Tên bộ phận (auto-fill từ currentUser).
  String get departmentName;

  /// Lý do tạm ứng.
  String get reason;

  /// Loại chuyển khoản (1..6 theo enum `TransferType`).
  int get transferType;

  /// Số tài khoản ngân hàng (chỉ chữ số).
  String get bankAccount;

  /// ID ngân hàng; bloc lookup `BankName` chuẩn hoá từ `state.banks`.
  int get bankListId;

  /// Tên ngân hàng (text hiển thị — fallback khi không lookup được).
  String get bankName;

  /// Số tiền tạm ứng (đã parse từ "x.xxx.xxx" → int).
  int get totalAmount;

  /// Ghi chú (optional).
  String? get note;
  @JsonKey(ignore: true)
  _$$SubmitAdvanceFormImplCopyWith<_$SubmitAdvanceFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearAdvanceSubmitStateImplCopyWith<$Res> {
  factory _$$ClearAdvanceSubmitStateImplCopyWith(
          _$ClearAdvanceSubmitStateImpl value,
          $Res Function(_$ClearAdvanceSubmitStateImpl) then) =
      __$$ClearAdvanceSubmitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearAdvanceSubmitStateImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res,
        _$ClearAdvanceSubmitStateImpl>
    implements _$$ClearAdvanceSubmitStateImplCopyWith<$Res> {
  __$$ClearAdvanceSubmitStateImplCopyWithImpl(
      _$ClearAdvanceSubmitStateImpl _value,
      $Res Function(_$ClearAdvanceSubmitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearAdvanceSubmitStateImpl implements _ClearAdvanceSubmitState {
  const _$ClearAdvanceSubmitStateImpl();

  @override
  String toString() {
    return 'BookingGuestHouseEvent.clearAdvanceSubmitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearAdvanceSubmitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return clearAdvanceSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return clearAdvanceSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (clearAdvanceSubmitState != null) {
      return clearAdvanceSubmitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return clearAdvanceSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return clearAdvanceSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (clearAdvanceSubmitState != null) {
      return clearAdvanceSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearAdvanceSubmitState implements BookingGuestHouseEvent {
  const factory _ClearAdvanceSubmitState() = _$ClearAdvanceSubmitStateImpl;
}

/// @nodoc
abstract class _$$SubmitSettlementFormImplCopyWith<$Res> {
  factory _$$SubmitSettlementFormImplCopyWith(_$SubmitSettlementFormImpl value,
          $Res Function(_$SubmitSettlementFormImpl) then) =
      __$$SubmitSettlementFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int accommodationBookingId,
      int totalAmount,
      int totalAmountWithInvoice,
      String invoiceNumber,
      String bankAccount,
      int bankListId,
      String bankName,
      int transferType,
      int? approvedTbpId,
      String reason,
      int? projectId,
      int? companyId,
      String companyName,
      String departmentName,
      String? note,
      String hotelName,
      String hotelTaxCode,
      List<PlatformFile> invoiceFiles,
      List<PlatformFile> billCkFiles});
}

/// @nodoc
class __$$SubmitSettlementFormImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res,
        _$SubmitSettlementFormImpl>
    implements _$$SubmitSettlementFormImplCopyWith<$Res> {
  __$$SubmitSettlementFormImplCopyWithImpl(_$SubmitSettlementFormImpl _value,
      $Res Function(_$SubmitSettlementFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accommodationBookingId = null,
    Object? totalAmount = null,
    Object? totalAmountWithInvoice = null,
    Object? invoiceNumber = null,
    Object? bankAccount = null,
    Object? bankListId = null,
    Object? bankName = null,
    Object? transferType = null,
    Object? approvedTbpId = freezed,
    Object? reason = null,
    Object? projectId = freezed,
    Object? companyId = freezed,
    Object? companyName = null,
    Object? departmentName = null,
    Object? note = freezed,
    Object? hotelName = null,
    Object? hotelTaxCode = null,
    Object? invoiceFiles = null,
    Object? billCkFiles = null,
  }) {
    return _then(_$SubmitSettlementFormImpl(
      accommodationBookingId: null == accommodationBookingId
          ? _value.accommodationBookingId
          : accommodationBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmountWithInvoice: null == totalAmountWithInvoice
          ? _value.totalAmountWithInvoice
          : totalAmountWithInvoice // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccount: null == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as String,
      bankListId: null == bankListId
          ? _value.bankListId
          : bankListId // ignore: cast_nullable_to_non_nullable
              as int,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as int,
      approvedTbpId: freezed == approvedTbpId
          ? _value.approvedTbpId
          : approvedTbpId // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      hotelName: null == hotelName
          ? _value.hotelName
          : hotelName // ignore: cast_nullable_to_non_nullable
              as String,
      hotelTaxCode: null == hotelTaxCode
          ? _value.hotelTaxCode
          : hotelTaxCode // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceFiles: null == invoiceFiles
          ? _value._invoiceFiles
          : invoiceFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      billCkFiles: null == billCkFiles
          ? _value._billCkFiles
          : billCkFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }
}

/// @nodoc

class _$SubmitSettlementFormImpl implements _SubmitSettlementForm {
  const _$SubmitSettlementFormImpl(
      {required this.accommodationBookingId,
      required this.totalAmount,
      required this.totalAmountWithInvoice,
      required this.invoiceNumber,
      required this.bankAccount,
      required this.bankListId,
      required this.bankName,
      required this.transferType,
      this.approvedTbpId,
      required this.reason,
      this.projectId,
      this.companyId,
      required this.companyName,
      required this.departmentName,
      this.note,
      required this.hotelName,
      required this.hotelTaxCode,
      final List<PlatformFile> invoiceFiles = const <PlatformFile>[],
      final List<PlatformFile> billCkFiles = const <PlatformFile>[]})
      : _invoiceFiles = invoiceFiles,
        _billCkFiles = billCkFiles;

  /// ID phiếu đặt phòng — UI lấy từ `widget.id`.
  @override
  final int accommodationBookingId;

  /// Tổng tiền (VNĐ) — đã parse từ "x.xxx.xxx" → int.
  @override
  final int totalAmount;

  /// Tổng tiền có hóa đơn (VNĐ) — đã parse từ "x.xxx.xxx" → int.
  @override
  final int totalAmountWithInvoice;

  /// Số hóa đơn (text rỗng → BE lưu null/rỗng tuỳ ý).
  @override
  final String invoiceNumber;

  /// Số tài khoản ngân hàng (chỉ chữ số).
  @override
  final String bankAccount;

  /// ID ngân hàng; bloc lookup `BankName` chuẩn hoá từ `state.banks`.
  @override
  final int bankListId;

  /// Tên ngân hàng (text hiển thị — fallback khi không lookup được).
  @override
  final String bankName;

  /// Loại chuyển khoản (1..6 theo enum `TransferType`).
  @override
  final int transferType;

  /// ID TBP duyệt (ưu tiên). Null → bloc fallback `detail.info.approvedTBP`.
  @override
  final int? approvedTbpId;

  /// Lý do quyết toán.
  @override
  final String reason;

  /// ID dự án (ưu tiên). Null → bloc fallback `detail.info.projectId`.
  @override
  final int? projectId;

  /// ID công ty. Null → bloc fallback `currentUser.taxCompanyId`.
  @override
  final int? companyId;

  /// Tên công ty (auto-fill từ currentUser + lookup state.taxCompanies).
  @override
  final String companyName;

  /// Tên bộ phận (auto-fill từ currentUser).
  @override
  final String departmentName;

  /// Ghi chú (optional).
  @override
  final String? note;

  /// Tên khách sạn.
  @override
  final String hotelName;

  /// Mã số thuế khách sạn.
  @override
  final String hotelTaxCode;

  /// File hóa đơn đính kèm (optional, mặc định rỗng = không upload).
  /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
  /// `?fileType=INVOICE`. Format cho phép: PDF / ảnh / excel.
  final List<PlatformFile> _invoiceFiles;

  /// File hóa đơn đính kèm (optional, mặc định rỗng = không upload).
  /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
  /// `?fileType=INVOICE`. Format cho phép: PDF / ảnh / excel.
  @override
  @JsonKey()
  List<PlatformFile> get invoiceFiles {
    if (_invoiceFiles is EqualUnmodifiableListView) return _invoiceFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceFiles);
  }

  /// File bill CK đính kèm (optional, mặc định rỗng = không upload).
  /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
  /// `?fileType=BILL_CK`. Format cho phép: PDF / ảnh.
  final List<PlatformFile> _billCkFiles;

  /// File bill CK đính kèm (optional, mặc định rỗng = không upload).
  /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
  /// `?fileType=BILL_CK`. Format cho phép: PDF / ảnh.
  @override
  @JsonKey()
  List<PlatformFile> get billCkFiles {
    if (_billCkFiles is EqualUnmodifiableListView) return _billCkFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billCkFiles);
  }

  @override
  String toString() {
    return 'BookingGuestHouseEvent.submitSettlementForm(accommodationBookingId: $accommodationBookingId, totalAmount: $totalAmount, totalAmountWithInvoice: $totalAmountWithInvoice, invoiceNumber: $invoiceNumber, bankAccount: $bankAccount, bankListId: $bankListId, bankName: $bankName, transferType: $transferType, approvedTbpId: $approvedTbpId, reason: $reason, projectId: $projectId, companyId: $companyId, companyName: $companyName, departmentName: $departmentName, note: $note, hotelName: $hotelName, hotelTaxCode: $hotelTaxCode, invoiceFiles: $invoiceFiles, billCkFiles: $billCkFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitSettlementFormImpl &&
            (identical(other.accommodationBookingId, accommodationBookingId) ||
                other.accommodationBookingId == accommodationBookingId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalAmountWithInvoice, totalAmountWithInvoice) ||
                other.totalAmountWithInvoice == totalAmountWithInvoice) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.bankListId, bankListId) ||
                other.bankListId == bankListId) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.approvedTbpId, approvedTbpId) ||
                other.approvedTbpId == approvedTbpId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.hotelName, hotelName) ||
                other.hotelName == hotelName) &&
            (identical(other.hotelTaxCode, hotelTaxCode) ||
                other.hotelTaxCode == hotelTaxCode) &&
            const DeepCollectionEquality()
                .equals(other._invoiceFiles, _invoiceFiles) &&
            const DeepCollectionEquality()
                .equals(other._billCkFiles, _billCkFiles));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        accommodationBookingId,
        totalAmount,
        totalAmountWithInvoice,
        invoiceNumber,
        bankAccount,
        bankListId,
        bankName,
        transferType,
        approvedTbpId,
        reason,
        projectId,
        companyId,
        companyName,
        departmentName,
        note,
        hotelName,
        hotelTaxCode,
        const DeepCollectionEquality().hash(_invoiceFiles),
        const DeepCollectionEquality().hash(_billCkFiles)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitSettlementFormImplCopyWith<_$SubmitSettlementFormImpl>
      get copyWith =>
          __$$SubmitSettlementFormImplCopyWithImpl<_$SubmitSettlementFormImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return submitSettlementForm(
        accommodationBookingId,
        totalAmount,
        totalAmountWithInvoice,
        invoiceNumber,
        bankAccount,
        bankListId,
        bankName,
        transferType,
        approvedTbpId,
        reason,
        projectId,
        companyId,
        companyName,
        departmentName,
        note,
        hotelName,
        hotelTaxCode,
        invoiceFiles,
        billCkFiles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return submitSettlementForm?.call(
        accommodationBookingId,
        totalAmount,
        totalAmountWithInvoice,
        invoiceNumber,
        bankAccount,
        bankListId,
        bankName,
        transferType,
        approvedTbpId,
        reason,
        projectId,
        companyId,
        companyName,
        departmentName,
        note,
        hotelName,
        hotelTaxCode,
        invoiceFiles,
        billCkFiles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submitSettlementForm != null) {
      return submitSettlementForm(
          accommodationBookingId,
          totalAmount,
          totalAmountWithInvoice,
          invoiceNumber,
          bankAccount,
          bankListId,
          bankName,
          transferType,
          approvedTbpId,
          reason,
          projectId,
          companyId,
          companyName,
          departmentName,
          note,
          hotelName,
          hotelTaxCode,
          invoiceFiles,
          billCkFiles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return submitSettlementForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return submitSettlementForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (submitSettlementForm != null) {
      return submitSettlementForm(this);
    }
    return orElse();
  }
}

abstract class _SubmitSettlementForm implements BookingGuestHouseEvent {
  const factory _SubmitSettlementForm(
      {required final int accommodationBookingId,
      required final int totalAmount,
      required final int totalAmountWithInvoice,
      required final String invoiceNumber,
      required final String bankAccount,
      required final int bankListId,
      required final String bankName,
      required final int transferType,
      final int? approvedTbpId,
      required final String reason,
      final int? projectId,
      final int? companyId,
      required final String companyName,
      required final String departmentName,
      final String? note,
      required final String hotelName,
      required final String hotelTaxCode,
      final List<PlatformFile> invoiceFiles,
      final List<PlatformFile> billCkFiles}) = _$SubmitSettlementFormImpl;

  /// ID phiếu đặt phòng — UI lấy từ `widget.id`.
  int get accommodationBookingId;

  /// Tổng tiền (VNĐ) — đã parse từ "x.xxx.xxx" → int.
  int get totalAmount;

  /// Tổng tiền có hóa đơn (VNĐ) — đã parse từ "x.xxx.xxx" → int.
  int get totalAmountWithInvoice;

  /// Số hóa đơn (text rỗng → BE lưu null/rỗng tuỳ ý).
  String get invoiceNumber;

  /// Số tài khoản ngân hàng (chỉ chữ số).
  String get bankAccount;

  /// ID ngân hàng; bloc lookup `BankName` chuẩn hoá từ `state.banks`.
  int get bankListId;

  /// Tên ngân hàng (text hiển thị — fallback khi không lookup được).
  String get bankName;

  /// Loại chuyển khoản (1..6 theo enum `TransferType`).
  int get transferType;

  /// ID TBP duyệt (ưu tiên). Null → bloc fallback `detail.info.approvedTBP`.
  int? get approvedTbpId;

  /// Lý do quyết toán.
  String get reason;

  /// ID dự án (ưu tiên). Null → bloc fallback `detail.info.projectId`.
  int? get projectId;

  /// ID công ty. Null → bloc fallback `currentUser.taxCompanyId`.
  int? get companyId;

  /// Tên công ty (auto-fill từ currentUser + lookup state.taxCompanies).
  String get companyName;

  /// Tên bộ phận (auto-fill từ currentUser).
  String get departmentName;

  /// Ghi chú (optional).
  String? get note;

  /// Tên khách sạn.
  String get hotelName;

  /// Mã số thuế khách sạn.
  String get hotelTaxCode;

  /// File hóa đơn đính kèm (optional, mặc định rỗng = không upload).
  /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
  /// `?fileType=INVOICE`. Format cho phép: PDF / ảnh / excel.
  List<PlatformFile> get invoiceFiles;

  /// File bill CK đính kèm (optional, mặc định rỗng = không upload).
  /// Sau khi save-detail OK, bloc sẽ lặp từng file upload
  /// `?fileType=BILL_CK`. Format cho phép: PDF / ảnh.
  List<PlatformFile> get billCkFiles;
  @JsonKey(ignore: true)
  _$$SubmitSettlementFormImplCopyWith<_$SubmitSettlementFormImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSettlementSubmitStateImplCopyWith<$Res> {
  factory _$$ClearSettlementSubmitStateImplCopyWith(
          _$ClearSettlementSubmitStateImpl value,
          $Res Function(_$ClearSettlementSubmitStateImpl) then) =
      __$$ClearSettlementSubmitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSettlementSubmitStateImplCopyWithImpl<$Res>
    extends _$BookingGuestHouseEventCopyWithImpl<$Res,
        _$ClearSettlementSubmitStateImpl>
    implements _$$ClearSettlementSubmitStateImplCopyWith<$Res> {
  __$$ClearSettlementSubmitStateImplCopyWithImpl(
      _$ClearSettlementSubmitStateImpl _value,
      $Res Function(_$ClearSettlementSubmitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSettlementSubmitStateImpl implements _ClearSettlementSubmitState {
  const _$ClearSettlementSubmitStateImpl();

  @override
  String toString() {
    return 'BookingGuestHouseEvent.clearSettlementSubmitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearSettlementSubmitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateStart, DateTime? dateEnd) init,
    required TResult Function(DateTime dateStart, DateTime dateEnd)
        changeDateRange,
    required TResult Function(String filterText) changeFilterText,
    required TResult Function() refresh,
    required TResult Function() loadFilters,
    required TResult Function(ProjectFilterItem? project) changeProjectFilter,
    required TResult Function(EmployeeFilterItem? employee)
        changeEmployeeFilter,
    required TResult Function(Map<String, dynamic> payload) submit,
    required TResult Function(int id) deleteBooking,
    required TResult Function(int id) loadDetail,
    required TResult Function(int id) loadPaymentDetail,
    required TResult Function() clearPaymentDetail,
    required TResult Function(Map<String, dynamic> payload) submitAdvance,
    required TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)
        submitAdvanceForm,
    required TResult Function() clearAdvanceSubmitState,
    required TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)
        submitSettlementForm,
    required TResult Function() clearSettlementSubmitState,
  }) {
    return clearSettlementSubmitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult? Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult? Function(String filterText)? changeFilterText,
    TResult? Function()? refresh,
    TResult? Function()? loadFilters,
    TResult? Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult? Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult? Function(Map<String, dynamic> payload)? submit,
    TResult? Function(int id)? deleteBooking,
    TResult? Function(int id)? loadDetail,
    TResult? Function(int id)? loadPaymentDetail,
    TResult? Function()? clearPaymentDetail,
    TResult? Function(Map<String, dynamic> payload)? submitAdvance,
    TResult? Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult? Function()? clearAdvanceSubmitState,
    TResult? Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult? Function()? clearSettlementSubmitState,
  }) {
    return clearSettlementSubmitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateStart, DateTime? dateEnd)? init,
    TResult Function(DateTime dateStart, DateTime dateEnd)? changeDateRange,
    TResult Function(String filterText)? changeFilterText,
    TResult Function()? refresh,
    TResult Function()? loadFilters,
    TResult Function(ProjectFilterItem? project)? changeProjectFilter,
    TResult Function(EmployeeFilterItem? employee)? changeEmployeeFilter,
    TResult Function(Map<String, dynamic> payload)? submit,
    TResult Function(int id)? deleteBooking,
    TResult Function(int id)? loadDetail,
    TResult Function(int id)? loadPaymentDetail,
    TResult Function()? clearPaymentDetail,
    TResult Function(Map<String, dynamic> payload)? submitAdvance,
    TResult Function(
            int accommodationBookingId,
            int? approvedTbpId,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String reason,
            int transferType,
            String bankAccount,
            int bankListId,
            String bankName,
            int totalAmount,
            String? note)?
        submitAdvanceForm,
    TResult Function()? clearAdvanceSubmitState,
    TResult Function(
            int accommodationBookingId,
            int totalAmount,
            int totalAmountWithInvoice,
            String invoiceNumber,
            String bankAccount,
            int bankListId,
            String bankName,
            int transferType,
            int? approvedTbpId,
            String reason,
            int? projectId,
            int? companyId,
            String companyName,
            String departmentName,
            String? note,
            String hotelName,
            String hotelTaxCode,
            List<PlatformFile> invoiceFiles,
            List<PlatformFile> billCkFiles)?
        submitSettlementForm,
    TResult Function()? clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (clearSettlementSubmitState != null) {
      return clearSettlementSubmitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ChangeDateRange value) changeDateRange,
    required TResult Function(_ChangeFilterText value) changeFilterText,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadFilters value) loadFilters,
    required TResult Function(_ChangeProjectFilter value) changeProjectFilter,
    required TResult Function(_ChangeEmployeeFilter value) changeEmployeeFilter,
    required TResult Function(_Submit value) submit,
    required TResult Function(_DeleteBooking value) deleteBooking,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_LoadPaymentDetail value) loadPaymentDetail,
    required TResult Function(_ClearPaymentDetail value) clearPaymentDetail,
    required TResult Function(_SubmitAdvance value) submitAdvance,
    required TResult Function(_SubmitAdvanceForm value) submitAdvanceForm,
    required TResult Function(_ClearAdvanceSubmitState value)
        clearAdvanceSubmitState,
    required TResult Function(_SubmitSettlementForm value) submitSettlementForm,
    required TResult Function(_ClearSettlementSubmitState value)
        clearSettlementSubmitState,
  }) {
    return clearSettlementSubmitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ChangeDateRange value)? changeDateRange,
    TResult? Function(_ChangeFilterText value)? changeFilterText,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadFilters value)? loadFilters,
    TResult? Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult? Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_DeleteBooking value)? deleteBooking,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult? Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult? Function(_SubmitAdvance value)? submitAdvance,
    TResult? Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult? Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult? Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult? Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
  }) {
    return clearSettlementSubmitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ChangeDateRange value)? changeDateRange,
    TResult Function(_ChangeFilterText value)? changeFilterText,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadFilters value)? loadFilters,
    TResult Function(_ChangeProjectFilter value)? changeProjectFilter,
    TResult Function(_ChangeEmployeeFilter value)? changeEmployeeFilter,
    TResult Function(_Submit value)? submit,
    TResult Function(_DeleteBooking value)? deleteBooking,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_LoadPaymentDetail value)? loadPaymentDetail,
    TResult Function(_ClearPaymentDetail value)? clearPaymentDetail,
    TResult Function(_SubmitAdvance value)? submitAdvance,
    TResult Function(_SubmitAdvanceForm value)? submitAdvanceForm,
    TResult Function(_ClearAdvanceSubmitState value)? clearAdvanceSubmitState,
    TResult Function(_SubmitSettlementForm value)? submitSettlementForm,
    TResult Function(_ClearSettlementSubmitState value)?
        clearSettlementSubmitState,
    required TResult orElse(),
  }) {
    if (clearSettlementSubmitState != null) {
      return clearSettlementSubmitState(this);
    }
    return orElse();
  }
}

abstract class _ClearSettlementSubmitState implements BookingGuestHouseEvent {
  const factory _ClearSettlementSubmitState() =
      _$ClearSettlementSubmitStateImpl;
}
