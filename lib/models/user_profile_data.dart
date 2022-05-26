import 'package:crendly/models/user_social_media_handles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfileData {
  @JsonKey(name: "picture")
  String? picture;

  @JsonKey(name: "phoneNumber")
  String? phoneNumber;

  @JsonKey(name: "firstName")
  String? firstName;

  @JsonKey(name: "middleName")
  String? middleName;

  @JsonKey(name: "lastName")
  String? lastName;

  @JsonKey(name: "gender")
  String gender;

  @JsonKey(name: "state")
  String? state;

  @JsonKey(name: "lga")
  String? lga;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "isRegulatoryIdProvided")
  bool isRegulatoryIdProvided;

  @JsonKey(name: "isRegulatoryIdVerified")
  bool isRegulatoryIdVerified;

  @JsonKey(name: "isPoliticallyExposed")
  bool isPoliticallyExposed;

  @JsonKey(name: "employmentStatus")
  String? employmentStatus;

  @JsonKey(name: "educationalQualification")
  String? educationalQualification;

  @JsonKey(name: "maritalStatus")
  String? maritalStatus;

  @JsonKey(name: "socialMediaHandles")
  List<UserSocialMediaHandle>? socialMediaHandle;

  UserProfileData(
      {this.picture,
      this.phoneNumber,
      this.firstName,
      this.middleName,
      this.lastName,
      required this.gender,
      this.state,
      this.lga,
      required this.email,
      required this.isRegulatoryIdProvided,
      required this.isRegulatoryIdVerified,
      required this.isPoliticallyExposed,
      this.employmentStatus,
      this.educationalQualification,
      this.maritalStatus,
      this.socialMediaHandle});

  factory UserProfileData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserProfileDataToJson(this);
}
