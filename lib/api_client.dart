import 'dart:async';
import "package:dio/dio.dart";
import 'package:flutter/foundation.dart';

class Client{
  Dio init() {
      Dio _dio = new Dio();
      _dio.interceptors.add(new ApiInterceptors());
      _dio.options.baseUrl = "https://swapi.dev/api";
      _dio.options.headers["Accept"] = "application/json";
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    // do something before request is sent

    print(options.baseUrl);
    print(options.headers);
    print(options.data);
  }

  @override
  Future<dynamic> onError(DioError dioError) async  {
    print("url :  ${dioError.request.uri}");
    print("headers : ${dioError.request.headers} ");
    print("method : ${dioError.request.method} ");
    print("erro : ${dioError.error} ");
    print("erro : ${dioError.message} ");
    throw new Exception(dioError.response);
  }

  @override
  Future<dynamic> onResponse(Response response) async {
    // do something before response
    print("url : ${response.request.uri}");
    print("ok : ${response}");

  }
}