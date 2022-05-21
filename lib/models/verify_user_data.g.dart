// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyUserData _$VerifyUserDataFromJson(Map<String, dynamic> json) =>
    VerifyUserData(
      userId: json['userId'] as String,
      accessToken: json['accessToken'] as String,
      isBvnVerified: json['isBvnVerified'] as bool,
      bvnData: BvnData.fromJson(json['bvnData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyUserDataToJson(VerifyUserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accessToken': instance.accessToken,
      'isBvnVerified': instance.isBvnVerified,
      'bvnData': instance.bvnData.toJson(),
    };
