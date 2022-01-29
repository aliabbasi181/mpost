import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        "Profile Screen",
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
