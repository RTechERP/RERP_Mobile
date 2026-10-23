// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_purchasing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApprovePurchasingItemImpl _$$ApprovePurchasingItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApprovePurchasingItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      totalBillImport: (json['TotalBillImport'] as num?)?.toDouble(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectFullName: json['ProjectFullName'] as String?,
      tt: json['TT'] as String?,
      productCode: json['ProductCode'] as String?,
      productName: json['ProductName'] as String?,
      statusRequest: (json['StatusRequest'] as num?)?.toInt(),
      statusRequestText: json['StatusRequestText'] as String?,
      fullName: json['FullName'] as String?,
      dateRequest: json['DateRequest'] == null
          ? null
          : DateTime.parse(json['DateRequest'] as String),
      dateReturnExpected: json['DateReturnExpected'] == null
          ? null
          : DateTime.parse(json['DateReturnExpected'] as String),
      quantity: (json['Quantity'] as num?)?.toDouble(),
      unitPrice: (json['UnitPrice'] as num?)?.toDouble(),
      totalPrice: (json['TotalPrice'] as num?)?.toDouble(),
      requestDate: json['RequestDate'] == null
          ? null
          : DateTime.parse(json['RequestDate'] as String),
      deadlineDelivery: json['DeadlineDelivery'] == null
          ? null
          : DateTime.parse(json['DeadlineDelivery'] as String),
      dateReturnActual: json['DateReturnActual'] == null
          ? null
          : DateTime.parse(json['DateReturnActual'] as String),
      dateReceive: json['DateReceive'] == null
          ? null
          : DateTime.parse(json['DateReceive'] as String),
      note: json['Note'] as String?,
      nameNcc: json['NameNCC'] as String?,
      projectPartListId: (json['ProjectPartListID'] as num?)?.toInt(),
      supplierSaleId: (json['SupplierSaleID'] as num?)?.toInt(),
      unitMoney: json['UnitMoney'] as String?,
      isApprovedTbp: json['IsApprovedTBP'] as bool?,
      isApprovedBgd: json['IsApprovedBGD'] as bool?,
      approvedTbp: (json['ApprovedTBP'] as num?)?.toInt(),
      approvedTbpName: json['ApprovedTBPName'] as String?,
      approvedBgd: (json['ApprovedBGD'] as num?)?.toInt(),
      approvedBgdName: json['ApprovedBGDName'] as String?,
      dateApprovedTbp: json['DateApprovedTBP'] == null
          ? null
          : DateTime.parse(json['DateApprovedTBP'] as String),
      dateApprovedBgd: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      productGroupId: (json['ProductGroupID'] as num?)?.toInt(),
      productSaleId: (json['ProductSaleID'] as num?)?.toInt(),
      productNewCode: json['ProductNewCode'] as String?,
      isImport: json['IsImport'] as bool?,
      currencyId: (json['CurrencyID'] as num?)?.toInt(),
      currencyRate: (json['CurrencyRate'] as num?)?.toDouble(),
      totalPriceExchange: (json['TotalPriceExchange'] as num?)?.toDouble(),
      leadTime: json['LeadTime'] as String?,
      unitFactoryExportPrice:
          (json['UnitFactoryExportPrice'] as num?)?.toDouble(),
      unitImportPrice: (json['UnitImportPrice'] as num?)?.toDouble(),
      totalImportPrice: (json['TotalImportPrice'] as num?)?.toDouble(),
      isRequestApproved: json['IsRequestApproved'] as bool?,
      manufacturer: json['Manufacturer'] as String?,
      reasonCancel: json['ReasonCancel'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      updatedName: json['UpdatedName'] as String?,
      vat: (json['VAT'] as num?)?.toDouble(),
      totaMoneyVat: (json['TotaMoneyVAT'] as num?)?.toDouble(),
      totalDayLeadTime: (json['TotalDayLeadTime'] as num?)?.toInt(),
      ponccId: (json['PONCCID'] as num?)?.toInt(),
      billCode: json['BillCode'] as String?,
      unitPricePokh: (json['UnitPricePOKH'] as num?)?.toDouble(),
      isCommercialProduct: json['IsCommercialProduct'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
      model: json['Model'] as String?,
      jobRequirementId: (json['JobRequirementID'] as num?)?.toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectTypeName: json['ProjectTypeName'] as String?,
      customerName: json['CustomerName'] as String?,
      poNumber: json['PONumber'] as String?,
      guestCode: json['GuestCode'] as String?,
      customerCode: json['CustomerCode'] as String?,
      pokhCode: json['POKHCode'] as String?,
      statusPokhText: json['StatusPOKHText'] as String?,
      specialCode: json['SpecialCode'] as String?,
      historyPrice: (json['HistoryPrice'] as num?)?.toDouble(),
      totalPriceHistory: (json['TotalPriceHistory'] as num?)?.toDouble(),
      isTechBought: json['IsTechBought'] as bool?,
      isApprovedBgdText: json['IsApprovedBGDText'] as String?,
      productGroupRtcId: (json['ProductGroupRTCID'] as num?)?.toInt(),
      productRtcId: (json['ProductRTCID'] as num?)?.toInt(),
      productNewCodeSale: json['ProductNewCodeSale'] as String?,
      notePartlist: json['NotePartlist'] as String?,
      ticketType: (json['TicketType'] as num?)?.toInt(),
      ticketTypeText: json['TicketTypeText'] as String?,
      dateReturnEstimated: json['DateReturnEstimated'] == null
          ? null
          : DateTime.parse(json['DateReturnEstimated'] as String),
      isStock: json['IsStock'] as bool?,
      productCodeRtc: json['ProductCodeRTC'] as String?,
      totalBillImportCount: (json['TotalBillImportCount'] as num?)?.toDouble(),
      projectPartlistPurchaseRequestTypeId:
          (json['ProjectPartlistPurchaseRequestTypeID'] as num?)?.toInt(),
      unitCountId: (json['UnitCountID'] as num?)?.toInt(),
      noteMarketing: json['NoteMarketing'] as String?,
      unitName: json['UnitName'] as String?,
      fullNamePriceRequest: json['FullNamePriceRequest'] as String?,
      unitNameNew: json['UnitNameNew'] as String?,
      unitPriceText: json['UnitPricetext'] as String?,
      projectId1: (json['ProjectID1'] as num?)?.toInt(),
      projectId2: (json['ProjectID2'] as num?)?.toInt(),
      productCode1: json['ProductCode1'] as String?,
      pokhDetailId: (json['POKHDetailID'] as num?)?.toInt(),
      inventoryProjectId: (json['InventoryProjectID'] as num?)?.toInt(),
      targetPrice: (json['TargetPrice'] as num?)?.toDouble(),
      duplicateId: (json['DuplicateID'] as num?)?.toInt(),
      originQuantity: (json['OriginQuantity'] as num?)?.toDouble(),
      totalHn: json['TotalHN'] as String?,
      totalHcm: json['TotalHCM'] as String?,
      totalBn: json['TotalBN'] as String?,
      totalHp: json['TotalHP'] as String?,
      totalBh: json['TotalBH'] as String?,
      totalDp: json['TotalDP'] as String?,
      parentProductCode: json['ParentProductCode'] as String?,
      parentProductCodePo: json['ParentProductCodePO'] as String?,
      warehouseId: (json['WarehouseID'] as num?)?.toInt(),
      isPaidLater: json['IsPaidLater'] as bool?,
      discountPercent: (json['DiscountPercent'] as num?)?.toDouble(),
      fullNameSale: json['FullNameSale'] as String?,
    );

Map<String, dynamic> _$$ApprovePurchasingItemImplToJson(
        _$ApprovePurchasingItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TotalBillImport': instance.totalBillImport,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectFullName': instance.projectFullName,
      'TT': instance.tt,
      'ProductCode': instance.productCode,
      'ProductName': instance.productName,
      'StatusRequest': instance.statusRequest,
      'StatusRequestText': instance.statusRequestText,
      'FullName': instance.fullName,
      'DateRequest': instance.dateRequest?.toIso8601String(),
      'DateReturnExpected': instance.dateReturnExpected?.toIso8601String(),
      'Quantity': instance.quantity,
      'UnitPrice': instance.unitPrice,
      'TotalPrice': instance.totalPrice,
      'RequestDate': instance.requestDate?.toIso8601String(),
      'DeadlineDelivery': instance.deadlineDelivery?.toIso8601String(),
      'DateReturnActual': instance.dateReturnActual?.toIso8601String(),
      'DateReceive': instance.dateReceive?.toIso8601String(),
      'Note': instance.note,
      'NameNCC': instance.nameNcc,
      'ProjectPartListID': instance.projectPartListId,
      'SupplierSaleID': instance.supplierSaleId,
      'UnitMoney': instance.unitMoney,
      'IsApprovedTBP': instance.isApprovedTbp,
      'IsApprovedBGD': instance.isApprovedBgd,
      'ApprovedTBP': instance.approvedTbp,
      'ApprovedTBPName': instance.approvedTbpName,
      'ApprovedBGD': instance.approvedBgd,
      'ApprovedBGDName': instance.approvedBgdName,
      'DateApprovedTBP': instance.dateApprovedTbp?.toIso8601String(),
      'DateApprovedBGD': instance.dateApprovedBgd?.toIso8601String(),
      'ProductGroupID': instance.productGroupId,
      'ProductSaleID': instance.productSaleId,
      'ProductNewCode': instance.productNewCode,
      'IsImport': instance.isImport,
      'CurrencyID': instance.currencyId,
      'CurrencyRate': instance.currencyRate,
      'TotalPriceExchange': instance.totalPriceExchange,
      'LeadTime': instance.leadTime,
      'UnitFactoryExportPrice': instance.unitFactoryExportPrice,
      'UnitImportPrice': instance.unitImportPrice,
      'TotalImportPrice': instance.totalImportPrice,
      'IsRequestApproved': instance.isRequestApproved,
      'Manufacturer': instance.manufacturer,
      'ReasonCancel': instance.reasonCancel,
      'ProjectID': instance.projectId,
      'UpdatedName': instance.updatedName,
      'VAT': instance.vat,
      'TotaMoneyVAT': instance.totaMoneyVat,
      'TotalDayLeadTime': instance.totalDayLeadTime,
      'PONCCID': instance.ponccId,
      'BillCode': instance.billCode,
      'UnitPricePOKH': instance.unitPricePokh,
      'IsCommercialProduct': instance.isCommercialProduct,
      'IsDeleted': instance.isDeleted,
      'Model': instance.model,
      'JobRequirementID': instance.jobRequirementId,
      'CustomerID': instance.customerId,
      'ProjectTypeName': instance.projectTypeName,
      'CustomerName': instance.customerName,
      'PONumber': instance.poNumber,
      'GuestCode': instance.guestCode,
      'CustomerCode': instance.customerCode,
      'POKHCode': instance.pokhCode,
      'StatusPOKHText': instance.statusPokhText,
      'SpecialCode': instance.specialCode,
      'HistoryPrice': instance.historyPrice,
      'TotalPriceHistory': instance.totalPriceHistory,
      'IsTechBought': instance.isTechBought,
      'IsApprovedBGDText': instance.isApprovedBgdText,
      'ProductGroupRTCID': instance.productGroupRtcId,
      'ProductRTCID': instance.productRtcId,
      'ProductNewCodeSale': instance.productNewCodeSale,
      'NotePartlist': instance.notePartlist,
      'TicketType': instance.ticketType,
      'TicketTypeText': instance.ticketTypeText,
      'DateReturnEstimated': instance.dateReturnEstimated?.toIso8601String(),
      'IsStock': instance.isStock,
      'ProductCodeRTC': instance.productCodeRtc,
      'TotalBillImportCount': instance.totalBillImportCount,
      'ProjectPartlistPurchaseRequestTypeID':
          instance.projectPartlistPurchaseRequestTypeId,
      'UnitCountID': instance.unitCountId,
      'NoteMarketing': instance.noteMarketing,
      'UnitName': instance.unitName,
      'FullNamePriceRequest': instance.fullNamePriceRequest,
      'UnitNameNew': instance.unitNameNew,
      'UnitPricetext': instance.unitPriceText,
      'ProjectID1': instance.projectId1,
      'ProjectID2': instance.projectId2,
      'ProductCode1': instance.productCode1,
      'POKHDetailID': instance.pokhDetailId,
      'InventoryProjectID': instance.inventoryProjectId,
      'TargetPrice': instance.targetPrice,
      'DuplicateID': instance.duplicateId,
      'OriginQuantity': instance.originQuantity,
      'TotalHN': instance.totalHn,
      'TotalHCM': instance.totalHcm,
      'TotalBN': instance.totalBn,
      'TotalHP': instance.totalHp,
      'TotalBH': instance.totalBh,
      'TotalDP': instance.totalDp,
      'ParentProductCode': instance.parentProductCode,
      'ParentProductCodePO': instance.parentProductCodePo,
      'WarehouseID': instance.warehouseId,
      'IsPaidLater': instance.isPaidLater,
      'DiscountPercent': instance.discountPercent,
      'FullNameSale': instance.fullNameSale,
    };

_$ApprovePurchasingRequestTypeItemImpl
    _$$ApprovePurchasingRequestTypeItemImplFromJson(
            Map<String, dynamic> json) =>
        _$ApprovePurchasingRequestTypeItemImpl(
          id: (json['ID'] as num?)?.toInt(),
          requestTypeName: json['RequestTypeName'] as String?,
          requestTypeCode: json['RequestTypeCode'] as String?,
          isIgnoreBgd: json['IsIgnoreBGD'] as bool?,
        );

Map<String, dynamic> _$$ApprovePurchasingRequestTypeItemImplToJson(
        _$ApprovePurchasingRequestTypeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RequestTypeName': instance.requestTypeName,
      'RequestTypeCode': instance.requestTypeCode,
      'IsIgnoreBGD': instance.isIgnoreBgd,
    };

_$CurrencyItemImpl _$$CurrencyItemImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      nameEnglish: json['NameEnglist'] as String?,
      nameVietnamese: json['NameVietNamese'] as String?,
      minUnit: json['MinUnit'] as String?,
      currencyRate: (json['CurrencyRate'] as num?)?.toDouble(),
      note: json['Note'] as String?,
      currencyRateOfficialQuota:
          (json['CurrencyRateOfficialQuota'] as num?)?.toDouble(),
      currencyRateUnofficialQuota:
          (json['CurrencyRateUnofficialQuota'] as num?)?.toDouble(),
      dateExpired: json['DateExpried'] == null
          ? null
          : DateTime.parse(json['DateExpried'] as String),
      dateStart: json['DateStart'] == null
          ? null
          : DateTime.parse(json['DateStart'] as String),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$CurrencyItemImplToJson(_$CurrencyItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'NameEnglist': instance.nameEnglish,
      'NameVietNamese': instance.nameVietnamese,
      'MinUnit': instance.minUnit,
      'CurrencyRate': instance.currencyRate,
      'Note': instance.note,
      'CurrencyRateOfficialQuota': instance.currencyRateOfficialQuota,
      'CurrencyRateUnofficialQuota': instance.currencyRateUnofficialQuota,
      'DateExpried': instance.dateExpired?.toIso8601String(),
      'DateStart': instance.dateStart?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
    };

_$ProductGroupItemImpl _$$ProductGroupItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductGroupItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      productGroupCode: json['ProductGroupID'] as String?,
      productGroupName: json['ProductGroupName'] as String?,
      isVisible: json['IsVisible'] as bool?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      parentId: (json['ParentID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductGroupItemImplToJson(
        _$ProductGroupItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProductGroupID': instance.productGroupCode,
      'ProductGroupName': instance.productGroupName,
      'IsVisible': instance.isVisible,
      'EmployeeID': instance.employeeId,
      'ParentID': instance.parentId,
      'STT': instance.stt,
    };

_$SupplierItemImpl _$$SupplierItemImplFromJson(Map<String, dynamic> json) =>
    _$SupplierItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      codeNcc: json['CodeNCC'] as String?,
      nameNcc: json['NameNCC'] as String?,
      addressNcc: json['AddressNCC'] as String?,
      phoneNcc: json['PhoneNCC'] as String?,
      ordererNcc: json['OrdererNCC'] as String?,
      debt: json['Debt'] as String?,
      ngayUpdate: json['NgayUpdate'] == null
          ? null
          : DateTime.parse(json['NgayUpdate'] as String),
      nvPhuTrach: json['NVPhuTrach'] as String?,
      loaiHangHoa: json['LoaiHangHoa'] as String?,
      brand: json['Brand'] as String?,
      maNhom: json['MaNhom'] as String?,
      tenTiengAnh: json['TenTiengAnh'] as String?,
      website: json['Website'] as String?,
      soTk: json['SoTK'] as String?,
      nganHang: json['NganHang'] as String?,
      maSoThue: json['MaSoThue'] as String?,
      note: json['Note'] as String?,
      company: (json['Company'] as num?)?.toInt(),
      shortNameSupplier: json['ShortNameSupplier'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      isDebt: json['IsDebt'] as bool?,
      fedexAccount: json['FedexAccount'] as String?,
      originItem: json['OriginItem'] as String?,
      bankCharge: json['BankCharge'] as String?,
      addressDelivery: json['AddressDelivery'] as String?,
      rulePayId: (json['RulePayID'] as num?)?.toInt(),
      description: json['Description'] as String?,
      ruleIncoterm: json['RuleIncoterm'] as String?,
      bankListId: (json['BankListID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SupplierItemImplToJson(_$SupplierItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CodeNCC': instance.codeNcc,
      'NameNCC': instance.nameNcc,
      'AddressNCC': instance.addressNcc,
      'PhoneNCC': instance.phoneNcc,
      'OrdererNCC': instance.ordererNcc,
      'Debt': instance.debt,
      'NgayUpdate': instance.ngayUpdate?.toIso8601String(),
      'NVPhuTrach': instance.nvPhuTrach,
      'LoaiHangHoa': instance.loaiHangHoa,
      'Brand': instance.brand,
      'MaNhom': instance.maNhom,
      'TenTiengAnh': instance.tenTiengAnh,
      'Website': instance.website,
      'SoTK': instance.soTk,
      'NganHang': instance.nganHang,
      'MaSoThue': instance.maSoThue,
      'Note': instance.note,
      'Company': instance.company,
      'ShortNameSupplier': instance.shortNameSupplier,
      'EmployeeID': instance.employeeId,
      'IsDeleted': instance.isDeleted,
      'IsDebt': instance.isDebt,
      'FedexAccount': instance.fedexAccount,
      'OriginItem': instance.originItem,
      'BankCharge': instance.bankCharge,
      'AddressDelivery': instance.addressDelivery,
      'RulePayID': instance.rulePayId,
      'Description': instance.description,
      'RuleIncoterm': instance.ruleIncoterm,
      'BankListID': instance.bankListId,
    };

_$ProjectFilterItemImpl _$$ProjectFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectShortName: json['ProjectShortName'] as String?,
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'] as bool?,
      contactId: (json['ContactID'] as num?)?.toInt(),
      po: json['PO'] as String?,
      projectType: (json['ProjectType'] as num?)?.toInt(),
      listCostId: (json['ListCostID'] as num?)?.toInt(),
      planDateStart: json['PlanDateStart'] == null
          ? null
          : DateTime.parse(json['PlanDateStart'] as String),
      planDateEnd: json['PlanDateEnd'] == null
          ? null
          : DateTime.parse(json['PlanDateEnd'] as String),
      actualDateStart: json['ActualDateStart'] == null
          ? null
          : DateTime.parse(json['ActualDateStart'] as String),
      actualDateEnd: json['ActualDateEnd'] == null
          ? null
          : DateTime.parse(json['ActualDateEnd'] as String),
      eu: json['EU'] as String?,
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      currentState: json['CurrentState'] as String?,
      priority: (json['Priotity'] as num?)?.toDouble(),
      poDate: json['PODate'] == null
          ? null
          : DateTime.parse(json['PODate'] as String),
      endUser: (json['EndUser'] as num?)?.toInt(),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ProjectFilterItemImplToJson(
        _$ProjectFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'ContactID': instance.contactId,
      'PO': instance.po,
      'ProjectType': instance.projectType,
      'ListCostID': instance.listCostId,
      'PlanDateStart': instance.planDateStart?.toIso8601String(),
      'PlanDateEnd': instance.planDateEnd?.toIso8601String(),
      'ActualDateStart': instance.actualDateStart?.toIso8601String(),
      'ActualDateEnd': instance.actualDateEnd?.toIso8601String(),
      'EU': instance.eu,
      'ProjectManager': instance.projectManager,
      'CurrentState': instance.currentState,
      'Priotity': instance.priority,
      'PODate': instance.poDate?.toIso8601String(),
      'EndUser': instance.endUser,
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
    };

_$ProductPriceHistoryItemImpl _$$ProductPriceHistoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPriceHistoryItemImpl(
      productCode: json['ProductCode'] as String?,
      productName: json['ProductName'] as String?,
      unitPrice: (json['UnitPrice'] as num?)?.toDouble(),
      currencyCode: json['CurrencyCode'] as String?,
      currencyRate: (json['CurrencyRate'] as num?)?.toDouble(),
      nameNcc: json['NameNCC'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      productId: (json['ProductID'] as num?)?.toInt(),
      leadTime: json['LeadTime'] as String?,
      tableType: json['TableType'] as String?,
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      supplierSaleId: (json['SupplierSaleID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      unit: json['Unit'] as String?,
      codeNcc: json['CodeNCC'] as String?,
      quantity: (json['Quantity'] as num?)?.toDouble(),
      maker: json['Maker'] as String?,
      model: json['Model'] as String?,
      totalPriceExchange: (json['TotalPriceExchange'] as num?)?.toDouble(),
      totalMoney: (json['TotalMoney'] as num?)?.toDouble(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductPriceHistoryItemImplToJson(
        _$ProductPriceHistoryItemImpl instance) =>
    <String, dynamic>{
      'ProductCode': instance.productCode,
      'ProductName': instance.productName,
      'UnitPrice': instance.unitPrice,
      'CurrencyCode': instance.currencyCode,
      'CurrencyRate': instance.currencyRate,
      'NameNCC': instance.nameNcc,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'ProductID': instance.productId,
      'LeadTime': instance.leadTime,
      'TableType': instance.tableType,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'SupplierSaleID': instance.supplierSaleId,
      'ProjectID': instance.projectId,
      'Unit': instance.unit,
      'CodeNCC': instance.codeNcc,
      'Quantity': instance.quantity,
      'Maker': instance.maker,
      'Model': instance.model,
      'TotalPriceExchange': instance.totalPriceExchange,
      'TotalMoney': instance.totalMoney,
      'EmployeeID': instance.employeeId,
    };
