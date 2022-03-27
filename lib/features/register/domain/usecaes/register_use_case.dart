import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../utils/base_use_case.dart';
import '../../../login/domain/repositories/user_repository.dart';

// UseCase<Type, Params>
@Injectable()
class RegisterUseCase extends UseCase<bool, NoParams> {
  final UserRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> execute(NoParams params) async {
    try {
      final data = await repository.registerUser({});
      return Right(data);
    } on Exception {
      return const Left(
        Failure("Error occurred while registering user"),
      );
    }
  }
}
