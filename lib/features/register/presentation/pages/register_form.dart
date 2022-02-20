import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/core/widgets/button.dart';
import 'package:flutter_start_repo/core/widgets/loading.dart';
import 'package:flutter_start_repo/features/register/presentation/cubits/register_bloc.dart';
import 'package:flutter_start_repo/features/register/presentation/cubits/register_state.dart';
import 'package:flutter_start_repo/utils/router.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  late GlobalKey<FormState> _formKey;

  _onRegisterUser() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    BlocProvider.of<RegisterBloc>(context).registerUser();
  }


  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
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
                Navigator.pushReplacementNamed(context, AppRouter.LOGIN);
              } else if (state is RegisterError) {
                ScaffoldMessenger.of(context).showSnackBar(
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
