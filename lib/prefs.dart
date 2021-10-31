import 'dart:convert';

import 'package:pos_apps/data_global.dart';
import 'package:pos_apps/res/res_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("save_user", jsonEncode(dataGlobal.user?.toJson()));
  }

  Future<Data?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return Data.fromJson(jsonDecode(prefs.getString("save_user") ?? ""));
    } catch (e) {
      return null;
    }
  }

  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
