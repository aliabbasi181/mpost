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

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late bool isLoggedIn;
  AnimationController? _animationController;
  Animation<double>? _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    super.initState();
    _checkUser();
  }

  _checkUser() async {
    if (await DatabaseHandler.instance.getUser(true) == 1) {
      //await DatabaseHandler.instance.removeUser();
      UserService _userService = UserService();
      await _userService.getUser(true);
      isLoggedIn = true;
      _navigateToHome();
    } else {
      isLoggedIn = false;
      _navigateToHome();
    }
    _animationController!.forward();
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
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(12),
        width: Constants.getWidth(context),
        height: Constants.getHeight(context),
        color: Constants.primaryColor,
        child: Stack(
          children: [
            Center(
              child: RotationTransition(
                turns: _animation!,
                child: Image(
                  color: Colors.white,
                  width: 78,
                  height: 67,
                  image: AssetImage("asset/images/mpost_blue_icon.png"),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SafeArea(
                  child: const Text(
                "Version: 1.0.2",
                style: TextStyle(color: Colors.white, fontFamily: "Montserrat"),
              )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
