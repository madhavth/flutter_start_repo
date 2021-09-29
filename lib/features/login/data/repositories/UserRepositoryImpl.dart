import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_start_repo/core/errors/failures.dart';
import 'package:flutter_start_repo/features/login/data/data_sources/user_repo_local_data_source.dart';
import 'package:flutter_start_repo/features/login/data/data_sources/user_repository_remote_data_source.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:injectable/injectable.dart';

@Environment(Environment.dev)
@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {

  final UserRepositoryRemoteDataSource remoteDataSource;
  final UserRepoLocalDataSource localDataSource;

  final Dio _dio = g<Dio>();
  // Dio client;
  UserRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  Future<Either<Failure, User>> authenticateUser(username, password) async {
    try{
      final result = await remoteDataSource.authenticateUser(username,password);
      return Right(result);
    }
    catch(e)
    {
      return Left(Failure("Something went wrong trying to authenticate user."));
    }
  }

  Future<Map> registerUser(Map<String,dynamic> register) async {
    return await remoteDataSource.registerUser(register);
  }

  Future<bool> deleteUserInfo() async {
    return await localDataSource.deleteUserInfo();
  }

  Future<bool> persistUserInfo(User user) async {
    return await localDataSource.persistUserInfo(user);
  }

  User? getUserInfo() {
    return localDataSource.getUserInfo();
  }
}
