import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/confirm_address.dart';

class AddBuilding extends StatefulWidget {
  String text;
  AddBuilding({Key? key, required this.text}) : super(key: key);

  @override
  _AddBuildingState createState() => _AddBuildingState();
}

class _AddBuildingState extends State<AddBuilding> {
  TextEditingController building = TextEditingController();
  @override
  initState() {
    building.text = widget.text;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: Constants.getHeight(context),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context, building.text);
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
                            'Add address details',
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Add a building or a landmark.',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Constants.descriptionColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: Color(0XFFFfcfcfc),
                          border:
                              Border.all(color: Color(0XFFFefefef), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: building,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat"),
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              CupertinoIcons.building_2_fill,
                              size: 25,
                              color: Color(0XFFFbdbfc1),
                            ),
                            border: InputBorder.none,
                            hintText: "Building, landmark",
                            hintStyle: TextStyle(
                                color: Color(0XFFFbdbfc1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat")),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    building.text.isNotEmpty
                        ? Navigator.pop(context, building.text)
                        : null;
                  },
                  child: Container(
                    width: Constants.getWidth(context),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: building.text.isNotEmpty
                            ? const Color(0XFFF1482be)
                            : Constants.descriptionColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "CONTINUE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
