import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class MSUREAbout extends StatefulWidget {
  const MSUREAbout({Key? key}) : super(key: key);

  @override
  State<MSUREAbout> createState() => _MSUREAboutState();
}

class _MSUREAboutState extends State<MSUREAbout> {
  int selectedValue = 1;
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
                  "About us",
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
                Container(
                  width: Constants.getWidth(context),
                  height: 243,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "asset/images/msure_banner_image.png"))),
                  child: Container(
                    width: Constants.getWidth(context),
                    height: 243,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.85)
                            ])),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "About us",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Porttitor facilisis lacinia velit nunc, commodo bibendum non sed. Turpis duis tellus arcu lobortis quis odio aenean sagittis. Egestas duis donec eget bibendum. \n\nPorttitor facilisis lacinia velit nunc, commodo bibendum non sed. Turpis duis tellus arcu lobortis quis odio aenean sagittis. Egestas duis donec eget bibendum. \n\nPorttitor facilisis lacinia velit nunc, commodo bibendum non sed. Turpis duis tellus arcu lobortis quis odio aenean sagittis. Egestas duis donec eget bibendum.",
                  style: TextStyle(
                      height: 1.5,
                      color: Color(0xff808689),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
