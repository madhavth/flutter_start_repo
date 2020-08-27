import 'package:dio/dio.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/models/User.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:flutter_start_repo/utils/storage.dart';
import 'package:injectable/injectable.dart';


class UserRepository {
  final Dio _dio = g<Dio>();
  // Dio client;
  UserRepository();

  Future<User> authenticateUser(username, password) async {
//    var response = await _dio
//        .post('auth', data: {'username': username, 'password': password});
//    print(response);
    return User(username: "madhavth",token: "1232312", id: "123214");
  }

  Future<Map> registerUser(Map register) async {
    var response =
        await _dio.post(Api.REGISTER, data: FormData.fromMap(register));
    return response.data;
  }

  Future<bool> deleteUserInfo() async {
    return g<Storage>().clearAll();
  }

  Future<void> persistUserInfo(User user) async {
    return g<Storage>().setUserInfo(user);
  }

  Future<User> getUserInfo() {
    return g<Storage>().getUserInfo();
  }
}
