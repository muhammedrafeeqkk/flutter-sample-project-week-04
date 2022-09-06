import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class screensplash extends StatefulWidget {
  const screensplash({Key? key}) : super(key: key);

  @override
  State<screensplash> createState() => _screensplashState();
}

class _screensplashState extends State<screensplash> {
  @override
  void initState() {
    checkUserlogidin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/instaflash.jpg',
          height: 80,
          width: 150,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => screenlogin(),
      ),
    );
  }

  Future checkUserlogidin() async {
    final _sharepreference = await SharedPreferences.getInstance();
    final _userlogidin = _sharepreference.getBool(save_key);
    if (_userlogidin == null || _userlogidin == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => screenhome()),
      );
    }
  }
}
