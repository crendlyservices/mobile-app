// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerification _$OtpVerificationFromJson(Map<String, dynamic> json) =>
    OtpVerification(
      statusRes: json['status'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$OtpVerificationToJson(OtpVerification instance) =>
    <String, dynamic>{
      'status': instance.statusRes,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
