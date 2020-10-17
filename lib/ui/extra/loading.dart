import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class LoadingIndicator extends StatelessWidget {
  final double height;
  final Color color;

  const LoadingIndicator({Key key, this.height =20, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(strokeWidth: height.h),
    );
  }
}
