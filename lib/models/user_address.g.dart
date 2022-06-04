// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      status: json['status'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      addressData: json['data'] == null
          ? null
          : AddressData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.addressData?.toJson(),
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      id: json['id'] as String,
      dateTimeCreated: DateTime.parse(json['dateTimeCreated'] as String),
      userId: json['userId'] as String,
      houseNumber: json['houseNumber'] as String,
      apartmentNumber: json['apartmentNumber'] as String,
      street: json['street'] as String,
      landMark: json['landMark'] as String,
      lga: json['lga'] as String,
      state: json['state'] as String,
      residenceHolding: json['residenceHolding'] as String,
      rentedFor: json['rentedFor'] as String,
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTimeCreated': instance.dateTimeCreated.toIso8601String(),
      'userId': instance.userId,
      'houseNumber': instance.houseNumber,
      'apartmentNumber': instance.apartmentNumber,
      'street': instance.street,
      'landMark': instance.landMark,
      'lga': instance.lga,
      'state': instance.state,
      'residenceHolding': instance.residenceHolding,
      'rentedFor': instance.rentedFor,
    };
