// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      bvn: json['bvn'] as String,
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String,
      lastName: json['last_name'] as String,
      dob: json['date_of_birth'] as String,
      phoneNumber: json['phone_number'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'bvn': instance.bvn,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'date_of_birth': instance.dob,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'email': instance.email,
    };
