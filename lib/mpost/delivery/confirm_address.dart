import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class ConfirmAddress extends StatefulWidget {
  const ConfirmAddress({Key? key}) : super(key: key);

  @override
  _ConfirmAddressState createState() => _ConfirmAddressState();
}

class _ConfirmAddressState extends State<ConfirmAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: Constants.getWidth(context),
            height: Constants.getHeight(context),
            color: Colors.amber,
            child: const Center(
              child: Text("Confirm Address MAP"),
            ),
          ),
          Container(
            width: Constants.getWidth(context),
            height: Constants.getHeight(context) * 0.40,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 30, spreadRadius: 10)
                ]),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Kilimani Road",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "Nairobi, Kenya",
                      style: TextStyle(
                          color: Color(0XFFF80868a),
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0XFFFc1c1c1),
                      size: 30,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFFeceef0),
                    thickness: 1,
                    height: 0,
                  ),
                  ListTile(
                    onTap: () {},
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Building, Landmark",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "Missing Details",
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0XFFFc1c1c1),
                      size: 30,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFFeceef0),
                    thickness: 1,
                    height: 0,
                  ),
                  ListTile(
                    onTap: () {},
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Floor, door, etc",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "Missing Details",
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0XFFFc1c1c1),
                      size: 30,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFFeceef0),
                    thickness: 1,
                    height: 0,
                  ),
                  ListTile(
                    onTap: () {},
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Kilimani Road",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text(
                      "Nairobi, Kenya",
                      style: TextStyle(
                          color: Color(0XFFF80868a),
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0XFFFc1c1c1),
                      size: 30,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFFeceef0),
                    thickness: 1,
                    height: 0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
