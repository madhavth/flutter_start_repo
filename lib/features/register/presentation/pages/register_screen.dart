import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/features/register/domain/usecaes/register_use_case.dart';
import 'package:flutter_start_repo/features/register/domain/usecaes/use_cases.dart';
import 'package:flutter_start_repo/features/register/presentation/cubits/register_bloc.dart';
import 'package:flutter_start_repo/features/register/presentation/pages/register_form.dart';
import 'package:flutter_start_repo/locator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(g<RegisterUseCases>()),
      child: RegisterForm(),
    );
  }
}
