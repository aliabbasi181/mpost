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
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "You are almost there!",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "You only have to enter OTP code we sent via SMS to your registered phone number",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
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
                  height: Constants.getWidth(context) * 0.05,
                ),
                InputLabel(label: "OTP", isReq: true),
                InputField(
                  hint: "Enter OTP code",
                  controller: otp,
                ),
                SizedBox(
                  height: Constants.getWidth(context) * 0.02,
                ),
                InputButton(
                    label: !applicationBloc.loading
                        ? "CONTINUE"
                        : "Please wait...",
                    onPress: () async {
                      Constants.registerMobile = widget.phone;
                      print(Constants.registerMobile);
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
                                builder: (context) => const Register()));
                      }
                    }),
                SizedBox(
                  height: Constants.getWidth(context) * 0.02,
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
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0XFFF1482be),
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () async {
                                if (await applicationBloc.login(
                                    widget.phone, context)) {
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
                          SizedBox(height: 15),
                          Container(
                            width: Constants.getWidth(context),
                            padding: const EdgeInsets.fromLTRB(22, 17, 22, 17),
                            decoration: BoxDecoration(
                                color: Color(0XFFFDF7DE),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.warning_rounded,
                                      color: Color(0XFFEB8501),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Failed to receive an OTP",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "This may be due blocking of promotional messages on your device.",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => messageDialog(
                                          context,
                                          "If you're not receiving OTP, follow the steps below to activate promotional messages.",
                                          "\nDial *100#\n5. My Subscriptions\n2. Promotional Messages\n5. Activate Promo Messages\n1. Yes\n\nThen request OTP again. If it still fails after this, please contact us on 0208000631.",
                                          "OK"),
                                    );
                                  },
                                  child: Text(
                                    "See how you can enable them ",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Constants.primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
          ],
        ));
  }
}
