import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  AddressData addressData;

  Address(
      {required this.status,
      required this.code,
      required this.message,
      required this.addressData});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

class AddressData {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "dateTimeCreated")
  DateTime dateTimeCreated = DateTime.now();

  @JsonKey(name: "userId")
  String userId;

  @JsonKey(name: "houseNumber")
  String houseNumber;

  @JsonKey(name: "apartmentNumber")
  String apartmentNumber;

  @JsonKey(name: "street")
  String street;

  @JsonKey(name: "landMark")
  String landMark;

  @JsonKey(name: "lga")
  String lga;

  @JsonKey(name: "state")
  String state;

  @JsonKey(name: "residenceHolding")
  String residenceHolding;

  @JsonKey(name: "rentedFor")
  String rentedFor;

  AddressData(
      {required this.id,
      required this.dateTimeCreated,
      required this.userId,
      required this.houseNumber,
      required this.apartmentNumber,
      required this.street,
      required this.landMark,
      required this.lga,
      required this.state,
      required this.residenceHolding,
      required this.rentedFor});

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
