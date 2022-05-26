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
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  String code;
  String message;
  bool status;
  dynamic data;

  factory FailedApiResponse.fromJson(Map<String, dynamic> json) =>
      FailedApiResponse(
        code: json["code"],
        message: json["message"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "status": status,
        "data": data,
      };
}
