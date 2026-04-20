import 'package:freezed_annotation/freezed_annotation.dart';

part 'lunch_model.freezed.dart';
part 'lunch_model.g.dart';

@freezed
class LunchItem with _$LunchItem {
  const factory LunchItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Quantity') int? quantity,
    @JsonKey(name: 'DateOrder') DateTime? dateOrder,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'Location') int? location,
    @JsonKey(name: 'LocationText') String? locationText,
    @JsonKey(name: 'EmployeeID') int? employeeId,
  }) = _LunchItem;

  factory LunchItem.fromJson(Map<String, dynamic> json) =>
      _$LunchItemFromJson(json);
}

@freezed
class SaveLunchItem with _$SaveLunchItem {
  const factory SaveLunchItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Quantity') int? quantity,
    @JsonKey(name: 'DateOrder') DateTime? dateOrder,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApproved') bool? isApproved,

    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,

    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'Location') int? location,
  }) = _SaveLunchItem;

  factory SaveLunchItem.fromJson(Map<String, dynamic> json) =>
      _$SaveLunchItemFromJson(json);
}