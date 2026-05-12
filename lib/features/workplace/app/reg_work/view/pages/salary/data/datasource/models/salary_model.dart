import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_model.freezed.dart';
part 'salary_model.g.dart';

@freezed
class SalaryItem with _$SalaryItem {
  const factory SalaryItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'EmployeeCode') String? employeeCode,
    @JsonKey(name: 'BasicSalary') double? basicSalary,
    @JsonKey(name: 'Allowance') double? allowance,
    @JsonKey(name: 'Deduction') double? deduction,
    @JsonKey(name: 'GrossSalary') double? grossSalary,
    @JsonKey(name: 'Tax') double? tax,
    @JsonKey(name: 'Insurance') double? insurance,
    @JsonKey(name: 'NetSalary') double? netSalary,
    @JsonKey(name: 'Month') int? month,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
  }) = _SalaryItem;

  factory SalaryItem.fromJson(Map<String, dynamic> json) =>
      _$SalaryItemFromJson(json);
}
