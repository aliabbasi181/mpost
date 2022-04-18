import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/payment_frequency.dart';

class SingleMSUREPlain extends StatefulWidget {
  String plain;
  SingleMSUREPlain({Key? key, required this.plain}) : super(key: key);

  @override
  State<SingleMSUREPlain> createState() => _SingleMSUREPlainState();
}

class _SingleMSUREPlainState extends State<SingleMSUREPlain> {
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
                                widget.plain + " Plain",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: widget.plain == "Basic",
                          child: Container(
                            width: Constants.getWidth(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(colors: [
                                  const Color(0xff187bb2),
                                  const Color(0xffcd2631),
                                ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(26, 13, 20, 13),
                                  child: const Text(
                                    "Basic Plain",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                ),
                                Divider(
                                  height: 0,
                                  color: Colors.white.withOpacity(0.08),
                                  thickness: 1,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "SUM ASSURED",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                "15,0000",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 32),
                                              ),
                                              const SizedBox(
                                                height: 45,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.doc_text,
                                                    color: Colors.white,
                                                    size: 32,
                                                  ),
                                                  const SizedBox(
                                                    width: 19,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "COVERAGE TYPE",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 11),
                                                      ),
                                                      Text(
                                                        "Personal cover",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(23),
                                        margin: const EdgeInsets.only(
                                            top: 20, right: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color:
                                                Colors.white.withOpacity(0.2)),
                                        child: const Image(
                                            width: 30,
                                            height: 30,
                                            image: AssetImage(
                                                "asset/images/heart_icon.png")),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: widget.plain == "Premium",
                          child: Container(
                            width: Constants.getWidth(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xff0175B2),
                                      const Color(0xff2C09BA),
                                    ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(26, 13, 20, 13),
                                  child: const Text(
                                    "Premium Plan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                ),
                                Divider(
                                  height: 0,
                                  color: Colors.white.withOpacity(0.08),
                                  thickness: 1,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "SUM ASSURED",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                "25,0000",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 32),
                                              ),
                                              const SizedBox(
                                                height: 45,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.doc_text,
                                                    color: Colors.white,
                                                    size: 32,
                                                  ),
                                                  const SizedBox(
                                                    width: 19,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "COVERAGE TYPE",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 11),
                                                      ),
                                                      Text(
                                                        "Personal cover",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(23),
                                        margin: const EdgeInsets.only(
                                            top: 20, right: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color:
                                                Colors.white.withOpacity(0.2)),
                                        child: const Image(
                                            width: 30,
                                            height: 30,
                                            image: AssetImage(
                                                "asset/images/umbrella-icon.png")),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "PRICE BREAKDOWN",
                                  style: TextStyle(
                                      color: const Color(0xff9FA3A6),
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Base premium",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xff9FA3A6),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "KES 300",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "INSURANCE ADD-ONS",
                                  style: TextStyle(
                                      color: const Color(0xff9FA3A6),
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Maternity",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xff9FA3A6),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "KES 1500",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Pre-exsiting diseases",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              size: 13,
                              color: const Color(0xffA5A5A5),
                            ),
                            const Spacer(),
                            Text(
                              "KES 5000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "OTHER BENEFITS ADD-ONS",
                                  style: TextStyle(
                                      color: const Color(0xff9FA3A6),
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Health add-ons",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xff9FA3A6),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "KES 2000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 0,
                          color: Colors.black.withOpacity(0.09),
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total price",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              size: 13,
                              color: const Color(0xffA5A5A5),
                            ),
                            const Spacer(),
                            Text(
                              "KES 14000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "VAT",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              "KES 100",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 0,
                          color: Colors.black.withOpacity(0.09),
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Grand total",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              "KES 15000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MSUREPaymentFrequency()));
                        },
                        child: Container(
                          width: Constants.getWidth(context),
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                              color: Constants.msureRed,
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            "ACTIVATE PLAIN",
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
