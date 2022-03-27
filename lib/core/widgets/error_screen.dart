import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  final Function()? retry;
  final Color? textColor;
  final double? fontSize;
  final double? gap;
  final Widget? retryButton;

  const ErrorScreen({
    Key? key,
    this.gap = 10,
    this.retryButton,
    this.message = "",
    this.fontSize = 14,
    this.retry,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message!,
              style: TextStyle(
                fontSize: fontSize!.sp,
                color: textColor ?? Colors.black,
              ),
            ),
            retry != null
                ? Column(
                    children: [
                      SizedBox(
                        height: gap!.h,
                      ),
                      retryButton ??
                          IconButton(
                            onPressed: () {
                              retry!();
                            },
                            icon: const Icon(Icons.refresh_sharp),
                          ),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
