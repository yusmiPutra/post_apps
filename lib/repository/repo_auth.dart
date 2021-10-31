import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/res/res_login.dart';

class RepoAuth {
  Dio dio = Dio();
  Future<ResLogin?> login(String? email, String? password) async {
    try {
      Response res = await dio
          .post(loginUser, data: {'email': email, 'password': password});
      return ResLogin.fromJson(res.data);
    } catch (e) {
      log('${e.toString()}');
    }
    return null;
  }
}
