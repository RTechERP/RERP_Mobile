// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_guest_house_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingGuestHouseStateCWProxy {
  BookingGuestHouseState status(BaseStateStatus status);

  BookingGuestHouseState message(String? message);

  BookingGuestHouseState bookings(List<BookingGuestHouseItem> bookings);

  BookingGuestHouseState dateStart(DateTime? dateStart);

  BookingGuestHouseState dateEnd(DateTime? dateEnd);

  BookingGuestHouseState filterText(String filterText);

  BookingGuestHouseState isRefreshing(bool isRefreshing);

  BookingGuestHouseState isSubmitting(bool isSubmitting);

  BookingGuestHouseState submitSuccess(bool submitSuccess);

  BookingGuestHouseState lastSubmittedId(int? lastSubmittedId);

  BookingGuestHouseState deleteSuccess(bool deleteSuccess);

  BookingGuestHouseState projects(List<ProjectFilterItem> projects);

  BookingGuestHouseState employees(List<EmployeeFilterItem> employees);

  BookingGuestHouseState provinces(List<ProvinceFilterItem> provinces);

  BookingGuestHouseState taxCompanies(List<TaxCompanyItem> taxCompanies);

  BookingGuestHouseState banks(List<BankItem> banks);

  BookingGuestHouseState selectedProject(ProjectFilterItem? selectedProject);

  BookingGuestHouseState selectedEmployee(EmployeeFilterItem? selectedEmployee);

  BookingGuestHouseState isLoadingFilters(bool isLoadingFilters);

  BookingGuestHouseState isDetailLoading(bool isDetailLoading);

  BookingGuestHouseState detailData(BookingGuestHouseDetailData? detailData);

  BookingGuestHouseState detailMessage(String? detailMessage);

  BookingGuestHouseState isLoadingPaymentDetail(bool isLoadingPaymentDetail);

  BookingGuestHouseState paymentDetail(
      BookingGuestHousePaymentDetailItem? paymentDetail);

  BookingGuestHouseState paymentDetailMessage(String? paymentDetailMessage);

  BookingGuestHouseState isSubmittingAdvance(bool isSubmittingAdvance);

  BookingGuestHouseState advanceSuccess(bool advanceSuccess);

  BookingGuestHouseState lastAdvanceResponse(
      BookingGuestHouseAdvanceResponse? lastAdvanceResponse);

  BookingGuestHouseState advanceMessage(String? advanceMessage);

  BookingGuestHouseState isSubmittingSettlement(bool isSubmittingSettlement);

  BookingGuestHouseState settlementSuccess(bool settlementSuccess);

  BookingGuestHouseState lastSettlementResponse(
      BookingGuestHouseSaveDetailResponse? lastSettlementResponse);

  BookingGuestHouseState settlementMessage(String? settlementMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingGuestHouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingGuestHouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingGuestHouseState call({
    BaseStateStatus? status,
    String? message,
    List<BookingGuestHouseItem>? bookings,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? filterText,
    bool? isRefreshing,
    bool? isSubmitting,
    bool? submitSuccess,
    int? lastSubmittedId,
    bool? deleteSuccess,
    List<ProjectFilterItem>? projects,
    List<EmployeeFilterItem>? employees,
    List<ProvinceFilterItem>? provinces,
    List<TaxCompanyItem>? taxCompanies,
    List<BankItem>? banks,
    ProjectFilterItem? selectedProject,
    EmployeeFilterItem? selectedEmployee,
    bool? isLoadingFilters,
    bool? isDetailLoading,
    BookingGuestHouseDetailData? detailData,
    String? detailMessage,
    bool? isLoadingPaymentDetail,
    BookingGuestHousePaymentDetailItem? paymentDetail,
    String? paymentDetailMessage,
    bool? isSubmittingAdvance,
    bool? advanceSuccess,
    BookingGuestHouseAdvanceResponse? lastAdvanceResponse,
    String? advanceMessage,
    bool? isSubmittingSettlement,
    bool? settlementSuccess,
    BookingGuestHouseSaveDetailResponse? lastSettlementResponse,
    String? settlementMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBookingGuestHouseState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBookingGuestHouseState.copyWith.fieldName(...)`
class _$BookingGuestHouseStateCWProxyImpl
    implements _$BookingGuestHouseStateCWProxy {
  const _$BookingGuestHouseStateCWProxyImpl(this._value);

  final BookingGuestHouseState _value;

  @override
  BookingGuestHouseState status(BaseStateStatus status) => this(status: status);

  @override
  BookingGuestHouseState message(String? message) => this(message: message);

  @override
  BookingGuestHouseState bookings(List<BookingGuestHouseItem> bookings) =>
      this(bookings: bookings);

  @override
  BookingGuestHouseState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  BookingGuestHouseState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  BookingGuestHouseState filterText(String filterText) =>
      this(filterText: filterText);

  @override
  BookingGuestHouseState isRefreshing(bool isRefreshing) =>
      this(isRefreshing: isRefreshing);

  @override
  BookingGuestHouseState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  BookingGuestHouseState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  BookingGuestHouseState lastSubmittedId(int? lastSubmittedId) =>
      this(lastSubmittedId: lastSubmittedId);

  @override
  BookingGuestHouseState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  BookingGuestHouseState projects(List<ProjectFilterItem> projects) =>
      this(projects: projects);

  @override
  BookingGuestHouseState employees(List<EmployeeFilterItem> employees) =>
      this(employees: employees);

  @override
  BookingGuestHouseState provinces(List<ProvinceFilterItem> provinces) =>
      this(provinces: provinces);

  @override
  BookingGuestHouseState taxCompanies(List<TaxCompanyItem> taxCompanies) =>
      this(taxCompanies: taxCompanies);

  @override
  BookingGuestHouseState banks(List<BankItem> banks) => this(banks: banks);

  @override
  BookingGuestHouseState selectedProject(ProjectFilterItem? selectedProject) =>
      this(selectedProject: selectedProject);

  @override
  BookingGuestHouseState selectedEmployee(
          EmployeeFilterItem? selectedEmployee) =>
      this(selectedEmployee: selectedEmployee);

  @override
  BookingGuestHouseState isLoadingFilters(bool isLoadingFilters) =>
      this(isLoadingFilters: isLoadingFilters);

  @override
  BookingGuestHouseState isDetailLoading(bool isDetailLoading) =>
      this(isDetailLoading: isDetailLoading);

  @override
  BookingGuestHouseState detailData(BookingGuestHouseDetailData? detailData) =>
      this(detailData: detailData);

  @override
  BookingGuestHouseState detailMessage(String? detailMessage) =>
      this(detailMessage: detailMessage);

  @override
  BookingGuestHouseState isLoadingPaymentDetail(bool isLoadingPaymentDetail) =>
      this(isLoadingPaymentDetail: isLoadingPaymentDetail);

  @override
  BookingGuestHouseState paymentDetail(
          BookingGuestHousePaymentDetailItem? paymentDetail) =>
      this(paymentDetail: paymentDetail);

  @override
  BookingGuestHouseState paymentDetailMessage(String? paymentDetailMessage) =>
      this(paymentDetailMessage: paymentDetailMessage);

  @override
  BookingGuestHouseState isSubmittingAdvance(bool isSubmittingAdvance) =>
      this(isSubmittingAdvance: isSubmittingAdvance);

  @override
  BookingGuestHouseState advanceSuccess(bool advanceSuccess) =>
      this(advanceSuccess: advanceSuccess);

  @override
  BookingGuestHouseState lastAdvanceResponse(
          BookingGuestHouseAdvanceResponse? lastAdvanceResponse) =>
      this(lastAdvanceResponse: lastAdvanceResponse);

  @override
  BookingGuestHouseState advanceMessage(String? advanceMessage) =>
      this(advanceMessage: advanceMessage);

  @override
  BookingGuestHouseState isSubmittingSettlement(bool isSubmittingSettlement) =>
      this(isSubmittingSettlement: isSubmittingSettlement);

  @override
  BookingGuestHouseState settlementSuccess(bool settlementSuccess) =>
      this(settlementSuccess: settlementSuccess);

  @override
  BookingGuestHouseState lastSettlementResponse(
          BookingGuestHouseSaveDetailResponse? lastSettlementResponse) =>
      this(lastSettlementResponse: lastSettlementResponse);

  @override
  BookingGuestHouseState settlementMessage(String? settlementMessage) =>
      this(settlementMessage: settlementMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingGuestHouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingGuestHouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingGuestHouseState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? bookings = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? filterText = const $CopyWithPlaceholder(),
    Object? isRefreshing = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? lastSubmittedId = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? employees = const $CopyWithPlaceholder(),
    Object? provinces = const $CopyWithPlaceholder(),
    Object? taxCompanies = const $CopyWithPlaceholder(),
    Object? banks = const $CopyWithPlaceholder(),
    Object? selectedProject = const $CopyWithPlaceholder(),
    Object? selectedEmployee = const $CopyWithPlaceholder(),
    Object? isLoadingFilters = const $CopyWithPlaceholder(),
    Object? isDetailLoading = const $CopyWithPlaceholder(),
    Object? detailData = const $CopyWithPlaceholder(),
    Object? detailMessage = const $CopyWithPlaceholder(),
    Object? isLoadingPaymentDetail = const $CopyWithPlaceholder(),
    Object? paymentDetail = const $CopyWithPlaceholder(),
    Object? paymentDetailMessage = const $CopyWithPlaceholder(),
    Object? isSubmittingAdvance = const $CopyWithPlaceholder(),
    Object? advanceSuccess = const $CopyWithPlaceholder(),
    Object? lastAdvanceResponse = const $CopyWithPlaceholder(),
    Object? advanceMessage = const $CopyWithPlaceholder(),
    Object? isSubmittingSettlement = const $CopyWithPlaceholder(),
    Object? settlementSuccess = const $CopyWithPlaceholder(),
    Object? lastSettlementResponse = const $CopyWithPlaceholder(),
    Object? settlementMessage = const $CopyWithPlaceholder(),
  }) {
    return BookingGuestHouseState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      bookings: bookings == const $CopyWithPlaceholder() || bookings == null
          ? _value.bookings
          // ignore: cast_nullable_to_non_nullable
          : bookings as List<BookingGuestHouseItem>,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      filterText:
          filterText == const $CopyWithPlaceholder() || filterText == null
              ? _value.filterText
              // ignore: cast_nullable_to_non_nullable
              : filterText as String,
      isRefreshing:
          isRefreshing == const $CopyWithPlaceholder() || isRefreshing == null
              ? _value.isRefreshing
              // ignore: cast_nullable_to_non_nullable
              : isRefreshing as bool,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      lastSubmittedId: lastSubmittedId == const $CopyWithPlaceholder()
          ? _value.lastSubmittedId
          // ignore: cast_nullable_to_non_nullable
          : lastSubmittedId as int?,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<ProjectFilterItem>,
      employees: employees == const $CopyWithPlaceholder() || employees == null
          ? _value.employees
          // ignore: cast_nullable_to_non_nullable
          : employees as List<EmployeeFilterItem>,
      provinces: provinces == const $CopyWithPlaceholder() || provinces == null
          ? _value.provinces
          // ignore: cast_nullable_to_non_nullable
          : provinces as List<ProvinceFilterItem>,
      taxCompanies:
          taxCompanies == const $CopyWithPlaceholder() || taxCompanies == null
              ? _value.taxCompanies
              // ignore: cast_nullable_to_non_nullable
              : taxCompanies as List<TaxCompanyItem>,
      banks: banks == const $CopyWithPlaceholder() || banks == null
          ? _value.banks
          // ignore: cast_nullable_to_non_nullable
          : banks as List<BankItem>,
      selectedProject: selectedProject == const $CopyWithPlaceholder()
          ? _value.selectedProject
          // ignore: cast_nullable_to_non_nullable
          : selectedProject as ProjectFilterItem?,
      selectedEmployee: selectedEmployee == const $CopyWithPlaceholder()
          ? _value.selectedEmployee
          // ignore: cast_nullable_to_non_nullable
          : selectedEmployee as EmployeeFilterItem?,
      isLoadingFilters: isLoadingFilters == const $CopyWithPlaceholder() ||
              isLoadingFilters == null
          ? _value.isLoadingFilters
          // ignore: cast_nullable_to_non_nullable
          : isLoadingFilters as bool,
      isDetailLoading: isDetailLoading == const $CopyWithPlaceholder() ||
              isDetailLoading == null
          ? _value.isDetailLoading
          // ignore: cast_nullable_to_non_nullable
          : isDetailLoading as bool,
      detailData: detailData == const $CopyWithPlaceholder()
          ? _value.detailData
          // ignore: cast_nullable_to_non_nullable
          : detailData as BookingGuestHouseDetailData?,
      detailMessage: detailMessage == const $CopyWithPlaceholder()
          ? _value.detailMessage
          // ignore: cast_nullable_to_non_nullable
          : detailMessage as String?,
      isLoadingPaymentDetail:
          isLoadingPaymentDetail == const $CopyWithPlaceholder() ||
                  isLoadingPaymentDetail == null
              ? _value.isLoadingPaymentDetail
              // ignore: cast_nullable_to_non_nullable
              : isLoadingPaymentDetail as bool,
      paymentDetail: paymentDetail == const $CopyWithPlaceholder()
          ? _value.paymentDetail
          // ignore: cast_nullable_to_non_nullable
          : paymentDetail as BookingGuestHousePaymentDetailItem?,
      paymentDetailMessage: paymentDetailMessage == const $CopyWithPlaceholder()
          ? _value.paymentDetailMessage
          // ignore: cast_nullable_to_non_nullable
          : paymentDetailMessage as String?,
      isSubmittingAdvance:
          isSubmittingAdvance == const $CopyWithPlaceholder() ||
                  isSubmittingAdvance == null
              ? _value.isSubmittingAdvance
              // ignore: cast_nullable_to_non_nullable
              : isSubmittingAdvance as bool,
      advanceSuccess: advanceSuccess == const $CopyWithPlaceholder() ||
              advanceSuccess == null
          ? _value.advanceSuccess
          // ignore: cast_nullable_to_non_nullable
          : advanceSuccess as bool,
      lastAdvanceResponse: lastAdvanceResponse == const $CopyWithPlaceholder()
          ? _value.lastAdvanceResponse
          // ignore: cast_nullable_to_non_nullable
          : lastAdvanceResponse as BookingGuestHouseAdvanceResponse?,
      advanceMessage: advanceMessage == const $CopyWithPlaceholder()
          ? _value.advanceMessage
          // ignore: cast_nullable_to_non_nullable
          : advanceMessage as String?,
      isSubmittingSettlement:
          isSubmittingSettlement == const $CopyWithPlaceholder() ||
                  isSubmittingSettlement == null
              ? _value.isSubmittingSettlement
              // ignore: cast_nullable_to_non_nullable
              : isSubmittingSettlement as bool,
      settlementSuccess: settlementSuccess == const $CopyWithPlaceholder() ||
              settlementSuccess == null
          ? _value.settlementSuccess
          // ignore: cast_nullable_to_non_nullable
          : settlementSuccess as bool,
      lastSettlementResponse:
          lastSettlementResponse == const $CopyWithPlaceholder()
              ? _value.lastSettlementResponse
              // ignore: cast_nullable_to_non_nullable
              : lastSettlementResponse as BookingGuestHouseSaveDetailResponse?,
      settlementMessage: settlementMessage == const $CopyWithPlaceholder()
          ? _value.settlementMessage
          // ignore: cast_nullable_to_non_nullable
          : settlementMessage as String?,
    );
  }
}

extension $BookingGuestHouseStateCopyWith on BookingGuestHouseState {
  /// Returns a callable class that can be used as follows: `instanceOfBookingGuestHouseState.copyWith(...)` or like so:`instanceOfBookingGuestHouseState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingGuestHouseStateCWProxy get copyWith =>
      _$BookingGuestHouseStateCWProxyImpl(this);
}
