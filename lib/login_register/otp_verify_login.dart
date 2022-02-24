import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class OTPVerifyLogin extends StatefulWidget {
  String phone;
  OTPVerifyLogin({Key? key, required this.phone}) : super(key: key);

  @override
  _OTPVerifyLoginState createState() => _OTPVerifyLoginState();
}

class _OTPVerifyLoginState extends State<OTPVerifyLogin> {
  String countryCode = "254";
  TextEditingController otp = TextEditingController();
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
          });
        }
      },
    );
  }

  @override
  initState() {
    super.initState();
    _runTimer();
  }

  dispose() {
    super.dispose();
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 25,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Verify OTP",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "OTP sent to ${widget.phone}, ",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constants.descriptionColor),
                            children: [
                          TextSpan(
                            text: "Change?",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context),
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Constants.primaryColor),
                          )
                        ])),
                    SizedBox(
                      height: Constants.getWidth(context) * 0.1,
                    ),
                    InputField(
                      hint: "Enter OTP code",
                      controller: otp,
                    ),
                    SizedBox(
                      height: Constants.getWidth(context) * 0.05,
                    ),
                    _countDown > 0
                        ? Text(
                            "Resend code in $_countDown seconds",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Constants.descriptionColor),
                          )
                        : Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0XFFF1482be),
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () async {
                                if (await applicationBloc.login(widget.phone)) {
                                  print("data");
                                  setState(() {
                                    _runTimer();
                                  });
                                }
                              },
                              child: Text(
                                !applicationBloc.loading
                                    ? "Resend OTP"
                                    : "Please wait...",
                                style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                    applicationBloc.otpVerified != true
                        ? const Text(
                            "Invalid Code.\nMake sure your number or re-check the OTP you received.",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        : const Text("")
                  ],
                ),
                const Spacer(),
                InputButton(
                    label:
                        !applicationBloc.loading ? "SUBMIT" : "Please wait...",
                    onPress: () async {
                      if (otp.text.isEmpty) {
                        showSnackBar(
                            "Validation Error", "OTP can not empty", context);
                        return;
                      }
                      await applicationBloc.checkConnection(context);
                      if (await applicationBloc.verifyLoginOTP(
                          otp.text, widget.phone)) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BottomNav(),
                          ),
                          (route) => false,
                        );
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const BottomNav()));
                      }
                    })
              ],
            )),
      ),
    );
  }
}
