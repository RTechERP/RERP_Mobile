import 'package:freezed_annotation/freezed_annotation.dart';

part 'crm_dashboard_model.freezed.dart';
part 'crm_dashboard_model.g.dart';

/// Model dữ liệu dashboard CRM.
@freezed
class CrmDashboardData with _$CrmDashboardData {
  const factory CrmDashboardData({
    @JsonKey(name: 'bySource') @Default([]) List<LeadBySource> bySource,
    @JsonKey(name: 'byMarketing') @Default([]) List<LeadByEmployee> byMarketing,
    @JsonKey(name: 'bySale') @Default([]) List<LeadByEmployee> bySale,
    @JsonKey(name: 'byTeamSale') @Default([]) List<LeadByTeam> byTeamSale,
    @JsonKey(name: 'byActivity') @Default([]) List<LeadByActivity> byActivity,
    @JsonKey(name: 'byIndustryGrowth') @Default([]) List<LeadByIndustryGrowth> byIndustryGrowth,
    @JsonKey(name: 'byCategoryGrowth') @Default([]) List<LeadByCategoryGrowth> byCategoryGrowth,
  }) = _CrmDashboardData;

  factory CrmDashboardData.fromJson(Map<String, dynamic> json) =>
      _$CrmDashboardDataFromJson(json);
}

/// Thống kê Lead theo nguồn.
@freezed
class LeadBySource with _$LeadBySource {
  const factory LeadBySource({
    @JsonKey(name: 'LeadSourceName') String? leadSourceName,
    @JsonKey(name: 'Total') @Default(0) int total,
    @JsonKey(name: 'TotalMarketing') @Default(0) int totalMarketing,
    @JsonKey(name: 'TotalSales') @Default(0) int totalSales,
    @JsonKey(name: 'TotalMQL') @Default(0) int totalMQL,
    @JsonKey(name: 'TotalHandover') @Default(0) int totalHandover,
    @JsonKey(name: 'TotalConverted') @Default(0) int totalConverted,
    @JsonKey(name: 'TotalLost') @Default(0) int totalLost,
    @JsonKey(name: 'TotalDisqualified') @Default(0) int totalDisqualified,
    @JsonKey(name: 'TotalPO') @Default(0) int totalPO,
    @JsonKey(name: 'TotalReturned') @Default(0) int totalReturned,
    @JsonKey(name: 'ConvertRate') @Default(0.0) double convertRate,
    @JsonKey(name: 'ConvertedValue') @Default(0.0) double convertedValue,
    @JsonKey(name: 'ConvertedValuePo') @Default(0.0) double convertedValuePo,
  }) = _LeadBySource;

  factory LeadBySource.fromJson(Map<String, dynamic> json) =>
      _$LeadBySourceFromJson(json);
}

/// Thống kê Lead theo nhân viên.
@freezed
class LeadByEmployee with _$LeadByEmployee {
  const factory LeadByEmployee({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'Total') @Default(0) int total,
  }) = _LeadByEmployee;

  factory LeadByEmployee.fromJson(Map<String, dynamic> json) =>
      _$LeadByEmployeeFromJson(json);
}

/// Thống kê Lead theo team Sale.
@freezed
class LeadByTeam with _$LeadByTeam {
  const factory LeadByTeam({
    @JsonKey(name: 'UserTeamID') int? userTeamId,
    @JsonKey(name: 'TeamName') String? teamName,
    @JsonKey(name: 'Total') @Default(0) int total,
  }) = _LeadByTeam;

  factory LeadByTeam.fromJson(Map<String, dynamic> json) =>
      _$LeadByTeamFromJson(json);
}

/// Thống kê Lead theo hoạt động.
@freezed
class LeadByActivity with _$LeadByActivity {
  const factory LeadByActivity({
    @JsonKey(name: 'LastActivityType') int? lastActivityType,
    @JsonKey(name: 'LastActivityTypeName') String? lastActivityTypeName,
    @JsonKey(name: 'Total') @Default(0) int total,
  }) = _LeadByActivity;

  factory LeadByActivity.fromJson(Map<String, dynamic> json) =>
      _$LeadByActivityFromJson(json);
}

/// Thống kê Lead theo nhóm hàng (tăng trưởng).
@freezed
class LeadByIndustryGrowth with _$LeadByIndustryGrowth {
  const factory LeadByIndustryGrowth({
    @JsonKey(name: 'PoTypeID') int? poTypeId,
    @JsonKey(name: 'PoType') String? poType,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'Month') int? month,
    @JsonKey(name: 'Total') @Default(0) int total,
  }) = _LeadByIndustryGrowth;

  factory LeadByIndustryGrowth.fromJson(Map<String, dynamic> json) =>
      _$LeadByIndustryGrowthFromJson(json);
}

/// Thống kê Lead theo loại khách hàng (tăng trưởng).
@freezed
class LeadByCategoryGrowth with _$LeadByCategoryGrowth {
  const factory LeadByCategoryGrowth({
    @JsonKey(name: 'CustomerTypeName') String? customerTypeName,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'Month') int? month,
    @JsonKey(name: 'Total') @Default(0) int total,
  }) = _LeadByCategoryGrowth;

  factory LeadByCategoryGrowth.fromJson(Map<String, dynamic> json) =>
      _$LeadByCategoryGrowthFromJson(json);
}
