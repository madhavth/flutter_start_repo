import 'package:flutter/material.dart';

class UiHelper {
  static showSnackBar(context, String message, {bool isError = false}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: isError ? Colors.red : Colors.black,
      content: Text(
        message,
      ),
    ));
  }
}
