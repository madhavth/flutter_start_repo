import 'package:bloc/bloc.dart';
import 'package:flutter_start_repo/bloc/authentication/bloc.dart';
import 'package:flutter_start_repo/models/User.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/repository/dio_helper.dart';
import 'package:meta/meta.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Cubit<AuthenticationState> {
  final UserRepository userRepository;
  User _userInfo;
  User get userInfo => _userInfo;

  AuthenticationBloc({@required this.userRepository}) : assert(userRepository != null)
  , super(AuthenticationUninitialized()){
   appStarted();
  }

  appStarted() async {
    final User user = await userRepository.getUserInfo();
    if (user != null) {
      dio.options.headers['Authorization'] = 'Bearer ${user.token}';
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }


  loggedIn(User user) async
  {
    await userRepository.persistUserInfo(user);
    dio.options.headers['Authorization'] = 'Bearer ${user.token}';
    emit(AuthenticationAuthenticated());
  }


  logOut() async
  {
    emit(AuthenticationLoading());
    await userRepository.deleteUserInfo();
    emit(AuthenticationUnauthenticated());
  }
}
