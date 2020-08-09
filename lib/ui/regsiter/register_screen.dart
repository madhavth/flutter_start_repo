import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/bloc/register/bloc.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/ui/regsiter/register_form.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterBloc(RepositoryProvider.of<UserRepository>(context)),
      child: RegisterForm(),
    );
  }
}
