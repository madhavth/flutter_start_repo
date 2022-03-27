import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/user_repository_remote_data_source.dart';
import '../models/user.dart';

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
    await _dio.get('https://www.google.com');
    return true;
  }

}