// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rio_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RioChatResponseImpl _$$RioChatResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RioChatResponseImpl(
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$$RioChatResponseImplToJson(
        _$RioChatResponseImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };

_$RioChatMessageImpl _$$RioChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$RioChatMessageImpl(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$RioChatMessageImplToJson(
        _$RioChatMessageImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
