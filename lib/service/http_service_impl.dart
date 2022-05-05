import 'package:crendly/service/http_service.dart';
import 'package:dio/dio.dart';

const AUTH_BASE_URL = 'https://trustbreed-auth-service.azurewebsites.net';

const IDENTITY_BASE_URL = 'https://trustbreed.azurewebsites.net';

class HttpServiceImpl implements IHttpService {
  late Dio _dio;

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, _) {
      print(error.message);
    }, onRequest: (request, _) {
      print('${request.method} | ${request.path}');
    }, onResponse: (response, _) {
      print(
          '${response.statusCode}, ${response.statusMessage}, ${response.data}');
    }));
  }

  @override
  Future<Response> verifyUserBvn(String url, Map body) async {
    _dio = Dio(BaseOptions(
        baseUrl: AUTH_BASE_URL,
        method: 'POST',
        headers: {"Content-Type": "application/json"}));

    Response response;
    try {
      response = await _dio.post(
        url,
        data: body,
      );

      print('Response: $response');
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  @override
  Future<Response> otpVerification(String url, Map body) async {
    _dio = Dio(BaseOptions(
        baseUrl: AUTH_BASE_URL,
        method: 'POST',
        headers: {"Content-Type": "application/json"}));

    Response response;
    try {
      response = await _dio.post(
        url,
        data: body,
      );
      print('Response: $response');
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  @override
  Future<Response> updateUserProfile(String url, Map body) async {
    _dio = Dio(BaseOptions(
        baseUrl: IDENTITY_BASE_URL,
        method: 'POST',
        headers: {"Content-Type": "application/json"}));

    Response response;
    try {
      response = await _dio.post(url);
      print('Response: $response');
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  @override
  Future<Response> updateUserRegulatoryId(String url, Map body) async {
    _dio = Dio(BaseOptions(
        baseUrl: IDENTITY_BASE_URL,
        method: 'POST',
        headers: {"Content-Type": "application/json"}));

    Response response;
    try {
      response = await _dio.post(url);
      print('Response: $response');
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
}
