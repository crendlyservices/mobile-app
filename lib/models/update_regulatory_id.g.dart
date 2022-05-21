// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_regulatory_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRegulatoryId _$UpdateRegulatoryIdFromJson(Map<String, dynamic> json) =>
    UpdateRegulatoryId(
      status: json['status'] as bool,
      code: json['code'] as String?,
      message: json['message'] as String,
      userRegulatoryidData:
          RegulatoryIdData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateRegulatoryIdToJson(UpdateRegulatoryId instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.userRegulatoryidData.toJson(),
    };
