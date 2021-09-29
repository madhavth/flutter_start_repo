
import 'package:flutter_start_repo/features/login/domain/use_cases/login_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCases {
  final LoginUseCase loginUseCase;

  LoginUseCases(this.loginUseCase);
}