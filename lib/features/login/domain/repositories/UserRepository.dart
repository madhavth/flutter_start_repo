import 'package:dartz/dartz.dart';
import 'package:flutter_start_repo/errors/failures.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';

abstract class UserRepository {

  // Dio client;
  UserRepository();

  Future<Either<Failure, User>> authenticateUser(username, password);

  Future<Map> registerUser(Map<String,dynamic> register);

  Future<bool> deleteUserInfo();

  Future<bool> persistUserInfo(User user);

  User? getUserInfo();
}
