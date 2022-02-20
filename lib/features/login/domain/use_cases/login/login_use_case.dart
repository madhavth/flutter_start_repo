import 'package:dartz/dartz.dart';
import 'package:flutter_start_repo/core/errors/failures.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/utils/base_use_case.dart';
import 'package:injectable/injectable.dart';

// UseCase<Type, Params>
@Injectable()
class LoginUseCase extends UseCase<User, LoginParams> {
  final UserRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call( param) async {
    try{
      final data=  await repository.authenticateUser(param.email, param.password);
      return Right(data);
    }
    catch(e)
    {
      return Left(Failure("Failed to login in"));
    }
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);
}