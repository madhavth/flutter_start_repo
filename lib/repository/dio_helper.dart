import 'package:dio/dio.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';

Dio dio = new Dio(BaseOptions(
    //todo setupbase helper
    baseUrl: "",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }))
  ..interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    print(
        'interceptors ===  ${options.baseUrl} ===  ${options.path} ===  ${options.data}');
    return options;
  }, onResponse: (Response response) async {
    return response;
  }, onError: (DioError error) async {
    return ErrorHelper.extractApiError(error);
  }));
