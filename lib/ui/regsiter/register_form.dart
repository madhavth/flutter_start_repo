import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_start_repo/notifiers/register/notifier.dart';
import 'package:flutter_start_repo/ui/extra/button.dart';
import 'package:flutter_start_repo/ui/extra/loading.dart';
import 'package:flutter_start_repo/utils/router.dart';

final registerNotifierProvider = StateNotifierProvider.autoDispose<RegisterNotifier>((ref){
  return RegisterNotifier(ref.read);
});

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();

  _onRegisterUser() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    context.read(registerNotifierProvider).registerUser();
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
          ProviderListener(
            provider: registerNotifierProvider.state,
            onChange: (context, state) {
              if (state is RegisterSuccess) {
                Navigator.pushReplacementNamed(context, AppRouter.LOGIN);
              } else if (state is RegisterError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.error}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Consumer(builder: (BuildContext context, watch, Widget child) {
              final registerState = watch(registerNotifierProvider.state);
              return _buildBody(registerState);
            },
            ),
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
