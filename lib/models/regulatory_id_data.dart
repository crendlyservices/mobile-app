import 'package:json_annotation/json_annotation.dart';

part 'regulatory_id_data.g.dart';

@JsonSerializable()
class RegulatoryIdData {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "dateTimeCreated")
  String dateTimeCreated;

  @JsonKey(name: "userId")
  String userId;

  @JsonKey(name: "type")
  String type;

  @JsonKey(name: "idNumber")
  String idNumber;

  @JsonKey(name: "issuanceDate")
  String issuanceDate;

  @JsonKey(name: "expiryDate")
  String expiryDate;

  @JsonKey(name: "imagePath")
  String imagePath;

  RegulatoryIdData(
      {required this.id,
      required this.dateTimeCreated,
      required this.userId,
      required this.type,
      required this.idNumber,
      required this.issuanceDate,
      required this.expiryDate,
      required this.imagePath});

  factory RegulatoryIdData.fromJson(Map<String, dynamic> json) =>
      _$RegulatoryIdDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RegulatoryIdDataToJson(this);
}
