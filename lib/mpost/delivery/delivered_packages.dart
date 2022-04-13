import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/delivery.dart';

class DeliveredPackages extends StatefulWidget {
  const DeliveredPackages({Key? key}) : super(key: key);

  @override
  State<DeliveredPackages> createState() => _DeliveredPackagesState();
}

class _DeliveredPackagesState extends State<DeliveredPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(22),
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
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        'Packages',
                        style: TextStyle(
                            fontFamily: "Packages",
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                color: Color.fromRGBO(0, 0, 0, 0.15),
                thickness: 0.3,
              ),
              Container(
                height: Constants.getHeight(context) * 0.80,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return DeliveryPackageCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryPackageCard extends StatefulWidget {
  const DeliveryPackageCard({Key? key}) : super(key: key);

  @override
  State<DeliveryPackageCard> createState() => _DeliveryPackageCardState();
}

class _DeliveryPackageCardState extends State<DeliveryPackageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.11), blurRadius: 5),
            ],
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                children: [
                  Image(
                    height: 40,
                    width: 40,
                    image: AssetImage("asset/images/clothing-icon.png"),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Documents",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "Thu, May 05, 02:30 PM",
                          style: const TextStyle(
                              color: Color(0xff9FA3A6),
                              fontSize: 11,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "KES 300.00",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: Color.fromRGBO(0, 0, 0, 0.15),
              thickness: 0.3,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        height: 24,
                        width: 24,
                        image: AssetImage("asset/images/mylocation-icon.png"),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Picked at 4:45 PM",
                              style: const TextStyle(
                                  color: Color(0xff9FA3A6),
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              "Avenue Building, Kimathi Street ",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Color(0XFFFbf157a),
                        size: 25,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Picked at 4:45 PM",
                              style: const TextStyle(
                                  color: Color(0xff9FA3A6),
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              "Avenue Building, Kimathi Street ",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: Color.fromRGBO(0, 0, 0, 0.15),
              thickness: 0.3,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image(
                          width: 19,
                          height: 19,
                          image:
                              AssetImage("asset/images/tick-cirlce-icon.png")),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        "Delivered",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                    decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(2)),
                    child: const Text(
                      "Repeat",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
