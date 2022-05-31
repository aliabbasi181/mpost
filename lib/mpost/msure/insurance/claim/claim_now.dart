import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/insurance/claim/global_claim.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:mpost/mpost/payment_status.dart';

class MPOSTInsuranceClaimNow extends StatefulWidget {
  const MPOSTInsuranceClaimNow({Key? key}) : super(key: key);

  @override
  State<MPOSTInsuranceClaimNow> createState() => _MPOSTInsuranceClaimNowState();
}

class _MPOSTInsuranceClaimNowState extends State<MPOSTInsuranceClaimNow> {
  TextEditingController dateInHospitalController = TextEditingController();
  TextEditingController selectReasonController =
      TextEditingController(text: "Select Reason");
  FocusNode dateInHospitalFocusNode = new FocusNode();
  String uploadDocument = "";

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
                  "Claim now",
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
            Text(
              "Claim form",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            Text(
              "Fill the following required information ",
              style: TextStyle(
                  height: 1.5,
                  color: Color(0xff808689),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(height: 30),
            MSUREInputField(
                labelText: "Date in Hospital",
                controller: dateInHospitalController,
                focusNode: dateInHospitalFocusNode),
            InkWell(
              onTap: () async {
                try {
                  selectReasonController.text = await showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: Constants.getHeight(context) * 0.6),
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Select Reason",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.cancel_outlined))
                                ],
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(
                                            context, "Reason ${(index + 1)}");
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: const Color(
                                                          0xffF1F1F1)))),
                                          child: Text(
                                            "Reason ${(index + 1)}",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          )),
                                    );
                                  },
                                ),
                              ))
                            ],
                          ),
                        );
                      });
                  setState(() {});
                } catch (ex) {}
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selectReasonController.text == "Select Reason"
                            ? const Color(0xffCBCBCB)
                            : Constants.msureRed,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      selectReasonController.text,
                      style: TextStyle(
                          color: selectReasonController.text == "Select Reason"
                              ? const Color(0xffCBCBCB)
                              : Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 26,
                      color: const Color(0xffC1C1C1),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            InkWell(
              onTap: () async {
                _pickImage(ImageSource.gallery);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: uploadDocument == ""
                            ? const Color(0xffCBCBCB)
                            : Constants.msureRed,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Visibility(
                      visible: image == null,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            uploadDocument == ""
                                ? "Upload Document"
                                : uploadDocument,
                            style: TextStyle(
                                color: uploadDocument == ""
                                    ? const Color(0xffCBCBCB)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 9),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.07),
                                borderRadius: BorderRadius.circular(4)),
                            child: const Text(
                              "Browse file",
                              style: TextStyle(
                                  color: const Color(0xff808689),
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: image != null,
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_copy_rounded,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            pickedFileName,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                image = null;
                              });
                            },
                            child: Icon(
                              CupertinoIcons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                              "Your claim has been submited. An agent will call you for more information",
                          onTap: () {
                            GlobalClaim.claimSubmitted = true;
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
