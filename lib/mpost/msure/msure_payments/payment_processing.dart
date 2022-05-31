import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class MSUREPaymentSuccess extends StatefulWidget {
  const MSUREPaymentSuccess({Key? key}) : super(key: key);

  @override
  _MSUREPaymentSuccessState createState() => _MSUREPaymentSuccessState();
}

class _MSUREPaymentSuccessState extends State<MSUREPaymentSuccess> {
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xff15BE8B),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.check,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Payment Successful',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Your payment was successful! You can now continue using MPOST',
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
                  Navigator.popUntil(
                      context, ModalRoute.withName('/msure_home'));
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

class MSUREPaymentFailed extends StatefulWidget {
  const MSUREPaymentFailed({Key? key}) : super(key: key);

  @override
  _MSUREPaymentFailedState createState() => _MSUREPaymentFailedState();
}

class _MSUREPaymentFailedState extends State<MSUREPaymentFailed> {
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xffBE1515),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.cancel_outlined,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Payment failed',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: const Color(0xffBE1515),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Your payment was successful! You can now continue using MPOST',
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
                  Navigator.pop(context);
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
                        color: const Color(0xffBE1515),
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
