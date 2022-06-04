import 'package:json_annotation/json_annotation.dart';

part 'face_scan_and_signature.g.dart';

@JsonSerializable()
class FaceScanAndSignature {
  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  String? data;

  FaceScanAndSignature(
      {required this.status,
      required this.code,
      required this.message,
      required this.data});

  factory FaceScanAndSignature.fromJson(Map<String, dynamic> json) =>
      _$FaceScanAndSignatureFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FaceScanAndSignatureToJson(this);
}
