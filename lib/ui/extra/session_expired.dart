import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_start_repo/utils/router.dart';

class SessionExpiredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: AlertDialog(
        actions: [
          MaterialButton(onPressed: () {
            Navigator.pushNamed(context, AppRouter.LOGIN);
          },
          child: Text('Go to login Screen'),
          )
        ],
        title: Text('Session Expired'),

      ),
    );
  }
}
