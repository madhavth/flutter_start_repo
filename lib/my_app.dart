import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/utils/color.dart';
import 'package:flutter_start_repo/utils/router.dart';

class InitScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(320,640),
        builder: () {
      return MyApp();
    });
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madhavth Start Repo',
      theme: ThemeData(
          fontFamily: 'Avenir',
          textTheme: TextTheme(
              bodyText1: TextStyle(color: CustomColor.DEFAULT_TEXT_COLOR),
              bodyText2: TextStyle(
                color: CustomColor.DEFAULT_TEXT_COLOR,
                fontSize: 15.sp,
              ),
              headline6: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700)),
          primaryColor: CustomColor.PRIMARY_COLOR,
          accentColor: CustomColor.ACCENT_COLOR,
          appBarTheme: AppBarTheme(
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.white))),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      initialRoute: AppRouter.START_PAGE,
      // navigatorKey: AppRouter.navigatorKey,
    );
  }
}
