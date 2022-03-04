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
      height: Constants.getHeight(context) * 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Coming soon!",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            Text(
              "Stay tuned to this. We are launching soon.",
              style: TextStyle(
                  height: 1.5,
                  color: Constants.descriptionColor,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
