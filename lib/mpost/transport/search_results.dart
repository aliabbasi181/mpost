import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/transport/select_seats.dart';
import 'package:mpost/mpost/transport/widgets.dart';

class TransportSearchResults extends StatefulWidget {
  const TransportSearchResults({Key? key}) : super(key: key);

  @override
  State<TransportSearchResults> createState() => _TransportSearchResultsState();
}

class _TransportSearchResultsState extends State<TransportSearchResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 17, top: 5),
        color: Constants.transportColor1,
        child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_rounded)),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nairobi - Kisumu",
                      style: TextStyle(
                          color: Constants.transportHeading,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "2 passengers",
                      style: TextStyle(
                          color: Constants.transportHeading,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 11),
                    ),
                  ],
                ),
              ],
            )),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 5)
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 05, 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 5)
                  ]),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
            Text(
              "Friday, 22 Apr 2022",
              style: TextStyle(
                  color: Constants.transportHeading,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 13),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 5)
                  ]),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ],
        ),
      ),
      Expanded(
          child: Container(
        padding: const EdgeInsets.all(17),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: const Color(0xff38B87C), width: 0.4),
                  color: const Color(0xff38B87C).withOpacity(0.2)),
              child: Row(
                children: [
                  Icon(
                    Icons.shield,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "All bus ratings include safety as a major factor",
                    style: TextStyle(
                        color: Constants.transportHeading,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: SafeArea(
              top: false,
              bottom: Platform.isAndroid,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return TransportResultBusCard(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransportSelectBusSeat()));
                    },
                  );
                },
              ),
            ))
          ],
        ),
      ))
    ]));
  }
}
