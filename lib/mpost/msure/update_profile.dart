import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/msure_nav.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:image_picker/image_picker.dart';

class MSUREUpdateProfile extends StatefulWidget {
  const MSUREUpdateProfile({Key? key}) : super(key: key);

  @override
  State<MSUREUpdateProfile> createState() => _MSUREUpdateProfileState();
}

class _MSUREUpdateProfileState extends State<MSUREUpdateProfile> {
  FocusNode nameFocusNode = new FocusNode();
  FocusNode surnameFocusNode = new FocusNode();
  FocusNode idNumberFocusNode = new FocusNode();
  FocusNode ntsaNumberFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode locationFocusNode = new FocusNode();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController ntsNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? image;

  _pickImage(ImageSource imageSource) async {
    try {
      final image = await _picker.pickImage(source: imageSource);
      if (image == null) return;
      setState(() {
        this.image = File(image.path);
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
                  "Personal Details",
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Update your profile",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                RichText(
                    text: TextSpan(
                        text: "Please add below your personal details. ",
                        style: TextStyle(
                            height: 1.5,
                            color: Color(0xff808689),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        children: [
                      TextSpan(
                        text: "Use my MPOST personal Details",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            switch (await showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                      title: const Text("ALERT!"),
                                      content: const Text(
                                          "Are you sure you want to use MPOST personal details?"),
                                      actions: [
                                        CupertinoDialogAction(
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop("No");
                                            }),
                                        CupertinoDialogAction(
                                            child: const Text(
                                              "YES",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontFamily: "Montserrat",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop("yes");
                                            }),
                                      ],
                                    ))) {
                              case "yes":
                                setState(() {
                                  FocusScope.of(context)
                                      .requestFocus(nameFocusNode);
                                  name.text =
                                      Constants.user.fullName.toString();
                                  FocusScope.of(context)
                                      .requestFocus(phoneFocusNode);
                                  phoneNumber.text =
                                      Constants.user.mobile.toString();
                                  FocusScope.of(context)
                                      .requestFocus(emailFocusNode);
                                  email.text = Constants.user.email.toString();
                                });
                                break;
                            }
                          },
                        style: TextStyle(
                            height: 1.5,
                            color: Constants.msureRed,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoActionSheet(
                              actions: [
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _pickImage(ImageSource.gallery);
                                    },
                                    child: Text(
                                      "Pick from gallery",
                                      style: TextStyle(
                                          color: Constants.transportHeading,
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    )),
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _pickImage(ImageSource.camera);
                                    },
                                    child: Text(
                                      "Pick from camera",
                                      style: TextStyle(
                                          color: Constants.transportHeading,
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          });
                      setState(() {});
                    } catch (ex) {}
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                            image: image == null
                                ? null
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(image!)),
                            color: const Color(0xffDAD9D9),
                            borderRadius: BorderRadius.circular(100)),
                        child: Visibility(
                            visible: image == null,
                            child: Icon(Icons.person_outline_rounded)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Add you picture",
                        style: TextStyle(
                            color: const Color(0xff808689),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          if (image != null) {
                            switch (await showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                      title: const Text("ALERT!"),
                                      content: const Text(
                                          "Are you sure you want to reset selected image?"),
                                      actions: [
                                        CupertinoDialogAction(
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop("No");
                                            }),
                                        CupertinoDialogAction(
                                            child: const Text(
                                              "RESET",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontFamily: "Montserrat",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop("reset");
                                            }),
                                      ],
                                    ))) {
                              case "reset":
                                setState(() {
                                  image = null;
                                });
                                break;
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Constants.msureRed,
                              borderRadius: BorderRadius.circular(6)),
                          child: const Text(
                            "Reset",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MSUREInputField(
                    labelText: "Name as per ID",
                    controller: name,
                    focusNode: nameFocusNode),
                MSUREInputField(
                    labelText: "Surame as per ID",
                    controller: surname,
                    focusNode: surnameFocusNode),
                MSUREInputField(
                    labelText: "ID NUmber",
                    controller: idNumber,
                    focusNode: idNumberFocusNode),
                MSUREInputField(
                    labelText: "NTSA Number",
                    controller: ntsNumber,
                    focusNode: ntsaNumberFocusNode),
                MSUREInputField(
                    labelText: "Phone Number",
                    controller: phoneNumber,
                    focusNode: phoneFocusNode),
                MSUREInputField(
                    labelText: "Email (optional)",
                    controller: email,
                    focusNode: emailFocusNode),
                MSUREInputField(
                    labelText: "Location",
                    controller: location,
                    focusNode: locationFocusNode),
              ],
            ),
          ),
        ),
      ),
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
                      builder: (context) => const ProfileUpdateSuccessMSURE()));
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

class ProfileUpdateSuccessMSURE extends StatefulWidget {
  const ProfileUpdateSuccessMSURE({Key? key}) : super(key: key);

  @override
  _ProfileUpdateSuccessMSUREState createState() =>
      _ProfileUpdateSuccessMSUREState();
}

class _ProfileUpdateSuccessMSUREState extends State<ProfileUpdateSuccessMSURE> {
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
                'Update successful',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Your personal details were updated successfully ',
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
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             MSUREBottomNav(loadDeliveries: false)),
                  //     ModalRoute.withName('/msure_home'));
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
