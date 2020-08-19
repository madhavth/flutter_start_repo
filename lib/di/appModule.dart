import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule{
  @lazySingleton
  Dio dio() =>
      new Dio(BaseOptions(
          baseUrl: Api.BASE_URL,
          connectTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }))
        ..interceptors.add(
            DioCacheManager(CacheConfig(baseUrl: Api.BASE_URL)).interceptor)
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

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}