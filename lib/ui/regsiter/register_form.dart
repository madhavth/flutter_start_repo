import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/bloc/register/register_bloc.dart';
import 'package:flutter_start_repo/bloc/register/register_state.dart';
import 'package:flutter_start_repo/ui/extra/button.dart';
import 'package:flutter_start_repo/ui/extra/loading.dart';
import 'package:flutter_start_repo/utils/router.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();

  _onRegisterUser() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    BlocProvider.of<RegisterBloc>(context).registerUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
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
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                Navigator.pushReplacementNamed(context, Router.LOGIN);
              } else if (state is RegisterError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.error}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return _buildBody(state);
            },
          )
        ],
      ),
    ));
  }

  Widget _buildBody(RegisterState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            state is RegisteringState
                ? LoadingIndicator()
                : Button(
                    title: 'Sign Up',
                    onPressed: this._onRegisterUser,
                  )
          ],
        ),
      ),
    );
  }
}
