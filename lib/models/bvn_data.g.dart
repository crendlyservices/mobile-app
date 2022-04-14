// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bvn_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BvnData _$BvnDataFromJson(Map<String, dynamic> json) => BvnData(
      status: json['status'] as String,
      message: json['message'] as String,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BvnDataToJson(BvnData instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.userData.toJson(),
    };
