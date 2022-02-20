import 'package:dartz/dartz.dart';
import 'package:flutter_start_repo/core/errors/failures.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/utils/base_use_case.dart';
import 'package:injectable/injectable.dart';

// UseCase<Type, Params>
@Injectable()
class RegisterUseCase extends UseCase<bool, NoParams> {
  final UserRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    try{
      final data=  await repository.registerUser({});
      return Right(data);
    }
    catch(e)
    {
      return Left(Failure("Error occurred while registering user"));
    }
  }
}