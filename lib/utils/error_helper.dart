import 'dart:io';

import 'package:dio/dio.dart';
import '../main.dart';

class ErrorHelper {
  static String getErrorMessage(error) {
    logger.e('error helper === $error');
    var message = "Something went wrong.";
    if (error is DioError) {
      message = error.message;
    }
    return message;
  }

  static String extractApiError(error) {
    var message = "Something went wrong";
    logger.e(
        'error === ${error.response}  ==== ${error.response != null ?
        error.response?.data : 'noresponse'} ==== ${error.response != null ?
        error.response?.extra : 'no response'}=== ${error.message}',);
    if (error is DioError) {
      if (error.error is SocketException ||
          error.type == DioErrorType.connectTimeout) {
        message = "Cannot connect to server. Make sure you have"
            " proper internet connection";
      } else if (error.response != null &&
          error.response?.data['message'] != null) {
        message = error.response?.data['message'];
      } else {
        message = error.message;
      }
    }
    return message;
  }
}
