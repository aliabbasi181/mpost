import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/transport/transport_constants.dart';
import 'package:mpost/mpost/transport/widgets.dart';
import 'package:mpost/mpost/widgets.dart';

class Pessanger {
  String firstName, lastName, mobileNumber, Nationality, identity, gender;
  Pessanger(this.firstName, this.lastName, this.mobileNumber, this.Nationality,
      this.identity, this.gender);
}

class TransportAddPessangerDetails extends StatefulWidget {
  const TransportAddPessangerDetails({Key? key}) : super(key: key);

  @override
  State<TransportAddPessangerDetails> createState() =>
      _TransportAddPessangerDetailsState();
}

class _TransportAddPessangerDetailsState
    extends State<TransportAddPessangerDetails> {
  List<Pessanger> pessangerDetails = [];
  @override
  void initState() {
    for (var i = 0; i < TransportConstants.selectedSeats.length; i++) {
      pessangerDetails.add(Pessanger("", "", "", "", "", ""));
    }
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
                      "Passenger Details",
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
            width: Constants.getWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Departure Date",
                  style: TextStyle(
                      color: Constants.transportHeading.withOpacity(0.6),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
                Text(
                  "Friday, 22 Apr 2022",
                  style: TextStyle(
                      color: Constants.transportHeading,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
                Divider(
                  height: 30,
                  color: Colors.black.withOpacity(0.2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nairobi",
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff4D5559).withOpacity(0.7),
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "8:30 am",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      "---   6h 10m   ---",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff4D5559).withOpacity(0.7),
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kisumu",
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff4D5559).withOpacity(0.7),
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "2:40 pm",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: TransportConstants.selectedSeats.length,
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) {
                    return AddPessangerDetailsCard(
                      seatTag: TransportConstants.selectedSeats[index],
                      child: pessangerDetails[index].firstName.isEmpty
                          ? Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.person),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Add Pessager details",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Personal details will appear on ticket",
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Constants.transportHeading
                                                .withOpacity(0.6),
                                            fontFamily: "Montserrat",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "First Name",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading
                                                      .withOpacity(0.6),
                                                  fontFamily: "Montserrat",
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                pessangerDetails[index]
                                                    .firstName,
                                                style: TextStyle(
                                                    color: Constants
                                                        .transportHeading,
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Last Name",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading
                                                      .withOpacity(0.6),
                                                  fontFamily: "Montserrat",
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                pessangerDetails[index]
                                                    .lastName,
                                                style: TextStyle(
                                                    color: Constants
                                                        .transportHeading,
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mobile number",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading
                                                      .withOpacity(0.6),
                                                  fontFamily: "Montserrat",
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                pessangerDetails[index]
                                                    .mobileNumber,
                                                style: TextStyle(
                                                    color: Constants
                                                        .transportHeading,
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nationality",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading
                                                      .withOpacity(0.6),
                                                  fontFamily: "Montserrat",
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                pessangerDetails[index]
                                                    .Nationality,
                                                style: TextStyle(
                                                    color: Constants
                                                        .transportHeading,
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ID/Passport Number",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading
                                                      .withOpacity(0.6),
                                                  fontFamily: "Montserrat",
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                                pessangerDetails[index]
                                                    .identity,
                                                style: TextStyle(
                                                    color: Constants
                                                        .transportHeading,
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Gender",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading
                                                      .withOpacity(0.6),
                                                  fontFamily: "Montserrat",
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(pessangerDetails[index].gender,
                                                style: TextStyle(
                                                    color: Constants
                                                        .transportHeading,
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                      onPress: () async {
                        try {
                          if (pessangerDetails[index].firstName.isNotEmpty) {
                            pessangerDetails[index] =
                                await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    elevation: 50,
                                    context: context,
                                    builder: (context) {
                                      return PessangerDetailForm(
                                        pessanger: pessangerDetails[index],
                                      );
                                    });
                          } else {
                            pessangerDetails[index] =
                                await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    elevation: 50,
                                    context: context,
                                    builder: (context) {
                                      return PessangerDetailForm();
                                    });
                          }
                          setState(() {});
                        } catch (ex) {}
                      },
                    );
                  },
                )),
          ),
          Container(
            width: Constants.getWidth(context),
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SafeArea(
                top: false,
                child: InkWell(
                  onTap: () {
                    for (var item in pessangerDetails) {
                      if (item.firstName.isNotEmpty) {
                      } else {
                        showSnackBar("Can not proceed",
                            "Please provide all pessangers details", context);
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 17),
                    decoration: BoxDecoration(
                        color: TransportConstants.selectedSeats.length ==
                                pessangerDetails.length
                            ? Constants.transportColor2
                            : Constants.transportColor2.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "Proceed to pay",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
          )
        ]));
  }
}

class PessangerDetailForm extends StatefulWidget {
  Pessanger? pessanger = Pessanger("", "", "", "", "", "");
  PessangerDetailForm({Key? key, this.pessanger}) : super(key: key);

  @override
  State<PessangerDetailForm> createState() => _PessangerDetailFormState();
}

class _PessangerDetailFormState extends State<PessangerDetailForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController identity = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String gender = "Gender", nationality = "Nationality";
  List<String> searchResults = [];
  @override
  void initState() {
    if (widget.pessanger != null) {
      if (widget.pessanger!.firstName.isNotEmpty) {
        firstName.text = widget.pessanger!.firstName;
        lastName.text = widget.pessanger!.lastName;
        mobileNumber.text = widget.pessanger!.mobileNumber;
        identity.text = widget.pessanger!.identity;
        nationality = widget.pessanger!.Nationality;
        gender = widget.pessanger!.gender;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Constants.getHeight(context) * 0.25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(CupertinoIcons.clear_circled))
            ],
          ),
          Text(
            "Passager personal details",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          TransportInputField(
              isLocationPicker: false,
              hintText: "First name",
              icon: Icons.person,
              controller: firstName),
          TransportInputField(
              isLocationPicker: false,
              hintText: "Last name",
              icon: Icons.person,
              controller: lastName),
          TransportInputField(
              isLocationPicker: false,
              hintText: "Mobile number",
              icon: Icons.phone_iphone_rounded,
              controller: mobileNumber),
          TransportInputSelector(
              prefixIcon: Icons.flag,
              hintText: nationality,
              sufixIcon: Icons.arrow_drop_down,
              onPress: () async {
                try {
                  nationality = await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return CountryPickerTransport();
                      });
                  setState(() {});
                } catch (ex) {}
              }),
          TransportInputField(
              isLocationPicker: false,
              hintText: "ID/Passport",
              icon: Icons.credit_card_rounded,
              controller: identity),
          TransportInputSelector(
              prefixIcon: gender == "Male"
                  ? Icons.male_rounded
                  : gender == "Female"
                      ? Icons.female_rounded
                      : Icons.transgender_rounded,
              hintText: gender,
              sufixIcon: Icons.arrow_drop_down,
              onPress: () async {
                try {
                  gender = await showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoActionSheet(
                          actions: [
                            CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context, "Male");
                                },
                                child: Text(
                                  "Male",
                                  style: TextStyle(
                                      color: Constants.transportHeading,
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )),
                            CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context, "Female");
                                },
                                child: Text(
                                  "Female",
                                  style: TextStyle(
                                      color: Constants.transportHeading,
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ))
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      });
                  setState(() {});
                } catch (ex) {}
              }),
          const Spacer(),
          SafeArea(
            top: false,
            bottom: Platform.isAndroid,
            child: InkWell(
              onTap: () {
                if (firstName.text.isEmpty) {
                  showSnackBar(
                      "Can not proceed", "Please provide first name.", context);
                  return;
                }
                if (mobileNumber.text.isEmpty) {
                  showSnackBar("Can not proceed",
                      "Please provide mobile number.", context);
                  return;
                }
                if (nationality == "Nationality") {
                  showSnackBar("Can not proceed",
                      "Please select your nationality.", context);
                  return;
                }
                if (gender == "Gender") {
                  showSnackBar(
                      "Can not proceed", "Please select gender.", context);
                  return;
                }
                if (identity.text.isEmpty) {
                  showSnackBar("Can not proceed",
                      "Please provide your identitiy (ID/Passport).", context);
                  return;
                }
                Navigator.pop(
                    context,
                    Pessanger(firstName.text, lastName.text, mobileNumber.text,
                        nationality, identity.text, gender));
              },
              child: Container(
                width: Constants.getWidth(context),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                decoration: BoxDecoration(
                    color: Constants.transportColor2,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  "Proceed to pay",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CountryPickerTransport extends StatefulWidget {
  const CountryPickerTransport({Key? key}) : super(key: key);

  @override
  State<CountryPickerTransport> createState() => _CountryPickerTransportState();
}

class _CountryPickerTransportState extends State<CountryPickerTransport> {
  TextEditingController searchController = TextEditingController();
  List<String> searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select your country",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(CupertinoIcons.clear_circled))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.white,
            // padding: const EdgeInsets.symmetric(
            //     vertical: 15, horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color(0xff6A6A6A).withOpacity(0.3),
                      width: 0.8)),
              child: TextField(
                onChanged: (value) {
                  searchResults = [];
                  setState(() {
                    for (var item in Constants.countries) {
                      if (item['country']
                          .toString()
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        searchResults.add(item['country'].toString());
                      }
                    }
                  });
                  print(searchResults.length);
                },
                controller: searchController,
                style: TextStyle(
                    color: Color(0xff4D5559),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  isCollapsed: true,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                  hintText: "Search country",
                  hintStyle: TextStyle(
                      color: Color(0xff4D5559).withOpacity(0.6),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          Visibility(
            visible: searchResults.isEmpty,
            child: Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: Constants.countries.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context,
                          Constants.countries[index]['country'].toString());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: const Color(0xff6A6A6A)
                                      .withOpacity(0.3)))),
                      child: Text(
                        Constants.countries[index]['country'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: searchResults.isNotEmpty,
            child: Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, searchResults[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: const Color(0xff6A6A6A)
                                      .withOpacity(0.3)))),
                      child: Text(
                        searchResults[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
