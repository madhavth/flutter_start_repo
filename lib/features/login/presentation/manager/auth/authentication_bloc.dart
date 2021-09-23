import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/auth/bloc.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/features/login/data/repositories/UserRepositoryImpl.dart';

import 'authentication_state.dart';

class AuthenticationBloc
    extends Cubit<AuthenticationState> {
  final UserRepositoryImpl userRepository;
  User? _userInfo;
  User? get userInfo => _userInfo;

  AuthenticationBloc({required this.userRepository}) : super(AuthenticationUninitialized()){
   appStarted();
  }

  appStarted() async {
    final User? user = userRepository.getUserInfo();
    if (user != null) {
      g<Dio>().options.headers['Authorization'] = 'Bearer ${user.token}';
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
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
