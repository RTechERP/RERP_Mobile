import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_table_model.freezed.dart';
part 'test_table_model.g.dart';

/// Phiếu đăng ký bàn test ESL từ `/ESLRegistration/get-all-registration`.
@freezed
class TestTableItem with _$TestTableItem {
  const factory TestTableItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegistrationCode') String? registrationCode,
    @JsonKey(name: 'TestTableID') int? testTableId,
    @JsonKey(name: 'TestTableName') String? testTableName,
    @JsonKey(name: 'TableSide') int? tableSide,
    @JsonKey(name: 'RegistrationStartDate') DateTime? registrationStartDate,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'RegistrationContent') String? registrationContent,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'DetailID') int? detailId,
    @JsonKey(name: 'No') int? no,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'DetailStartDate') DateTime? detailStartDate,
    @JsonKey(name: 'DetailEndDate') DateTime? detailEndDate,
    @JsonKey(name: 'ActualReturnDate') DateTime? actualReturnDate,
    @JsonKey(name: 'OwnerID') int? ownerId,
    @JsonKey(name: 'OwnerFullName') String? ownerFullName,
    @JsonKey(name: 'OwnerSDTCaNhan') String? ownerPhone,
    @JsonKey(name: 'OwnerCode') String? ownerCode,
    @JsonKey(name: 'ApproverID') int? approverId,
    @JsonKey(name: 'ApproverFullName') String? approverFullName,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ApproveDate') DateTime? approveDate,
    @JsonKey(name: 'ApproveNote') String? approveNote,
    @JsonKey(name: 'esl_battery') int? eslBattery,
    @JsonKey(name: 'online') bool? online,
    @JsonKey(name: 'tableID') int? tableId,
    @JsonKey(name: 'DetailsJson') String? detailsJson,
  }) = _TestTableItem;

  factory TestTableItem.fromJson(Map<String, dynamic> json) =>
      _$TestTableItemFromJson(json);
}
