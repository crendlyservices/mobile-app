import 'package:json_annotation/json_annotation.dart';

part 'user_social_media_handles.g.dart';

@JsonSerializable()
class UserSocialMediaHandle {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "handle")
  String? handle;

  UserSocialMediaHandle(this.name, this.handle);

  factory UserSocialMediaHandle.fromJson(Map<String, dynamic> json) =>
      _$UserSocialMediaHandleFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserSocialMediaHandleToJson(this);
}
