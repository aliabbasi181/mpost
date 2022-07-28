import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureProductModel.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:mpost/mpost/msure/msure_payments/payment_processing.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:mpost/mpost/payment_status.dart';
import 'package:provider/provider.dart';

class MSUREPaymentSelect extends StatefulWidget {
  const MSUREPaymentSelect({Key? key}) : super(key: key);

  @override
  State<MSUREPaymentSelect> createState() => _MSUREPaymentSelectState();
}

class _MSUREPaymentSelectState extends State<MSUREPaymentSelect> {
  FocusNode paymentFocusNode = new FocusNode();
  TextEditingController paymentController = TextEditingController();
  TextEditingController mpesaNumberController = TextEditingController();
  List<bool> amountKeys = [true, true, true, true, true, true];
  List<MsureProductModel> products = [];
  int recomended = 0;
  _amountSelector(var index, var amount) {
    setState(() {
      for (var i = 0; i < 6; i++) {
        if (i == index)
          amountKeys[i] = false;
        else
          amountKeys[i] = true;
      }
      paymentController.text = amount.toString();
      //FocusScope.of(context).requestFocus(paymentFocusNode);
    });
  }

  @override
  void initState() {
    mpesaNumberController.text = Constants.user.mobile.toString();
    _getProduct();
    _getContributionAmount();
    super.initState();
  }

  _getProduct() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    products = await msureApplicationBloc.getProducts();
  }

  _getContributionAmount() async {
    MsureUserModel user = await SPLocalStorage.getMsureUserDetail();
    recomended = int.parse(user.stage!.dailyContribution.toString());
    amountKeys[1] = false;
    paymentController.text = recomended.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 17, top: 5),
        color: Constants.msureRed,
        child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  "Payments",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ],
            )),
      ),
      Expanded(
          child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payments",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                  RichText(
                      text: TextSpan(
                    text:
                        "Fill the following required information and kick start  your insurance payments.",
                    style: TextStyle(
                        height: 1.5,
                        color: const Color(0xff808689),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )),
                  const SizedBox(height: 30),
                  Text(
                    "Select amount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff808689),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _amountSelector(0, "25");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                                color: amountKeys[0]
                                    ? Colors.black.withOpacity(0.03)
                                    : Constants.msureRed,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              "Ksh 25",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: amountKeys[0]
                                      ? const Color(0xff808689)
                                      : Colors.white,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _amountSelector(1, recomended);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                                color: amountKeys[1]
                                    ? Colors.black.withOpacity(0.03)
                                    : Constants.msureRed,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              "Ksh $recomended",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: amountKeys[1]
                                      ? const Color(0xff808689)
                                      : Colors.white,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _amountSelector(2, "100");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                                color: amountKeys[2]
                                    ? Colors.black.withOpacity(0.03)
                                    : Constants.msureRed,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              "Ksh 100",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: amountKeys[2]
                                      ? const Color(0xff808689)
                                      : Colors.white,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () {
                  //           _amountSelector(3, "500");
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(vertical: 11),
                  //           decoration: BoxDecoration(
                  //               color: amountKeys[3]
                  //                   ? Colors.black.withOpacity(0.03)
                  //                   : Constants.msureRed,
                  //               borderRadius: BorderRadius.circular(4)),
                  //           child: Text(
                  //             "Ksh 500",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //                 color: amountKeys[3]
                  //                     ? const Color(0xff808689)
                  //                     : Colors.white,
                  //                 fontFamily: "Montserrat",
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 15),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 15,
                  //     ),
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () {
                  //           _amountSelector(4, "1000");
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(vertical: 11),
                  //           decoration: BoxDecoration(
                  //               color: amountKeys[4]
                  //                   ? Colors.black.withOpacity(0.03)
                  //                   : Constants.msureRed,
                  //               borderRadius: BorderRadius.circular(4)),
                  //           child: Text(
                  //             "Ksh 1000",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //                 color: amountKeys[4]
                  //                     ? const Color(0xff808689)
                  //                     : Colors.white,
                  //                 fontFamily: "Montserrat",
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 15),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 15,
                  //     ),
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () {
                  //           _amountSelector(5, "5000");
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(vertical: 11),
                  //           decoration: BoxDecoration(
                  //               color: amountKeys[5]
                  //                   ? Colors.black.withOpacity(0.03)
                  //                   : Constants.msureRed,
                  //               borderRadius: BorderRadius.circular(4)),
                  //           child: Text(
                  //             "Ksh 5000",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //                 color: amountKeys[5]
                  //                     ? const Color(0xff808689)
                  //                     : Colors.white,
                  //                 fontFamily: "Montserrat",
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 15),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 30),
                  MSUREInputField(
                      labelText: "Enter amount ( Ksh 50 - Ksh 15,000)",
                      controller: paymentController,
                      focusNode: paymentFocusNode),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Constants.msureRed, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: mpesaNumberController,
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "",
                              hintStyle: TextStyle(
                                  color: const Color(0xffCBCBCB),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/M-PESA_LOGO-01.svg/1200px-M-PESA_LOGO-01.svg.png"),
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "*MPESA number which money will be deducted",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff302627),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ],
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
                  final msureApplicationBloc =
                      Provider.of<MSUREApplicationBloc>(context, listen: false);
                  if (await msureApplicationBloc.buyPolicy(
                      paymentController.text,
                      mpesaNumberController.text,
                      MsureConstants
                          .msureUserStatus.policies!.mshuaIndividual!.first.guid
                          .toString())) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MPOSTPaymentSuccessGeneral(
                                buttonText: "Continue to Home",
                                message:
                                    "Your payment request was sent Successfully.",
                                onTap: () {
                                  Navigator.popUntil(context,
                                      ModalRoute.withName('/msure_home'));
                                },
                                title: "Payment initiate successful")));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MPOSTPaymentFailedGeneral(
                                buttonText: "Try again",
                                message:
                                    "Oh no! Something went wrong. We aren’t able to process your payment. Please try again",
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                title: "Payment failed")));
                  }
                },
                child: Container(
                  width: Constants.getWidth(context),
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xff1582BE),
                        const Color(0xff00C0C4),
                      ]),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "Pay Now",
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
        ],
      ))
    ]));
  }
}
