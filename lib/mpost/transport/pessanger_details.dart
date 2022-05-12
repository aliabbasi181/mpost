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
                      onPress: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            elevation: 50,
                            context: context,
                            builder: (context) {
                              return PessangerDetailForm();
                            });
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
                    if (TransportConstants.selectedSeats.length ==
                        pessangerDetails.length) {
                    } else {
                      showSnackBar("Can not proceed",
                          "Please provide all pessangers details", context);
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
  const PessangerDetailForm({Key? key}) : super(key: key);

  @override
  State<PessangerDetailForm> createState() => _PessangerDetailFormState();
}

class _PessangerDetailFormState extends State<PessangerDetailForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController identity = TextEditingController();
  String gender = "Gender", nationality = "Nationality";
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
              onPress: () {}),
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
          InkWell(
            onTap: () {},
            child: Container(
              width: Constants.getWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
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
          )
        ],
      ),
    );
  }
}
