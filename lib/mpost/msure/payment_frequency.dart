import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class MSUREPaymentFrequency extends StatefulWidget {
  const MSUREPaymentFrequency({Key? key}) : super(key: key);

  @override
  State<MSUREPaymentFrequency> createState() => _MSUREPaymentFrequencyState();
}

class _MSUREPaymentFrequencyState extends State<MSUREPaymentFrequency> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            bottom: Platform.isAndroid,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "Payment frequency",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Choose a payment option that suits you",
                          style: TextStyle(
                              color: const Color(0xff808689),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  selectedValue = 1;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: DottedBorder(
                                  dashPattern:
                                      selectedValue == 1 ? [5, 2] : [5, 0],
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10),
                                  strokeWidth: selectedValue == 1 ? 1.5 : 0.5,
                                  color: selectedValue == 1
                                      ? const Color(0xff18B284)
                                      : Color.fromRGBO(159, 163, 166, 0.89),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 5, 0, 5),
                                    decoration: BoxDecoration(
                                        color: selectedValue == 1
                                            ? const Color(0xff18B284)
                                                .withOpacity(0.1)
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "KES 30",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "Daily payments",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Radio(
                                            value: 1,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = 1;
                                              });
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Container(
                                margin: const EdgeInsets.only(left: 15),
                                padding:
                                    const EdgeInsets.fromLTRB(12, 3, 12, 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xff18B284),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Text(
                                  "Recommend",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selectedValue = 2;
                            });
                          },
                          child: DottedBorder(
                            dashPattern: selectedValue == 2 ? [5, 2] : [5, 0],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            strokeWidth: selectedValue == 2 ? 1.5 : 0.5,
                            color: selectedValue == 2
                                ? const Color(0xff18B284)
                                : Color.fromRGBO(159, 163, 166, 0.89),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                              decoration: BoxDecoration(
                                  color: selectedValue == 2
                                      ? const Color(0xff18B284).withOpacity(0.1)
                                      : null,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "KES 400",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Weekly payments",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Radio(
                                      value: 2,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = 2;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selectedValue = 3;
                            });
                          },
                          child: DottedBorder(
                            dashPattern: selectedValue == 3 ? [5, 2] : [5, 0],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            strokeWidth: selectedValue == 3 ? 1.5 : 0.5,
                            color: selectedValue == 3
                                ? const Color(0xff18B284)
                                : Color.fromRGBO(159, 163, 166, 0.89),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                              decoration: BoxDecoration(
                                  color: selectedValue == 3
                                      ? const Color(0xff18B284).withOpacity(0.1)
                                      : null,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "KES 1500",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Make one off payment",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Radio(
                                      value: 3,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = 3;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          border: Border.all(color: const Color(0xffEDEEF0))),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: Constants.getWidth(context),
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                              color: Constants.msureRed,
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            "CONTINUE TO PAYMENT",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
