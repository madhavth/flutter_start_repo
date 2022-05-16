import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/color.dart';
import 'utils/router.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(320, 640),
      builder: (child) {
        return const MyApp();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madhavth Start Repo',
      theme: ThemeData(
        fontFamily: 'Avenir',
        textTheme: TextTheme(
          bodyText1: const TextStyle(color: CustomColor.defaultTextColor),
          bodyText2: TextStyle(
            color: CustomColor.defaultTextColor,
            fontSize: 15.sp,
          ),
          headline6: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
        ),
        primaryColor: CustomColor.primaryColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: CustomColor.accentColor),
      ),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      initialRoute: AppRouter.kStartPage,
      // navigatorKey: AppRouter.navigatorKey,
    );
  }
}
