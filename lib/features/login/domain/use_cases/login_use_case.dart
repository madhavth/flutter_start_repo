import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/features/login/domain/entities/login_user.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/utils/base_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase extends UseCase<User, UserLogin> {
  final UserRepository repository;

  LoginUseCase(this.repository);

  call(UserLogin user) async {
    return await repository.authenticateUser(user.username, user.password);
  }
}
