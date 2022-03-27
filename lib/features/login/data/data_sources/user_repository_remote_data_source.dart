import '../models/user.dart';

abstract class UserRepositoryRemoteDataSource {
  Future<User> authenticateUser(String username, String password);

  Future<bool> registerUser(Map<String,dynamic> register);
}