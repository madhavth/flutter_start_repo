import 'package:dio/dio.dart';
import 'package:flutter_start_repo/features/login/data/data_sources/user_repository_remote_data_source.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: UserRepositoryRemoteDataSource)
class UserRepoRemoteDataSourceImpl extends UserRepositoryRemoteDataSource {
  final Dio _dio;

  UserRepoRemoteDataSourceImpl(this._dio);

  @override
  Future<User> authenticateUser(username, password) async {
    return User(username: "madhavth",token: "1232312", id: "123214");
      // var response = await _dio
      //     .post('auth', data: {'username': username, 'password': password});
      // return User.fromJson(response.data);
  }

  @override
  Future<bool> registerUser(Map<String, dynamic> register) async {
    return true;
  }

}