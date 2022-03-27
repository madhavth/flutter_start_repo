import '../../data/models/user.dart';

abstract class UserRepository {
  // Dio client;
  UserRepository();

  Future<User> authenticateUser(username, password);

  Future<bool> registerUser(Map<String,dynamic> register);

  Future<bool> deleteUserInfo();

  Future<bool> persistUserInfo(User user);

  User? getUserInfo();
}
