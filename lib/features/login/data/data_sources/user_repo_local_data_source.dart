import '../models/user.dart';

abstract class UserRepoLocalDataSource {
  Future<bool> deleteUserInfo();

  Future<bool> persistUserInfo(User user);

  User? getUserInfo();
}