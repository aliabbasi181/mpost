import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/register.dart';
import 'package:mpost/widgets.dart';

class OTPVerify extends StatefulWidget {
  String phone;
  OTPVerify({Key? key, required this.phone}) : super(key: key);

  @override
  _OTPVerifyState createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  String countryCode = "254";
  TextEditingController otp = TextEditingController();
  late Timer _timer;
  late int _countDown;

  _runTimer() {
    const oneSec = Duration(seconds: 1);
    _countDown = 25;
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
                        size: 40,
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
                      "You'r almost there!",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "You only have to enteron OTP code we sent via SMS to your registered phone number",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Constants.descriptionColor),
                    ),
                    Text(
                      widget.phone,
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: Constants.getWidth(context) * 0.1,
                    ),
                    InputLabel(label: "OTP", isReq: true),
                    InputField(
                      hint: "Enter 6 digit code",
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
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Constants.descriptionColor),
                          )
                        : Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0XFFF1482be),
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () {
                                print("data");
                                setState(() {
                                  _runTimer();
                                });
                              },
                              child: const Text(
                                "Resend OTP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                  ],
                ),
                Spacer(),
                InputButton(
                    label: "CONTINUE",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HowYouWillUse()));
                    })
              ],
            )),
      ),
    );
  }
}
