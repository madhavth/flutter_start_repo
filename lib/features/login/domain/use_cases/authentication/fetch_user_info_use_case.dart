import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../utils/base_use_case.dart';
import '../../../data/models/user.dart';
import '../../repositories/user_repository.dart';

// UseCase<Type, Params>
@Injectable()
class FetchUserInfoUseCase extends UseCase<User, NoParams> {
  final UserRepository repository;

  FetchUserInfoUseCase(this.repository);

  @override
  Future<Either<Failure, User>> execute(NoParams params) async {
    try{
      final success = repository.getUserInfo();
      if(success == null){
        return const Left(Failure("User not found"));
      }
      return Right(success);
    }
    on Exception
    {
      return const Left(Failure("Failed fetching user info"));
    }
  }
}