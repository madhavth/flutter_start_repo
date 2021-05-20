import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/bloc/authentication/bloc.dart';
import 'package:flutter_start_repo/ui/extra/loading.dart';
import 'package:flutter_start_repo/ui/home/home_screen.dart';
import 'package:flutter_start_repo/ui/login/login_screen.dart';
import 'package:flutter_start_repo/ui/screen/splash_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return const HomeScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginScreen();
            // return RegisterScreen();
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashScreen();
        },
      ),
    );
  }
}