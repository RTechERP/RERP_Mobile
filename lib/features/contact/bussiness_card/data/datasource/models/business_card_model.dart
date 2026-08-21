import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_card_model.freezed.dart';
part 'business_card_model.g.dart';

/// Model danh thiếp - thông tin chi tiết của một nhân viên trong công ty.
/// Dùng cho mục đích tạo/quản lý danh thiếp.
@freezed
class BusinessCardModel with _$BusinessCardModel {
  const factory BusinessCardModel({
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'EmployeeTeamName') String? employeeTeamName,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
    @JsonKey(name: 'EmailCongTy') String? emailCongTy,
    @JsonKey(name: 'EmailCaNhan') String? emailCaNhan,
    @JsonKey(name: 'StartWorking') DateTime? startWorking,
    @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'CompanyAddress') String? companyAddress,
    @JsonKey(name: 'CompanyPhone') String? companyPhone,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'IsFavorite') @Default(false) bool? isFavorite,
  }) = _BusinessCardModel;

  factory BusinessCardModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardModelFromJson(json);
}
