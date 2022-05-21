// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOtp _$UserOtpFromJson(Map<String, dynamic> json) => UserOtp(
      id: json['id'] as String,
      username: json['username'] as String,
      mobileNo: json['mobileNo'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      status: json['status'] as bool,
      twoFactorEnabled: json['TwoFactorEnabled'] as bool,
      lastPasswordChange: json['last_password_change'] as String?,
      deviceUuid: json['deviceUuid'] as String?,
      jti: json['jti'] as String?,
      permissions: json['permissions'] as String?,
      roleName: json['roleName'] as String?,
      shouldChangePassword: json['shouldChangePassword'] as int,
      emailVerified: json['emailVerified'] as bool,
      mobileVerified: json['mobileVerified'] as bool,
      profileType: json['profileType'] as String,
    );

Map<String, dynamic> _$UserOtpToJson(UserOtp instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'mobileNo': instance.mobileNo,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'status': instance.status,
      'TwoFactorEnabled': instance.twoFactorEnabled,
      'last_password_change': instance.lastPasswordChange,
      'deviceUuid': instance.deviceUuid,
      'jti': instance.jti,
      'permissions': instance.permissions,
      'roleName': instance.roleName,
      'shouldChangePassword': instance.shouldChangePassword,
      'emailVerified': instance.emailVerified,
      'mobileVerified': instance.mobileVerified,
      'profileType': instance.profileType,
    };
