import 'package:json_annotation/json_annotation.dart';

import 'bvn_data.dart';

part 'verify_user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class VerifyUserData {
  @JsonKey(name: "userId")
  String userId;

  @JsonKey(name: "accessToken")
  String accessToken;

  @JsonKey(name: "isBvnVerified")
  bool isBvnVerified;

  @JsonKey(name: "bvnData")
  BvnData bvnData;

  VerifyUserData(
      {required this.userId,
      required this.accessToken,
      required this.isBvnVerified,
      required this.bvnData});

  factory VerifyUserData.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VerifyUserDataToJson(this);
}
