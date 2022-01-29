// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/log_and_reg.dart';
import 'login_register/register.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LoginAndRegister()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.primaryColor,
        child: const Center(
          child: Image(
            width: 250,
            height: 250,
            image: AssetImage("asset/images/mpost_logo.png"),
          ),
        ),
      ),
    );
  }
}
