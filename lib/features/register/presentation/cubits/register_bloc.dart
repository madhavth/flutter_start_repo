import 'package:bloc/bloc.dart';
import 'package:flutter_start_repo/features/login/data/repositories/UserRepositoryImpl.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/features/register/domain/usecaes/use_cases.dart';
import 'package:flutter_start_repo/utils/base_use_case.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';
import 'bloc.dart';
import 'bloc.dart';

class RegisterBloc extends Cubit<RegisterState> {
  final RegisterUseCases useCases;

  RegisterBloc(this.useCases) : super(InitialRegisterState());

  registerUser() async {
    emit(RegisteringState());

    final data = await useCases.registerUseCase(NoParams());

    data.fold(
      (failure) => emit(RegisterError(failure.errorMessage)),
      (success) => emit(RegisterSuccess()),
    );
  }
}
