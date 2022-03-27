import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../../utils/constant.dart';
import '../data_sources/user_repo_local_data_source.dart';
import '../models/user.dart';

@Injectable(as: UserRepoLocalDataSource)
class UserRepoLocalDataSourceImpl extends UserRepoLocalDataSource {
  final SharedPreferences pref;

  UserRepoLocalDataSourceImpl(this.pref);

  @override
  Future<bool> persistUserInfo(User user) async {
    return pref.setString(
      Preference.userInfo,
      jsonEncode(user.toJson()),
    );
  }

  @override
  User? getUserInfo() {
    logger.i("userinfo in pref ===== ${pref.get(Preference.userInfo)}");
    return pref.containsKey(Preference.userInfo)
        ? User.fromJson(jsonDecode(pref.get(Preference.userInfo) as String))
        : null;
  }

  @override
  Future<bool> deleteUserInfo() async {
    return pref.clear();
  }
}
