import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/register.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

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
                              onTap: () async {
                                if (await applicationBloc.login(widget.phone)) {
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                    applicationBloc.newPhone != true
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
                    label: !applicationBloc.loading
                        ? "CONTINUE"
                        : "Please wait...",
                    onPress: () async {
                      if (otp.text.isEmpty) {
                        showSnackBar(
                            "Validation Error", "OTP can not empty", context);
                        return;
                      }
                      await applicationBloc.checkConnection(context);
                      if (await applicationBloc.verifyOTP(
                          otp.text, widget.phone)) {
                        Constants.registerMobile = widget.phone;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HowYouWillUse()));
                      }
                    })
              ],
            )),
      ),
    );
  }
}
