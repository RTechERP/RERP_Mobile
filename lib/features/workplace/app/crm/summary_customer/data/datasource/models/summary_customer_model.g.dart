// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryCustomerItemImpl _$$SummaryCustomerItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryCustomerItemImpl(
      customerName: json['CustomerName'] as String?,
      typeName: json['TypeName'] as String?,
      customerCode: json['CustomerCode'] as String?,
      customerShortName: json['CustomerShortName'] as String?,
      address: json['Address'] as String?,
      taxCode: json['TaxCode'] as String?,
      industriesNameVi: json['IndustriesNameVI'] as String?,
      industryProduct: json['IndustryProduct'] as String?,
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      pic: json['PIC'] as String?,
    );

Map<String, dynamic> _$$SummaryCustomerItemImplToJson(
        _$SummaryCustomerItemImpl instance) =>
    <String, dynamic>{
      'CustomerName': instance.customerName,
      'TypeName': instance.typeName,
      'CustomerCode': instance.customerCode,
      'CustomerShortName': instance.customerShortName,
      'Address': instance.address,
      'TaxCode': instance.taxCode,
      'IndustriesNameVI': instance.industriesNameVi,
      'IndustryProduct': instance.industryProduct,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'PIC': instance.pic,
    };
