import 'package:flutter/material.dart';

import 'loading.dart';

class LoadingDialog {
  static showLoadingDialog(context) {
    showDialog(
        useRootNavigator: true,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            child: LoadingIndicator(),
          );
        });
  }
}
