import 'package:dio/dio.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/models/User.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:meta/meta.dart';

import 'authentication_state.dart';

class AuthenticationNotifier
    extends StateNotifier<AuthenticationState> {
  final UserRepository userRepository;
  User _userInfo;
  User get userInfo => _userInfo;

  AuthenticationNotifier({@required this.userRepository}) : assert(userRepository != null)
  , super(AuthenticationUninitialized()){
   appStarted();
  }

  appStarted() async {
    final User user = userRepository.getUserInfo();
    if (user != null) {
      g<Dio>().options.headers['Authorization'] = 'Bearer ${user.token}';
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }


  emit(state)
  {
    this.state = state;
  }


  loggedIn(User user) async
  {
    await userRepository.persistUserInfo(user);
    g<Dio>().options.headers['Authorization'] = 'Bearer ${user.token}';
    emit(AuthenticationAuthenticated());
  }


  logOut() async
  {
    emit(AuthenticationLoading());
    await userRepository.deleteUserInfo();
    emit(AuthenticationUnauthenticated());
  }
}
