import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class ActivityTransport extends StatefulWidget {
  const ActivityTransport({Key? key}) : super(key: key);

  @override
  _ActivityTransportState createState() => _ActivityTransportState();
}

class _ActivityTransportState extends State<ActivityTransport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: Constants.getWidth(context),
      color: Colors.lightBlue,
      child: const Text("transport"),
    );
  }
}
