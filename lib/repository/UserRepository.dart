import 'package:dio/dio.dart';
import 'package:flutter_start_repo/models/User.dart';
import 'package:flutter_start_repo/repository/dio_helper.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:flutter_start_repo/utils/storage.dart';

class UserRepository {
  // Dio client;
  UserRepository();

  Future<User> authenticateUser(username, password) async {
    var response = await dio
        .post('auth', data: {'username': username, 'password': password});
    print(response);
    return User.fromJson(response.data);
  }

  Future<Map> registerUser(Map register) async {
    var response =
        await dio.post(Api.REGISTER, data: FormData.fromMap(register));
    return response.data;
  }

  Future<bool> deleteUserInfo() async {
    return Storage().clearAll();
  }

  Future<void> persistUserInfo(User user) async {
    return Storage().setUserInfo(user);
  }

  Future<User> getUserInfo() async {
    return Storage().getUserInfo();
  }
}
