import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:intl/intl.dart';

class TransportDatePicker extends StatefulWidget {
  bool isReturn;
  TransportDatePicker({Key? key, required this.isReturn}) : super(key: key);

  @override
  State<TransportDatePicker> createState() => _TransportDatePickerState();
}

class _TransportDatePickerState extends State<TransportDatePicker> {
  String today = "";
  String departureDate = '', returnDate = '';

  @override
  void initState() {
    DateTime now = DateTime.now();
    departureDate = "${now.day}-${now.month}-${now.year}";
    if (widget.isReturn) {
      returnDate = "${now.day}-${now.month}-${now.year}";
    }
    today =
        "${now.day}${now.day == 1 || now.day == 21 ? "st" : now.day == 2 || now.day == 22 ? "nd" : now.day == 3 || now.day == 23 ? "rd" : "th"} ";
    switch (now.month) {
      case 1:
        today += "January";
        break;
      case 2:
        today += "February";
        break;
      case 3:
        today += "March";
        break;
      case 4:
        today += "April";
        break;
      case 5:
        today += "May";
        break;
      case 6:
        today += "June";
        break;
      case 7:
        today += "July";
        break;
      case 8:
        today += "August";
        break;
      case 9:
        today += "September";
        break;
      case 10:
        today += "October";
        break;
      case 11:
        today += "November";
        break;
      case 12:
        today += "December";
        break;
    }
    today += " ${now.year}";
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
                    Text(
                      "Choose Date",
                      style: TextStyle(
                          color: Constants.transportHeading,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                )),
          ),
          Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: Constants.getWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                "Today, ${today}",
                style: TextStyle(
                    color: Constants.transportHeading,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              decoration: BoxDecoration(
                                  color: const Color(0xffF1F4F5),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Departure date",
                                    style: TextStyle(
                                        color: Constants.transportHeading
                                            .withOpacity(0.4),
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11),
                                  ),
                                  Text(
                                    departureDate,
                                    style: TextStyle(
                                        color: Constants.transportHeading,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            CalendarDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              currentDate: DateTime.now(),
                              lastDate: DateTime(2030),
                              onDateChanged: (value) {
                                setState(() {
                                  departureDate =
                                      "${value.day}-${value.month}-${value.year}";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Visibility(
                        visible: widget.isReturn,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF1F4F5),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Return date",
                                          style: TextStyle(
                                              color: Constants.transportHeading
                                                  .withOpacity(0.4),
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11),
                                        ),
                                        Text(
                                          returnDate,
                                          style: TextStyle(
                                              color: Constants.transportHeading,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CalendarDatePicker(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    currentDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                    onDateChanged: (value) {
                                      setState(() {
                                        returnDate =
                                            "${value.day}-${value.month}-${value.year}";
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isReturn = !widget.isReturn;
                            if (!widget.isReturn) {
                              returnDate = '';
                            } else {
                              DateTime now = DateTime.now();
                              returnDate =
                                  "${now.day}-${now.month}-${now.year}";
                            }
                          });
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: widget.isReturn
                                      ? Colors.red
                                      : const Color(0xff4D5559)
                                          .withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                widget.isReturn
                                    ? CupertinoIcons.clear
                                    : Icons.add,
                                size: 18,
                                color: widget.isReturn
                                    ? Colors.red
                                    : Constants.transportHeading
                                        .withOpacity(0.6),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.isReturn
                                    ? "Remove return"
                                    : "Add return",
                                style: TextStyle(
                                    color: widget.isReturn
                                        ? Colors.red
                                        : Constants.transportHeading
                                            .withOpacity(0.8),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print(departureDate);
                          print(returnDate);
                          Navigator.pop(context, "$departureDate|$returnDate");
                        },
                        child: Container(
                          width: Constants.getWidth(context),
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 17),
                          decoration: BoxDecoration(
                              color: Constants.transportColor2,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            "Confirm Date",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
