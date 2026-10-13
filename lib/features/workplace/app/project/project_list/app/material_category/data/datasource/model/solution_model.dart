import 'package:freezed_annotation/freezed_annotation.dart';

part 'solution_model.freezed.dart';
part 'solution_model.g.dart';

/// Model API response cho danh sách Giải pháp.
/// API: GET /projectworker/get-solution/{projectRequestId}
@freezed
class SolutionModel with _$SolutionModel {
  const factory SolutionModel({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectRequestID') int? projectRequestId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'DateSolution') String? dateSolution,
    @JsonKey(name: 'CodeSolution') String? codeSolution,
    @JsonKey(name: 'ContentSolution') String? contentSolution,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'StatusSolution') int? statusSolution,
    @JsonKey(name: 'IsApprovedPrice') bool? isApprovedPrice,
    @JsonKey(name: 'IsApprovedPO') bool? isApprovedPO,
    @JsonKey(name: 'EmployeeApprovedPriceID') int? employeeApprovedPriceId,
    @JsonKey(name: 'EmployeeApprovedPOID') int? employeeApprovedPOId,
    @JsonKey(name: 'PriceReportDeadline') String? priceReportDeadline,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CodeRequest') String? codeRequest,
    @JsonKey(name: 'STTRequest') int? sttRequest,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
  }) = _SolutionModel;

  factory SolutionModel.fromJson(Map<String, dynamic> json) =>
      _$SolutionModelFromJson(json);
}
