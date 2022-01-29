import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        "Delivery Screen",
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 20),
      ),
    ));
  }
}
