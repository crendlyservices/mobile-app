// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountData _$AccountDataFromJson(Map<String, dynamic> json) => AccountData(
      accountName: json['accountName'] as String?,
      bank: json['bank'] as String?,
      accountNumber: json['accountNumber'] as String?,
    );

Map<String, dynamic> _$AccountDataToJson(AccountData instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'bank': instance.bank,
      'accountNumber': instance.accountNumber,
    };
