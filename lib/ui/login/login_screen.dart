import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/bloc/authentication/bloc.dart';
import 'package:flutter_start_repo/bloc/login/bloc.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/ui/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  const LoginScreen({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    userRepository: userRepository,
                  );
                },
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
