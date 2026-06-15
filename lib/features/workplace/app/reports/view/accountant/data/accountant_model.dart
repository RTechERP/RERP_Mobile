import 'package:freezed_annotation/freezed_annotation.dart';

part 'accountant_model.freezed.dart';
part 'accountant_model.g.dart';

@freezed
class AccountantItem with _$AccountantItem {
  const factory AccountantItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') required int employeeId,
    @JsonKey(name: 'ReportDate') required String reportDate,
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'Result') required String result,
    @JsonKey(name: 'NextPlan') String? nextPlan,
    @JsonKey(name: 'PendingIssues') String? pendingIssues,
    @JsonKey(name: 'Urgent') String? urgent,
    @JsonKey(name: 'MistakeOrViolation') String? mistakeOrViolation,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'IsDeleted') @Default(false) bool isDeleted,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'RowNum') int? rowNum,
  }) = _AccountantItem;

  factory AccountantItem.fromJson(Map<String, dynamic> json) =>
      _$AccountantItemFromJson(json);
}
