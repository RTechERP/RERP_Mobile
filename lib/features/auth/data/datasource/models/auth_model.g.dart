// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginPayloadImpl _$$LoginPayloadImplFromJson(Map<String, dynamic> json) =>
    _$LoginPayloadImpl(
      loginName: json['LoginName'] as String,
      passwordHash: json['PasswordHash'] as String,
    );

Map<String, dynamic> _$$LoginPayloadImplToJson(_$LoginPayloadImpl instance) =>
    <String, dynamic>{
      'LoginName': instance.loginName,
      'PasswordHash': instance.passwordHash,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['access_token'] as String,
      expires: json['expires'] == null
          ? null
          : DateTime.parse(json['expires'] as String),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires': instance.expires?.toIso8601String(),
    };
