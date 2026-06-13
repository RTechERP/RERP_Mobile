// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollItemImpl _$$PollItemImplFromJson(Map<String, dynamic> json) =>
    _$PollItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      title: json['Title'] as String?,
      description: json['Description'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isPublic: json['IsPublic'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
      backgroundImagePath: json['BackgroundImagePath'] as String?,
      titleColor: json['TitleColor'] as String?,
      isNotifycation: json['IsNotifycation'] as bool?,
    );

Map<String, dynamic> _$$PollItemImplToJson(_$PollItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Title': instance.title,
      'Description': instance.description,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsPublic': instance.isPublic,
      'IsDeleted': instance.isDeleted,
      'BackgroundImagePath': instance.backgroundImagePath,
      'TitleColor': instance.titleColor,
      'IsNotifycation': instance.isNotifycation,
    };

_$PollDetailItemImpl _$$PollDetailItemImplFromJson(Map<String, dynamic> json) =>
    _$PollDetailItemImpl(
      questions: (json['Questions'] as List<dynamic>?)
          ?.map((e) => PollQuestionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      sections: (json['Sections'] as List<dynamic>?)
          ?.map((e) => PollSectionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['ID'] as num?)?.toInt(),
      title: json['Title'] as String?,
      titleColor: json['TitleColor'] as String?,
      description: json['Description'] as String?,
      backgroundImagePath: json['BackgroundImagePath'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      isPublic: json['IsPublic'] as bool?,
      isNotifycation: json['IsNotifycation'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
    );

Map<String, dynamic> _$$PollDetailItemImplToJson(
        _$PollDetailItemImpl instance) =>
    <String, dynamic>{
      'Questions': instance.questions,
      'Sections': instance.sections,
      'ID': instance.id,
      'Title': instance.title,
      'TitleColor': instance.titleColor,
      'Description': instance.description,
      'BackgroundImagePath': instance.backgroundImagePath,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'IsPublic': instance.isPublic,
      'IsNotifycation': instance.isNotifycation,
      'IsDeleted': instance.isDeleted,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
    };

_$PollSectionItemImpl _$$PollSectionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PollSectionItemImpl(
      questions: (json['Questions'] as List<dynamic>?)
          ?.map((e) => PollQuestionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['ID'] as num?)?.toInt(),
      pollFormId: (json['PollFormID'] as num?)?.toInt(),
      title: json['Title'] as String?,
      description: json['Description'] as String?,
      sortOrder: (json['SortOrder'] as num?)?.toInt(),
      showIfJson: json['ShowIfJson'] as String?,
      branchingRulesJson: json['BranchingRulesJson'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
    );

Map<String, dynamic> _$$PollSectionItemImplToJson(
        _$PollSectionItemImpl instance) =>
    <String, dynamic>{
      'Questions': instance.questions,
      'ID': instance.id,
      'PollFormID': instance.pollFormId,
      'Title': instance.title,
      'Description': instance.description,
      'SortOrder': instance.sortOrder,
      'ShowIfJson': instance.showIfJson,
      'BranchingRulesJson': instance.branchingRulesJson,
      'IsDeleted': instance.isDeleted,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
    };

_$PollQuestionItemImpl _$$PollQuestionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PollQuestionItemImpl(
      response: json['Response'] == null
          ? null
          : PollAnswerItem.fromJson(json['Response'] as Map<String, dynamic>),
      dataSourceLabel: json['DataSourceLabel'] as String?,
      dataSourceValue: json['DataSourceValue'] as String?,
      dataSourceDisplayValue: json['DataSourceDisplayValue'] as String?,
      isAutoFilled: json['IsAutoFilled'] as bool?,
      options: (json['Options'] as List<dynamic>?)
          ?.map((e) => PollOptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['ID'] as num?)?.toInt(),
      pollFormId: (json['PollFormID'] as num?)?.toInt(),
      sectionId: (json['SectionID'] as num?)?.toInt(),
      questionText: json['QuestionText'] as String?,
      fieldKey: json['FieldKey'] as String?,
      questionType: json['QuestionType'] as String?,
      isRequired: json['IsRequired'] as bool?,
      sortOrder: (json['SortOrder'] as num?)?.toInt(),
      configJson: json['ConfigJson'] as String?,
      dataSourceType: json['DataSourceType'] as String?,
      dataSourceField: json['DataSourceField'] as String?,
    );

Map<String, dynamic> _$$PollQuestionItemImplToJson(
        _$PollQuestionItemImpl instance) =>
    <String, dynamic>{
      'Response': instance.response,
      'DataSourceLabel': instance.dataSourceLabel,
      'DataSourceValue': instance.dataSourceValue,
      'DataSourceDisplayValue': instance.dataSourceDisplayValue,
      'IsAutoFilled': instance.isAutoFilled,
      'Options': instance.options,
      'ID': instance.id,
      'PollFormID': instance.pollFormId,
      'SectionID': instance.sectionId,
      'QuestionText': instance.questionText,
      'FieldKey': instance.fieldKey,
      'QuestionType': instance.questionType,
      'IsRequired': instance.isRequired,
      'SortOrder': instance.sortOrder,
      'ConfigJson': instance.configJson,
      'DataSourceType': instance.dataSourceType,
      'DataSourceField': instance.dataSourceField,
    };

_$PollOptionItemImpl _$$PollOptionItemImplFromJson(Map<String, dynamic> json) =>
    _$PollOptionItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      pollQuestionId: (json['PollQuestionID'] as num?)?.toInt(),
      optionText: json['OptionText'] as String?,
      optionValue: json['OptionValue'] as String?,
      sortOrder: (json['SortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PollOptionItemImplToJson(
        _$PollOptionItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PollQuestionID': instance.pollQuestionId,
      'OptionText': instance.optionText,
      'OptionValue': instance.optionValue,
      'SortOrder': instance.sortOrder,
    };

_$ResponseItemImpl _$$ResponseItemImplFromJson(Map<String, dynamic> json) =>
    _$ResponseItemImpl(
      pollFormId: (json['PollFormID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      hasResponse: json['HasResponse'] as bool?,
      isCompleted: json['IsCompleted'] as bool?,
      canEdit: json['CanEdit'] as bool?,
      isClosed: json['IsClosed'] as bool?,
      closedReason: json['ClosedReason'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      response: json['Response'] == null
          ? null
          : PollFormResponseItem.fromJson(
              json['Response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseItemImplToJson(_$ResponseItemImpl instance) =>
    <String, dynamic>{
      'PollFormID': instance.pollFormId,
      'EmployeeID': instance.employeeId,
      'HasResponse': instance.hasResponse,
      'IsCompleted': instance.isCompleted,
      'CanEdit': instance.canEdit,
      'IsClosed': instance.isClosed,
      'ClosedReason': instance.closedReason,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'Response': instance.response,
    };

_$PollFormResponseItemImpl _$$PollFormResponseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PollFormResponseItemImpl(
      answers: (json['Answers'] as List<dynamic>?)
          ?.map((e) => PollAnswerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['ID'] as num?)?.toInt(),
      pollFormId: (json['PollFormID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isCompleted: json['IsCompleted'] as bool?,
      completedDate: json['CompletedDate'] == null
          ? null
          : DateTime.parse(json['CompletedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
    );

Map<String, dynamic> _$$PollFormResponseItemImplToJson(
        _$PollFormResponseItemImpl instance) =>
    <String, dynamic>{
      'Answers': instance.answers,
      'ID': instance.id,
      'PollFormID': instance.pollFormId,
      'EmployeeID': instance.employeeId,
      'IsCompleted': instance.isCompleted,
      'CompletedDate': instance.completedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
    };

_$PollAnswerItemImpl _$$PollAnswerItemImplFromJson(Map<String, dynamic> json) =>
    _$PollAnswerItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      pollResponseId: (json['PollResponseID'] as num?)?.toInt(),
      pollQuestionId: (json['PollQuestionID'] as num?)?.toInt(),
      answerText: json['AnswerText'] as String?,
      answerJson: json['AnswerJson'] as String?,
      displayText: json['DisplayText'] as String?,
    );

Map<String, dynamic> _$$PollAnswerItemImplToJson(
        _$PollAnswerItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PollResponseID': instance.pollResponseId,
      'PollQuestionID': instance.pollQuestionId,
      'AnswerText': instance.answerText,
      'AnswerJson': instance.answerJson,
      'DisplayText': instance.displayText,
    };

_$PollSubmitAnswerImpl _$$PollSubmitAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$PollSubmitAnswerImpl(
      questionId: (json['questionId'] as num?)?.toInt(),
      answerText: json['answerText'] as String?,
      answerJson: json['answerJson'] as String?,
    );

Map<String, dynamic> _$$PollSubmitAnswerImplToJson(
        _$PollSubmitAnswerImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answerText': instance.answerText,
      'answerJson': instance.answerJson,
    };

_$PollSubmitPayloadImpl _$$PollSubmitPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$PollSubmitPayloadImpl(
      pollResponseId: (json['pollResponseId'] as num?)?.toInt(),
      sectionId: (json['sectionId'] as num?)?.toInt(),
      employeeId: (json['employeeId'] as num?)?.toInt(),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => PollSubmitAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      visibleSectionIds: (json['visibleSectionIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      hiddenSectionIds: (json['hiddenSectionIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      visibleQuestionIds: (json['visibleQuestionIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      hiddenQuestionIds: (json['hiddenQuestionIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      clearSectionIds: (json['clearSectionIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      clearQuestionIds: (json['clearQuestionIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PollSubmitPayloadImplToJson(
        _$PollSubmitPayloadImpl instance) =>
    <String, dynamic>{
      'pollResponseId': instance.pollResponseId,
      'sectionId': instance.sectionId,
      'employeeId': instance.employeeId,
      'answers': instance.answers,
      'visibleSectionIds': instance.visibleSectionIds,
      'hiddenSectionIds': instance.hiddenSectionIds,
      'visibleQuestionIds': instance.visibleQuestionIds,
      'hiddenQuestionIds': instance.hiddenQuestionIds,
      'clearSectionIds': instance.clearSectionIds,
      'clearQuestionIds': instance.clearQuestionIds,
    };

_$PollSubmitResultItemImpl _$$PollSubmitResultItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PollSubmitResultItemImpl(
      pollResponseId: (json['PollResponseID'] as num?)?.toInt(),
      pollFormId: (json['PollFormID'] as num?)?.toInt(),
      isCompleted: json['IsCompleted'] as bool?,
      totalSavedAnswerCount: (json['TotalSavedAnswerCount'] as num?)?.toInt(),
      sectionResults: (json['SectionResults'] as List<dynamic>?)
          ?.map(
              (e) => PollSectionResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PollSubmitResultItemImplToJson(
        _$PollSubmitResultItemImpl instance) =>
    <String, dynamic>{
      'PollResponseID': instance.pollResponseId,
      'PollFormID': instance.pollFormId,
      'IsCompleted': instance.isCompleted,
      'TotalSavedAnswerCount': instance.totalSavedAnswerCount,
      'SectionResults': instance.sectionResults,
    };

_$PollSectionResultItemImpl _$$PollSectionResultItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PollSectionResultItemImpl(
      sectionId: (json['SectionID'] as num?)?.toInt(),
      savedAnswerCount: (json['SavedAnswerCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PollSectionResultItemImplToJson(
        _$PollSectionResultItemImpl instance) =>
    <String, dynamic>{
      'SectionID': instance.sectionId,
      'SavedAnswerCount': instance.savedAnswerCount,
    };
