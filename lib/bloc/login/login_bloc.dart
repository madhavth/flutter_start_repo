
import 'package:bloc/bloc.dart';
import 'package:flutter_start_repo/bloc/authentication/bloc.dart';
import 'package:flutter_start_repo/bloc/login/bloc.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';

import '../../utils/error_helper.dart';
import 'bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : super(LoginInitial());

  loginButtonPressed(String username, String password) async {
    emit(LoginLoading());
    try {
      final userInfo = await userRepository.authenticateUser(
        username,
        password,
      );
      print("loginbloc === ${userInfo.toJson()}");
      authenticationBloc.loggedIn(userInfo);
    } catch (error) {
      print(error);
      emit(LoginFailure(error: ErrorHelper.getErrorMessage(error)));
    }
  }
}
