import 'package:crendly/models/status.dart';
import 'package:crendly/models/verify_user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_bvn.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class VerifyBvn {
  Status statusResponse;

  VerifyUserData verifyUserData;

  VerifyBvn({required this.statusResponse, required this.verifyUserData});
  factory VerifyBvn.fromJson(Map<String, dynamic> json) =>
      _$VerifyBvnFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VerifyBvnToJson(this);
}
