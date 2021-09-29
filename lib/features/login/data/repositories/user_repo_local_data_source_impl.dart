import 'dart:convert';

import 'package:flutter_start_repo/features/login/data/data_sources/user_repo_local_data_source.dart';
import 'package:flutter_start_repo/features/login/data/models/User.dart';
import 'package:flutter_start_repo/main.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: UserRepoLocalDataSource)
class UserRepoLocalDataSourceImpl extends UserRepoLocalDataSource {

  final SharedPreferences pref;

  UserRepoLocalDataSourceImpl(this.pref);

  @override
  Future<bool> persistUserInfo(User user) async {
    return await pref.setString(
        Preference.USER_INFO, jsonEncode(user.toJson()));
  }

  @override
  User? getUserInfo() {
    logger.i("userinfo in pref ===== ${pref.get(Preference.USER_INFO)}");
    return pref.containsKey(Preference.USER_INFO)
        ? User.fromJson(jsonDecode(pref.get(Preference.USER_INFO) as String))
        : null;
  }

  @override
  Future<bool> deleteUserInfo()async
  {
    return await pref.clear();
  }
}