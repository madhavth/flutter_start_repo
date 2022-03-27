import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../core/errors/failures.dart';

// Parameters have to be put into a container object so that they can be
// included in this abstract base class method definition.

//ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> execute(Params params);
}

// This will be used by the code calling the use case whenever the use case
// doesn't accept any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
