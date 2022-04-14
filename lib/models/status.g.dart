// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      statusRes: json['status'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'status': instance.statusRes,
      'code': instance.code,
      'message': instance.message,
    };
