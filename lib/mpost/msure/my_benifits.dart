import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/single_msure_plain.dart';

class MSUREMyBenifits extends StatefulWidget {
  const MSUREMyBenifits({Key? key}) : super(key: key);

  @override
  State<MSUREMyBenifits> createState() => _MSUREMyBenifitsState();
}

class _MSUREMyBenifitsState extends State<MSUREMyBenifits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            bottom: Platform.isAndroid,
            child: SingleChildScrollView(
                child: Container(
                    width: Constants.getWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
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
                                  child: Center(
                                child: Image(
                                    height: 40,
                                    width: 40,
                                    image: AssetImage(
                                        "asset/images/msure_icon.png")),
                              )),
                              InkWell(
                                onTap: () {},
                                child: const Image(
                                    width: 30,
                                    image: AssetImage(
                                        "asset/images/menu_icon.png")),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My Benefits",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: Constants.getWidth(context),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 15,
                                          color:
                                              Colors.black.withOpacity(0.11)),
                                    ],
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          26, 13, 20, 13),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Premium Plan",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 15),
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 3, 12, 3),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff0175B2)
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Text(
                                              "Pending",
                                              style: TextStyle(
                                                  color: Constants.primaryColor,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
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
                                                    "TOTAL PAID",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "2,000",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 32),
                                                  ),
                                                  const SizedBox(
                                                    height: 35,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons.doc_text,
                                                        color: Colors.black,
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
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 11),
                                                          ),
                                                          Text(
                                                            "Personal cover",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
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
                                            padding: const EdgeInsets.all(18),
                                            margin: const EdgeInsets.only(
                                                top: 20, right: 20),
                                            decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  const Color(0xff187bb2),
                                                  const Color(0xffcd2631),
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.white
                                                    .withOpacity(1)),
                                            child: const Image(
                                                width: 30,
                                                height: 30,
                                                image: AssetImage(
                                                    "asset/images/heart_icon.png")),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      color: Colors.white.withOpacity(0.08),
                                      thickness: 1,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleMSUREPlain(
                                                      plain: "Basic",
                                                    )));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            26, 13, 20, 13),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Next payment",
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff9FA3A6),
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 11),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.doc_text,
                                                      color: const Color(
                                                          0xff9FA3A6),
                                                      size: 18,
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    Text(
                                                      "Tue 19, April 2022",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Text(
                                              "Adjust payment",
                                              style: TextStyle(
                                                  color: Constants.primaryColor,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Icon(
                                              CupertinoIcons.arrow_right,
                                              size: 16,
                                              color: Constants.primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: Constants.getWidth(context),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 15,
                                          color:
                                              Colors.black.withOpacity(0.11)),
                                    ],
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
                                      padding: const EdgeInsets.fromLTRB(
                                          26, 13, 20, 13),
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
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "25,000",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 32),
                                                  ),
                                                  const SizedBox(
                                                    height: 35,
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
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 11),
                                                          ),
                                                          Text(
                                                            "Personal cover",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
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
                                            padding: const EdgeInsets.all(18),
                                            margin: const EdgeInsets.only(
                                                top: 20, right: 20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.white
                                                    .withOpacity(0.2)),
                                            child: const Image(
                                                width: 30,
                                                height: 30,
                                                image: AssetImage(
                                                    "asset/images/umbrella-icon.png")),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      color: Colors.white.withOpacity(0.08),
                                      thickness: 1,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleMSUREPlain(
                                                      plain: "Premium",
                                                    )));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            26, 13, 20, 13),
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Buy this cover",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                            const Spacer(),
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Icon(
                                                  CupertinoIcons.arrow_right,
                                                  size: 18,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://images.indianexpress.com/2019/08/imran-khan-4.jpg"))),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            18, 9, 100, 12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(6),
                                                bottomRight:
                                                    Radius.circular(6)),
                                            color: Color(0xffD8364D)
                                                .withOpacity(0.9)),
                                        child: Text(
                                          "No one can surely predict the future. But we can protect it.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )))));
  }
}
