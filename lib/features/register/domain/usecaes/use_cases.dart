import 'package:injectable/injectable.dart';

import 'register_use_case.dart';

@Injectable()
class RegisterUseCases {
  final RegisterUseCase registerUseCase;

  RegisterUseCases(this.registerUseCase);
}