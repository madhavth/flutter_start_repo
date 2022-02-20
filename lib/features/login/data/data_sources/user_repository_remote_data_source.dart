import 'package:flutter_start_repo/features/login/data/models/User.dart';

abstract class UserRepositoryRemoteDataSource {
  Future<User> authenticateUser(String username, String password);

  Future<bool> registerUser(Map<String,dynamic> register);
}