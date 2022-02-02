import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/address_picker.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/widgets.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({Key? key}) : super(key: key);

  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  String countryCode = "254";
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFf8f9ff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
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
                      const Expanded(
                        child: Text(
                          'Your Order',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      onTap: () {},
                      minLeadingWidth: 0,
                      leading: const Icon(
                        CupertinoIcons.smallcircle_fill_circle_fill,
                        color: Color(0XFFF39bacd),
                        size: 30,
                      ),
                      title: const Text(
                        "Sender",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      "Joel Mwangi",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "0711305097",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "Caltext Building, Nairobi, Kenya",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      minLeadingWidth: 0,
                      contentPadding: const EdgeInsets.all(0),
                      onTap: () {},
                      leading: const Icon(
                        Icons.location_on_rounded,
                        color: Color(0XFFFbf157a),
                        size: 30,
                      ),
                      title: const Text(
                        "Recipient",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Color(0XFFFeceef0)),
                        ),
                      ),
                      child: TextField(
                        controller: name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat"),
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(0),
                            border: InputBorder.none,
                            hintText: "Name*",
                            hintStyle: TextStyle(
                                color: Color(0XFFFbdbfc1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat")),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 6, top: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Color(0XFFFeceef0)),
                        ),
                      ),
                      child: TextField(
                        controller: name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat"),
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(0),
                            border: InputBorder.none,
                            hintText: "Phone Number*",
                            hintStyle: TextStyle(
                                color: Color(0XFFFbdbfc1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat")),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Order details",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(
                      color: Color(0XFFFeceef0),
                      thickness: 1,
                      height: 10,
                    ),
                    TextField(
                      controller: name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat"),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type of item",
                          prefixIcon: Icon(
                            CupertinoIcons.cube_box_fill,
                            size: 20,
                          ),
                          hintStyle: TextStyle(
                              color: Color(0XFFFbdbfc1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat")),
                    ),
                    const Divider(
                      color: Color(0XFFFeceef0),
                      thickness: 1,
                      height: 0,
                    ),
                    TextField(
                      controller: name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat"),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a note to driver",
                          prefixIcon: Icon(
                            CupertinoIcons.text_alignleft,
                            size: 20,
                          ),
                          hintStyle: TextStyle(
                              color: Color(0XFFFbdbfc1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat")),
                    ),
                    const Divider(
                      color: Color(0XFFFeceef0),
                      thickness: 1,
                      height: 0,
                    ),
                    TextField(
                      controller: name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat"),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a delivery instructions",
                          prefixIcon: Icon(
                            Icons.mode_edit_outlined,
                            size: 20,
                          ),
                          hintStyle: TextStyle(
                              color: Color(0XFFFbdbfc1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat")),
                    ),
                    const Divider(
                      color: Color(0XFFFeceef0),
                      thickness: 1,
                      height: 0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                width: Constants.getWidth(context),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: "Total Weight",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                            children: [
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600),
                          )
                        ])),
                    ListTile(
                      onTap: () {},
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.add_chart,
                        color: Color(0XFFFc1c1c1),
                        size: 25,
                      ),
                      title: const Text("Add delivery instrustions",
                          style: TextStyle(
                              color: Color(0XFFFbdbfc1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat")),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color(0XFFFc1c1c1),
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: Constants.getWidth(context),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 10)
                    ]),
                child: InputButton(
                    label: "SAVE",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
