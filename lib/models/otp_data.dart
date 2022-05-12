import 'package:crendly/models/otp_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_data.g.dart';

@JsonSerializable(explicitToJson: true)
class OtpData {
  @JsonKey(name: "scope")
  String scope;

  @JsonKey(name: "user")
  UserOtp userOtp;

  @JsonKey(name: "access_token")
  String accessToken;

  @JsonKey(name: "refresh_token")
  String refreshToken;

  @JsonKey(name: "token_type")
  String tokenType;

  OtpData(
      {required this.scope,
      required this.userOtp,
      required this.accessToken,
      required this.refreshToken,
      required this.tokenType});

  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OtpDataToJson(this);
}
