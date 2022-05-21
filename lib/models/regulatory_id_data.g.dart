// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regulatory_id_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegulatoryIdData _$RegulatoryIdDataFromJson(Map<String, dynamic> json) =>
    RegulatoryIdData(
      id: json['id'] as String,
      dateTimeCreated: json['dateTimeCreated'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      idNumber: json['idNumber'] as String,
      issuanceDate: json['issuanceDate'] as String,
      expiryDate: json['expiryDate'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$RegulatoryIdDataToJson(RegulatoryIdData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTimeCreated': instance.dateTimeCreated,
      'userId': instance.userId,
      'type': instance.type,
      'idNumber': instance.idNumber,
      'issuanceDate': instance.issuanceDate,
      'expiryDate': instance.expiryDate,
      'imagePath': instance.imagePath,
    };
