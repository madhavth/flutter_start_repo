import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading.dart';
import '../../../../core/widgets/splash_screen.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../cubits/auth/authentication_bloc.dart';
import '../cubits/auth/authentication_state.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          // return HomeScreen();

          if (state is AuthenticationAuthenticated) {
            return const HomeScreen();
          }
          if (state is AuthenticationUnauthenticated ||
              state is AuthenticationFailure) {
            return const LoginScreen();
            // return RegisterScreen();
          }
          if (state is AuthenticationLoading) {
            return const LoadingIndicator();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
