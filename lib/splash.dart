// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/log_and_reg.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/services/database.dart';
import 'package:mpost/services/user_service.dart';

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
  }

  _checkUser() async {
    if (await DatabaseHandler.instance.getUser(true) == 1) {
      UserService _userService = UserService();
      await _userService.getUser(true);
      isLoggedIn = true;
      _navigateToHome();
    } else {
      isLoggedIn = false;
      _navigateToHome();
    }
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => isLoggedIn
                ? BottomNav(
                    loadDeliveries: true,
                  )
                : const LoginAndRegister()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.primaryColor,
        child: const Center(
          child: Image(
            color: Colors.white,
            width: 78,
            height: 67,
            image: AssetImage("asset/images/mpost_blue_icon.png"),
          ),
        ),
      ),
    );
  }
}
