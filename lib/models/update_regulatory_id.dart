import 'package:crendly/models/regulatory_id_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_regulatory_id.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateRegulatoryId {
  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  RegulatoryIdData userRegulatoryidData;

  UpdateRegulatoryId(
      {required this.status,
      this.code,
      required this.message,
      required this.userRegulatoryidData});

  factory UpdateRegulatoryId.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegulatoryIdFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UpdateRegulatoryIdToJson(this);
}
