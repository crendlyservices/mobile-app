import 'package:crendly/models/employment_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employment_details.g.dart';

@JsonSerializable(explicitToJson: true)
class EmploymentDetails {
  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  EmploymentData data;

  EmploymentDetails(
      {required this.status,
      required this.code,
      required this.message,
      required this.data});

  factory EmploymentDetails.fromJson(Map<String, dynamic> json) =>
      _$EmploymentDetailsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EmploymentDetailsToJson(this);
}
