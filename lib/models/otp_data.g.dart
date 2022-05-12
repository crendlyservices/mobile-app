// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpData _$OtpDataFromJson(Map<String, dynamic> json) => OtpData(
      scope: json['scope'] as String,
      userOtp: UserOtp.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$OtpDataToJson(OtpData instance) => <String, dynamic>{
      'scope': instance.scope,
      'user': instance.userOtp.toJson(),
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
    };
