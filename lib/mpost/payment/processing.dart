import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/payment/choose_payment.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/notifications.dart';
import 'package:provider/provider.dart';

class ProcessingPayment extends StatefulWidget {
  const ProcessingPayment({Key? key}) : super(key: key);

  @override
  _ProcessingPaymentState createState() => _ProcessingPaymentState();
}

class _ProcessingPaymentState extends State<ProcessingPayment> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
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
                    Text(
                      applicationBloc.request_verify
                          ? "Verifying payment..."
                          : 'Processing payment',
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNav(
                                loadDeliveries: false,
                              )),
                      (route) => false);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const BottomNav()));
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

class PaymentPending extends StatefulWidget {
  String paymentId;
  PaymentPending({Key? key, required this.paymentId}) : super(key: key);

  @override
  _PaymentPendingState createState() => _PaymentPendingState();
}

class _PaymentPendingState extends State<PaymentPending> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
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
                    color: const Color(0xffe68b37),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.loop_rounded,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Payment pending...',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Your payment is on pending! Please pay if you have not paid yet or verify payment.',
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
                onTap: () async {
                  if (!applicationBloc.request_verify) {
                    if (await applicationBloc
                        .paymentVerification(widget.paymentId)) {
                      MpostNotification.notify(
                          "Payment has been initialized.",
                          "Dear user your payment has been successfully initialized and its on pending. Put your security PIN to complete delivery process.",
                          "basic_channel");
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PaymentSuccess(),
                        ),
                        (route) => false,
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => messageDialog(
                            context,
                            "Payment",
                            "Payment is still pending",
                            "OK"),
                      );
                    }
                  }
                },
                child: Container(
                  width: Constants.getWidth(context),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    applicationBloc.request_verify
                        ? "Verifying Payment..."
                        : "Verify payment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  if (!applicationBloc.request_verify) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNav(
                                  loadDeliveries: false,
                                )),
                        (route) => false);
                  }
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
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosePayment(
                                cost: applicationBloc.totalCost.toString(),
                                isDelivery: true,
                                id: applicationBloc.paymentRequestId.toString(),
                              )));
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
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNav(
                                loadDeliveries: false,
                              )),
                      (route) => false);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const BottomNav()));
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
