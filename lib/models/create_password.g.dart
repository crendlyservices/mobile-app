// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePassword _$CreatePasswordFromJson(Map<String, dynamic> json) =>
    CreatePassword(
      status: json['status'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: json['data'] as bool?,
    );

Map<String, dynamic> _$CreatePasswordToJson(CreatePassword instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
