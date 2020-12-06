import 'dart:convert';

import 'package:flutter_start_repo/models/User.dart';
import 'package:flutter_start_repo/utils/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class Storage {
  final SharedPreferences pref;

  Storage(this.pref);

  Future<void> setUserInfo(User user) async {
    return await pref.setString(
        Preference.USER_INFO, jsonEncode(user.toJson()));
  }

  User getUserInfo() {
    print("userinfo in pref ===== ${pref.get(Preference.USER_INFO)}");
    return pref.containsKey(Preference.USER_INFO)
        ? User.fromJson(jsonDecode(pref.get(Preference.USER_INFO)))
        : null;
  }

  Future<bool> clearAll()async
  {
    return await pref.clear();
  }
}
