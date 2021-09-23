import 'package:flutter_start_repo/features/login/data/models/User.dart';

abstract class UserRepository {

  // Dio client;
  UserRepository();

  Future<User> authenticateUser(username, password);

  Future<Map> registerUser(Map<String,dynamic> register);

  Future<bool> deleteUserInfo();

  Future<bool> persistUserInfo(User user);

  User? getUserInfo();
}
