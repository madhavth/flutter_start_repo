import 'package:flutter/material.dart';

import 'loading.dart';

class LoadingDialog {
  static void showLoadingDialog(context) {
    showDialog(
      useRootNavigator: true,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const LoadingIndicator();
      },
    );
  }
}
