import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/core/widgets/loading.dart';
import 'package:flutter_start_repo/core/widgets/splash_screen.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/auth/bloc.dart';
import 'package:flutter_start_repo/features/home/presentation/pages/home_screen.dart';
import 'package:flutter_start_repo/features/login/presentation/pages/login_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {

          return HomeScreen();

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