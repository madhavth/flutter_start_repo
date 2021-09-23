import 'package:bloc/bloc.dart';
import 'package:flutter_start_repo/features/login/data/repositories/UserRepositoryImpl.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';
import 'bloc.dart';
import 'bloc.dart';

class RegisterBloc extends Cubit<RegisterState> {
  final UserRepositoryImpl userRepository;

  RegisterBloc(this.userRepository):super(InitialRegisterState());

  registerUser() async
  {
    emit(RegisteringState());
    try {
      await userRepository.registerUser({});
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterError(ErrorHelper.getErrorMessage(error)));
    }
  }
}
