import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/insurance/claim/claim_now.dart';
import 'package:mpost/mpost/msure/insurance/claim/claim_query.dart';
import 'package:mpost/mpost/msure/insurance/claim/global_claim.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MPOSTInsuranceClaimHome extends StatefulWidget {
  const MPOSTInsuranceClaimHome({Key? key}) : super(key: key);

  @override
  State<MPOSTInsuranceClaimHome> createState() =>
      _MPOSTInsuranceClaimHomeState();
}

class _MPOSTInsuranceClaimHomeState extends State<MPOSTInsuranceClaimHome> {
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
                  "Claim",
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
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MSUREClaimMessage(),
            const SizedBox(height: 20),
            MSUREInsuranceClaimCard(
                onTap: () async {
                  try {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MPOSTInsuranceClaimNow()));
                    setState(() {});
                  } catch (ex) {}
                },
                title: "Claim Now"),
            const SizedBox(
              height: 10,
            ),
            MSUREInsuranceClaimCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MPOSTInsuranceClaimQuery(
                                claimMessageWidget: MSUREClaimMessage(),
                              )));
                },
                title: "Claim Query"),
          ],
        ),
      ))
    ]));
  }
}

class MSUREInsuranceClaimCard extends StatelessWidget {
  VoidCallback onTap;
  String title;
  MSUREInsuranceClaimCard({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.07)),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
              )
            ]),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: TextStyle(
                  height: 1.5,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: const Color(0xffC1C1C1),
            )
          ],
        ),
      ),
    );
  }
}

class MSUREClaimMessage extends StatelessWidget {
  const MSUREClaimMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Visibility(
            visible: !GlobalClaim.claimSubmitted,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: Constants.msureRed.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: const Color(0xffD8364D),
                        size: 30,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "No claims",
                        style: TextStyle(
                            color: const Color(0xffD8364D),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "You currently do not have any claims logged in your policy",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: GlobalClaim.claimSubmitted,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: Constants.msureRed.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.doc_checkmark,
                        color: const Color(0xffD8AB36),
                        size: 30,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Submitted claims",
                        style: TextStyle(
                            color: const Color(0xffD8AB36),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "You currently have one submitted claim in your policy awaiting approval.",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.07),
                    height: 30,
                  ),
                  RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: "Have any questions? ",
                          style: TextStyle(
                              height: 1.5,
                              color: Color(0xff808689),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          children: [
                            TextSpan(
                              text: "Call us now.",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoActionSheet(
                                          title: const Text(
                                              "Do you want to call +254 711 305097?"),
                                          cancelButton:
                                              CupertinoActionSheetAction(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              bool? res =
                                                  await FlutterPhoneDirectCaller
                                                      .callNumber(
                                                          "03404037045");
                                            },
                                            child: Text(
                                              "Call: +254 711 305097",
                                              style: TextStyle(
                                                  color: Constants.primaryColor,
                                                  fontFamily: "Montserrat",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        );
                                      });
                                },
                              style: TextStyle(
                                  height: 1.5,
                                  color: Constants.primaryColor,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
