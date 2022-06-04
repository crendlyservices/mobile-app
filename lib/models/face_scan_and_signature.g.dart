// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_scan_and_signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceScanAndSignature _$FaceScanAndSignatureFromJson(
        Map<String, dynamic> json) =>
    FaceScanAndSignature(
      status: json['status'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$FaceScanAndSignatureToJson(
        FaceScanAndSignature instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
