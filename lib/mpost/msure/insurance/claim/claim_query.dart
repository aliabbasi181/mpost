import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:mpost/mpost/payment_status.dart';

class MPOSTInsuranceClaimQuery extends StatefulWidget {
  Widget claimMessageWidget;
  MPOSTInsuranceClaimQuery({Key? key, required this.claimMessageWidget})
      : super(key: key);

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
            widget.claimMessageWidget,
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
