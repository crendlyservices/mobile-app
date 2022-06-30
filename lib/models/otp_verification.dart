import 'package:crendly/models/otp_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_verification.g.dart';

@JsonSerializable(explicitToJson: true)
class OtpVerification {
  @JsonKey(name: "status")
  bool statusRes;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  OtpData? data;

  OtpVerification(
      {required this.statusRes,
      required this.code,
      required this.message,
      this.data});

  factory OtpVerification.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OtpVerificationToJson(this);
}
