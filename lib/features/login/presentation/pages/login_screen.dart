import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/auth/bloc.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/login/bloc.dart';
import 'package:flutter_start_repo/features/login/data/repositories/UserRepositoryImpl.dart';
import 'package:flutter_start_repo/features/login/presentation/pages/login_form.dart';

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
                return LoginBloc(
                  authenticationBloc:
                      BlocProvider.of<AuthenticationBloc>(context),
                  userRepository: RepositoryProvider.of<UserRepository>(context),
                );
              },
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
