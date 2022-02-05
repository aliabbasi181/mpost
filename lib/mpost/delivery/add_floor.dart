import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class AddFloor extends StatefulWidget {
  String text;
  AddFloor({Key? key, required this.text}) : super(key: key);

  @override
  _AddFloorState createState() => _AddFloorState();
}

class _AddFloorState extends State<AddFloor> {
  TextEditingController floor = TextEditingController();
  @override
  initState() {
    floor.text = widget.text;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
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
                            Navigator.pop(context, floor);
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
                        controller: floor,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat"),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              CupertinoIcons.home,
                              size: 25,
                              color: Color(0XFFFbdbfc1),
                            ),
                            border: InputBorder.none,
                            hintText: "Floor, door, etc",
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
                    floor.text.isNotEmpty
                        ? Navigator.pop(context, floor.text)
                        : null;
                  },
                  child: Container(
                    width: Constants.getWidth(context),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: floor.text.isNotEmpty
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
