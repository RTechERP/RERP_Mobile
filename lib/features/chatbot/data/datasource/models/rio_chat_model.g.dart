// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rio_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RioChatResponseImpl _$$RioChatResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RioChatResponseImpl(
  question: json['question'] as String?,
  answer: json['answer'] as String?,
);

Map<String, dynamic> _$$RioChatResponseImplToJson(
  _$RioChatResponseImpl instance,
) => <String, dynamic>{
  'question': instance.question,
  'answer': instance.answer,
};

_$RioChatMessageImpl _$$RioChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$RioChatMessageImpl(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$RioChatMessageImplToJson(
  _$RioChatMessageImpl instance,
) => <String, dynamic>{
  'question': instance.question,
  'answer': instance.answer,
};

_$ChatHistorySessionImpl _$$ChatHistorySessionImplFromJson(
  Map<String, dynamic> json,
) => _$ChatHistorySessionImpl(
  sessionId: (json['SessionID'] as num).toInt(),
  createdDate: DateTime.parse(json['CreatedDate'] as String),
  updatedDate: DateTime.parse(json['UpdatedDate'] as String),
);

Map<String, dynamic> _$$ChatHistorySessionImplToJson(
  _$ChatHistorySessionImpl instance,
) => <String, dynamic>{
  'SessionID': instance.sessionId,
  'CreatedDate': instance.createdDate.toIso8601String(),
  'UpdatedDate': instance.updatedDate.toIso8601String(),
};

_$ChatHistoryMessageImpl _$$ChatHistoryMessageImplFromJson(
  Map<String, dynamic> json,
) => _$ChatHistoryMessageImpl(
  question: json['Question'] as String,
  answer: json['Answer'] as String,
);

Map<String, dynamic> _$$ChatHistoryMessageImplToJson(
  _$ChatHistoryMessageImpl instance,
) => <String, dynamic>{
  'Question': instance.question,
  'Answer': instance.answer,
};

_$ChatSessionDetailImpl _$$ChatSessionDetailImplFromJson(
  Map<String, dynamic> json,
) => _$ChatSessionDetailImpl(
  sessionId: (json['SessionID'] as num).toInt(),
  createdDate: DateTime.parse(json['CreatedDate'] as String),
  updatedDate: DateTime.parse(json['UpdatedDate'] as String),
  messages: (json['Messages'] as List<dynamic>)
      .map((e) => ChatHistoryMessage.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ChatSessionDetailImplToJson(
  _$ChatSessionDetailImpl instance,
) => <String, dynamic>{
  'SessionID': instance.sessionId,
  'CreatedDate': instance.createdDate.toIso8601String(),
  'UpdatedDate': instance.updatedDate.toIso8601String(),
  'Messages': instance.messages,
};
