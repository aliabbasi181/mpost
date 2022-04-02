// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/login.dart';
import 'package:mpost/login_register/register.dart';
import 'package:mpost/login_register/with_email/login_signup_email.dart';
import 'package:mpost/login_register/with_phone/login_signup_phone.dart';
import 'package:mpost/mpost/privacy_policy.dart';
import 'package:mpost/mpost/terms_of_service.dart';
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
            image: AssetImage("asset/images/slider_01.jpeg"),
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
            "From essential services to earning opportunities.\nWe are all in one platform",
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
            image: AssetImage("asset/images/slider_2.jpeg"),
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
            "From essential services to earning opportunities.\nWe are all in one platform",
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
                padding: const EdgeInsets.fromLTRB(20, 05, 20, 05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage("asset/images/mpost_blue_icon.png"),
                      height: 30,
                      width: 30,
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
                height: Constants.getHeight(context) * 0.47,
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
                          label: "Continue with phone number",
                          onPress: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return SafeArea(
                                    bottom: false,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: Constants.getHeight(context) *
                                              0.1),
                                      width: Constants.getWidth(context),
                                      height: Constants.getHeight(context),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: const LoginSignupPhone(),
                                    ),
                                  );
                                });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return SafeArea(
                                  bottom: false,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            Constants.getHeight(context) * 0.1),
                                    width: Constants.getWidth(context),
                                    height: Constants.getHeight(context),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: const LoginSignupEmail(),
                                  ),
                                );
                              });
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
                            "Continue with email",
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
                                  "By logging in or registering, you agree to our ",
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
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TermsOfService()));
                                },
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
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PrivacyPolicy()));
                                },
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
