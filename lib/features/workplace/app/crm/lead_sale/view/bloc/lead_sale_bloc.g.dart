// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_sale_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeadSaleStateCWProxy {
  LeadSaleState status(BaseStateStatus status);

  LeadSaleState message(String? message);

  LeadSaleState leads(List<LeadSaleItem> leads);

  LeadSaleState roleContext(LeadSaleRoleContext? roleContext);

  LeadSaleState dateStart(DateTime? dateStart);

  LeadSaleState dateEnd(DateTime? dateEnd);

  LeadSaleState keyword(String keyword);

  LeadSaleState viewMode(int viewMode);

  LeadSaleState leadType(int leadType);

  LeadSaleState leadSourceId(int leadSourceId);

  LeadSaleState marketingEmployeeId(int marketingEmployeeId);

  LeadSaleState saleEmployeeId(int saleEmployeeId);

  LeadSaleState includeOpen(bool includeOpen);

  LeadSaleState stageFilter(LeadSaleStage? stageFilter);

  LeadSaleState sources(List<LeadSaleSource> sources);

  LeadSaleState marketingEmployees(List<LeadSaleEmployee> marketingEmployees);

  LeadSaleState saleEmployees(List<LeadSaleEmployee> saleEmployees);

  LeadSaleState detail(LeadSaleDetail? detail);

  LeadSaleState detailStatus(BaseStateStatus detailStatus);

  LeadSaleState detailMessage(String? detailMessage);

  LeadSaleState files(List<LeadSaleFile> files);

  LeadSaleState filesStatus(BaseStateStatus filesStatus);

  LeadSaleState filesMessage(String? filesMessage);

  LeadSaleState filesLeadId(int? filesLeadId);

  LeadSaleState filesPo(List<LeadSaleFile> filesPo);

  LeadSaleState filesPoStatus(BaseStateStatus filesPoStatus);

  LeadSaleState filesPoMessage(String? filesPoMessage);

  LeadSaleState filesPoLeadId(int? filesPoLeadId);

  LeadSaleState fileActionStatus(BaseStateStatus fileActionStatus);

  LeadSaleState fileActionMessage(String? fileActionMessage);

  LeadSaleState deletingFileId(int? deletingFileId);

  LeadSaleState poTypes(List<LeadSalePoType> poTypes);

  LeadSaleState customerIndustries(
      List<LeadSaleCustomerIndustry> customerIndustries);

  LeadSaleState customerSpecializations(
      List<LeadSaleCustomerSpecialization> customerSpecializations);

  LeadSaleState businessFields(List<LeadSaleBusinessField> businessFields);

  LeadSaleState provinces(List<LeadSaleProvince> provinces);

  LeadSaleState customers(List<LeadSaleCustomer> customers);

  LeadSaleState customerDetail(LeadSaleCustomer? customerDetail);

  LeadSaleState customerDetailStatus(BaseStateStatus customerDetailStatus);

  LeadSaleState customerDetailMessage(String? customerDetailMessage);

  LeadSaleState submitStatus(BaseStateStatus submitStatus);

  LeadSaleState submitMessage(String? submitMessage);

  LeadSaleState saveResult(LeadSaleSaveResult? saveResult);

  LeadSaleState duplicates(List<LeadSaleDuplicateInfo> duplicates);

  LeadSaleState deleteStatus(BaseStateStatus deleteStatus);

  LeadSaleState deleteMessage(String? deleteMessage);

  LeadSaleState activityStatus(BaseStateStatus activityStatus);

  LeadSaleState activityMessage(String? activityMessage);

  LeadSaleState activityResult(LeadSaleActivitySaveResult? activityResult);

  LeadSaleState activityTypes(List<LeadSaleActivityType> activityTypes);

  LeadSaleState activityTypesStatus(BaseStateStatus activityTypesStatus);

  LeadSaleState activityTypesMessage(String? activityTypesMessage);

  LeadSaleState stageActionStatus(BaseStateStatus stageActionStatus);

  LeadSaleState stageActionMessage(String? stageActionMessage);

  LeadSaleState stageActionIds(List<int> stageActionIds);

  LeadSaleState saleLeaders(List<LeadSaleEmployee> saleLeaders);

  LeadSaleState saleAdmins(List<LeadSaleEmployee> saleAdmins);

  LeadSaleState handoverOptionsStatus(BaseStateStatus handoverOptionsStatus);

  LeadSaleState handoverOptionsMessage(String? handoverOptionsMessage);

  LeadSaleState adminSaleId(int? adminSaleId);

  LeadSaleState handoverStatus(BaseStateStatus handoverStatus);

  LeadSaleState handoverMessage(String? handoverMessage);

  LeadSaleState handoverIds(List<int> handoverIds);

  LeadSaleState currentUser(User? currentUser);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadSaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadSaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadSaleState call({
    BaseStateStatus? status,
    String? message,
    List<LeadSaleItem>? leads,
    LeadSaleRoleContext? roleContext,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? viewMode,
    int? leadType,
    int? leadSourceId,
    int? marketingEmployeeId,
    int? saleEmployeeId,
    bool? includeOpen,
    LeadSaleStage? stageFilter,
    List<LeadSaleSource>? sources,
    List<LeadSaleEmployee>? marketingEmployees,
    List<LeadSaleEmployee>? saleEmployees,
    LeadSaleDetail? detail,
    BaseStateStatus? detailStatus,
    String? detailMessage,
    List<LeadSaleFile>? files,
    BaseStateStatus? filesStatus,
    String? filesMessage,
    int? filesLeadId,
    List<LeadSaleFile>? filesPo,
    BaseStateStatus? filesPoStatus,
    String? filesPoMessage,
    int? filesPoLeadId,
    BaseStateStatus? fileActionStatus,
    String? fileActionMessage,
    int? deletingFileId,
    List<LeadSalePoType>? poTypes,
    List<LeadSaleCustomerIndustry>? customerIndustries,
    List<LeadSaleCustomerSpecialization>? customerSpecializations,
    List<LeadSaleBusinessField>? businessFields,
    List<LeadSaleProvince>? provinces,
    List<LeadSaleCustomer>? customers,
    LeadSaleCustomer? customerDetail,
    BaseStateStatus? customerDetailStatus,
    String? customerDetailMessage,
    BaseStateStatus? submitStatus,
    String? submitMessage,
    LeadSaleSaveResult? saveResult,
    List<LeadSaleDuplicateInfo>? duplicates,
    BaseStateStatus? deleteStatus,
    String? deleteMessage,
    BaseStateStatus? activityStatus,
    String? activityMessage,
    LeadSaleActivitySaveResult? activityResult,
    List<LeadSaleActivityType>? activityTypes,
    BaseStateStatus? activityTypesStatus,
    String? activityTypesMessage,
    BaseStateStatus? stageActionStatus,
    String? stageActionMessage,
    List<int>? stageActionIds,
    List<LeadSaleEmployee>? saleLeaders,
    List<LeadSaleEmployee>? saleAdmins,
    BaseStateStatus? handoverOptionsStatus,
    String? handoverOptionsMessage,
    int? adminSaleId,
    BaseStateStatus? handoverStatus,
    String? handoverMessage,
    List<int>? handoverIds,
    User? currentUser,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeadSaleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeadSaleState.copyWith.fieldName(...)`
class _$LeadSaleStateCWProxyImpl implements _$LeadSaleStateCWProxy {
  const _$LeadSaleStateCWProxyImpl(this._value);

  final LeadSaleState _value;

  @override
  LeadSaleState status(BaseStateStatus status) => this(status: status);

  @override
  LeadSaleState message(String? message) => this(message: message);

  @override
  LeadSaleState leads(List<LeadSaleItem> leads) => this(leads: leads);

  @override
  LeadSaleState roleContext(LeadSaleRoleContext? roleContext) =>
      this(roleContext: roleContext);

  @override
  LeadSaleState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  LeadSaleState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  LeadSaleState keyword(String keyword) => this(keyword: keyword);

  @override
  LeadSaleState viewMode(int viewMode) => this(viewMode: viewMode);

  @override
  LeadSaleState leadType(int leadType) => this(leadType: leadType);

  @override
  LeadSaleState leadSourceId(int leadSourceId) =>
      this(leadSourceId: leadSourceId);

  @override
  LeadSaleState marketingEmployeeId(int marketingEmployeeId) =>
      this(marketingEmployeeId: marketingEmployeeId);

  @override
  LeadSaleState saleEmployeeId(int saleEmployeeId) =>
      this(saleEmployeeId: saleEmployeeId);

  @override
  LeadSaleState includeOpen(bool includeOpen) => this(includeOpen: includeOpen);

  @override
  LeadSaleState stageFilter(LeadSaleStage? stageFilter) =>
      this(stageFilter: stageFilter);

  @override
  LeadSaleState sources(List<LeadSaleSource> sources) => this(sources: sources);

  @override
  LeadSaleState marketingEmployees(List<LeadSaleEmployee> marketingEmployees) =>
      this(marketingEmployees: marketingEmployees);

  @override
  LeadSaleState saleEmployees(List<LeadSaleEmployee> saleEmployees) =>
      this(saleEmployees: saleEmployees);

  @override
  LeadSaleState detail(LeadSaleDetail? detail) => this(detail: detail);

  @override
  LeadSaleState detailStatus(BaseStateStatus detailStatus) =>
      this(detailStatus: detailStatus);

  @override
  LeadSaleState detailMessage(String? detailMessage) =>
      this(detailMessage: detailMessage);

  @override
  LeadSaleState files(List<LeadSaleFile> files) => this(files: files);

  @override
  LeadSaleState filesStatus(BaseStateStatus filesStatus) =>
      this(filesStatus: filesStatus);

  @override
  LeadSaleState filesMessage(String? filesMessage) =>
      this(filesMessage: filesMessage);

  @override
  LeadSaleState filesLeadId(int? filesLeadId) => this(filesLeadId: filesLeadId);

  @override
  LeadSaleState filesPo(List<LeadSaleFile> filesPo) => this(filesPo: filesPo);

  @override
  LeadSaleState filesPoStatus(BaseStateStatus filesPoStatus) =>
      this(filesPoStatus: filesPoStatus);

  @override
  LeadSaleState filesPoMessage(String? filesPoMessage) =>
      this(filesPoMessage: filesPoMessage);

  @override
  LeadSaleState filesPoLeadId(int? filesPoLeadId) =>
      this(filesPoLeadId: filesPoLeadId);

  @override
  LeadSaleState fileActionStatus(BaseStateStatus fileActionStatus) =>
      this(fileActionStatus: fileActionStatus);

  @override
  LeadSaleState fileActionMessage(String? fileActionMessage) =>
      this(fileActionMessage: fileActionMessage);

  @override
  LeadSaleState deletingFileId(int? deletingFileId) =>
      this(deletingFileId: deletingFileId);

  @override
  LeadSaleState poTypes(List<LeadSalePoType> poTypes) => this(poTypes: poTypes);

  @override
  LeadSaleState customerIndustries(
          List<LeadSaleCustomerIndustry> customerIndustries) =>
      this(customerIndustries: customerIndustries);

  @override
  LeadSaleState customerSpecializations(
          List<LeadSaleCustomerSpecialization> customerSpecializations) =>
      this(customerSpecializations: customerSpecializations);

  @override
  LeadSaleState businessFields(List<LeadSaleBusinessField> businessFields) =>
      this(businessFields: businessFields);

  @override
  LeadSaleState provinces(List<LeadSaleProvince> provinces) =>
      this(provinces: provinces);

  @override
  LeadSaleState customers(List<LeadSaleCustomer> customers) =>
      this(customers: customers);

  @override
  LeadSaleState customerDetail(LeadSaleCustomer? customerDetail) =>
      this(customerDetail: customerDetail);

  @override
  LeadSaleState customerDetailStatus(BaseStateStatus customerDetailStatus) =>
      this(customerDetailStatus: customerDetailStatus);

  @override
  LeadSaleState customerDetailMessage(String? customerDetailMessage) =>
      this(customerDetailMessage: customerDetailMessage);

  @override
  LeadSaleState submitStatus(BaseStateStatus submitStatus) =>
      this(submitStatus: submitStatus);

  @override
  LeadSaleState submitMessage(String? submitMessage) =>
      this(submitMessage: submitMessage);

  @override
  LeadSaleState saveResult(LeadSaleSaveResult? saveResult) =>
      this(saveResult: saveResult);

  @override
  LeadSaleState duplicates(List<LeadSaleDuplicateInfo> duplicates) =>
      this(duplicates: duplicates);

  @override
  LeadSaleState deleteStatus(BaseStateStatus deleteStatus) =>
      this(deleteStatus: deleteStatus);

  @override
  LeadSaleState deleteMessage(String? deleteMessage) =>
      this(deleteMessage: deleteMessage);

  @override
  LeadSaleState activityStatus(BaseStateStatus activityStatus) =>
      this(activityStatus: activityStatus);

  @override
  LeadSaleState activityMessage(String? activityMessage) =>
      this(activityMessage: activityMessage);

  @override
  LeadSaleState activityResult(LeadSaleActivitySaveResult? activityResult) =>
      this(activityResult: activityResult);

  @override
  LeadSaleState activityTypes(List<LeadSaleActivityType> activityTypes) =>
      this(activityTypes: activityTypes);

  @override
  LeadSaleState activityTypesStatus(BaseStateStatus activityTypesStatus) =>
      this(activityTypesStatus: activityTypesStatus);

  @override
  LeadSaleState activityTypesMessage(String? activityTypesMessage) =>
      this(activityTypesMessage: activityTypesMessage);

  @override
  LeadSaleState stageActionStatus(BaseStateStatus stageActionStatus) =>
      this(stageActionStatus: stageActionStatus);

  @override
  LeadSaleState stageActionMessage(String? stageActionMessage) =>
      this(stageActionMessage: stageActionMessage);

  @override
  LeadSaleState stageActionIds(List<int> stageActionIds) =>
      this(stageActionIds: stageActionIds);

  @override
  LeadSaleState saleLeaders(List<LeadSaleEmployee> saleLeaders) =>
      this(saleLeaders: saleLeaders);

  @override
  LeadSaleState saleAdmins(List<LeadSaleEmployee> saleAdmins) =>
      this(saleAdmins: saleAdmins);

  @override
  LeadSaleState handoverOptionsStatus(BaseStateStatus handoverOptionsStatus) =>
      this(handoverOptionsStatus: handoverOptionsStatus);

  @override
  LeadSaleState handoverOptionsMessage(String? handoverOptionsMessage) =>
      this(handoverOptionsMessage: handoverOptionsMessage);

  @override
  LeadSaleState adminSaleId(int? adminSaleId) => this(adminSaleId: adminSaleId);

  @override
  LeadSaleState handoverStatus(BaseStateStatus handoverStatus) =>
      this(handoverStatus: handoverStatus);

  @override
  LeadSaleState handoverMessage(String? handoverMessage) =>
      this(handoverMessage: handoverMessage);

  @override
  LeadSaleState handoverIds(List<int> handoverIds) =>
      this(handoverIds: handoverIds);

  @override
  LeadSaleState currentUser(User? currentUser) =>
      this(currentUser: currentUser);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadSaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadSaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadSaleState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? leads = const $CopyWithPlaceholder(),
    Object? roleContext = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? viewMode = const $CopyWithPlaceholder(),
    Object? leadType = const $CopyWithPlaceholder(),
    Object? leadSourceId = const $CopyWithPlaceholder(),
    Object? marketingEmployeeId = const $CopyWithPlaceholder(),
    Object? saleEmployeeId = const $CopyWithPlaceholder(),
    Object? includeOpen = const $CopyWithPlaceholder(),
    Object? stageFilter = const $CopyWithPlaceholder(),
    Object? sources = const $CopyWithPlaceholder(),
    Object? marketingEmployees = const $CopyWithPlaceholder(),
    Object? saleEmployees = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? detailStatus = const $CopyWithPlaceholder(),
    Object? detailMessage = const $CopyWithPlaceholder(),
    Object? files = const $CopyWithPlaceholder(),
    Object? filesStatus = const $CopyWithPlaceholder(),
    Object? filesMessage = const $CopyWithPlaceholder(),
    Object? filesLeadId = const $CopyWithPlaceholder(),
    Object? filesPo = const $CopyWithPlaceholder(),
    Object? filesPoStatus = const $CopyWithPlaceholder(),
    Object? filesPoMessage = const $CopyWithPlaceholder(),
    Object? filesPoLeadId = const $CopyWithPlaceholder(),
    Object? fileActionStatus = const $CopyWithPlaceholder(),
    Object? fileActionMessage = const $CopyWithPlaceholder(),
    Object? deletingFileId = const $CopyWithPlaceholder(),
    Object? poTypes = const $CopyWithPlaceholder(),
    Object? customerIndustries = const $CopyWithPlaceholder(),
    Object? customerSpecializations = const $CopyWithPlaceholder(),
    Object? businessFields = const $CopyWithPlaceholder(),
    Object? provinces = const $CopyWithPlaceholder(),
    Object? customers = const $CopyWithPlaceholder(),
    Object? customerDetail = const $CopyWithPlaceholder(),
    Object? customerDetailStatus = const $CopyWithPlaceholder(),
    Object? customerDetailMessage = const $CopyWithPlaceholder(),
    Object? submitStatus = const $CopyWithPlaceholder(),
    Object? submitMessage = const $CopyWithPlaceholder(),
    Object? saveResult = const $CopyWithPlaceholder(),
    Object? duplicates = const $CopyWithPlaceholder(),
    Object? deleteStatus = const $CopyWithPlaceholder(),
    Object? deleteMessage = const $CopyWithPlaceholder(),
    Object? activityStatus = const $CopyWithPlaceholder(),
    Object? activityMessage = const $CopyWithPlaceholder(),
    Object? activityResult = const $CopyWithPlaceholder(),
    Object? activityTypes = const $CopyWithPlaceholder(),
    Object? activityTypesStatus = const $CopyWithPlaceholder(),
    Object? activityTypesMessage = const $CopyWithPlaceholder(),
    Object? stageActionStatus = const $CopyWithPlaceholder(),
    Object? stageActionMessage = const $CopyWithPlaceholder(),
    Object? stageActionIds = const $CopyWithPlaceholder(),
    Object? saleLeaders = const $CopyWithPlaceholder(),
    Object? saleAdmins = const $CopyWithPlaceholder(),
    Object? handoverOptionsStatus = const $CopyWithPlaceholder(),
    Object? handoverOptionsMessage = const $CopyWithPlaceholder(),
    Object? adminSaleId = const $CopyWithPlaceholder(),
    Object? handoverStatus = const $CopyWithPlaceholder(),
    Object? handoverMessage = const $CopyWithPlaceholder(),
    Object? handoverIds = const $CopyWithPlaceholder(),
    Object? currentUser = const $CopyWithPlaceholder(),
  }) {
    return LeadSaleState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      leads: leads == const $CopyWithPlaceholder() || leads == null
          ? _value.leads
          // ignore: cast_nullable_to_non_nullable
          : leads as List<LeadSaleItem>,
      roleContext: roleContext == const $CopyWithPlaceholder()
          ? _value.roleContext
          // ignore: cast_nullable_to_non_nullable
          : roleContext as LeadSaleRoleContext?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
      viewMode: viewMode == const $CopyWithPlaceholder() || viewMode == null
          ? _value.viewMode
          // ignore: cast_nullable_to_non_nullable
          : viewMode as int,
      leadType: leadType == const $CopyWithPlaceholder() || leadType == null
          ? _value.leadType
          // ignore: cast_nullable_to_non_nullable
          : leadType as int,
      leadSourceId:
          leadSourceId == const $CopyWithPlaceholder() || leadSourceId == null
              ? _value.leadSourceId
              // ignore: cast_nullable_to_non_nullable
              : leadSourceId as int,
      marketingEmployeeId:
          marketingEmployeeId == const $CopyWithPlaceholder() ||
                  marketingEmployeeId == null
              ? _value.marketingEmployeeId
              // ignore: cast_nullable_to_non_nullable
              : marketingEmployeeId as int,
      saleEmployeeId: saleEmployeeId == const $CopyWithPlaceholder() ||
              saleEmployeeId == null
          ? _value.saleEmployeeId
          // ignore: cast_nullable_to_non_nullable
          : saleEmployeeId as int,
      includeOpen:
          includeOpen == const $CopyWithPlaceholder() || includeOpen == null
              ? _value.includeOpen
              // ignore: cast_nullable_to_non_nullable
              : includeOpen as bool,
      stageFilter: stageFilter == const $CopyWithPlaceholder()
          ? _value.stageFilter
          // ignore: cast_nullable_to_non_nullable
          : stageFilter as LeadSaleStage?,
      sources: sources == const $CopyWithPlaceholder() || sources == null
          ? _value.sources
          // ignore: cast_nullable_to_non_nullable
          : sources as List<LeadSaleSource>,
      marketingEmployees: marketingEmployees == const $CopyWithPlaceholder() ||
              marketingEmployees == null
          ? _value.marketingEmployees
          // ignore: cast_nullable_to_non_nullable
          : marketingEmployees as List<LeadSaleEmployee>,
      saleEmployees:
          saleEmployees == const $CopyWithPlaceholder() || saleEmployees == null
              ? _value.saleEmployees
              // ignore: cast_nullable_to_non_nullable
              : saleEmployees as List<LeadSaleEmployee>,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as LeadSaleDetail?,
      detailStatus:
          detailStatus == const $CopyWithPlaceholder() || detailStatus == null
              ? _value.detailStatus
              // ignore: cast_nullable_to_non_nullable
              : detailStatus as BaseStateStatus,
      detailMessage: detailMessage == const $CopyWithPlaceholder()
          ? _value.detailMessage
          // ignore: cast_nullable_to_non_nullable
          : detailMessage as String?,
      files: files == const $CopyWithPlaceholder() || files == null
          ? _value.files
          // ignore: cast_nullable_to_non_nullable
          : files as List<LeadSaleFile>,
      filesStatus:
          filesStatus == const $CopyWithPlaceholder() || filesStatus == null
              ? _value.filesStatus
              // ignore: cast_nullable_to_non_nullable
              : filesStatus as BaseStateStatus,
      filesMessage: filesMessage == const $CopyWithPlaceholder()
          ? _value.filesMessage
          // ignore: cast_nullable_to_non_nullable
          : filesMessage as String?,
      filesLeadId: filesLeadId == const $CopyWithPlaceholder()
          ? _value.filesLeadId
          // ignore: cast_nullable_to_non_nullable
          : filesLeadId as int?,
      filesPo: filesPo == const $CopyWithPlaceholder() || filesPo == null
          ? _value.filesPo
          // ignore: cast_nullable_to_non_nullable
          : filesPo as List<LeadSaleFile>,
      filesPoStatus:
          filesPoStatus == const $CopyWithPlaceholder() || filesPoStatus == null
              ? _value.filesPoStatus
              // ignore: cast_nullable_to_non_nullable
              : filesPoStatus as BaseStateStatus,
      filesPoMessage: filesPoMessage == const $CopyWithPlaceholder()
          ? _value.filesPoMessage
          // ignore: cast_nullable_to_non_nullable
          : filesPoMessage as String?,
      filesPoLeadId: filesPoLeadId == const $CopyWithPlaceholder()
          ? _value.filesPoLeadId
          // ignore: cast_nullable_to_non_nullable
          : filesPoLeadId as int?,
      fileActionStatus: fileActionStatus == const $CopyWithPlaceholder() ||
              fileActionStatus == null
          ? _value.fileActionStatus
          // ignore: cast_nullable_to_non_nullable
          : fileActionStatus as BaseStateStatus,
      fileActionMessage: fileActionMessage == const $CopyWithPlaceholder()
          ? _value.fileActionMessage
          // ignore: cast_nullable_to_non_nullable
          : fileActionMessage as String?,
      deletingFileId: deletingFileId == const $CopyWithPlaceholder()
          ? _value.deletingFileId
          // ignore: cast_nullable_to_non_nullable
          : deletingFileId as int?,
      poTypes: poTypes == const $CopyWithPlaceholder() || poTypes == null
          ? _value.poTypes
          // ignore: cast_nullable_to_non_nullable
          : poTypes as List<LeadSalePoType>,
      customerIndustries: customerIndustries == const $CopyWithPlaceholder() ||
              customerIndustries == null
          ? _value.customerIndustries
          // ignore: cast_nullable_to_non_nullable
          : customerIndustries as List<LeadSaleCustomerIndustry>,
      customerSpecializations:
          customerSpecializations == const $CopyWithPlaceholder() ||
                  customerSpecializations == null
              ? _value.customerSpecializations
              // ignore: cast_nullable_to_non_nullable
              : customerSpecializations as List<LeadSaleCustomerSpecialization>,
      businessFields: businessFields == const $CopyWithPlaceholder() ||
              businessFields == null
          ? _value.businessFields
          // ignore: cast_nullable_to_non_nullable
          : businessFields as List<LeadSaleBusinessField>,
      provinces: provinces == const $CopyWithPlaceholder() || provinces == null
          ? _value.provinces
          // ignore: cast_nullable_to_non_nullable
          : provinces as List<LeadSaleProvince>,
      customers: customers == const $CopyWithPlaceholder() || customers == null
          ? _value.customers
          // ignore: cast_nullable_to_non_nullable
          : customers as List<LeadSaleCustomer>,
      customerDetail: customerDetail == const $CopyWithPlaceholder()
          ? _value.customerDetail
          // ignore: cast_nullable_to_non_nullable
          : customerDetail as LeadSaleCustomer?,
      customerDetailStatus:
          customerDetailStatus == const $CopyWithPlaceholder() ||
                  customerDetailStatus == null
              ? _value.customerDetailStatus
              // ignore: cast_nullable_to_non_nullable
              : customerDetailStatus as BaseStateStatus,
      customerDetailMessage:
          customerDetailMessage == const $CopyWithPlaceholder()
              ? _value.customerDetailMessage
              // ignore: cast_nullable_to_non_nullable
              : customerDetailMessage as String?,
      submitStatus:
          submitStatus == const $CopyWithPlaceholder() || submitStatus == null
              ? _value.submitStatus
              // ignore: cast_nullable_to_non_nullable
              : submitStatus as BaseStateStatus,
      submitMessage: submitMessage == const $CopyWithPlaceholder()
          ? _value.submitMessage
          // ignore: cast_nullable_to_non_nullable
          : submitMessage as String?,
      saveResult: saveResult == const $CopyWithPlaceholder()
          ? _value.saveResult
          // ignore: cast_nullable_to_non_nullable
          : saveResult as LeadSaleSaveResult?,
      duplicates:
          duplicates == const $CopyWithPlaceholder() || duplicates == null
              ? _value.duplicates
              // ignore: cast_nullable_to_non_nullable
              : duplicates as List<LeadSaleDuplicateInfo>,
      deleteStatus:
          deleteStatus == const $CopyWithPlaceholder() || deleteStatus == null
              ? _value.deleteStatus
              // ignore: cast_nullable_to_non_nullable
              : deleteStatus as BaseStateStatus,
      deleteMessage: deleteMessage == const $CopyWithPlaceholder()
          ? _value.deleteMessage
          // ignore: cast_nullable_to_non_nullable
          : deleteMessage as String?,
      activityStatus: activityStatus == const $CopyWithPlaceholder() ||
              activityStatus == null
          ? _value.activityStatus
          // ignore: cast_nullable_to_non_nullable
          : activityStatus as BaseStateStatus,
      activityMessage: activityMessage == const $CopyWithPlaceholder()
          ? _value.activityMessage
          // ignore: cast_nullable_to_non_nullable
          : activityMessage as String?,
      activityResult: activityResult == const $CopyWithPlaceholder()
          ? _value.activityResult
          // ignore: cast_nullable_to_non_nullable
          : activityResult as LeadSaleActivitySaveResult?,
      activityTypes:
          activityTypes == const $CopyWithPlaceholder() || activityTypes == null
              ? _value.activityTypes
              // ignore: cast_nullable_to_non_nullable
              : activityTypes as List<LeadSaleActivityType>,
      activityTypesStatus:
          activityTypesStatus == const $CopyWithPlaceholder() ||
                  activityTypesStatus == null
              ? _value.activityTypesStatus
              // ignore: cast_nullable_to_non_nullable
              : activityTypesStatus as BaseStateStatus,
      activityTypesMessage: activityTypesMessage == const $CopyWithPlaceholder()
          ? _value.activityTypesMessage
          // ignore: cast_nullable_to_non_nullable
          : activityTypesMessage as String?,
      stageActionStatus: stageActionStatus == const $CopyWithPlaceholder() ||
              stageActionStatus == null
          ? _value.stageActionStatus
          // ignore: cast_nullable_to_non_nullable
          : stageActionStatus as BaseStateStatus,
      stageActionMessage: stageActionMessage == const $CopyWithPlaceholder()
          ? _value.stageActionMessage
          // ignore: cast_nullable_to_non_nullable
          : stageActionMessage as String?,
      stageActionIds: stageActionIds == const $CopyWithPlaceholder() ||
              stageActionIds == null
          ? _value.stageActionIds
          // ignore: cast_nullable_to_non_nullable
          : stageActionIds as List<int>,
      saleLeaders:
          saleLeaders == const $CopyWithPlaceholder() || saleLeaders == null
              ? _value.saleLeaders
              // ignore: cast_nullable_to_non_nullable
              : saleLeaders as List<LeadSaleEmployee>,
      saleAdmins:
          saleAdmins == const $CopyWithPlaceholder() || saleAdmins == null
              ? _value.saleAdmins
              // ignore: cast_nullable_to_non_nullable
              : saleAdmins as List<LeadSaleEmployee>,
      handoverOptionsStatus:
          handoverOptionsStatus == const $CopyWithPlaceholder() ||
                  handoverOptionsStatus == null
              ? _value.handoverOptionsStatus
              // ignore: cast_nullable_to_non_nullable
              : handoverOptionsStatus as BaseStateStatus,
      handoverOptionsMessage:
          handoverOptionsMessage == const $CopyWithPlaceholder()
              ? _value.handoverOptionsMessage
              // ignore: cast_nullable_to_non_nullable
              : handoverOptionsMessage as String?,
      adminSaleId: adminSaleId == const $CopyWithPlaceholder()
          ? _value.adminSaleId
          // ignore: cast_nullable_to_non_nullable
          : adminSaleId as int?,
      handoverStatus: handoverStatus == const $CopyWithPlaceholder() ||
              handoverStatus == null
          ? _value.handoverStatus
          // ignore: cast_nullable_to_non_nullable
          : handoverStatus as BaseStateStatus,
      handoverMessage: handoverMessage == const $CopyWithPlaceholder()
          ? _value.handoverMessage
          // ignore: cast_nullable_to_non_nullable
          : handoverMessage as String?,
      handoverIds:
          handoverIds == const $CopyWithPlaceholder() || handoverIds == null
              ? _value.handoverIds
              // ignore: cast_nullable_to_non_nullable
              : handoverIds as List<int>,
      currentUser: currentUser == const $CopyWithPlaceholder()
          ? _value.currentUser
          // ignore: cast_nullable_to_non_nullable
          : currentUser as User?,
    );
  }
}

extension $LeadSaleStateCopyWith on LeadSaleState {
  /// Returns a callable class that can be used as follows: `instanceOfLeadSaleState.copyWith(...)` or like so:`instanceOfLeadSaleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeadSaleStateCWProxy get copyWith => _$LeadSaleStateCWProxyImpl(this);
}
