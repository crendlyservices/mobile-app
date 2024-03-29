import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Either<T, F>> apiRequest<T, F>(
    String uri,
    String endPoint,
    String method,
    T Function(Map<String, dynamic> json) fromJson,
    F Function(Map<String, dynamic> json) fromJsonError, {
    required Map body,
    String token = '',
  }) async {
    http.Response resp = http.Response("", 200);
    final String url = uri + endPoint;
    final Map<String, String> headers = <String, String>{};
    headers.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');
    if (token.isNotEmpty) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer ' + token);
    }
    Uri apiUri = Uri.parse(url);
    final msg = jsonEncode(body);

    try {
      if (method == "get") {
        resp = await http.get(
          apiUri,
          headers: headers,
        );
      } else if (method == "put") {
        resp = await http.put(
          apiUri,
          headers: headers,
          body: body,
        );
      } else if (method == "post") {
        resp = await http.post(
          apiUri,
          headers: {"Content-Type": "application/json"},
          body: msg,
        );
      } else if (method == "delete") {
        resp = await http.delete(
          apiUri,
          headers: headers,
        );
      }
      if (resp.statusCode == 200) {
        return left(fromJson(json.decode(resp.body)));
      } else {
        return right(fromJsonError(json.decode(resp.body)));
      }
    } on TimeoutException catch (e) {
      //handleTimeout();
      return json.decode(resp.body);
    } on SocketException catch (e) {
      print('Socket Error: $e');
      return json.decode(resp.body);

      //handleTimeout();
    } on Error catch (e) {
      print('General Error: $e');
      //showError();
      throw Exception();
    }
  }
}
