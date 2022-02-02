import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/confirm_address.dart';
import 'package:mpost/widgets.dart';

class AddressPicker extends StatefulWidget {
  const AddressPicker({Key? key}) : super(key: key);

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
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
              child: Text("MAP"),
            ),
          ),
          Container(
            width: Constants.getWidth(context),
            height: Constants.getHeight(context) * 0.35,
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 30, spreadRadius: 10)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add a pick-up address',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return SafeArea(
                            bottom: false,
                            child: Container(
                              margin: const EdgeInsets.only(top: 50),
                              width: Constants.getWidth(context),
                              height: Constants.getHeight(context),
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Container(
                                child: MyBottomSheet(),
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                      width: Constants.getWidth(context),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0XFFFefefef)),
                          color: const Color(0XFFFfcfcfc),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Icon(CupertinoIcons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search street, city, district",
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0XFFFbdbfc1),
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
                ListTile(
                  onTap: () {},
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    child: const Image(
                        width: 30,
                        image: AssetImage(
                            "asset/images/use_my_location_icon.png")),
                  ),
                  title: Text(
                    'Use current location',
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      'Search Location',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
                decoration: BoxDecoration(
                    color: Color(0XFFFfcfcfc),
                    border: Border.all(color: Color(0XFFFefefef), width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: searchController,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat"),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        size: 25,
                        color: Color(0XFFFbdbfc1),
                      ),
                      border: InputBorder.none,
                      hintText: "Search street, city, district",
                      hintStyle: TextStyle(
                          color: Color(0XFFFbdbfc1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat")),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfirmAddress()));
                },
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  child: const Icon(Icons.location_on_rounded,
                      color: Color(0XFFF80868a)),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0XFFFefefef),
                      borderRadius: BorderRadius.circular(100)),
                ),
                title: const Text(
                  "Kilimani Mall",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "Tigoni Road, Nairobi, Kenya",
                    style: TextStyle(
                        color: Color(0XFFF80868a),
                        fontSize: 12,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Divider(
                color: Color(0XFFFeceef0),
                thickness: 1,
                height: 5,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  child: const Icon(Icons.location_on_rounded,
                      color: Color(0XFFF80868a)),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0XFFFefefef),
                      borderRadius: BorderRadius.circular(100)),
                ),
                title: const Text(
                  "Kilimani Police Station",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "Jabavu Road, Nairobi, Kenya",
                    style: TextStyle(
                        color: Color(0XFFF80868a),
                        fontSize: 12,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Divider(
                color: Color(0XFFFeceef0),
                thickness: 1,
                height: 5,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  child: const Icon(Icons.location_on_rounded,
                      color: Color(0XFFF80868a)),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0XFFFefefef),
                      borderRadius: BorderRadius.circular(100)),
                ),
                title: const Text(
                  "Kilimani Primary School",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "Argwings Kodhek Road, Nairobi, Kenya",
                    style: TextStyle(
                        color: Color(0XFFF80868a),
                        fontSize: 12,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Divider(
                color: Color(0XFFFeceef0),
                thickness: 1,
                height: 5,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  child: const Icon(Icons.location_on_rounded,
                      color: Color(0XFFF80868a)),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0XFFFefefef),
                      borderRadius: BorderRadius.circular(100)),
                ),
                title: const Text(
                  "Kilimani Road",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    "Nairobi, Kenya",
                    style: TextStyle(
                        color: Color(0XFFF80868a),
                        fontSize: 12,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Divider(
                color: Color(0XFFFeceef0),
                thickness: 1,
                height: 5,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
