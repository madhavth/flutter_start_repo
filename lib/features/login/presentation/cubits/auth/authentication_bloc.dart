import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../locator.dart';
import '../../../../../utils/base_use_case.dart';
import '../../../data/models/user.dart';
import '../../../domain/use_cases/authentication/use_cases.dart';
import 'authentication_state.dart';

@Injectable()
class AuthenticationBloc extends Cubit<AuthenticationState> {
  final AuthenticationUseCases authenticationUseCases;

  User? _userInfo;

  User? get userInfo => _userInfo;

  AuthenticationBloc({required this.authenticationUseCases})
      : super(AuthenticationUninitialized()) {
    appStarted();
  }

  Future<void> appStarted() async {
    final userData = await authenticationUseCases.fetchUserInfoUseCase.execute(
      NoParams(),
    );

    userData.fold((l) {
      emit(AuthenticationUnauthenticated());
      emit(AuthenticationFailure(l.errorMessage));
    }, (user) {
      g<Dio>().options.headers['Authorization'] = 'Bearer ${user.token}';
      emit(AuthenticationAuthenticated());
    });
  }

  Future<void> loggedIn(User user) async {
    final data =
        await authenticationUseCases.persistUserInfoUseCase.execute(user);
    data.fold((l) => emit(AuthenticationFailure(l.errorMessage)), (r) {
      g<Dio>().options.headers['Authorization'] = 'Bearer ${user.token}';
      emit(AuthenticationAuthenticated());
    });
  }

  Future<void> logOut() async {
    emit(AuthenticationLoading());
    final result =
        await authenticationUseCases.logoutUseCase.execute(NoParams());
    result.fold(
      (l) => emit(AuthenticationFailure(l.errorMessage)),
      (r) => emit(AuthenticationUnauthenticated()),
    );
  }
}
