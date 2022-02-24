// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/login.dart';
import 'package:mpost/login_register/register.dart';
import 'package:mpost/widgets.dart';

class LoginAndRegister extends StatefulWidget {
  const LoginAndRegister({Key? key}) : super(key: key);

  @override
  _LoginAndRegisterState createState() => _LoginAndRegisterState();
}

class _LoginAndRegisterState extends State<LoginAndRegister> {
  List<Slide> _slides = [];
  @override
  initState() {
    _slides.add(
      Slide(
          widgetTitle: const Image(
            image: AssetImage("asset/images/slider_01.png"),
          ),
          marginTitle: const EdgeInsets.all(25),
          centerWidget: const Text(
            "Welcome to MPost!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700),
          ),
          marginDescription: const EdgeInsets.all(0),
          widgetDescription: Text(
            "From essential services to earning apportunities.\nWe are all in one platform",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Constants.descriptionColor),
          ),
          backgroundColor: Colors.transparent),
    );
    _slides.add(
      Slide(
          widgetTitle: const Image(
            image: AssetImage("asset/images/slider_01.png"),
          ),
          marginTitle: const EdgeInsets.all(25),
          centerWidget: const Text(
            "Welcome to MPost!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700),
          ),
          marginDescription: const EdgeInsets.all(0),
          widgetDescription: Text(
            "From essential services to earning apportunities.\nWe are all in one platform",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Constants.descriptionColor),
          ),
          backgroundColor: Colors.transparent),
    );
    _slides.add(
      Slide(
          widgetTitle: const Image(
            image: AssetImage("asset/images/slider_01.png"),
          ),
          marginTitle: const EdgeInsets.all(25),
          centerWidget: const Text(
            "Welcome to MPost!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700),
          ),
          marginDescription: const EdgeInsets.all(0),
          widgetDescription: Text(
            "From essential services to earning apportunities.\nWe are all in one platform",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Constants.descriptionColor),
          ),
          backgroundColor: Colors.transparent),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image:
                          AssetImage("asset/images/mpost_logo_transparent.png"),
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xfff17be8b)),
                      child: const Text(
                        "EN",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              Container(
                height: Constants.getHeight(context) * 0.57,
                child: IntroSlider(
                    backgroundColorAllSlides: Colors.transparent,
                    showDoneBtn: false,
                    showNextBtn: false,
                    showPrevBtn: false,
                    showSkipBtn: false,
                    slides: _slides,
                    colorDot: const Color(0XFFFd1e5f3),
                    colorActiveDot: const Color(0XFFF1482be),
                    sizeDot: 10),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    children: [
                      InputButton(
                          label: "Login",
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        child: Container(
                          width: Constants.getWidth(context),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: const Color(0XFFF1482be)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "I'm new, sign me up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0XFFF1482be),
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text:
                                  "By logging in or registring, you agre to our ",
                              style: TextStyle(
                                  height: 1.5,
                                  fontFamily: "Montserrat",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Constants.descriptionColor),
                              children: [
                            TextSpan(
                              text: "Terms of Service",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pop(context),
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Constants.primaryColor),
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pop(context),
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Constants.primaryColor),
                            ),
                          ])),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
