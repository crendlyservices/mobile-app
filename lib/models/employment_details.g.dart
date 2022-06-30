// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentDetails _$EmploymentDetailsFromJson(Map<String, dynamic> json) =>
    EmploymentDetails(
      status: json['status'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : EmploymentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmploymentDetailsToJson(EmploymentDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
