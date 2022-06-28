import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:mpost/mpost/payment_status.dart';

class MPOSTInsuranceClaimQuery extends StatefulWidget {
  List<dynamic> claims;
  MPOSTInsuranceClaimQuery({Key? key, required this.claims}) : super(key: key);

  @override
  State<MPOSTInsuranceClaimQuery> createState() =>
      _MPOSTInsuranceClaimQueryState();
}

class _MPOSTInsuranceClaimQueryState extends State<MPOSTInsuranceClaimQuery> {
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  FocusNode subjectFocusNode = FocusNode();

  final ImagePicker _picker = ImagePicker();
  File? image;
  String pickedFileName = '';

  _pickImage(ImageSource imageSource) async {
    try {
      final image = await _picker.pickImage(source: imageSource);
      if (image == null) return;
      setState(() {
        this.image = File(image.path);
        pickedFileName = image.name;
      });
    } catch (ex) {}
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
                  "Claim query",
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
            Container(
              child: Column(
                children: [
                  Visibility(
                    visible: widget.claims.length == 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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
                    visible: widget.claims.length > 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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
                                                          color: Constants
                                                              .primaryColor,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
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
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Send us a message",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            MSUREInputField(
              labelText: "Subject",
              controller: subject,
              focusNode: subjectFocusNode,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 17),
              height: 172,
              child: TextField(
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(messageFocusNode);
                  });
                },
                controller: message,
                maxLines: 7,
                autocorrect: false,
                focusNode: messageFocusNode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Constants.msureRed, width: 1.5)),
                  //labelText: "",
                  hintText: "Message",
                  hintStyle: TextStyle(
                      color: Color(0xffCBCBCB),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      )),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SafeArea(
          bottom: Platform.isAndroid,
          top: false,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MPOSTPaymentSuccessGeneral(
                          buttonText: "Continue to claims",
                          message:
                              "Your claim message have been successfully sent.",
                          onTap: () {
                            Navigator.popUntil(context,
                                ModalRoute.withName('/msure_insurance_claim'));
                          },
                          title: "Success!")));
            },
            child: Container(
              width: Constants.getWidth(context),
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff1582BE),
                    const Color(0xff00C0C4),
                  ]),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "Submit",
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
      )
    ]));
  }
}
