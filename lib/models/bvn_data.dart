import 'package:json_annotation/json_annotation.dart';

part 'bvn_data.g.dart';

@JsonSerializable()
class BvnData {
  @JsonKey(name: "parentId")
  String? parentId;

  @JsonKey(name: "status")
  String statusFound;

  @JsonKey(name: "dataValidation")
  bool dataValidation;

  @JsonKey(name: "selfieValidation")
  bool selfieValidation;

  @JsonKey(name: "firstName")
  String firstName;

  @JsonKey(name: "middleName")
  String? middleName;

  @JsonKey(name: "lastName")
  String lastName;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "enrollmentBranch")
  String? enrollmentBranch;

  @JsonKey(name: "enrollmentInstitution")
  String? enrollmentInstitution;

  @JsonKey(name: "mobile")
  String phoneNumber;

  @JsonKey(name: "dateOfBirth")
  String dob;

  @JsonKey(name: "isConsent")
  bool isConsent;

  @JsonKey(name: "idNumber")
  String idNumber;

  @JsonKey(name: "businessId")
  String businessId;

  @JsonKey(name: "type")
  String type;

  @JsonKey(name: "gender")
  String? gender;

  @JsonKey(name: "requestedAt")
  DateTime requestedAt = DateTime.now();

  @JsonKey(name: "country")
  String country;

  @JsonKey(name: "createdAt")
  DateTime createdAt = DateTime.now();

  @JsonKey(name: "lastModifiedAt")
  DateTime lastModifiedAt = DateTime.now();

  @JsonKey(name: "id")
  String id;

  BvnData(
      {this.parentId,
      required this.statusFound,
      required this.dataValidation,
      required this.selfieValidation,
      required this.firstName,
      this.middleName,
      required this.lastName,
      required this.image,
      this.enrollmentBranch,
      this.enrollmentInstitution,
      required this.phoneNumber,
      required this.dob,
      required this.isConsent,
      required this.idNumber,
      required this.businessId,
      required this.type,
      this.gender,
      required this.requestedAt,
      required this.country,
      required this.createdAt,
      required this.lastModifiedAt,
      required this.id});

  factory BvnData.fromJson(Map<String, dynamic> json) =>
      _$BvnDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BvnDataToJson(this);
}
