import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/features/login/data/repositories/UserRepositoryImpl.dart';
import 'package:flutter_start_repo/features/login/domain/use_cases/login/use_cases.dart';
import 'package:flutter_start_repo/features/login/presentation/cubits/auth/authentication_bloc.dart';
import 'package:flutter_start_repo/features/login/presentation/pages/login_form.dart';
import 'package:flutter_start_repo/locator.dart';

import '../cubits/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 64,
            ),
            FlutterLogo(
              size: 128,
            ),
            SizedBox(
              height: 64,
            ),
            BlocProvider<LoginBloc>(
              create: (context) {
                return LoginBloc(useCases: g<LoginUseCases>(),
                    authenticationBloc: context.read<AuthenticationBloc>());
              },
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
