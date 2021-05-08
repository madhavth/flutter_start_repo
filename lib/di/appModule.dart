import 'package:dio/dio.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  Dio dio() => new Dio(BaseOptions(
        baseUrl: Api.BASE_URL,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ))
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options,handler) async {
          print(
              'interceptors ===  ${options.baseUrl} ===  ${options.path} ===  ${options.data}');
          handler.next(options);
        }, onResponse: (Response response,handler) async {
              handler.next(response);
        }, onError: (DioError error,handler) async {
          // goToSessionExpiredScreen(error);
          // return ErrorHelper.extractApiError(error);
          handler.next(error);
        }));

  Future<SharedPreferences> get sharedPreferences async =>
      await SharedPreferences.getInstance();

  goToSessionExpiredScreen(DioError error) async {
    // await Future.delayed(Duration(milliseconds: 250));
    // if (error.response.statusCode == 401) {
    //   AppRouter.navigatorState.pushReplacementNamed(AppRouter.SESSION_EXPIRED);
    // }
  }
}
