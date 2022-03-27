import 'package:flutter/material.dart';

import '../core/widgets/session_expired.dart';
import '../features/login/presentation/pages/login_screen.dart';
import '../features/login/presentation/pages/start_screen.dart';
import '../features/register/presentation/pages/register_screen.dart';

class AppRouter {
  static const kLogin = "login";
  static const kRegister = 'register';
  static const kStartPage = 'start_page';
  static const kSessionExpired = 'session-expired';

  static GlobalKey navigatorKey = GlobalKey<NavigatorState>();

  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kStartPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: kStartPage),
          builder: (_) => const StartScreen(),
        );
      case kLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case kRegister:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case kSessionExpired:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return const SessionExpiredScreen();
        },);

      default:
        return const Scaffold(
          body: Center(
            child: Text('something went wrong'),
          ),
        ).defaultPage();
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
