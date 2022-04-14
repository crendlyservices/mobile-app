import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(includeIfNull: false)
class UserData {
  @JsonKey(name: "bvn")
  String bvn;

  @JsonKey(name: "first_name")
  String firstName;

  @JsonKey(name: "middle_name")
  String middleName;

  @JsonKey(name: "last_name")
  String lastName;

  @JsonKey(name: "date_of_birth")
  String dob;

  @JsonKey(name: "phone_number")
  String phoneNumber;

  @JsonKey(name: "gender")
  String gender;

  @JsonKey(name: "email")
  String email;

  UserData(
      {required this.bvn,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.dob,
      required this.phoneNumber,
      required this.gender,
      required this.email});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
