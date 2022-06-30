// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserProfile _$UpdateUserProfileFromJson(Map<String, dynamic> json) =>
    UpdateUserProfile(
      code: json['code'] as int,
      message: json['message'] as String,
      userProfileData: json['data'] == null
          ? null
          : UserProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserProfileToJson(UpdateUserProfile instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.userProfileData?.toJson(),
    };
