import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_source_model.freezed.dart';
part 'lead_source_model.g.dart';

/// Nguồn lead trong CRM.
///
/// API: GET /LeadSource?sourceGroup=0.
@freezed
class LeadSourceItem with _$LeadSourceItem {
  const factory LeadSourceItem({
    @JsonKey(name: 'ID') @Default(0) int id,
    @JsonKey(name: 'Code') @Default('') String code,
    @JsonKey(name: 'Name') @Default('') String name,
    @JsonKey(name: 'SourceGroup') @Default(0) int sourceGroup,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _LeadSourceItem;

  factory LeadSourceItem.fromJson(Map<String, dynamic> json) =>
      _$LeadSourceItemFromJson(json);
}
