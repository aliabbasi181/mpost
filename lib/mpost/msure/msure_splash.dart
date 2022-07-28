import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/msure/authentication/msure_login.dart';
import 'package:mpost/mpost/msure/authentication/msure_signup.dart';
import 'package:mpost/mpost/msure/authentication/msure_signup_region_details.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:provider/provider.dart';

class MsureSplashScreen extends StatefulWidget {
  const MsureSplashScreen({Key? key}) : super(key: key);

  @override
  State<MsureSplashScreen> createState() => _MsureSplashScreenState();
}

class _MsureSplashScreenState extends State<MsureSplashScreen> {
  bool isLoggedIn = true;
  bool isLoading = true;

  @override
  void initState() {
    _checkAccount();
    super.initState();
  }

  _checkAccount() async {
    isLoading = true;
    setState(() {});
    var token =
        SPLocalStorage.preferences!.getString(SPLocalStorage.keyMsureToken);
    if (token.toString() == "null") {
      setState(() {
        isLoggedIn = false;
        isLoading = false;
      });
    } else {
      MsureConstants.token = "$token";
      MsureConstants.setToken("$token");
      final msureApplicationBloc =
          Provider.of<MSUREApplicationBloc>(context, listen: false);
      if (await msureApplicationBloc.getUserStatus() != -1) {
        await msureApplicationBloc.getUser();
        setState(() {
          isLoading = false;
          isLoggedIn = true;
        });
        Navigator.pushNamed(context, '/msure_home');
      } else {
        EasyLoading.showError("You are Unauthorised.");
        await SPLocalStorage.removeMsureToken();
        setState(() {
          isLoggedIn = false;
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constants.getHeight(context),
        width: Constants.getWidth(context),
        decoration: BoxDecoration(color: Constants.msureRed),
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "asset/images/msure_icon.png",
            ),
            RichText(
                text: TextSpan(
                    text: "Insurance ",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                    ),
                    children: [
                  TextSpan(
                      text: "Chap-Chap, for your ",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                      )),
                  TextSpan(
                      text: "Boda",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                      ))
                ])),
            Visibility(
              visible: isLoading,
              child: Container(
                alignment: Alignment.center,
                width: Constants.getWidth(context),
                padding: const EdgeInsets.symmetric(vertical: 19),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Platform.isAndroid
                          ? Container(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : CupertinoActivityIndicator(
                              color: Colors.white,
                              radius: 15,
                            ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Please wait...",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !isLoggedIn,
              child: InkWell(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("MSURE",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat",
                              )),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 30, 10, 30),
                          content: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MSURELogin()));
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Icon(
                                            Icons.login_rounded,
                                            size: 40,
                                          ),
                                        ),
                                        Text("Sign In",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MSURESignupRegionDetail()));
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Icon(
                                            CupertinoIcons.person_add,
                                            size: 40,
                                          ),
                                        ),
                                        Text("Sign Up",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Constants.getWidth(context),
                  padding: const EdgeInsets.symmetric(vertical: 19),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
