import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_start_repo/main.dart';
import 'package:flutter_start_repo/ui/login/login_screen.dart';
import 'package:flutter_start_repo/ui/regsiter/register_screen.dart';
import 'package:flutter_start_repo/utils/constant.dart';

class Routers {
  static const LOGIN = "login";
  static const REGISTER = 'register';
  static const START_PAGE = 'start_page';

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case START_PAGE:
        return MaterialPageRoute(
            settings: RouteSettings(name: START_PAGE),
            builder: (_) => StartScreen().adaptOnOrientation());
      case LOGIN:
        return MaterialPageRoute(
            builder: (_) => LoginScreen().adaptOnOrientation());
      case REGISTER:
        return MaterialPageRoute(
            builder: (_) => RegisterScreen().adaptOnOrientation());

      default:
        return Scaffold(body: Center(child: Text('something went wrong')))
            .defaultPage();
    }
  }
}

extension RouterWidgetExtensions on Widget {
  Widget adaptOnOrientation() {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final isPortrait = orientation == Orientation.portrait;
        ScreenUtil.init(context,
            designSize: isPortrait
                ? Size(ScreenUtilConstants.width, ScreenUtilConstants.height)
                : Size(ScreenUtilConstants.height, ScreenUtilConstants.width));

        return this;
      },
    );
  }

  PageRouteBuilder fadePage({opaque = true}) {
    return PageRouteBuilder(
      pageBuilder: (ctx, anim, anim2) {
        return this;
      },
      transitionsBuilder: (ctx, anim, anim2, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 250),
    );
  }

  MaterialPageRoute defaultPage() {
    return MaterialPageRoute(builder: (_) => this);
  }
}
