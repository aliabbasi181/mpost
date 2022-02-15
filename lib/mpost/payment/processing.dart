import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/payment/choose_payment.dart';

class ProcessingPayment extends StatefulWidget {
  const ProcessingPayment({Key? key}) : super(key: key);

  @override
  _ProcessingPaymentState createState() => _ProcessingPaymentState();
}

class _ProcessingPaymentState extends State<ProcessingPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: Constants.getHeight(context),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Platform.isIOS
                        ? const CupertinoActivityIndicator(
                            radius: 20,
                          )
                        : const CircularProgressIndicator(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Processing payment',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentSuccess()));
                    },
                    child: const Text("Success")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentError()));
                    },
                    child: const Text("Attack")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(60),
        height: Constants.getHeight(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 100,
                color: Color(0xff15BE8B),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Payment successful',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'You payment was successful! You can now continue using MPOST',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNav()));
                },
                child: Container(
                  width: Constants.getWidth(context),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: const Color(0xff15BE8B)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Continue to home",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff15BE8B),
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentError extends StatefulWidget {
  const PaymentError({Key? key}) : super(key: key);

  @override
  _PaymentErrorState createState() => _PaymentErrorState();
}

class _PaymentErrorState extends State<PaymentError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(60),
        height: Constants.getHeight(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.cancel_rounded,
                size: 100,
                color: Color(0xffBE1515),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Payment failed',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: Color(0xffBE1515),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Oh no! Something went wrong. We aren’t able to process your payment. Please try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChoosePayment()));
                },
                child: Container(
                  width: Constants.getWidth(context),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: const Color(0xffBE1515)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Try again",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffBE1515),
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
