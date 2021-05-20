import 'package:dio/dio.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Environment(Environment.dev)
@module
abstract class AppModule {
  Dio dio() => new Dio(BaseOptions(
        baseUrl: Api.BASE_URL,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ))
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options,handler) async {
          // print(
          //     'interceptors ===  ${options.baseUrl} ===  ${options.path} ===  ${options.data}');
          handler.next(options);
        }, onResponse: (Response response,handler) async {
              handler.next(response);
        }, onError: (DioError error,handler) async {
          // goToSessionExpiredScreen(error);
          // return ErrorHelper.extractApiError(error);
          handler.next(error);
        }))
    ..interceptors.add(PrettyDioLogger());

  @preResolve
  Future<SharedPreferences> get sharedPreferences async =>
      await SharedPreferences.getInstance();

}
