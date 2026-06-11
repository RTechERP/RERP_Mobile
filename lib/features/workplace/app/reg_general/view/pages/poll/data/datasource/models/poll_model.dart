import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_model.freezed.dart';
part 'poll_model.g.dart';

@freezed
class PollItem with _$PollItem {
  const factory PollItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsPublic') bool? isPublic,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'BackgroundImagePath') String? backgroundImagePath,
    @JsonKey(name: 'TitleColor') String? titleColor,
    @JsonKey(name: 'IsNotifycation') bool? isNotifycation,
  }) = _PollItem;

  factory PollItem.fromJson(Map<String, dynamic> json) =>
      _$PollItemFromJson(json);
}

@freezed
class PollDetailItem with _$PollDetailItem {
  const factory PollDetailItem({
    @JsonKey(name: 'Questions') List<PollQuestionItem>? questions,
    @JsonKey(name: 'Sections') List<PollSectionItem>? sections,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'TitleColor') String? titleColor,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'BackgroundImagePath') String? backgroundImagePath,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'IsPublic') bool? isPublic,
    @JsonKey(name: 'IsNotifycation') bool? isNotifycation,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
  }) = _PollDetailItem;

  factory PollDetailItem.fromJson(Map<String, dynamic> json) =>
      _$PollDetailItemFromJson(json);
}

@freezed
class PollSectionItem with _$PollSectionItem {
  const factory PollSectionItem({
    @JsonKey(name: 'Questions') List<PollQuestionItem>? questions,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'PollFormID') int? pollFormId,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'SortOrder') int? sortOrder,
    @JsonKey(name: 'ShowIfJson') String? showIfJson,
    @JsonKey(name: 'BranchingRulesJson') String? branchingRulesJson,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
  }) = _PollSectionItem;

  factory PollSectionItem.fromJson(Map<String, dynamic> json) =>
      _$PollSectionItemFromJson(json);
}

@freezed
class PollQuestionItem with _$PollQuestionItem {
  const factory PollQuestionItem({
    @JsonKey(name: 'Response') PollAnswerItem? response,
    @JsonKey(name: 'DataSourceLabel') String? dataSourceLabel,
    @JsonKey(name: 'DataSourceValue') String? dataSourceValue,
    @JsonKey(name: 'DataSourceDisplayValue') String? dataSourceDisplayValue,
    @JsonKey(name: 'IsAutoFilled') bool? isAutoFilled,
    @JsonKey(name: 'Options') List<PollOptionItem>? options,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'PollFormID') int? pollFormId,
    @JsonKey(name: 'SectionID') int? sectionId,
    @JsonKey(name: 'QuestionText') String? questionText,
    @JsonKey(name: 'FieldKey') String? fieldKey,
    @JsonKey(name: 'QuestionType') String? questionType,
    @JsonKey(name: 'IsRequired') bool? isRequired,
    @JsonKey(name: 'SortOrder') int? sortOrder,
    @JsonKey(name: 'ConfigJson') String? configJson,
    @JsonKey(name: 'DataSourceType') String? dataSourceType,
    @JsonKey(name: 'DataSourceField') String? dataSourceField,
  }) = _PollQuestionItem;

  factory PollQuestionItem.fromJson(Map<String, dynamic> json) =>
      _$PollQuestionItemFromJson(json);
}

@freezed
class PollOptionItem with _$PollOptionItem {
  const factory PollOptionItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'PollQuestionID') int? pollQuestionId,
    @JsonKey(name: 'OptionText') String? optionText,
    @JsonKey(name: 'OptionValue') String? optionValue,
    @JsonKey(name: 'SortOrder') int? sortOrder,
  }) = _PollOptionItem;

  factory PollOptionItem.fromJson(Map<String, dynamic> json) =>
      _$PollOptionItemFromJson(json);
}

@freezed
class ResponseItem with _$ResponseItem {
  const factory ResponseItem({
    @JsonKey(name: 'PollFormID') int? pollFormId,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'HasResponse') bool? hasResponse,
    @JsonKey(name: 'IsCompleted') bool? isCompleted,
    @JsonKey(name: 'CanEdit') bool? canEdit,
    @JsonKey(name: 'IsClosed') bool? isClosed,
    @JsonKey(name: 'ClosedReason') String? closedReason,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'Response') PollFormResponseItem? response,
  }) = _ResponseItem;

  factory ResponseItem.fromJson(Map<String, dynamic> json) =>
      _$ResponseItemFromJson(json);
}

@freezed
class PollFormResponseItem with _$PollFormResponseItem {
  const factory PollFormResponseItem({
    @JsonKey(name: 'Answers') List<PollAnswerItem>? answers,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'PollFormID') int? pollFormId,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsCompleted') bool? isCompleted,
    @JsonKey(name: 'CompletedDate') DateTime? completedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
  }) = _PollFormResponseItem;

  factory PollFormResponseItem.fromJson(Map<String, dynamic> json) =>
      _$PollFormResponseItemFromJson(json);
}

@freezed
class PollAnswerItem with _$PollAnswerItem {
  const factory PollAnswerItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'PollResponseID') int? pollResponseId,
    @JsonKey(name: 'PollQuestionID') int? pollQuestionId,
    @JsonKey(name: 'AnswerText') String? answerText,
    @JsonKey(name: 'AnswerJson') String? answerJson,
    @JsonKey(name: 'DisplayText') String? displayText,
  }) = _PollAnswerItem;

  factory PollAnswerItem.fromJson(Map<String, dynamic> json) =>
      _$PollAnswerItemFromJson(json);
}
