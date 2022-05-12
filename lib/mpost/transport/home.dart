import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/transport/search_results.dart';
import 'package:mpost/mpost/transport/widgets.dart';
import 'package:mpost/widgets.dart';

class TransportHome extends StatefulWidget {
  const TransportHome({Key? key}) : super(key: key);

  @override
  State<TransportHome> createState() => _TransportHomeState();
}

class _TransportHomeState extends State<TransportHome> {
  bool oneWay = true;
  TextEditingController locationFromController = TextEditingController();
  TextEditingController locationToController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 20, left: 20, bottom: 17, top: 5),
            color: Constants.transportColor1,
            child: SafeArea(
                bottom: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bus Tickets",
                      style: TextStyle(
                          color: Constants.transportHeading,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(CupertinoIcons.clear_circled))
                  ],
                )),
          ),
          Expanded(
            child: SafeArea(
              bottom: Platform.isAndroid,
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Where are you going?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Constants.transportHeading,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      oneWay = true;
                                    });
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.radio_button_checked_rounded,
                                          size: 18,
                                          color: oneWay
                                              ? Constants.transportColor2
                                              : const Color(0xff4D5559)
                                                  .withOpacity(0.5),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "One way",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Color(0xff4D5559),
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      oneWay = false;
                                    });
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.radio_button_checked_rounded,
                                          size: 18,
                                          color: !oneWay
                                              ? Constants.transportColor2
                                              : const Color(0xff4D5559)
                                                  .withOpacity(0.5),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Return trip",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Color(0xff4D5559),
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TransportInputField(
                            hintText: "From",
                            icon: Icons.location_on,
                            controller: locationFromController,
                            isLocationPicker: true,
                          ),
                          TransportInputField(
                            hintText: "To",
                            icon: Icons.location_on,
                            controller: locationFromController,
                            isLocationPicker: true,
                          ),
                          TransportInputField(
                            hintText: "Departure Date",
                            icon: Icons.location_on,
                            controller: locationFromController,
                            isLocationPicker: true,
                          ),
                          TransportInputField(
                            hintText: "Number of passengers",
                            icon: Icons.location_on,
                            controller: locationFromController,
                            isLocationPicker: true,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TransportInputButton(
                              label: "Search for Bus",
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (constext) =>
                                            TransportSearchResults()));
                              })
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xfff3f5f7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You can also expolore",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Constants.transportHeading,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 97,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.07),
                                              blurRadius: 10)
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    alignment: AlignmentDirectional.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                            height: 42,
                                            width: 42,
                                            image: AssetImage(
                                                "asset/images/transport-icon.png")),
                                        Text(
                                          "Bus Hire",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Constants.transportHeading,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.07),
                                              blurRadius: 10)
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                            height: 42,
                                            width: 42,
                                            image: AssetImage(
                                                "asset/images/transport-icon.png")),
                                        Text(
                                          "Bus-timetable",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Constants.transportHeading,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          Text(
                            "Recent searches",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Constants.transportHeading,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 210,
                              child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return TransportLocationCard(
                                    title: "Kisumu - Nairobi",
                                    date: "Thu, 24 Apr 2022",
                                    passengers: "5",
                                    image:
                                        "https://africanspicesafaris.com/wp-content/uploads/2020/06/hippo-point-day-trip-kisumu.gif",
                                  );
                                },
                              )),
                          const SizedBox(
                            height: 27,
                          ),
                          Text(
                            "Bus operators that trust us",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Constants.transportHeading,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 66,
                            child: Row(
                              children: [
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 66,
                            child: Row(
                              children: [
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 66,
                            child: Row(
                              children: [
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: BusOperatorsCard(
                                  logo:
                                      "https://logos-world.net/wp-content/uploads/2021/08/Daewoo-Logo-1978-1994.png",
                                )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color(0xff4D5559).withOpacity(0.4)),
                                  borderRadius: BorderRadius.circular(4)),
                              width: 150,
                              height: 40,
                              child: Text(
                                "Show more",
                                style: TextStyle(
                                    color: Constants.transportHeading,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          Text(
                            "Top Destinations",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Constants.transportHeading,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "These popular destinations are popular among travelers like you",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xff4D5559).withOpacity(0.8),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TransportCityCard(
                            name: "Kisumu City",
                            image:
                                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/eb/69/2c/integritour-day-tours.jpg?w=500&h=400&s=1",
                            details:
                                "Kisumu is a Kenyan port city on Lake Victoria",
                          ),
                          TransportCityCard(
                            name: "Mombasa City",
                            image:
                                "https://mediaim.expedia.com/localexpert/1063406/eb41b148-2934-4979-b94c-7be1755951e5.jpg?impolicy=resizecrop&rw=1005&rh=565",
                            details: "Mombasa is a coastal city in Kenya ",
                          ),
                          TransportCityCard(
                            name: "Nairobi City",
                            image:
                                "https://i.ytimg.com/vi/ofzQqJNEYBk/maxresdefault.jpg",
                            details: "Nairobi is Kenya’s capital city ",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color(0xff4D5559).withOpacity(0.4)),
                                  borderRadius: BorderRadius.circular(4)),
                              width: 150,
                              height: 40,
                              child: Text(
                                "See all",
                                style: TextStyle(
                                    color: Constants.transportHeading,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Text(
                            "We promise to deliver",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Constants.transportHeading,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TransportAdvantageCard(
                            title: "Unmatched Benefits",
                            image: "",
                            subtitle:
                                "We take care of your travel beyond ticketing by providing you with innovative and unique benefits.",
                          ),
                          TransportAdvantageCard(
                            title: "Customer Service",
                            image: "",
                            subtitle:
                                "We put our experience and relationships to good use and are available to solve your travel issues.",
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone: 0720 000 000",
                                  style: TextStyle(
                                      color: Constants.transportHeading,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                Text(
                                  "email: support@mbus.com",
                                  style: TextStyle(
                                      color: Constants.transportHeading,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          TransportAdvantageCard(
                            title: "Lowest Prices",
                            image: "",
                            subtitle:
                                "We always give you the lowest price with the best partner offers.",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
