import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SafeArea(
            bottom: Platform.isAndroid,
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
                          padding: const EdgeInsets.fromLTRB(26, 13, 20, 13),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "COVERAGE TYPE",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                "Personal cover",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w700,
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
                                margin:
                                    const EdgeInsets.only(top: 20, right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white.withOpacity(0.2)),
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
                          padding: const EdgeInsets.fromLTRB(26, 13, 20, 13),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "COVERAGE TYPE",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                "Personal cover",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w700,
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
                                margin:
                                    const EdgeInsets.only(top: 20, right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white.withOpacity(0.2)),
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
              ],
            )),
      ),
    );
  }
}
