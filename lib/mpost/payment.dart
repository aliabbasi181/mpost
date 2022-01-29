import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        "Payment Screen",
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
