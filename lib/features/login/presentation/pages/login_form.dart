import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../main.dart';
import '../../../../utils/color.dart';
import '../../../../utils/router.dart';
import '../../../../utils/ui_helper.dart';
import '../../../../utils/validator.dart';
import '../cubits/login/login_bloc.dart';
import '../cubits/login/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

GlobalKey<FormState> _formKey = GlobalKey();

class _LoginFormState extends State<LoginForm> {
  String _email = "";
  String _password = "";

  void _onSignInPress() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    logger.d('email $_email password $_password');
    BlocProvider.of<LoginBloc>(context).loginButtonPressed(_email, _password);
  }

  void _onSignInWithFacebook() {
    Navigator.pushNamed(context, 'aasd');
  }

  void _onSignUpPressed() {
    Navigator.pushNamed(context, AppRouter.kRegister);
  }

  void _onForgetPasswordPressed() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              UiHelper.showSnackBar(context, state.error, isError: true);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return _buildBody(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(LoginState state) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(
            hintText: "Username",
            labelText: "Username",
          ),
          validator: (value) => Validator.validateEmail(value!),
          onSaved: (value) => _email = value!,
          initialValue: kDebugMode ? 'admin@admin.com' : '',
        ),
        const SizedBox(
          height: 32,
        ),
        TextFormField(
          validator: (value) => Validator.validatePassword(value!),
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(
            hintText: "Password",
            labelText: "Password",
          ),
          onSaved: (value) => _password = value!,
          initialValue: kDebugMode ? 'secret' : '',
        ),
        const SizedBox(
          height: 32,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: _onForgetPasswordPressed,
            child: Text(
              "Forgot your password?",
              style: TextStyle(color: theme.primaryColor),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        state is LoginLoading
            ? const LoadingIndicator()
            : Button(
                onPressed: () => _onSignInPress(),
                title: "SIGN IN",
                padding: const EdgeInsets.all(20),
              ),
        const SizedBox(
          height: 32,
        ),
        MaterialButton(
          onPressed: () => _onSignInWithFacebook(),
          child: const Text("Connect with Facebook"),
          color: CustomColor.fbLogo,
          elevation: 0,
          textColor: Colors.white,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 16,
        ),
        Align(
          child: RichText(
            text: TextSpan(
              text: "Don't have account? ",
              style: const TextStyle(color: Colors.grey),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: const TextStyle(color: Colors.black),
                  recognizer: TapGestureRecognizer()..onTap = _onSignUpPressed,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
