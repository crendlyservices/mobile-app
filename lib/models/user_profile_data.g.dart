// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileData _$UserProfileDataFromJson(Map<String, dynamic> json) =>
    UserProfileData(
      picture: json['picture'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      email: json['email'] as String,
      isRegulatoryIdProvided: json['isRegulatoryIdProvided'] as bool,
      isRegulatoryIdVerified: json['isRegulatoryIdVerified'] as bool,
      isPoliticallyExposed: json['isPoliticallyExposed'] as bool,
      employmentStatus: json['employmentStatus'] as String?,
      educationalQualification: json['educationalQualification'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      socialMediaHandle: json['socialMediaHandles'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserProfileDataToJson(UserProfileData instance) =>
    <String, dynamic>{
      'picture': instance.picture,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'state': instance.state,
      'lga': instance.lga,
      'email': instance.email,
      'isRegulatoryIdProvided': instance.isRegulatoryIdProvided,
      'isRegulatoryIdVerified': instance.isRegulatoryIdVerified,
      'isPoliticallyExposed': instance.isPoliticallyExposed,
      'employmentStatus': instance.employmentStatus,
      'educationalQualification': instance.educationalQualification,
      'maritalStatus': instance.maritalStatus,
      'socialMediaHandles': instance.socialMediaHandle,
    };
