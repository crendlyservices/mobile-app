// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_bvn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyBvn _$VerifyBvnFromJson(Map<String, dynamic> json) => VerifyBvn(
      statusResponse:
          Status.fromJson(json['statusResponse'] as Map<String, dynamic>),
      verifyUserData: VerifyUserData.fromJson(
          json['verifyUserData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyBvnToJson(VerifyBvn instance) => <String, dynamic>{
      'statusResponse': instance.statusResponse.toJson(),
      'verifyUserData': instance.verifyUserData.toJson(),
    };
