import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/transport/pessanger_details.dart';
import 'package:mpost/mpost/transport/transport_constants.dart';
import 'package:mpost/mpost/transport/widgets.dart';

class TransportSelectBusSeat extends StatefulWidget {
  const TransportSelectBusSeat({Key? key}) : super(key: key);

  @override
  State<TransportSelectBusSeat> createState() => _TransportSelectBusSeatState();
}

class _TransportSelectBusSeatState extends State<TransportSelectBusSeat> {
  @override
  void initState() {
    setState(() {
      TransportConstants.selectedSeats = [];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3f5f7),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding:
                const EdgeInsets.only(right: 20, left: 20, bottom: 17, top: 5),
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
                          "Select Seats",
                          style: TextStyle(
                              color: Constants.transportHeading,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Nairobi - Kisumu",
                              style: TextStyle(
                                  color: Constants.transportHeading,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              width: 20,
                              child: Icon(
                                Icons.circle,
                                size: 8,
                              ),
                            ),
                            Text(
                              "Fri, 22 Apr",
                              style: TextStyle(
                                  color: Constants.transportHeading,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              width: 20,
                              child: Icon(
                                Icons.circle,
                                size: 8,
                              ),
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: Constants.transportHeading
                                    .withOpacity(0.2))),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Available",
                        style: TextStyle(
                            color: Constants.transportHeading,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Constants.transportHeading,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Occupied",
                        style: TextStyle(
                            color: Constants.transportHeading,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xff38B87C),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Your seat",
                        style: TextStyle(
                            color: Constants.transportHeading,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: Constants.getWidth(context),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Constants.transportHeading.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Container(
                          height: 53,
                          decoration: BoxDecoration(
                              color: const Color(0xffEDEDED),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4))),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.circle_outlined,
                                      size: 35,
                                    )
                                  ]),
                              Divider(
                                height: 30,
                                color: Colors.black.withOpacity(0.4),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Constants.transportHeading
                                            .withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  "Conductor",
                                  style: TextStyle(
                                      color: Constants.transportHeading,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [false, false, false, true],
                                seatTags: ["1A", "1B", "1C", "1D"],
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [false, false, false, false],
                                seatTags: ["2A", "2B", "2C", "2D"],
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [false, false, false, false],
                                seatTags: ["3A", "3B", "3C", "3D"],
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [false, true, false, false],
                                seatTags: ["4A", "4B", "4C", "4D"],
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [true, false, false, false],
                                seatTags: ["5A", "5B", "5C", "5D"],
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [false, false, false, false],
                                seatTags: ["6A", "6B", "6C", "6D"],
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [false, false, false, false],
                                seatTags: ["7A", "7B", "7C", "7D"],
                              ),
                              TransportSeatSelectorSeatRow(
                                occupiedSeats: [false, false, false, false],
                                seatTags: ["8A", "8B", "8C", "8D"],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 23,
                          decoration: BoxDecoration(
                              color: const Color(0xffEDEDED),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4))),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xff4D5559).withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(4)),
                    width: Constants.getWidth(context),
                    height: 40,
                    child: Text(
                      "Selecting seating for Easy Coach bus",
                      style: TextStyle(
                          color: Constants.transportHeading,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          )),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ksh 3000",
                    style: TextStyle(
                        color: Constants.transportHeading,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TransportAddPessangerDetails()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 17),
                      decoration: BoxDecoration(
                          color: Constants.transportColor2,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "Proceed to book",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
