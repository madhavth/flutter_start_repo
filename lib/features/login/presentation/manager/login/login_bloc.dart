
import 'package:bloc/bloc.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/auth/bloc.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/login/bloc.dart';
import 'package:flutter_start_repo/main.dart';
import 'package:flutter_start_repo/features/login/data/repositories/UserRepositoryImpl.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';

import '../../../../../utils/error_helper.dart';
import 'bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : super(LoginInitial());

  loginButtonPressed(String username, String password) async {
    emit(LoginLoading());
    final userInfoResult = await userRepository.authenticateUser(
        username,
        password,
      );

      userInfoResult.fold((error) {
      logger.e(error.errorMessage);
      emit(LoginFailure(error: ErrorHelper.getErrorMessage(error.errorMessage)));
      },
    (userInfo) {
      logger.i("loginbloc === ${userInfo.toJson()}");
          authenticationBloc.loggedIn(userInfo);
      });

  }
}
