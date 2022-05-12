import 'package:json_annotation/json_annotation.dart';

part 'employment_data.g.dart';

@JsonSerializable()
class EmploymentData {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "dateTimeCreated")
  DateTime dateTimeCreated = DateTime.now();

  @JsonKey(name: "userId")
  String userId;

  @JsonKey(name: "employer")
  String? employer;

  @JsonKey(name: "occupation")
  String? occupation;

  @JsonKey(name: "salaryOrIncomeRange")
  String? salaryOrIncomeRange;

  @JsonKey(name: "position")
  String? position;

  @JsonKey(name: "employmentType")
  String employmentType;

  EmploymentData(
      {required this.id,
      required this.dateTimeCreated,
      required this.userId,
      this.employer,
      this.occupation,
      this.salaryOrIncomeRange,
      this.position,
      required this.employmentType});

  factory EmploymentData.fromJson(Map<String, dynamic> json) =>
      _$EmploymentDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EmploymentDataToJson(this);
}
