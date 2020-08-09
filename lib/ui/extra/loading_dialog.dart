import 'package:flutter/material.dart';
import 'package:flutter_start_repo/ui/extra/loading.dart';

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
