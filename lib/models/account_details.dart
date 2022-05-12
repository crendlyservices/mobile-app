import 'package:json_annotation/json_annotation.dart';

import 'account_data.dart';

part 'account_details.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountDetails {
  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "code")
  String code;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  AccountData accountData;

  AccountDetails(
      {required this.status,
      required this.code,
      required this.message,
      required this.accountData});

  factory AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccountDetailsToJson(this);
}
