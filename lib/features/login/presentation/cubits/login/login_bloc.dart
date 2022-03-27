import 'package:bloc/bloc.dart';

import '../../../../../main.dart';
import '../../../../../utils/error_helper.dart';
import '../../../domain/use_cases/login/login_use_case.dart';
import '../../../domain/use_cases/login/use_cases.dart';
import '../auth/authentication_bloc.dart';
import 'bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  final LoginUseCases useCases;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.useCases,
    required this.authenticationBloc,
  }) : super(LoginInitial());

  Future<void> loginButtonPressed(String username, String password) async {
    emit(LoginLoading());
    final userInfoResult =
        await useCases.loginUseCase.execute(LoginParams(username, password));

    userInfoResult.fold((error) {
      logger.e(error.errorMessage);
      emit(
        LoginFailure(error: ErrorHelper.getErrorMessage(error.errorMessage)),
      );
    }, (userInfo) {
      logger.i("loginbloc === ${userInfo.toJson()}");
      authenticationBloc.loggedIn(userInfo);
    });
  }
}
