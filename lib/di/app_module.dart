import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

@Environment(Environment.dev)
@module
abstract class AppModule {
  Dio dio() => Dio(
        BaseOptions(
          baseUrl: Api.baseUrl,
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ),
      )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              // print(
              //     'interceptors ===  ${options.baseUrl} ===
              //     ${options.path} ===
              //     ${options.data}');
              handler.next(options);
            },
            onResponse: (response, handler) async {
              handler.next(response);
            },
            onError: (error, handler) async {
              // goToSessionExpiredScreen(error);
              // return ErrorHelper.extractApiError(error);
              handler.next(error);
            },
          ),
        )
        ..interceptors.add(PrettyDioLogger());

  @preResolve
  Future<SharedPreferences> get sharedPreferences async =>
      SharedPreferences.getInstance();
}
