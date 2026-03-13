part of 'sale_bloc.dart';

@freezed
class SaleEvent with _$SaleEvent {
  const factory SaleEvent.init() = _Init;
  const factory SaleEvent.addWork() = _AddWork;
  const factory SaleEvent.removeWork({required int index}) = _RemoveWork;
  const factory SaleEvent.expandWork({required int index}) = _ExpandWork;
  const factory SaleEvent.getSaleProject() = _GetSaleProject;
  const factory SaleEvent.getFirmBase() = _GetFirmBase;
  const factory SaleEvent.getTypeProjectBase() = _GetTypeProjectBase;
  const factory SaleEvent.getStatusProject() = _GetStatusProject;
  const factory SaleEvent.getCustomer() = _GetCustomer;
  const factory SaleEvent.getTypeTeamSale() = _GetTypeTeamSale;

  const factory SaleEvent.getCustomerContact({required int customerId}) =
      _GetCustomerContact;
  const factory SaleEvent.getCustomerPart({required int customerId}) =
      _GetCustomerPart;
  const factory SaleEvent.updateWork({
    required int index,
    int? projectId,
    String? projectName,
    String? code,
    int? firmId,
    String? firmName,
    int? typeProjectId,
    String? typeProjectName,
    int? customerId,
    String? customerName,
    String? customerCode,
    int? typeTeamSaleId,
    String? typeTeamSaleMainIndex,
    int? statusProjectId,
    String? statusProjectName,
    int? indexStatusProject,
    int? customerContactId,
    String? customerContactName,
    String? customerContactPhone,
    String? customerContactTeam,
    String? customerContactPart,
    String? customerContactPosition,
    int? customerPartId,
    String? customerPartName,
    String? customerPartCode,
    int? indexCustomerPart,
    bool? saleOpportunity,
    bool? bigAccount,
    String? content,
    String? results,
    String? planNextDay,
    String? backlog,
    String? customerProduct,
  }) = _UpdateWork;

  const factory SaleEvent.updateDate(DateTime? picked) = _UpdateDate;

  const factory SaleEvent.submitReport(DateTime pickedDate) = _SubmitReport;

  const factory SaleEvent.resetSubmitFlags() = _ResetSubmitFlags;

  const factory SaleEvent.deleteReport({required int dailyID}) = _DeleteReport;

}
