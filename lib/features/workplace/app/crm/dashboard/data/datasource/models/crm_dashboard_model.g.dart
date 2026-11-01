// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CrmDashboardDataImpl _$$CrmDashboardDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CrmDashboardDataImpl(
      bySource: (json['bySource'] as List<dynamic>?)
              ?.map((e) => LeadBySource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byMarketing: (json['byMarketing'] as List<dynamic>?)
              ?.map((e) => LeadByEmployee.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bySale: (json['bySale'] as List<dynamic>?)
              ?.map((e) => LeadByEmployee.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byTeamSale: (json['byTeamSale'] as List<dynamic>?)
              ?.map((e) => LeadByTeam.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byActivity: (json['byActivity'] as List<dynamic>?)
              ?.map((e) => LeadByActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byIndustryGrowth: (json['byIndustryGrowth'] as List<dynamic>?)
              ?.map((e) =>
                  LeadByIndustryGrowth.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      byCategoryGrowth: (json['byCategoryGrowth'] as List<dynamic>?)
              ?.map((e) =>
                  LeadByCategoryGrowth.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CrmDashboardDataImplToJson(
        _$CrmDashboardDataImpl instance) =>
    <String, dynamic>{
      'bySource': instance.bySource,
      'byMarketing': instance.byMarketing,
      'bySale': instance.bySale,
      'byTeamSale': instance.byTeamSale,
      'byActivity': instance.byActivity,
      'byIndustryGrowth': instance.byIndustryGrowth,
      'byCategoryGrowth': instance.byCategoryGrowth,
    };

_$LeadBySourceImpl _$$LeadBySourceImplFromJson(Map<String, dynamic> json) =>
    _$LeadBySourceImpl(
      leadSourceName: json['LeadSourceName'] as String?,
      total: (json['Total'] as num?)?.toInt() ?? 0,
      totalMarketing: (json['TotalMarketing'] as num?)?.toInt() ?? 0,
      totalSales: (json['TotalSales'] as num?)?.toInt() ?? 0,
      totalMQL: (json['TotalMQL'] as num?)?.toInt() ?? 0,
      totalHandover: (json['TotalHandover'] as num?)?.toInt() ?? 0,
      totalConverted: (json['TotalConverted'] as num?)?.toInt() ?? 0,
      totalLost: (json['TotalLost'] as num?)?.toInt() ?? 0,
      totalDisqualified: (json['TotalDisqualified'] as num?)?.toInt() ?? 0,
      totalPO: (json['TotalPO'] as num?)?.toInt() ?? 0,
      totalReturned: (json['TotalReturned'] as num?)?.toInt() ?? 0,
      convertRate: (json['ConvertRate'] as num?)?.toDouble() ?? 0.0,
      convertedValue: (json['ConvertedValue'] as num?)?.toDouble() ?? 0.0,
      convertedValuePo: (json['ConvertedValuePo'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$LeadBySourceImplToJson(_$LeadBySourceImpl instance) =>
    <String, dynamic>{
      'LeadSourceName': instance.leadSourceName,
      'Total': instance.total,
      'TotalMarketing': instance.totalMarketing,
      'TotalSales': instance.totalSales,
      'TotalMQL': instance.totalMQL,
      'TotalHandover': instance.totalHandover,
      'TotalConverted': instance.totalConverted,
      'TotalLost': instance.totalLost,
      'TotalDisqualified': instance.totalDisqualified,
      'TotalPO': instance.totalPO,
      'TotalReturned': instance.totalReturned,
      'ConvertRate': instance.convertRate,
      'ConvertedValue': instance.convertedValue,
      'ConvertedValuePo': instance.convertedValuePo,
    };

_$LeadByEmployeeImpl _$$LeadByEmployeeImplFromJson(Map<String, dynamic> json) =>
    _$LeadByEmployeeImpl(
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeName: json['EmployeeName'] as String?,
      total: (json['Total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadByEmployeeImplToJson(
        _$LeadByEmployeeImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeId,
      'EmployeeName': instance.employeeName,
      'Total': instance.total,
    };

_$LeadByTeamImpl _$$LeadByTeamImplFromJson(Map<String, dynamic> json) =>
    _$LeadByTeamImpl(
      userTeamId: (json['UserTeamID'] as num?)?.toInt(),
      teamName: json['TeamName'] as String?,
      total: (json['Total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadByTeamImplToJson(_$LeadByTeamImpl instance) =>
    <String, dynamic>{
      'UserTeamID': instance.userTeamId,
      'TeamName': instance.teamName,
      'Total': instance.total,
    };

_$LeadByActivityImpl _$$LeadByActivityImplFromJson(Map<String, dynamic> json) =>
    _$LeadByActivityImpl(
      lastActivityType: (json['LastActivityType'] as num?)?.toInt(),
      lastActivityTypeName: json['LastActivityTypeName'] as String?,
      total: (json['Total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadByActivityImplToJson(
        _$LeadByActivityImpl instance) =>
    <String, dynamic>{
      'LastActivityType': instance.lastActivityType,
      'LastActivityTypeName': instance.lastActivityTypeName,
      'Total': instance.total,
    };

_$LeadByIndustryGrowthImpl _$$LeadByIndustryGrowthImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadByIndustryGrowthImpl(
      poTypeId: (json['PoTypeID'] as num?)?.toInt(),
      poType: json['PoType'] as String?,
      year: (json['Year'] as num?)?.toInt(),
      month: (json['Month'] as num?)?.toInt(),
      total: (json['Total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadByIndustryGrowthImplToJson(
        _$LeadByIndustryGrowthImpl instance) =>
    <String, dynamic>{
      'PoTypeID': instance.poTypeId,
      'PoType': instance.poType,
      'Year': instance.year,
      'Month': instance.month,
      'Total': instance.total,
    };

_$LeadByCategoryGrowthImpl _$$LeadByCategoryGrowthImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadByCategoryGrowthImpl(
      customerTypeName: json['CustomerTypeName'] as String?,
      year: (json['Year'] as num?)?.toInt(),
      month: (json['Month'] as num?)?.toInt(),
      total: (json['Total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeadByCategoryGrowthImplToJson(
        _$LeadByCategoryGrowthImpl instance) =>
    <String, dynamic>{
      'CustomerTypeName': instance.customerTypeName,
      'Year': instance.year,
      'Month': instance.month,
      'Total': instance.total,
    };
