import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../utils/base_use_case.dart';
import '../../repositories/user_repository.dart';

@Injectable()
class LogoutUseCase extends UseCase<bool, NoParams> {
  final UserRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> execute(NoParams params) async {
    try{
      final success=  await repository.deleteUserInfo();
      return Right(success);
    }
    on Exception
    {
      return const Left(Failure("Failed to delete user info."));
    }
  }
}