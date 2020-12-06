import 'package:flutter_riverpod/all.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/ui/start/start_screen.dart';
import 'package:flutter_start_repo/utils/error_helper.dart';
import './notifier.dart';
import 'notifier.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  final UserRepository userRepository;
  final Reader read;

  RegisterNotifier(this.read)
      : userRepository = read(userRepositoryProvider),
        super(InitialRegisterState());

  registerUser() async {
    emit(RegisteringState());
    try {
      await userRepository.registerUser({});
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterError(ErrorHelper.getErrorMessage(error)));
    }
  }

  emit(state) {
    this.state = state;
  }
}
