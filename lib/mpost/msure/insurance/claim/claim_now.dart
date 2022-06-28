import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/insurance/claim/global_claim.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:mpost/mpost/payment_status.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:provider/provider.dart';

class MPOSTInsuranceClaimNow extends StatefulWidget {
  const MPOSTInsuranceClaimNow({Key? key}) : super(key: key);

  @override
  State<MPOSTInsuranceClaimNow> createState() => _MPOSTInsuranceClaimNowState();
}

class _MPOSTInsuranceClaimNowState extends State<MPOSTInsuranceClaimNow> {
  TextEditingController dateInHospitalController = TextEditingController();
  TextEditingController selectClaimType =
      TextEditingController(text: "Claim Type");
  TextEditingController selectRelationToMember =
      TextEditingController(text: "Relation to Member");
  String hospitalAdmissionDate = "";
  String hospitalDischargeDate = "";
  FocusNode dateInHospitalFocusNode = new FocusNode();
  String uploadDocument = "";
  var relations = ['Self', 'Brother', 'Sister', 'Father', 'Mother'];
  var types = ['Hospital', 'Type 2', 'Type 3', 'Type 4', 'Type 5'];

  final ImagePicker _picker = ImagePicker();
  File? image;
  String pickedFileName = '';
  List<dynamic> reasons = [];
  dynamic selectedReason;

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
  void initState() {
    // TODO: implement initState
    //_getClaimReasons();
    super.initState();
  }

  _getClaimReasons() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    reasons = await msureApplicationBloc.getClaimReasons();
    print(reasons);
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
            InkWell(
              onTap: () async {
                try {
                  selectClaimType.text = await showModalBottomSheet(
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
                                    "Select claim type",
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
                                  itemCount: types.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        //selectedReason = reasons[index];
                                        Navigator.pop(
                                            context, types[index].toString());
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
                                            types[index].toString(),
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
                        color: selectClaimType.text == "Claim Type"
                            ? const Color(0xffCBCBCB)
                            : Constants.msureRed,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      selectClaimType.text,
                      style: TextStyle(
                          color: selectClaimType.text == "Claim Type"
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
                try {
                  selectRelationToMember.text = await showModalBottomSheet(
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
                                    "Select relation to member",
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
                                  itemCount: relations.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        //selectedReason = reasons[index];
                                        Navigator.pop(context,
                                            relations[index].toString());
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
                                            relations[index].toString(),
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
                        color:
                            selectRelationToMember.text == "Relation to Member"
                                ? const Color(0xffCBCBCB)
                                : Constants.msureRed,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      selectRelationToMember.text.isEmpty
                          ? "Relation to Member"
                          : selectRelationToMember.text,
                      style: TextStyle(
                          color: selectRelationToMember.text ==
                                  "Relation to Member"
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
            // InkWell(
            //   onTap: () async {
            //     _pickImage(ImageSource.gallery);
            //   },
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            //     decoration: BoxDecoration(
            //         border: Border.all(
            //             color: uploadDocument == ""
            //                 ? const Color(0xffCBCBCB)
            //                 : Constants.msureRed,
            //             width: 1.5),
            //         borderRadius: BorderRadius.circular(10.0)),
            //     child: Column(
            //       children: [
            //         Visibility(
            //           visible: image == null,
            //           child: Row(
            //             children: [
            //               Expanded(
            //                   child: Text(
            //                 uploadDocument == ""
            //                     ? "Upload Document"
            //                     : uploadDocument,
            //                 style: TextStyle(
            //                     color: uploadDocument == ""
            //                         ? const Color(0xffCBCBCB)
            //                         : Colors.black,
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w600),
            //               )),
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //               Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     vertical: 6, horizontal: 9),
            //                 decoration: BoxDecoration(
            //                     color: Colors.black.withOpacity(0.07),
            //                     borderRadius: BorderRadius.circular(4)),
            //                 child: const Text(
            //                   "Browse file",
            //                   style: TextStyle(
            //                       color: const Color(0xff808689),
            //                       fontFamily: "Montserrat",
            //                       fontWeight: FontWeight.w500,
            //                       fontSize: 13),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //         Visibility(
            //           visible: image != null,
            //           child: Row(
            //             children: [
            //               Icon(
            //                 Icons.file_copy_rounded,
            //                 color: Colors.grey,
            //               ),
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //               Expanded(
            //                   child: Text(
            //                 pickedFileName,
            //                 maxLines: 1,
            //                 softWrap: true,
            //                 overflow: TextOverflow.ellipsis,
            //                 style: TextStyle(
            //                     color: Colors.black.withOpacity(0.6),
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w600),
            //               )),
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //               InkWell(
            //                 onTap: () {
            //                   setState(() {
            //                     image = null;
            //                   });
            //                 },
            //                 child: Icon(
            //                   CupertinoIcons.delete,
            //                   color: Colors.red,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

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
                                    initialDateTime: DateTime.now(),
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
                                        hospitalAdmissionDate =
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xffCBCBCB), width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        hospitalAdmissionDate.isEmpty
                            ? "Hospital Admission Date"
                            : hospitalAdmissionDate,
                        style: TextStyle(
                            color: hospitalAdmissionDate.isEmpty
                                ? const Color(0xffCBCBCB)
                                : Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    hospitalAdmissionDate.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                hospitalAdmissionDate = "";
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
            ),
            const SizedBox(
              height: 17,
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
                                    initialDateTime: DateTime.now(),
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
                                        hospitalDischargeDate =
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xffCBCBCB), width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        hospitalDischargeDate.isEmpty
                            ? "Hospital Discharge Date"
                            : hospitalDischargeDate,
                        style: TextStyle(
                            color: hospitalDischargeDate.isEmpty
                                ? const Color(0xffCBCBCB)
                                : Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    hospitalDischargeDate.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                hospitalDischargeDate = "";
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
          ],
        ),
      )),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SafeArea(
          bottom: Platform.isAndroid,
          top: false,
          child: InkWell(
            onTap: () async {
              if (selectClaimType.text.isEmpty) {
                showSnackBar(
                    "Validation error!", 'Please select Claim type.', context);
                return;
              }
              if (selectRelationToMember.text.isEmpty) {
                showSnackBar("Validation error!",
                    'Please select Relation to memeber.', context);
                return;
              }
              if (hospitalAdmissionDate.isEmpty) {
                showSnackBar("Validation error!",
                    'Please select Hospital admission date.', context);
                return;
              }
              if (hospitalDischargeDate.isEmpty) {
                showSnackBar("Validation error!",
                    'Please select Hospital discharge date.', context);
                return;
              }

              try {
                final msureApplicationBloc =
                    Provider.of<MSUREApplicationBloc>(context, listen: false);
                if (await msureApplicationBloc.initiateClaim(
                    selectClaimType.text,
                    selectRelationToMember.text,
                    hospitalAdmissionDate,
                    hospitalDischargeDate)) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MPOSTPaymentSuccessGeneral(
                              buttonText: "Continue to claims",
                              message:
                                  "Your claim has been submited. An agent will call you for more information",
                              onTap: () {
                                GlobalClaim.claimSubmitted = true;
                                Navigator.popUntil(
                                    context,
                                    ModalRoute.withName(
                                        '/msure_insurance_claim'));
                              },
                              title: "Success!")));
                }
              } catch (ex) {}
            },
            child: Container(
              width: Constants.getWidth(context),
              //margin: const EdgeInsets.only(top: 20),
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
