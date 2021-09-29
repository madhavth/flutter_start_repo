import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/features/login/domain/use_cases/use_cases.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/auth/bloc.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';

import 'authentication_state.dart';

class AuthenticationBloc
    extends Cubit<AuthenticationState> {
  final LoginUseCases loginUseCases;
  User? _userInfo;
  User? get userInfo => _userInfo;

  AuthenticationBloc({required this.loginUseCases}) : super(AuthenticationUninitialized()){
   appStarted();
  }

  appStarted() async {
    final User? user = loginUseCases.loginUseCase.getUserInfo();
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
