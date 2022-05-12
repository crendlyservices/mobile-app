import 'package:json_annotation/json_annotation.dart';

part 'account_data.g.dart';

@JsonSerializable()
class AccountData {
  @JsonKey(name: "accountName")
  String accountName;

  @JsonKey(name: "bank")
  String bank;

  @JsonKey(name: "accountNumber")
  String accountNumber;

  AccountData(
      {required this.accountName,
      required this.bank,
      required this.accountNumber});

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}
