import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/utilities.dart';
import 'package:provider/provider.dart';

class MSURESignup extends StatefulWidget {
  const MSURESignup({Key? key}) : super(key: key);

  @override
  State<MSURESignup> createState() => _MSURESignupState();
}

class _MSURESignupState extends State<MSURESignup> {
  FocusNode nameFocusNode = new FocusNode();
  FocusNode surNameFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode confirmPasswordFocusNode = new FocusNode();
  FocusNode idNumberFocusNode = new FocusNode();
  FocusNode ntsaNumberFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode locationFocusNode = new FocusNode();
  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController ntsNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? image;
  bool passwordHide = true, confirmPasswordHide = true;
  String dateOfBirth = "";

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
        color: Constants.msureRed,
        child: SafeArea(bottom: false, child: Container()),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
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
                // InkWell(
                //   onTap: () async {
                //     try {
                //       await showCupertinoModalPopup(
                //           context: context,
                //           builder: (BuildContext context) {
                //             return CupertinoActionSheet(
                //               actions: [
                //                 CupertinoActionSheetAction(
                //                     onPressed: () {
                //                       Navigator.pop(context);
                //                       _pickImage(ImageSource.gallery);
                //                     },
                //                     child: Text(
                //                       "Pick from gallery",
                //                       style: TextStyle(
                //                           color: Constants.transportHeading,
                //                           fontFamily: "Montserrat",
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w600),
                //                     )),
                //                 CupertinoActionSheetAction(
                //                     onPressed: () {
                //                       Navigator.pop(context);
                //                       _pickImage(ImageSource.camera);
                //                     },
                //                     child: Text(
                //                       "Pick from camera",
                //                       style: TextStyle(
                //                           color: Constants.transportHeading,
                //                           fontFamily: "Montserrat",
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w600),
                //                     ))
                //               ],
                //               cancelButton: CupertinoActionSheetAction(
                //                 onPressed: () {
                //                   Navigator.pop(context);
                //                 },
                //                 child: const Text(
                //                   "Cancel",
                //                   style: const TextStyle(
                //                       color: Colors.red,
                //                       fontFamily: "Montserrat",
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //               ),
                //             );
                //           });
                //       setState(() {});
                //     } catch (ex) {}
                //   },
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 43,
                //         width: 43,
                //         decoration: BoxDecoration(
                //             image: image == null
                //                 ? null
                //                 : DecorationImage(
                //                     fit: BoxFit.cover,
                //                     image: FileImage(image!)),
                //             color: const Color(0xffDAD9D9),
                //             borderRadius: BorderRadius.circular(100)),
                //         child: Visibility(
                //             visible: image == null,
                //             child: Icon(Icons.person_outline_rounded)),
                //       ),
                //       const SizedBox(
                //         width: 20,
                //       ),
                //       Text(
                //         "Add you picture",
                //         style: TextStyle(
                //             color: const Color(0xff808689),
                //             fontFamily: "Montserrat",
                //             fontWeight: FontWeight.w600,
                //             fontSize: 15),
                //       ),
                //       const Spacer(),
                //       InkWell(
                //         onTap: () async {
                //           if (image != null) {
                //             switch (await showDialog(
                //                 context: context,
                //                 builder: (BuildContext context) =>
                //                     CupertinoAlertDialog(
                //                       title: const Text("ALERT!"),
                //                       content: const Text(
                //                           "Are you sure you want to reset selected image?"),
                //                       actions: [
                //                         CupertinoDialogAction(
                //                             child: const Text(
                //                               "Cancel",
                //                               style: TextStyle(
                //                                   fontFamily: "Montserrat",
                //                                   fontSize: 14,
                //                                   fontWeight: FontWeight.w600),
                //                             ),
                //                             onPressed: () {
                //                               Navigator.of(context).pop("No");
                //                             }),
                //                         CupertinoDialogAction(
                //                             child: const Text(
                //                               "RESET",
                //                               style: TextStyle(
                //                                   color: Colors.red,
                //                                   fontFamily: "Montserrat",
                //                                   fontSize: 14,
                //                                   fontWeight: FontWeight.w600),
                //                             ),
                //                             onPressed: () {
                //                               Navigator.of(context)
                //                                   .pop("reset");
                //                             }),
                //                       ],
                //                     ))) {
                //               case "reset":
                //                 setState(() {
                //                   image = null;
                //                 });
                //                 break;
                //             }
                //           }
                //         },
                //         child: Container(
                //           padding: const EdgeInsets.symmetric(
                //               vertical: 5, horizontal: 15),
                //           decoration: BoxDecoration(
                //               color: Constants.msureRed,
                //               borderRadius: BorderRadius.circular(6)),
                //           child: const Text(
                //             "Reset",
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                MSUREInputField(
                    labelText: "Name as per ID",
                    controller: name,
                    focusNode: nameFocusNode),
                MSUREInputField(
                    labelText: "Surname",
                    controller: surName,
                    focusNode: surNameFocusNode),
                MSUREInputField(
                    labelText: "ID Nnmber",
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
                // MSUREInputField(
                //     labelText: "Password",
                //     controller: password,
                //     focusNode: passwordFocusNode),
                Container(
                  margin: const EdgeInsets.only(bottom: 17),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      });
                    },
                    controller: password,
                    focusNode: passwordFocusNode,
                    autocorrect: false,
                    obscureText: passwordHide,
                    obscuringCharacter: '●',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: const Color(0xffCBCBCB), width: 1.5)),
                      labelText: "Password",
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passwordHide = !passwordHide;
                          });
                        },
                        child: Text(
                          passwordHide ? "Show" : "Hide",
                          style: TextStyle(
                              color: passwordHide
                                  ? Constants.primaryColor
                                  : Constants.msureRed,
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Constants.msureRed, width: 1.5)),
                      labelStyle: TextStyle(
                          color: passwordFocusNode.hasFocus
                              ? Constants.msureRed
                              : const Color(0xffCBCBCB),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 17),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        FocusScope.of(context)
                            .requestFocus(confirmPasswordFocusNode);
                      });
                    },
                    controller: confirmPassword,
                    focusNode: confirmPasswordFocusNode,
                    autocorrect: false,
                    obscureText: confirmPasswordHide,
                    obscuringCharacter: '●',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: const Color(0xffCBCBCB), width: 1.5)),
                      labelText: "Confirm password",
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            confirmPasswordHide = !confirmPasswordHide;
                          });
                        },
                        child: Text(
                          confirmPasswordHide ? "Show" : "Hide",
                          style: TextStyle(
                              color: confirmPasswordHide
                                  ? Constants.primaryColor
                                  : Constants.msureRed,
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Constants.msureRed, width: 1.5)),
                      labelStyle: TextStyle(
                          color: confirmPasswordFocusNode.hasFocus
                              ? Constants.msureRed
                              : const Color(0xffCBCBCB),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    DateTime selectedDate =
                        DateTime(DateTime.now().year - 18, 12, 31);
                    await showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: SafeArea(
                              top: false,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: DateTime(
                                            DateTime.now().year - 18, 12, 31),
                                        minimumDate: DateTime(
                                            DateTime.now().year - 100, 6, 1),
                                        maximumDate: DateTime(
                                            DateTime.now().year - 18, 12, 31),
                                        onDateTimeChanged: (value) {
                                          selectedDate = value;
                                        }),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Constants.msureRed,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Montserrat"),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            dateOfBirth =
                                                "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Constants.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Text(
                                            "Select",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Montserrat"),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffCBCBCB), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            dateOfBirth.isEmpty ? "Date of birth" : dateOfBirth,
                            style: TextStyle(
                                color: dateOfBirth.isEmpty
                                    ? const Color(0xffCBCBCB)
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        dateOfBirth.isNotEmpty
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    dateOfBirth = "";
                                  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Constants.msureRed,
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey.withOpacity(0.7),
                              )
                      ],
                    ),
                  ),
                )
                // MSUREInputField(
                //     labelText: "Beneficiary Phone",
                //     controller: location,
                //     focusNode: locationFocusNode),
                // MSUREInputField(
                //     labelText: "Beneficiary Name",
                //     controller: location,
                //     focusNode: locationFocusNode),
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
            onTap: () async {
              if (name.text.isEmpty) {
                showSnackBar("Validation!", "Name can not be empty.", context);
                return;
              }
              if (idNumber.text.isEmpty) {
                showSnackBar(
                    "Validation!", "ID Number can not be empty.", context);
                return;
              }
              if (ntsNumber.text.isEmpty) {
                ntsNumber.text = "null";
              }
              if (phoneNumber.text.isEmpty) {
                showSnackBar(
                    "Validation!", "Phone number can not be empty.", context);
                return;
              }
              if (email.text.isEmpty) {
                showSnackBar("Validation!", "Email can not be empty.", context);
                return;
              }
              if (location.text.isEmpty) {
                showSnackBar(
                    "Validation!", "Location can not be empty.", context);
                return;
              }
              if (password.text.isEmpty) {
                showSnackBar(
                    "Validation!", "Password can not be empty.", context);
                return;
              }
              if (confirmPassword.text.isEmpty) {
                showSnackBar("Validation!",
                    "Confirm Password can not be empty.", context);
                return;
              }
              if (password.text != confirmPassword.text) {
                showSnackBar("Validation!",
                    "Password and confirm password are not same.", context);
                return;
              }

              final msureApplicationBloc =
                  Provider.of<MSUREApplicationBloc>(context, listen: false);
              if (await msureApplicationBloc.msureRegister(
                  name.text,
                  surName.text,
                  phoneNumber.text,
                  email.text,
                  password.text,
                  idNumber.text,
                  dateOfBirth,
                  location.text,
                  ntsNumber.text)) {
                Navigator.pushNamed(context, '/msure_home');
              }
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
                "Register",
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
