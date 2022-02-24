// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/log_and_reg.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/services/database.dart';
import 'login_register/register.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkUser();
    _navigateToHome();
  }

  void _checkUser() async {
    if (await DatabaseHandler.instance.getUser() == 1) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? const BottomNav() : const LoginAndRegister()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.primaryColor,
        child: const Center(
          child: Image(
            width: 111,
            height: 111,
            image: AssetImage("asset/images/mpost_logo.png"),
          ),
        ),
      ),
    );
  }
}
