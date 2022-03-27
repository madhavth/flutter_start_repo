import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../utils/base_use_case.dart';
import '../../../data/models/user.dart';
import '../../repositories/user_repository.dart';

@Injectable()
class PersistUserInfoUseCase extends UseCase<bool, User> {
  final UserRepository repository;

  PersistUserInfoUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> execute(User params) async {
    try{
      final success =  await repository.persistUserInfo(params);
      return Right(success);
    }
    on Exception
    {
      return const Left(Failure("Something went wrong while saving user info"));
    }
  }
}