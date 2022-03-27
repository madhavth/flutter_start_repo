import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../../domain/use_cases/login/use_cases.dart';
import '../cubits/auth/authentication_bloc.dart';
import '../cubits/login/login_bloc.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 64,
            ),
            const FlutterLogo(
              size: 128,
            ),
            const SizedBox(
              height: 64,
            ),
            BlocProvider<LoginBloc>(
              create: (context) {
                return LoginBloc(
                  useCases: g<LoginUseCases>(),
                  authenticationBloc: context.read<AuthenticationBloc>(),
                );
              },
              child: const LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
