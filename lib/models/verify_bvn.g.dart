// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_bvn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyBvn _$VerifyBvnFromJson(Map<String, dynamic> json) => VerifyBvn(
      statusRes: json['status'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      verifyUserData: json['data'] == null
          ? null
          : VerifyUserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyBvnToJson(VerifyBvn instance) => <String, dynamic>{
      'status': instance.statusRes,
      'code': instance.code,
      'message': instance.message,
      'data': instance.verifyUserData?.toJson(),
    };
