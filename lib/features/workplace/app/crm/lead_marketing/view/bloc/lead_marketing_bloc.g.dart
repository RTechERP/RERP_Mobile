// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_marketing_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeadMarketingStateCWProxy {
  LeadMarketingState status(BaseStateStatus status);

  LeadMarketingState message(String? message);

  LeadMarketingState leads(List<LeadMarketingItem> leads);

  LeadMarketingState roleContext(LeadRoleContext? roleContext);

  LeadMarketingState dateStart(DateTime? dateStart);

  LeadMarketingState dateEnd(DateTime? dateEnd);

  LeadMarketingState keyword(String keyword);

  LeadMarketingState viewMode(int viewMode);

  LeadMarketingState leadType(int leadType);

  LeadMarketingState leadSourceId(int leadSourceId);

  LeadMarketingState marketingEmployeeId(int marketingEmployeeId);

  LeadMarketingState saleEmployeeId(int saleEmployeeId);

  LeadMarketingState includeOpen(bool includeOpen);

  LeadMarketingState stageFilter(LeadStage? stageFilter);

  LeadMarketingState sources(List<LeadSource> sources);

  LeadMarketingState marketingEmployees(List<LeadEmployee> marketingEmployees);

  LeadMarketingState saleEmployees(List<LeadEmployee> saleEmployees);

  LeadMarketingState detail(LeadDetail? detail);

  LeadMarketingState detailStatus(BaseStateStatus detailStatus);

  LeadMarketingState detailMessage(String? detailMessage);

  LeadMarketingState files(List<LeadFile> files);

  LeadMarketingState filesStatus(BaseStateStatus filesStatus);

  LeadMarketingState filesMessage(String? filesMessage);

  LeadMarketingState filesLeadId(int? filesLeadId);

  LeadMarketingState filesPo(List<LeadFile> filesPo);

  LeadMarketingState filesPoStatus(BaseStateStatus filesPoStatus);

  LeadMarketingState filesPoMessage(String? filesPoMessage);

  LeadMarketingState filesPoLeadId(int? filesPoLeadId);

  LeadMarketingState poTypes(List<LeadPoType> poTypes);

  LeadMarketingState customerIndustries(
      List<LeadCustomerIndustry> customerIndustries);

  LeadMarketingState customerSpecializations(
      List<LeadCustomerSpecialization> customerSpecializations);

  LeadMarketingState businessFields(List<LeadBusinessField> businessFields);

  LeadMarketingState provinces(List<LeadProvince> provinces);

  LeadMarketingState customers(List<LeadCustomer> customers);

  LeadMarketingState customerDetail(LeadCustomer? customerDetail);

  LeadMarketingState customerDetailStatus(BaseStateStatus customerDetailStatus);

  LeadMarketingState customerDetailMessage(String? customerDetailMessage);

  LeadMarketingState submitStatus(BaseStateStatus submitStatus);

  LeadMarketingState submitMessage(String? submitMessage);

  LeadMarketingState saveResult(LeadSaveResult? saveResult);

  LeadMarketingState duplicates(List<LeadDuplicateInfo> duplicates);

  LeadMarketingState deleteStatus(BaseStateStatus deleteStatus);

  LeadMarketingState deleteMessage(String? deleteMessage);

  LeadMarketingState activityStatus(BaseStateStatus activityStatus);

  LeadMarketingState activityMessage(String? activityMessage);

  LeadMarketingState activityResult(LeadActivitySaveResult? activityResult);

  LeadMarketingState activityTypes(List<LeadActivityType> activityTypes);

  LeadMarketingState activityTypesStatus(BaseStateStatus activityTypesStatus);

  LeadMarketingState activityTypesMessage(String? activityTypesMessage);

  LeadMarketingState stageActionStatus(BaseStateStatus stageActionStatus);

  LeadMarketingState stageActionMessage(String? stageActionMessage);

  LeadMarketingState stageActionIds(List<int> stageActionIds);

  LeadMarketingState currentUser(User? currentUser);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadMarketingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadMarketingState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadMarketingState call({
    BaseStateStatus? status,
    String? message,
    List<LeadMarketingItem>? leads,
    LeadRoleContext? roleContext,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? keyword,
    int? viewMode,
    int? leadType,
    int? leadSourceId,
    int? marketingEmployeeId,
    int? saleEmployeeId,
    bool? includeOpen,
    LeadStage? stageFilter,
    List<LeadSource>? sources,
    List<LeadEmployee>? marketingEmployees,
    List<LeadEmployee>? saleEmployees,
    LeadDetail? detail,
    BaseStateStatus? detailStatus,
    String? detailMessage,
    List<LeadFile>? files,
    BaseStateStatus? filesStatus,
    String? filesMessage,
    int? filesLeadId,
    List<LeadFile>? filesPo,
    BaseStateStatus? filesPoStatus,
    String? filesPoMessage,
    int? filesPoLeadId,
    List<LeadPoType>? poTypes,
    List<LeadCustomerIndustry>? customerIndustries,
    List<LeadCustomerSpecialization>? customerSpecializations,
    List<LeadBusinessField>? businessFields,
    List<LeadProvince>? provinces,
    List<LeadCustomer>? customers,
    LeadCustomer? customerDetail,
    BaseStateStatus? customerDetailStatus,
    String? customerDetailMessage,
    BaseStateStatus? submitStatus,
    String? submitMessage,
    LeadSaveResult? saveResult,
    List<LeadDuplicateInfo>? duplicates,
    BaseStateStatus? deleteStatus,
    String? deleteMessage,
    BaseStateStatus? activityStatus,
    String? activityMessage,
    LeadActivitySaveResult? activityResult,
    List<LeadActivityType>? activityTypes,
    BaseStateStatus? activityTypesStatus,
    String? activityTypesMessage,
    BaseStateStatus? stageActionStatus,
    String? stageActionMessage,
    List<int>? stageActionIds,
    User? currentUser,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeadMarketingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeadMarketingState.copyWith.fieldName(...)`
class _$LeadMarketingStateCWProxyImpl implements _$LeadMarketingStateCWProxy {
  const _$LeadMarketingStateCWProxyImpl(this._value);

  final LeadMarketingState _value;

  @override
  LeadMarketingState status(BaseStateStatus status) => this(status: status);

  @override
  LeadMarketingState message(String? message) => this(message: message);

  @override
  LeadMarketingState leads(List<LeadMarketingItem> leads) => this(leads: leads);

  @override
  LeadMarketingState roleContext(LeadRoleContext? roleContext) =>
      this(roleContext: roleContext);

  @override
  LeadMarketingState dateStart(DateTime? dateStart) =>
      this(dateStart: dateStart);

  @override
  LeadMarketingState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  LeadMarketingState keyword(String keyword) => this(keyword: keyword);

  @override
  LeadMarketingState viewMode(int viewMode) => this(viewMode: viewMode);

  @override
  LeadMarketingState leadType(int leadType) => this(leadType: leadType);

  @override
  LeadMarketingState leadSourceId(int leadSourceId) =>
      this(leadSourceId: leadSourceId);

  @override
  LeadMarketingState marketingEmployeeId(int marketingEmployeeId) =>
      this(marketingEmployeeId: marketingEmployeeId);

  @override
  LeadMarketingState saleEmployeeId(int saleEmployeeId) =>
      this(saleEmployeeId: saleEmployeeId);

  @override
  LeadMarketingState includeOpen(bool includeOpen) =>
      this(includeOpen: includeOpen);

  @override
  LeadMarketingState stageFilter(LeadStage? stageFilter) =>
      this(stageFilter: stageFilter);

  @override
  LeadMarketingState sources(List<LeadSource> sources) =>
      this(sources: sources);

  @override
  LeadMarketingState marketingEmployees(
          List<LeadEmployee> marketingEmployees) =>
      this(marketingEmployees: marketingEmployees);

  @override
  LeadMarketingState saleEmployees(List<LeadEmployee> saleEmployees) =>
      this(saleEmployees: saleEmployees);

  @override
  LeadMarketingState detail(LeadDetail? detail) => this(detail: detail);

  @override
  LeadMarketingState detailStatus(BaseStateStatus detailStatus) =>
      this(detailStatus: detailStatus);

  @override
  LeadMarketingState detailMessage(String? detailMessage) =>
      this(detailMessage: detailMessage);

  @override
  LeadMarketingState files(List<LeadFile> files) => this(files: files);

  @override
  LeadMarketingState filesStatus(BaseStateStatus filesStatus) =>
      this(filesStatus: filesStatus);

  @override
  LeadMarketingState filesMessage(String? filesMessage) =>
      this(filesMessage: filesMessage);

  @override
  LeadMarketingState filesLeadId(int? filesLeadId) =>
      this(filesLeadId: filesLeadId);

  @override
  LeadMarketingState filesPo(List<LeadFile> filesPo) => this(filesPo: filesPo);

  @override
  LeadMarketingState filesPoStatus(BaseStateStatus filesPoStatus) =>
      this(filesPoStatus: filesPoStatus);

  @override
  LeadMarketingState filesPoMessage(String? filesPoMessage) =>
      this(filesPoMessage: filesPoMessage);

  @override
  LeadMarketingState filesPoLeadId(int? filesPoLeadId) =>
      this(filesPoLeadId: filesPoLeadId);

  @override
  LeadMarketingState poTypes(List<LeadPoType> poTypes) =>
      this(poTypes: poTypes);

  @override
  LeadMarketingState customerIndustries(
          List<LeadCustomerIndustry> customerIndustries) =>
      this(customerIndustries: customerIndustries);

  @override
  LeadMarketingState customerSpecializations(
          List<LeadCustomerSpecialization> customerSpecializations) =>
      this(customerSpecializations: customerSpecializations);

  @override
  LeadMarketingState businessFields(List<LeadBusinessField> businessFields) =>
      this(businessFields: businessFields);

  @override
  LeadMarketingState provinces(List<LeadProvince> provinces) =>
      this(provinces: provinces);

  @override
  LeadMarketingState customers(List<LeadCustomer> customers) =>
      this(customers: customers);

  @override
  LeadMarketingState customerDetail(LeadCustomer? customerDetail) =>
      this(customerDetail: customerDetail);

  @override
  LeadMarketingState customerDetailStatus(
          BaseStateStatus customerDetailStatus) =>
      this(customerDetailStatus: customerDetailStatus);

  @override
  LeadMarketingState customerDetailMessage(String? customerDetailMessage) =>
      this(customerDetailMessage: customerDetailMessage);

  @override
  LeadMarketingState submitStatus(BaseStateStatus submitStatus) =>
      this(submitStatus: submitStatus);

  @override
  LeadMarketingState submitMessage(String? submitMessage) =>
      this(submitMessage: submitMessage);

  @override
  LeadMarketingState saveResult(LeadSaveResult? saveResult) =>
      this(saveResult: saveResult);

  @override
  LeadMarketingState duplicates(List<LeadDuplicateInfo> duplicates) =>
      this(duplicates: duplicates);

  @override
  LeadMarketingState deleteStatus(BaseStateStatus deleteStatus) =>
      this(deleteStatus: deleteStatus);

  @override
  LeadMarketingState deleteMessage(String? deleteMessage) =>
      this(deleteMessage: deleteMessage);

  @override
  LeadMarketingState activityStatus(BaseStateStatus activityStatus) =>
      this(activityStatus: activityStatus);

  @override
  LeadMarketingState activityMessage(String? activityMessage) =>
      this(activityMessage: activityMessage);

  @override
  LeadMarketingState activityResult(LeadActivitySaveResult? activityResult) =>
      this(activityResult: activityResult);

  @override
  LeadMarketingState activityTypes(List<LeadActivityType> activityTypes) =>
      this(activityTypes: activityTypes);

  @override
  LeadMarketingState activityTypesStatus(BaseStateStatus activityTypesStatus) =>
      this(activityTypesStatus: activityTypesStatus);

  @override
  LeadMarketingState activityTypesMessage(String? activityTypesMessage) =>
      this(activityTypesMessage: activityTypesMessage);

  @override
  LeadMarketingState stageActionStatus(BaseStateStatus stageActionStatus) =>
      this(stageActionStatus: stageActionStatus);

  @override
  LeadMarketingState stageActionMessage(String? stageActionMessage) =>
      this(stageActionMessage: stageActionMessage);

  @override
  LeadMarketingState stageActionIds(List<int> stageActionIds) =>
      this(stageActionIds: stageActionIds);

  @override
  LeadMarketingState currentUser(User? currentUser) =>
      this(currentUser: currentUser);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeadMarketingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeadMarketingState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeadMarketingState call({
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
    Object? currentUser = const $CopyWithPlaceholder(),
  }) {
    return LeadMarketingState(
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
          : leads as List<LeadMarketingItem>,
      roleContext: roleContext == const $CopyWithPlaceholder()
          ? _value.roleContext
          // ignore: cast_nullable_to_non_nullable
          : roleContext as LeadRoleContext?,
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
          : stageFilter as LeadStage?,
      sources: sources == const $CopyWithPlaceholder() || sources == null
          ? _value.sources
          // ignore: cast_nullable_to_non_nullable
          : sources as List<LeadSource>,
      marketingEmployees: marketingEmployees == const $CopyWithPlaceholder() ||
              marketingEmployees == null
          ? _value.marketingEmployees
          // ignore: cast_nullable_to_non_nullable
          : marketingEmployees as List<LeadEmployee>,
      saleEmployees:
          saleEmployees == const $CopyWithPlaceholder() || saleEmployees == null
              ? _value.saleEmployees
              // ignore: cast_nullable_to_non_nullable
              : saleEmployees as List<LeadEmployee>,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as LeadDetail?,
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
          : files as List<LeadFile>,
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
          : filesPo as List<LeadFile>,
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
      poTypes: poTypes == const $CopyWithPlaceholder() || poTypes == null
          ? _value.poTypes
          // ignore: cast_nullable_to_non_nullable
          : poTypes as List<LeadPoType>,
      customerIndustries: customerIndustries == const $CopyWithPlaceholder() ||
              customerIndustries == null
          ? _value.customerIndustries
          // ignore: cast_nullable_to_non_nullable
          : customerIndustries as List<LeadCustomerIndustry>,
      customerSpecializations:
          customerSpecializations == const $CopyWithPlaceholder() ||
                  customerSpecializations == null
              ? _value.customerSpecializations
              // ignore: cast_nullable_to_non_nullable
              : customerSpecializations as List<LeadCustomerSpecialization>,
      businessFields: businessFields == const $CopyWithPlaceholder() ||
              businessFields == null
          ? _value.businessFields
          // ignore: cast_nullable_to_non_nullable
          : businessFields as List<LeadBusinessField>,
      provinces: provinces == const $CopyWithPlaceholder() || provinces == null
          ? _value.provinces
          // ignore: cast_nullable_to_non_nullable
          : provinces as List<LeadProvince>,
      customers: customers == const $CopyWithPlaceholder() || customers == null
          ? _value.customers
          // ignore: cast_nullable_to_non_nullable
          : customers as List<LeadCustomer>,
      customerDetail: customerDetail == const $CopyWithPlaceholder()
          ? _value.customerDetail
          // ignore: cast_nullable_to_non_nullable
          : customerDetail as LeadCustomer?,
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
          : saveResult as LeadSaveResult?,
      duplicates:
          duplicates == const $CopyWithPlaceholder() || duplicates == null
              ? _value.duplicates
              // ignore: cast_nullable_to_non_nullable
              : duplicates as List<LeadDuplicateInfo>,
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
          : activityResult as LeadActivitySaveResult?,
      activityTypes:
          activityTypes == const $CopyWithPlaceholder() || activityTypes == null
              ? _value.activityTypes
              // ignore: cast_nullable_to_non_nullable
              : activityTypes as List<LeadActivityType>,
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
      currentUser: currentUser == const $CopyWithPlaceholder()
          ? _value.currentUser
          // ignore: cast_nullable_to_non_nullable
          : currentUser as User?,
    );
  }
}

extension $LeadMarketingStateCopyWith on LeadMarketingState {
  /// Returns a callable class that can be used as follows: `instanceOfLeadMarketingState.copyWith(...)` or like so:`instanceOfLeadMarketingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeadMarketingStateCWProxy get copyWith =>
      _$LeadMarketingStateCWProxyImpl(this);
}
