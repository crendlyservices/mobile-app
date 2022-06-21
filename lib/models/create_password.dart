import 'package:json_annotation/json_annotation.dart';

part 'create_password.g.dart';

@JsonSerializable()
class CreatePassword {
  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  bool? data;

  CreatePassword(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory CreatePassword.fromJson(Map<String, dynamic> json) =>
      _$CreatePasswordFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CreatePasswordToJson(this);
}
