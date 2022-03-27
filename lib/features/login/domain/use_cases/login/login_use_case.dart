import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../utils/base_use_case.dart';
import '../../../data/models/user.dart';
import '../../repositories/user_repository.dart';

// UseCase<Type, Params>
@Injectable()
class LoginUseCase extends UseCase<User, LoginParams> {
  final UserRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> execute(params) async {
    try {
      final data = await repository.authenticateUser(
        params.email,
        params.password,
      );
      return Right(data);
    } on Exception {
      return const Left(Failure("Failed to login in"));
    }
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);
}
