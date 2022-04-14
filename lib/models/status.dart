import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(includeIfNull: false)
class Status {
  @JsonKey(name: "status")
  bool statusRes;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  Status({required this.statusRes, required this.code, required this.message});
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
