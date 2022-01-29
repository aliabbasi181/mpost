import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Activity Screen",
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      ),
    );
  }
}
