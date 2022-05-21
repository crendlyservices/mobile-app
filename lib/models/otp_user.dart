import 'package:json_annotation/json_annotation.dart';

part 'otp_user.g.dart';

@JsonSerializable()
class UserOtp {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "mobileNo")
  String mobileNo;

  @JsonKey(name: "firstName")
  String firstName;

  @JsonKey(name: "lastName")
  String lastName;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "TwoFactorEnabled")
  bool twoFactorEnabled;

  @JsonKey(name: "last_password_change")
  String? lastPasswordChange;

  @JsonKey(name: "deviceUuid")
  String? deviceUuid;

  @JsonKey(name: "jti")
  String? jti;

  @JsonKey(name: "permissions")
  String? permissions;

  @JsonKey(name: "roleName")
  String? roleName;

  @JsonKey(name: "shouldChangePassword")
  int shouldChangePassword;

  @JsonKey(name: "emailVerified")
  bool emailVerified;

  @JsonKey(name: "mobileVerified")
  bool mobileVerified;

  @JsonKey(name: "profileType")
  String profileType;

  UserOtp(
      {required this.id,
      required this.username,
      required this.mobileNo,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.status,
      required this.twoFactorEnabled,
      this.lastPasswordChange,
      this.deviceUuid,
      this.jti,
      this.permissions,
      this.roleName,
      required this.shouldChangePassword,
      required this.emailVerified,
      required this.mobileVerified,
      required this.profileType});

  factory UserOtp.fromJson(Map<String, dynamic> json) =>
      _$UserOtpFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserOtpToJson(this);
}
