import 'package:dartz/dartz.dart';
import 'package:flutter_start_repo/core/errors/failures.dart';
import 'package:flutter_start_repo/features/login/data/data_sources/user_repository_remote_data_source.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';

abstract class UserRepository {
  // Dio client;
  UserRepository();

  Future<User> authenticateUser(username, password);

  Future<bool> registerUser(Map<String,dynamic> register);

  Future<bool> deleteUserInfo();

  Future<bool> persistUserInfo(User user);

  User? getUserInfo();
}
