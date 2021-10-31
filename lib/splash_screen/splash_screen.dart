import 'package:flutter/material.dart';
import 'package:pos_apps/data_global.dart';
import 'package:pos_apps/page/auth/login_page.dart';
import 'package:pos_apps/page/main_menu.dart';
import 'package:pos_apps/prefs.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  cekSession() async {
    Future.delayed(Duration(seconds: 5), () async {
      dataGlobal.user = await Prefs().loadUser();
      if (dataGlobal.user != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => MainMenu()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
      }
    });
  }

  @override
  void initState() {
    cekSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/udc.jpeg')],
        ),
      ),
    );
  }
}
