import 'package:dartz/dartz.dart';
import 'package:flutter_start_repo/core/errors/failures.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/utils/base_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PersistUserInfoUseCase extends UseCase<bool, User> {
  final UserRepository repository;

  PersistUserInfoUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(User param) async {
    try{
      final success =  await repository.persistUserInfo(param);
      return Right(success);
    }
    catch(e)
    {
      return Left(Failure("Something went wrong while saving user info"));
    }
  }
}