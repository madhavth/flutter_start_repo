import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiHelper {
  static showSnackBar(context, String message,
      {bool isError = false,
      SnackBarAction action,
      int durationInMilliSeconds = 4000,
      double width}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isError ? Colors.red : Colors.black,
      action: action,
      content: Text(
        message,
      ),
      width: width,
      duration: Duration(milliseconds: durationInMilliSeconds),
      behavior:
          width != null ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    ));
  }

  changeStatusBarColor({Color color}) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color ?? Colors.black));
  }

  changeSoftNavBarColor({Color color}) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: color ?? Colors.black));
  }
}
