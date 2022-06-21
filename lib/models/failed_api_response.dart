// To parse this JSON data, do
//
//     final failedApiResponse = failedApiResponseFromJson(jsonString);

import 'dart:convert';

FailedApiResponse failedApiResponseFromJson(String str) =>
    FailedApiResponse.fromJson(json.decode(str));

String failedApiResponseToJson(FailedApiResponse data) =>
    json.encode(data.toJson());

class FailedApiResponse {
  FailedApiResponse({
    required this.status,
    this.code,
    this.message,
    required this.data,
  });
  bool status;
  String? code;
  String? message;
  dynamic data;

  factory FailedApiResponse.fromJson(Map<String, dynamic> json) =>
      FailedApiResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "status": status,
        "data": data,
      };
}
