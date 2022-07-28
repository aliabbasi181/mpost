import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/utilities.dart';
import 'package:provider/provider.dart';

class MSURELogin extends StatefulWidget {
  const MSURELogin({Key? key}) : super(key: key);

  @override
  State<MSURELogin> createState() => _MSURELoginState();
}

class _MSURELoginState extends State<MSURELogin> {
  FocusNode nameFocusNode = new FocusNode();
  FocusNode surNameFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode confirmPasswordFocusNode = new FocusNode();
  FocusNode idNumberFocusNode = new FocusNode();
  FocusNode ntsaNumberFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode locationFocusNode = new FocusNode();
  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController ntsNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? image;
  bool passwordHide = true, confirmPasswordHide = true;
  String dateOfBirth = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        color: Constants.msureRed,
        child: SafeArea(bottom: false, child: Container()),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                RichText(
                    text: TextSpan(
                        text: "Please add below your personal details. ",
                        style: TextStyle(
                            height: 1.5,
                            color: Color(0xff808689),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        children: [
                      TextSpan(
                        text: "Use my MPOST email",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            switch (await showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                      title: const Text("ALERT!"),
                                      content: const Text(
                                          "Are you sure you want to use MPOST personal email?"),
                                      actions: [
                                        CupertinoDialogAction(
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop("No");
                                            }),
                                        CupertinoDialogAction(
                                            child: const Text(
                                              "YES",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontFamily: "Montserrat",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop("yes");
                                            }),
                                      ],
                                    ))) {
                              case "yes":
                                setState(() {
                                  FocusScope.of(context)
                                      .requestFocus(nameFocusNode);
                                  name.text =
                                      Constants.user.fullName.toString();
                                  FocusScope.of(context)
                                      .requestFocus(phoneFocusNode);
                                  phoneNumber.text =
                                      Constants.user.mobile.toString();
                                  FocusScope.of(context)
                                      .requestFocus(emailFocusNode);
                                  email.text = Constants.user.email.toString();
                                });
                                break;
                            }
                          },
                        style: TextStyle(
                            height: 1.5,
                            color: Constants.primaryColor,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                MSUREInputField(
                    labelText: "Email",
                    controller: email,
                    focusNode: emailFocusNode),
                Container(
                  margin: const EdgeInsets.only(bottom: 17),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      });
                    },
                    controller: password,
                    focusNode: passwordFocusNode,
                    autocorrect: false,
                    obscureText: passwordHide,
                    obscuringCharacter: '●',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: const Color(0xffCBCBCB), width: 1.5)),
                      labelText: "Password",
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passwordHide = !passwordHide;
                          });
                        },
                        child: Text(
                          passwordHide ? "Show" : "Hide",
                          style: TextStyle(
                              color: passwordHide
                                  ? Constants.primaryColor
                                  : Constants.msureRed,
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Constants.msureRed, width: 1.5)),
                      labelStyle: TextStyle(
                          color: passwordFocusNode.hasFocus
                              ? Constants.msureRed
                              : const Color(0xffCBCBCB),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SafeArea(
          bottom: Platform.isAndroid,
          top: false,
          child: InkWell(
            onTap: () async {
              // email.text = "Eliasbaya1223@gmail.com";
              // password.text = "Eliasbaya@1223";
              if (email.text.isEmpty) {
                showSnackBar("Validation!", "Email can not be empty.", context);
                return;
              }

              if (password.text.isEmpty) {
                showSnackBar(
                    "Validation!", "Password can not be empty.", context);
                return;
              }
              final msureApplicationBloc =
                  Provider.of<MSUREApplicationBloc>(context, listen: false);
              if (await msureApplicationBloc.msureLogin(
                  email.text, password.text)) {
                Navigator.pushReplacementNamed(context, '/msure_home');
              }
            },
            child: Container(
              width: Constants.getWidth(context),
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff1582BE),
                    const Color(0xff00C0C4),
                  ]),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
