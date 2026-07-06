import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_form_model.freezed.dart';
part 'general_form_model.g.dart';

@freezed
class FormItem with _$FormItem {
  const factory FormItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'NameDocumentType') String? nameDocumentType,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'NameDocument') String? nameDocument,
    @JsonKey(name: 'DatePromulgate') DateTime? datePromulgate,
    @JsonKey(name: 'DateEffective') DateTime? dateEffective,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DepartmentCode') String? departmentCode,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentCode1') String? departmentCode1,
  }) = _FormItem;

  factory FormItem.fromJson(Map<String, dynamic> json) =>
      _$FormItemFromJson(json);
}

@freezed
class FormDetailItem with _$FormDetailItem {
  const factory FormDetailItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'DocumentID') int? documentId,
    @JsonKey(name: 'FileNameOrigin') String? fileNameOrigin,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _FormDetailItem;

  factory FormDetailItem.fromJson(Map<String, dynamic> json) =>
      _$FormDetailItemFromJson(json);
}