import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_start_repo/errors/failures.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/UserRepository.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:flutter_start_repo/utils/storage.dart';
import 'package:injectable/injectable.dart';

@Environment(Environment.dev)
@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {

  final Dio _dio = g<Dio>();
  // Dio client;
  UserRepositoryImpl();

  Future<Either<Failure, User>> authenticateUser(username, password) async {
//    var response = await _dio
//        .post('auth', data: {'username': username, 'password': password});
//    print(response);
    return Right(User(username: "madhavth",token: "1232312", id: "123214"));
  }

  Future<Map> registerUser(Map<String,dynamic> register) async {
    var response =
        await _dio.post(Api.REGISTER, data: FormData.fromMap(register));
    return response.data;
  }

  Future<bool> deleteUserInfo() async {
    return await g<Storage>().clearAll();
  }

  Future<bool> persistUserInfo(User user) async {
    return await g<Storage>().setUserInfo(user);
  }

  User? getUserInfo() {
    return g<Storage>().getUserInfo();
  }
}
