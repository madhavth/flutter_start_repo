import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../utils/router.dart';
import '../cubits/register_bloc.dart';
import '../cubits/register_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late GlobalKey<FormState> _formKey;

  void _onRegisterUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
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
            const SizedBox(
              height: 64,
            ),
            const FlutterLogo(
              size: 128,
            ),
            const SizedBox(
              height: 64,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  Navigator.pushReplacementNamed(context, AppRouter.kLogin);
                } else if (state is RegisterError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
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
      ),
    );
  }

  Widget _buildBody(RegisterState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            state is RegisteringState
                ? const LoadingIndicator()
                : Button(
                    title: 'Sign Up',
                    onPressed: _onRegisterUser,
                  )
          ],
        ),
      ),
    );
  }
}
