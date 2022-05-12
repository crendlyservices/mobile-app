import 'package:dio/dio.dart';

abstract class IHttpService {
  Future<Response> verifyUserBvn(String url, Map body);

  Future<Response> otpVerification(String url, Map body);

  Future<Response> updateUserProfile(String url, Map body);

  Future<Response> updateUserRegulatoryId(String url, Map body);

  Future<Response> updateEmploymentDetails(String url, Map body);
}
