import 'package:freezed_annotation/freezed_annotation.dart';

part 'celebration_model.freezed.dart';
part 'celebration_model.g.dart';

// Model for birthday/seniority celebration check response
@freezed
class CelebrationItem with _$CelebrationItem {
  const factory CelebrationItem({
    @JsonKey(name: 'EmployeeID') int? employeeID,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'PositionName') String? positionName,
    @JsonKey(name: 'GioiTinh') int? gioiTinh,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
    @JsonKey(name: 'StartWorking') DateTime? startWorking,
    @JsonKey(name: 'IsBirthday') bool? isBirthday,
    @JsonKey(name: 'IsSeniority') bool? isSeniority,
    @JsonKey(name: 'IsSeniority5Year') bool? isSeniority5Year,
    @JsonKey(name: 'IsSeniority10Year') bool? isSeniority10Year,
    @JsonKey(name: 'SeniorityYears') int? seniorityYears,
    @JsonKey(name: 'TotalYearsWorking') int? totalYearsWorking,
  }) = _CelebrationItem;

  factory CelebrationItem.fromJson(Map<String, dynamic> json) =>
      _$CelebrationItemFromJson(json);
}
