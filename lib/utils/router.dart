import 'package:flutter/material.dart';
import 'package:flutter_start_repo/core/widgets/session_expired.dart';
import 'package:flutter_start_repo/features/login/presentation/pages/login_screen.dart';
import 'package:flutter_start_repo/features/register/presentation/pages/register_screen.dart';
import 'package:flutter_start_repo/features/login/presentation/pages/start_screen.dart';

class AppRouter {
  static const LOGIN = "login";
  static const REGISTER = 'register';
  static const START_PAGE = 'start_page';
  static const SESSION_EXPIRED = 'session-expired';

  static GlobalKey navigatorKey = GlobalKey<NavigatorState>();

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case START_PAGE:
        return MaterialPageRoute(
            settings: RouteSettings(name: START_PAGE),
            builder: (_) => StartScreen());
      case LOGIN:
        return MaterialPageRoute(
            builder: (_) => LoginScreen());
      case REGISTER:
        return MaterialPageRoute(
            builder: (_) => RegisterScreen());
      case SESSION_EXPIRED:
        return PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return SessionExpiredScreen();
        });

      default:
        return Scaffold(body: Center(child: Text('something went wrong')))
            .defaultPage();
    }
  }
}

extension RouterWidgetExtensions on Widget {
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
