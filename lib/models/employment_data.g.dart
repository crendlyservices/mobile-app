// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentData _$EmploymentDataFromJson(Map<String, dynamic> json) =>
    EmploymentData(
      id: json['id'] as String,
      dateTimeCreated: DateTime.parse(json['dateTimeCreated'] as String),
      userId: json['userId'] as String,
      employer: json['employer'] as String?,
      occupation: json['occupation'] as String?,
      salaryOrIncomeRange: json['salaryOrIncomeRange'] as String?,
      position: json['position'] as String?,
      employmentType: json['employmentType'] as String,
    );

Map<String, dynamic> _$EmploymentDataToJson(EmploymentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTimeCreated': instance.dateTimeCreated.toIso8601String(),
      'userId': instance.userId,
      'employer': instance.employer,
      'occupation': instance.occupation,
      'salaryOrIncomeRange': instance.salaryOrIncomeRange,
      'position': instance.position,
      'employmentType': instance.employmentType,
    };
