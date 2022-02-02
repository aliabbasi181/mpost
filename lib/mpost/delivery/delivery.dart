import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/otp_verify_login.dart';
import 'package:mpost/mpost/delivery/address_picker.dart';
import 'package:mpost/mpost/delivery/delivery_details.dart';
import 'package:mpost/widgets.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String countryCode = "254";
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddressPicker()));
                        },
                        leading: const Icon(
                          CupertinoIcons.smallcircle_fill_circle_fill,
                          color: Color(0XFFF39bacd),
                          size: 30,
                        ),
                        title: const Text(
                          "Pick up item at?",
                          style: TextStyle(
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddressPicker()));
                        },
                        leading: const Icon(
                          Icons.location_on_rounded,
                          color: Color(0XFFFbf157a),
                          size: 30,
                        ),
                        title: const Text(
                          "Deliver to?",
                          style: TextStyle(
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
                      const ListTile(
                        title: Text(
                          "Pickup time",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Padding(
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
                        trailing: Icon(
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
                          "Add your phone number",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Padding(
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
                        trailing: Icon(
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
                  const SizedBox(
                    height: 40,
                  ),
                  InputButton(
                      label: "CONFIRM ORDER",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPVerifyLogin(
                                    phone: "$countryCode ${phone.text}")));
                      })
                ],
              )),
        ),
      ),
    );
  }
}
