import 'package:flutter_start_repo/features/login/data/models/User.dart';

abstract class UserRepoLocalDataSource {
  Future<bool> deleteUserInfo();

  Future<bool> persistUserInfo(User user);

  User? getUserInfo();
}