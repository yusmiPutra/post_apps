import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pos_apps/data_global.dart';
import 'package:pos_apps/page/main_menu.dart';
import 'package:pos_apps/prefs.dart';
import 'package:pos_apps/repository/repo_auth.dart';
import 'package:pos_apps/res/res_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  RepoAuth repoAuth = RepoAuth();
  ResLogin? resLogin;

  Future<void> loginUser(
      BuildContext context, String? email, String? password) async {
    try {
      emit(LoginLoading());
      ResLogin? res = await repoAuth.login(email, password);
      if (res != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => MainMenu()), (route) => false);
        dataGlobal.user = res.data;
        await Prefs().saveUser();
        emit(LoginSuccess(res));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email atau Password anda salah')));
        emit(LoginFailed(res?.message));
      }
    } catch (e, st) {
      log(st.toString());
    }
  }
}
