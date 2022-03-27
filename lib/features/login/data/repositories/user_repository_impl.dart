import 'package:injectable/injectable.dart';

import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_repo_local_data_source.dart';
import '../data_sources/user_repository_remote_data_source.dart';
import '../models/user.dart';

@Environment(Environment.dev)
@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserRepositoryRemoteDataSource remoteDataSource;
  final UserRepoLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> authenticateUser(username, password) async {
    return remoteDataSource.authenticateUser(username, password);
  }

  @override
  Future<bool> registerUser(Map<String, dynamic> register) async {
    return remoteDataSource.registerUser(register);
  }

  @override
  Future<bool> deleteUserInfo() async {
    return localDataSource.deleteUserInfo();
  }

  @override
  Future<bool> persistUserInfo(User user) async {
    return localDataSource.persistUserInfo(user);
  }

  @override
  User? getUserInfo() {
    return localDataSource.getUserInfo();
  }
}
