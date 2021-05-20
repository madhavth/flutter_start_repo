import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/utils/storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HomeScreen extends StatelessWidget {

  const HomeScreen();

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
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).logOut();
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  Text(
                    'screen width === ${MediaQuery.of(context).size.width}\n'
                    'screen height === ${MediaQuery.of(context).size.height}',
                    style: TextStyle(fontSize: 24.sp),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.blue,
              height: 100.h,
              child: Center(
                child: const TextHeight(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class TextHeight extends StatelessWidget {

  const TextHeight();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,size){
      return Column(
        children: [
          Text('width, height ==== ${size.maxWidth}, ${size.maxHeight}',
          style: TextStyle(fontSize: 24.sp),
          ),
          FutureBuilder(builder: (ctx,ss)
          {
           return Text(ss.hasData.toString()); 
          },
            future: g<Dio>().get("https://jsonplaceholder.typicode.com/todos/1"),
          )
        ],
      );
    });
  }
}

