import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHelper {
  static String getErrorMessage(error) {
    print('error helper === $error');
    if (error is DioError) {
      return error.message;
    }
    return error.toString();
  }

  static extractApiError(DioError error) {
    String message = "Something went wrong";
    print(
        'error === ${error.response}  ==== ${error.response != null ? error.response.data : 'noresponse'} ==== ${error.response != null ? error.response.extra : 'no response'}=== ${error.message}');
    if (error is DioError) {
      if (error.error is SocketException) {
        message =
            "Cannot connect to server. Make sure you have proper internet connection";
      } else if (error.response != null &&
          error.response.data['message'] != null) {
        message = error.response.data['message'];
      } else if (error.message != null) {
        message = error.message;
      } else {
        message = error.message ?? error.response.statusMessage;
      }
    }
    return message;
  }
}
