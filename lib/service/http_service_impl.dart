import 'package:crendly/service/http_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

const BASE_URL = 'https://trustbreed-auth-service.azurewebsites.net';

class HttpServiceImpl implements HttpService {
  late Dio _dio;
  @override
  void init(Map<String, dynamic> headers) {
    // TODO: implement init
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: headers));
    initializeInterceptors;
  }

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
  Future<Response> verifyUserBvn(
      String url, Map<String, dynamic> headers, Map body) async {
    init(headers);
    Response response;
    try {
      response = await _dio.post(url, data: body);
      print('Response: $response');
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
    // TODO: implement verifyUserBvn
    throw UnimplementedError();
  }
}
