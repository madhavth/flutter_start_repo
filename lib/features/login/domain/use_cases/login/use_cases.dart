import 'package:injectable/injectable.dart';

import 'login_use_case.dart';

@Injectable()
class LoginUseCases {
  final LoginUseCase loginUseCase;

  LoginUseCases(this.loginUseCase);
}