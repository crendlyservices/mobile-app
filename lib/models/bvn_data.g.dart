// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bvn_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BvnData _$BvnDataFromJson(Map<String, dynamic> json) => BvnData(
      parentId: json['parentId'] as String?,
      statusFound: json['status'] as String,
      dataValidation: json['dataValidation'] as bool,
      selfieValidation: json['selfieValidation'] as bool,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      image: json['image'] as String,
      enrollmentBranch: json['enrollmentBranch'] as String?,
      enrollmentInstitution: json['enrollmentInstitution'] as String?,
      phoneNumber: json['mobile'] as String,
      dob: json['dateOfBirth'] as String,
      isConsent: json['isConsent'] as bool,
      idNumber: json['idNumber'] as String,
      businessId: json['businessId'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String?,
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      country: json['country'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastModifiedAt: DateTime.parse(json['lastModifiedAt'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$BvnDataToJson(BvnData instance) => <String, dynamic>{
      'parentId': instance.parentId,
      'status': instance.statusFound,
      'dataValidation': instance.dataValidation,
      'selfieValidation': instance.selfieValidation,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'image': instance.image,
      'enrollmentBranch': instance.enrollmentBranch,
      'enrollmentInstitution': instance.enrollmentInstitution,
      'mobile': instance.phoneNumber,
      'dateOfBirth': instance.dob,
      'isConsent': instance.isConsent,
      'idNumber': instance.idNumber,
      'businessId': instance.businessId,
      'type': instance.type,
      'gender': instance.gender,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'country': instance.country,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastModifiedAt': instance.lastModifiedAt.toIso8601String(),
      'id': instance.id,
    };
