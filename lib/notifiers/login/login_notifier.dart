import 'package:flutter_riverpod/all.dart';
import 'package:flutter_start_repo/notifiers/authentication/notifiers.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/ui/start/start_screen.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';
import 'package:meta/meta.dart';

import '../../utils/error_helper.dart';
import 'notifier.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final UserRepository userRepository;
  final AuthenticationNotifier authenticationNotifier;
  final Reader read;

  LoginNotifier(this.read)
      : userRepository = read(userRepositoryProvider),
        authenticationNotifier = read(authenticationNotifierProvider),
        super(LoginInitial());

  loginButtonPressed(String username, String password) async {
    emit(LoginLoading());
    try {
      final userInfo = await userRepository.authenticateUser(
        username,
        password,
      );
      print("loginbloc === ${userInfo.toJson()}");
      authenticationNotifier.loggedIn(userInfo);
    } catch (error) {
      print(error);
      emit(LoginFailure(error: ErrorHelper.getErrorMessage(error)));
    }
  }

  emit(state) {
    this.state = state;
  }
}
