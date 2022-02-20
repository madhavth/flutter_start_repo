import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/features/login/domain/use_cases/authentication/use_cases.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/utils/base_use_case.dart';
import 'package:injectable/injectable.dart';

import 'authentication_state.dart';

@Injectable()
class AuthenticationBloc
    extends Cubit<AuthenticationState> {
  final AuthenticationUseCases authenticationUseCases;

  User? _userInfo;
  User? get userInfo => _userInfo;

  AuthenticationBloc({required this.authenticationUseCases}) : super(AuthenticationUninitialized()){
   appStarted();
  }

  appStarted() async {
    final userData = await authenticationUseCases.fetchUserInfoUseCase(NoParams());

    userData.fold((l) {
      emit(AuthenticationUnauthenticated());
      emit(AuthenticationFailure(l.errorMessage));
    }, (user) {
      g<Dio>().options.headers['Authorization'] = 'Bearer ${user.token}';
      emit(AuthenticationAuthenticated());
    });
  }


  loggedIn(User user) async
  {
    final data = await authenticationUseCases.persistUserInfoUseCase(user);
    data.fold((l) => emit(AuthenticationFailure(l.errorMessage)), (r) {
      g<Dio>().options.headers['Authorization'] = 'Bearer ${user.token}';
      emit(AuthenticationAuthenticated());
    });
  }


  logOut() async
  {
    emit(AuthenticationLoading());
    final result = await authenticationUseCases.logoutUseCase(NoParams());
    result.fold((l) => emit(AuthenticationFailure(l.errorMessage)),
            (r) => emit(AuthenticationUnauthenticated()));
  }
}
