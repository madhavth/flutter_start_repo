import 'package:bloc/bloc.dart';

import '../../../../utils/base_use_case.dart';
import '../../domain/usecaes/use_cases.dart';
import 'bloc.dart';

class RegisterBloc extends Cubit<RegisterState> {
  final RegisterUseCases useCases;

  RegisterBloc(this.useCases) : super(InitialRegisterState());

  Future<void> registerUser() async {
    emit(RegisteringState());

    final data = await useCases.registerUseCase.execute(NoParams());

    data.fold(
      (failure) => emit(RegisterError(failure.errorMessage)),
      (success) => emit(RegisterSuccess()),
    );
  }
}
