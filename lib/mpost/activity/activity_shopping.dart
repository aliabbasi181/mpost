import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class ActivityShopping extends StatefulWidget {
  const ActivityShopping({Key? key}) : super(key: key);

  @override
  _ActivityShoppingState createState() => _ActivityShoppingState();
}

class _ActivityShoppingState extends State<ActivityShopping> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: Constants.getWidth(context),
      color: Colors.teal,
      child: const Text("Shopping"),
    );
  }
}
