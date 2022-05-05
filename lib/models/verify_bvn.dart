import 'package:crendly/models/verify_user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_bvn.g.dart';

@JsonSerializable(explicitToJson: true)
class VerifyBvn {
  @JsonKey(name: "status")
  bool statusRes;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  VerifyUserData verifyUserData;

  VerifyBvn(
      {required this.statusRes,
      required this.code,
      required this.message,
      required this.verifyUserData});
  factory VerifyBvn.fromJson(Map<String, dynamic> json) =>
      _$VerifyBvnFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VerifyBvnToJson(this);
}
