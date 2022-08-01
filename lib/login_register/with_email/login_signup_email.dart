import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/blocs/social_auth_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/with_email/register_email.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/privacy_policy.dart';
import 'package:mpost/mpost/terms_of_service.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class LoginSignupEmail extends StatefulWidget {
  const LoginSignupEmail({Key? key}) : super(key: key);

  @override
  State<LoginSignupEmail> createState() => _LoginSignupEmailState();
}

class _LoginSignupEmailState extends State<LoginSignupEmail> {
  bool loginSelected = true;
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _hidePassword = true;
  GoogleSignInAccount? googleAccount;

  _signInWithGoogle() async {
    try {
      googleAccount = await Provider.of<SocailAuthBloc>(context, listen: false)
          .googleLogin();
      if (googleAccount != null) {
        if (!loginSelected) {
          email.text = googleAccount!.email;
        }
      }
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffcbccc7),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        loginSelected = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: loginSelected
                                ? BorderSide(
                                    width: 2, color: Constants.primaryColor)
                                : BorderSide(width: 2, color: Colors.white)),
                      ),
                      child: Center(
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                              color: loginSelected
                                  ? Constants.primaryColor
                                  : Constants.descriptionColor,
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        loginSelected = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: !loginSelected
                                ? BorderSide(
                                    width: 2, color: Constants.primaryColor)
                                : BorderSide(width: 2, color: Colors.white)),
                      ),
                      child: Center(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: !loginSelected
                                  ? Constants.primaryColor
                                  : Constants.descriptionColor,
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: loginSelected,
              child: Container(
                height: 500,
                child: ListView(children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            // await _signInWithGoogle();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => messageDialog(
                                  context,
                                  "Coming soon!",
                                  "Stay tuned to this. We are launching soon",
                                  "OK"),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                Image.network(
                                  "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Center(
                                  child: Text("Continue with Google",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => messageDialog(
                                  context,
                                  "Coming soon!",
                                  "Stay tuned to this. We are launching soon",
                                  "OK"),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.fromLTRB(25, 14, 30, 14),
                            decoration: BoxDecoration(
                                color: Color(0xff3b5a99),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Image.network(
                                    "https://icons-for-free.com/iconfiles/png/512/facebook+logo+logo+website+icon-1320190502625926346.png",
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text("Continue with facebook",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Or login with username",
                          style: TextStyle(
                              color: Constants.descriptionColor,
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                            hint: "Username (phone number)",
                            controller: username),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0XFFFd9d9d9), width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: password,
                            cursorColor: Constants.primaryColor,
                            scrollPadding: const EdgeInsets.all(0),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                            autocorrect: false,
                            obscuringCharacter: '●',
                            obscureText: _hidePassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    color: Color(0XFFFbdbfc1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat")),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputButton(
                            label: applicationBloc.loading
                                ? "Please wait..."
                                : "Login",
                            onPress: () async {
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) => messageDialog(
                              //       context,
                              //       "Coming soon!",
                              //       "Stay tuned to this. We are launching soon",
                              //       "OK"),
                              // );

                              if (username.text.isEmpty) {
                                showSnackBar("Validation Message",
                                    "Username can't be empty", context);
                                return;
                              } else if (password.text.isEmpty) {
                                showSnackBar("Validation Message",
                                    "Please enter password", context);
                                return;
                              }
                              username.text =
                                  int.parse(username.text).toString();
                              if (username.text.length == 9) {
                                username.text = "254" + username.text;
                              }
                              if (await applicationBloc
                                  .loginWithUsernamePassword(
                                      username.text, password.text, context)) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BottomNav(
                                      loadDeliveries: true,
                                    ),
                                  ),
                                  (route) => false,
                                );
                              }
                            }),
                        const SizedBox(
                          height: 20,
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
                    ),
                  ),
                ]),
              ),
            ),
            Visibility(
              visible: !loginSelected,
              child: Container(
                height: 500,
                child: ListView(children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => messageDialog(
                                  context,
                                  "Coming soon!",
                                  "Stay tuned to this. We are launching soon",
                                  "OK"),
                            );
                            //await _signInWithGoogle();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                Image.network(
                                  "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Center(
                                  child: Text("Continue with Google",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => messageDialog(
                                  context,
                                  "Coming soon!",
                                  "Stay tuned to this. We are launching soon",
                                  "OK"),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.fromLTRB(25, 14, 30, 14),
                            decoration: BoxDecoration(
                                color: Color(0xff3b5a99),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Image.network(
                                    "https://icons-for-free.com/iconfiles/png/512/facebook+logo+logo+website+icon-1320190502625926346.png",
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text("Continue with facebook",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Or signup with email",
                          style: TextStyle(
                              color: Constants.descriptionColor,
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputEmailField(hint: "Email", controller: email),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0XFFFd9d9d9), width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: password,
                            cursorColor: Constants.primaryColor,
                            scrollPadding: const EdgeInsets.all(0),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                            autocorrect: false,
                            obscuringCharacter: '●',
                            obscureText: _hidePassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    color: Color(0XFFFbdbfc1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat")),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputButton(
                            label: "Continue",
                            onPress: () {
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) => messageDialog(
                              //       context,
                              //       "Coming soon!",
                              //       "Stay tuned to this. We are launching soon",
                              //       "OK"),
                              // );
                              Constants.registerEmail = email.text;
                              Constants.registerPassword = password.text;
                              print(Constants.registerPassword);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterWithEmail(
                                            googleAccount: googleAccount,
                                          )));
                            }),
                        const SizedBox(
                          height: 20,
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
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
