import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/otp_verify_login.dart';
import 'package:mpost/mpost/delivery/addPhoneNumber.dart';
import 'package:mpost/mpost/delivery/address_picker.dart';
import 'package:mpost/mpost/delivery/delivery_details.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/widgets.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String pickFrom = "", deliver = "";
  String pickupTime = "";
  String phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Constants.getHeight(context) * 0.83,
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20),
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
                                    'Delivery',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const Image(
                                    width: 30,
                                    image: AssetImage(
                                        "asset/images/location_history.png"))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              onTap: () async {
                                try {
                                  pickFrom = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddressPicker()));
                                } catch (ex) {}
                                setState(() {});
                              },
                              leading: const Icon(
                                CupertinoIcons.smallcircle_fill_circle_fill,
                                color: Color(0XFFF39bacd),
                                size: 30,
                              ),
                              title: Text(
                                pickFrom.isEmpty
                                    ? "Pick up item at?"
                                    : pickFrom,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0XFFF80868a),
                                    fontSize: 16,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 30,
                              ),
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              onTap: () async {
                                try {
                                  deliver = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddressPicker()));
                                } catch (ex) {}
                                setState(() {});
                              },
                              leading: const Icon(
                                Icons.location_on_rounded,
                                color: Color(0XFFFbf157a),
                                size: 30,
                              ),
                              title: Text(
                                deliver.isEmpty ? "Deliver to?" : deliver,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0XFFF80868a),
                                    fontSize: 16,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              width: Constants.getWidth(context),
                              child: const Center(child: Text("Map")),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DeliveryDetails()));
                              },
                              title: const Text(
                                "Your order",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  "Delivery details",
                                  style: TextStyle(
                                      color: Color(0XFFF80868a),
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 30,
                              ),
                            ),
                            const Divider(
                              color: Color(0XFFFeceef0),
                              thickness: 1.5,
                              height: 15,
                            ),
                            ListTile(
                              onTap: () async {
                                try {
                                  pickupTime = await showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return SafeArea(
                                          bottom: false,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: Constants.getHeight(
                                                        context) *
                                                    0.6),
                                            width: Constants.getWidth(context),
                                            height:
                                                Constants.getHeight(context),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            child: const TimePicker(),
                                          ),
                                        );
                                      });
                                  print(pickupTime);
                                  setState(() {});
                                } catch (ex) {}
                              },
                              title: Text(
                                pickupTime.isEmpty ? "Pickup time" : pickupTime,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  "As soon as possible",
                                  style: TextStyle(
                                      color: Color(0XFFF80868a),
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 30,
                              ),
                            ),
                            const Divider(
                              color: Color(0XFFFeceef0),
                              thickness: 1.5,
                              height: 15,
                            ),
                            ListTile(
                              onTap: () async {
                                try {
                                  phone = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddPhoneNumber()));
                                  setState(() {});
                                } catch (ex) {}
                              },
                              title: Text(
                                phone.isEmpty ? "Add your phone number" : phone,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  "In case we need to contact you about your package",
                                  style: TextStyle(
                                      color: Color(0XFFF80868a),
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 30,
                              ),
                            ),
                            const Divider(
                              color: Color(0XFFFeceef0),
                              thickness: 1.5,
                              height: 15,
                            ),
                            const ListTile(
                              title: Text(
                                "Total",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Text(
                                "KSH 400",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: InputButton(
                  label: "CONFIRM ORDER",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  Color optionColor = Color(0XFFFbdbfc1);
  bool today = true, tomorrow = false;
  String selection = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        height: Constants.getHeight(context) * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Schedule a time',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'As soon as possible',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Constants.descriptionColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Color(0XFFFeceef0),
              thickness: 1,
              height: 0,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  today = true;
                  tomorrow = false;
                  selection = "Today | 16:00 - 17:00";
                });
              },
              selectedTileColor: Colors.amberAccent,
              leading: Text(
                'Today',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: today ? Colors.black : optionColor),
              ),
              trailing: Text(
                '16:00 - 17:00',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: today ? Colors.black : optionColor),
              ),
            ),
            const Divider(
              color: Color(0XFFFeceef0),
              thickness: 1,
              height: 0,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  today = false;
                  tomorrow = true;
                  selection = "Tomorrow | 16:00 - 17:00";
                });
              },
              leading: Text(
                'Tomorrow',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: tomorrow ? Colors.black : optionColor),
              ),
              trailing: Text(
                '16:00 - 17:00',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: tomorrow ? Colors.black : optionColor),
              ),
            ),
            const Divider(
              color: Color(0XFFFeceef0),
              thickness: 1,
              height: 0,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, "");
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, selection);
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
