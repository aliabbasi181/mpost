import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/transport/transport_constants.dart';
import 'package:mpost/mpost/transport/widgets.dart';

class TransportAddPessangerDetails extends StatefulWidget {
  const TransportAddPessangerDetails({Key? key}) : super(key: key);

  @override
  State<TransportAddPessangerDetails> createState() =>
      _TransportAddPessangerDetailsState();
}

class _TransportAddPessangerDetailsState
    extends State<TransportAddPessangerDetails> {
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
