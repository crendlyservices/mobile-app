import 'package:crendly/models/user_profile_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateUserProfile {
  @JsonKey(name: "code")
  int code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  UserProfileData? userProfileData;

  UpdateUserProfile(
      {required this.code, required this.message, this.userProfileData});

  factory UpdateUserProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserProfileFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UpdateUserProfileToJson(this);
}
