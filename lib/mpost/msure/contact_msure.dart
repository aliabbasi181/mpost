import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/widgets.dart';

class MSUREContact extends StatefulWidget {
  const MSUREContact({Key? key}) : super(key: key);

  @override
  State<MSUREContact> createState() => _MSUREContactState();
}

class _MSUREContactState extends State<MSUREContact> {
  int selectedValue = 1;
  TextEditingController name = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode messageFocusNode = FocusNode();
  FocusNode subjectFocusNode = FocusNode();
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
                  "Contact us",
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About us",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  "Get in touch with our agents.",
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff808689),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                MSUREInputField(
                  labelText: "Names as per ID",
                  controller: name,
                  focusNode: nameFocusNode,
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
                          borderSide: BorderSide(
                              color: Constants.msureRed, width: 1.5)),
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
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          bottom: Platform.isAndroid,
          child: InkWell(
            onTap: () {},
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
                "Send",
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
    ]));
  }
}
