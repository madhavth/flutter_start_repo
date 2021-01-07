import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/notifiers/authentication/notifiers.dart';
import 'package:flutter_start_repo/utils/storage.dart';
import 'package:flutter_riverpod/all.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.deepPurple,
              height: 200.h,
              child: Column(
                children: [
                  Text(
                    'userInfo === ${g<Storage>().getUserInfo()}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  FlatButton(
                    onPressed: () {
                      context.read(authenticationNotifierProvider).logOut();
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                  Text(
                    'screen width === ${MediaQuery.of(context).size.width}\n'
                    'screen height === ${MediaQuery.of(context).size.height}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),

            Container(
              width: 320.w,
              height: 40.h,
              color: Colors.deepPurple,
            ),

            Container(
              color: Colors.blue,
              height: 100.h,
              child: Center(
                child: TextHeight(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,size){
      return Text('width, height ==== ${size.maxWidth}, ${size.maxHeight}',
      style: TextStyle(fontSize: 14.sp),
      );
    });
  }
}

