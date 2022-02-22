import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class ActivityEvents extends StatefulWidget {
  const ActivityEvents({Key? key}) : super(key: key);

  @override
  _ActivityEventsState createState() => _ActivityEventsState();
}

class _ActivityEventsState extends State<ActivityEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: Constants.getWidth(context),
      color: Colors.green,
      child: const Text("Events"),
    );
  }
}
