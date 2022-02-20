import 'package:dartz/dartz.dart';
import 'package:flutter_start_repo/core/errors/failures.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/utils/base_use_case.dart';
import 'package:injectable/injectable.dart';

// UseCase<Type, Params>
@Injectable()
class FetchUserInfoUseCase extends UseCase<User, NoParams> {
  final UserRepository repository;

  FetchUserInfoUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams param) async {
    try{
      final success = repository.getUserInfo();
      if(success == null){
        return Left(Failure("User not found"));
      }
      return Right(success);
    }
    catch(e)
    {
      return Left(Failure("Failed fetching user info"));
    }
  }
}