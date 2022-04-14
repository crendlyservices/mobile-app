import 'package:crendly/models/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bvn_data.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class BvnData {
  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  UserData userData;

  BvnData(
      {required this.status, required this.message, required this.userData});

  factory BvnData.fromJson(Map<String, dynamic> json) =>
      _$BvnDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BvnDataToJson(this);
}
