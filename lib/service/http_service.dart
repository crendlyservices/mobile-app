import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response> verifyUserBvn(
      String url, Map<String, dynamic> headers, Map body);

  void init(Map<String, dynamic> headers);
}
