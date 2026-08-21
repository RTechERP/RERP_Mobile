import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class ContactPersonalItem with _$ContactPersonalItem {
  const factory ContactPersonalItem({
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'EmployeeTeamName') String? employeeTeamName,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
    @JsonKey(name: 'EmailCongTy') String? emailCongTy,
    @JsonKey(name: 'StartWorking') DateTime? startWorking,
    @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
    @JsonKey(name: 'Code') String? code,
  }) = _ContactPersonalItem;

  factory ContactPersonalItem.fromJson(Map<String, dynamic> json) =>
      _$ContactPersonalItemFromJson(json);
}