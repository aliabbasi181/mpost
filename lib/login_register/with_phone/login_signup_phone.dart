import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/otp_verify.dart';
import 'package:mpost/login_register/otp_verify_login.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/privacy_policy.dart';
import 'package:mpost/mpost/terms_of_service.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class LoginSignupPhone extends StatefulWidget {
  const LoginSignupPhone({Key? key}) : super(key: key);

  @override
  State<LoginSignupPhone> createState() => _LoginSignupPhoneState();
}

class _LoginSignupPhoneState extends State<LoginSignupPhone> {
  bool loginSelected = true;
  bool otpSent = false;
  bool otpSentRegister = false;
  String countryCode = "254";
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();
  bool _hidePassword = true;

  late Timer _timer;
  late int _countDown;

  _runTimer() {
    const oneSec = Duration(seconds: 1);
    _countDown = 90;
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countDown == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _countDown--;
            print(_countDown);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Column(
                  children: [
                    Visibility(
                      visible: !otpSent,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CountryCodePicker(
                                  initialSelection: "Kenya",
                                  showDropDownButton: true,
                                  showCountryOnly: true,
                                  textStyle: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  showOnlyCountryWhenClosed: true,
                                  favorite: const ['+254', 'KE'],
                                  flagWidth: 30,
                                  onChanged: (code) {
                                    setState(() {
                                      countryCode = code.toString();
                                    });
                                  },
                                ),
                                InputPhoneNumber(
                                  hint: "Mobile Number",
                                  countryCode: countryCode,
                                  controller: phone,
                                ),
                                applicationBloc.loginOTPSent != true
                                    ? const Text(
                                        "Error sending OTP.\nCheck your phone number, country code and make sure you are connected to internet.",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Text(""),
                                InputButton(
                                    label: !applicationBloc.loading
                                        ? "GET OTP"
                                        : "Please wait...",
                                    onPress: () async {
                                      if (phone.text.isEmpty) {
                                        showSnackBar(
                                            "Validation Error",
                                            "Phone number is required.",
                                            context);
                                        return;
                                      }
                                      await applicationBloc
                                          .checkConnection(context);
                                      if (await applicationBloc.login(
                                          countryCode + phone.text, context)) {
                                        setState(() {
                                          otpSent = true;
                                        });
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => OTPVerifyLogin(
                                        //             phone:
                                        //                 "$countryCode${phone.text}")));
                                      }
                                      setState(() {});
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "By ‘Get OTP’, you agree to our ",
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
                        ],
                      ),
                    ),
                    Visibility(
                        visible: otpSent,
                        child: OTPVerifyLogin(phone: phone.text)),
                  ],
                ),
              ),
              Visibility(
                visible: !loginSelected,
                child: Column(
                  children: [
                    Visibility(
                      visible: !otpSentRegister,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CountryCodePicker(
                                  initialSelection: "Kenya",
                                  showDropDownButton: true,
                                  showCountryOnly: true,
                                  textStyle: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  showOnlyCountryWhenClosed: true,
                                  favorite: const ['+254', 'KE'],
                                  flagWidth: 30,
                                  onChanged: (code) {
                                    setState(() {
                                      countryCode = code.toString();
                                    });
                                  },
                                ),
                                InputPhoneNumber(
                                  hint: "Mobile Number",
                                  countryCode: countryCode,
                                  controller: phone,
                                ),
                                applicationBloc.loginOTPSent != true
                                    ? const Text(
                                        "Error sending OTP.\nCheck your phone number, country code and make sure you are connected to internet.",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Text(""),
                                InputButton(
                                    label: !applicationBloc.loading
                                        ? "GET OTP"
                                        : "Please wait...",
                                    onPress: () async {
                                      if (phone.text.isEmpty) {
                                        showSnackBar(
                                            "Validation Error",
                                            "Phone number is required.",
                                            context);
                                        return;
                                      }
                                      await applicationBloc
                                          .checkConnection(context);
                                      if (await applicationBloc.requestOTP(
                                          countryCode + phone.text)) {
                                        setState(() {
                                          otpSentRegister = true;
                                        });
                                      }
                                      setState(() {});
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "By ‘Get OTP’, you agree to our ",
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
                        ],
                      ),
                    ),
                    Visibility(
                        visible: otpSentRegister,
                        child: OTPVerify(phone: "254" + phone.text)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pg1 extends StatefulWidget {
  const Pg1({Key? key}) : super(key: key);

  @override
  State<Pg1> createState() => _Pg1State();
}

class _Pg1State extends State<Pg1> {
  @override
  void initState() {
    print("page 1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Page 1"),
      ),
    );
  }
}
