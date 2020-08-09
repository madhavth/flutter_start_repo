import 'package:flutter/material.dart';
import 'package:flutter_start_repo/ui/login/login_screen.dart';
import 'package:flutter_start_repo/ui/regsiter/register_screen.dart';

class Router {
  static const LOGIN = "login";
  static const REGISTER = 'register';
  static const DOCTOR_DETAIL = "doctor_detail";

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      default:
        return Text("aalu khau");
    }
  }
}
