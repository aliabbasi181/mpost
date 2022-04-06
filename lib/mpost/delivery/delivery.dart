import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/mpost/delivery/delivered_packages.dart';
import 'package:mpost/mpost/delivery/post_delivery.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class DeliveryHome extends StatefulWidget {
  const DeliveryHome({Key? key}) : super(key: key);

  @override
  State<DeliveryHome> createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
  String location = "";
  @override
  void initState() {
    _getAddress();
    super.initState();
  }

  _getAddress() async {
    final applicationBloc =
        Provider.of<ApplicaitonBloc>(context, listen: false);
    await applicationBloc.getUserLocation();
    List<Address> addresses = await applicationBloc.getAddress(
        applicationBloc.userLocation.latitude,
        applicationBloc.userLocation.longitude);
    var data = addresses.first.address.split(' ');
    location = "";
    for (var item in data) {
      if (!item.contains("1800")) {
        location += item + " ";
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
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
                      child: Image(
                          height: 18,
                          width: 63,
                          image:
                              AssetImage("asset/images/mpost_blue_logo.png"))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DeliveredPackages()));
                    },
                    child: const Image(
                        width: 30,
                        image: AssetImage("asset/images/location_history.png")),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.2),
              thickness: 0.5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        height: 22,
                        width: 22,
                        image: AssetImage("asset/images/mylocation-icon.png"),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your current location",
                              style: const TextStyle(
                                  color: Color(0XFF808689),
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              location.isEmpty
                                  ? "Fetching location..."
                                  : location,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Color(0XFF212121),
                                  fontSize: 15,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: 182,
                    width: Constants.getWidth(context),
                    decoration: BoxDecoration(
                        color: const Color(0xffFFCE82),
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Image(
                            image:
                                AssetImage("asset/images/banner-bg-image.png"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 172,
                            width: 130,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "asset/images/delivery_man.png"))),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 20, 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Super fast",
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              wellcomeDialog(context));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 3, bottom: 2),
                                      padding:
                                          const EdgeInsets.fromLTRB(7, 3, 7, 3),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        const Color(0xff187bb2),
                                        const Color(0xffcd2631),
                                      ])),
                                      child: const Text(
                                        "deliveries",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.fast_forward_rounded,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Mpost tap a delivery",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 8),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "You can now send any package with using Mpost Tap a delivery",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputButton(
                      label: "I want to send a package",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PostDelivery()));
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.11),
                              blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                          child: const Text(
                            "Offer!! Pick a delivery package",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color(0xff808689),
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          thickness: 0.5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ksh 1000",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "Get 10 deliveries",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0XFFFc1c1c1),
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                thickness: 0.5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ksh 1000",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "Get 10 deliveries",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0XFFFc1c1c1),
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                thickness: 0.5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ksh 1000",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "Get 10 deliveries",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0XFFFc1c1c1),
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.11),
                              blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                          child: const Text(
                            "Current Package",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color(0xff808689),
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          thickness: 0.5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: const Text(
                                      "Ksh 1000",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(18, 5, 18, 5),
                                    decoration: BoxDecoration(
                                        color: Color(0xff18B284),
                                        borderRadius: BorderRadius.circular(2)),
                                    child: const Text(
                                      "Track",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 6,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        color: Constants.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  Container(
                                    height: 6,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        color: Constants.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  Container(
                                    height: 6,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xff0175B2).withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  Container(
                                    height: 6,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xff0175B2).withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Image(
                                      width: 21,
                                      height: 14,
                                      image: AssetImage(
                                          "asset/images/truck_delivery_icon.png")),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    "Out of delivery",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.info_outline_rounded,
                                    size: 15,
                                    color: const Color(0xff9FA3A6),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    "ETA 30min",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.11),
                              blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                          child: const Text(
                            "Recent Packages",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color(0xff808689),
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          thickness: 0.5,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    height: 40,
                                    width: 40,
                                    image: AssetImage(
                                        "asset/images/documents-icon.png"),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Sat, May 23, 02:30 PM",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "#614251D",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0XFFFc1c1c1),
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                thickness: 0.5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Image(
                                    height: 40,
                                    width: 40,
                                    image: AssetImage(
                                        "asset/images/food-icon.png"),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Fri, May 08, 12:34 PM",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "#614251D",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0XFFFc1c1c1),
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                thickness: 0.5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Image(
                                    height: 40,
                                    width: 40,
                                    image: AssetImage(
                                        "asset/images/clothing-icon.png"),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Thu, May 05, 02:30 PM",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "#614251D",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0XFFFc1c1c1),
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                thickness: 0.5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Image(
                                    height: 40,
                                    width: 40,
                                    image: AssetImage(
                                        "asset/images/fragile-icon.png"),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Mon, May 01, 02:30 PM",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "#614251D",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0XFFFc1c1c1),
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                thickness: 0.5,
                              ),
                              InkWell(
                                onTap: () {
                                  print("Loading more");
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 12),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Load more",
                                          style: const TextStyle(
                                              color: Color(0xff9FA3A6),
                                              fontSize: 11,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Color(0XFFFc1c1c1),
                                          size: 20,
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
