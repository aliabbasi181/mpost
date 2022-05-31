import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class MPOSTInsuranceAddCover extends StatefulWidget {
  const MPOSTInsuranceAddCover({Key? key}) : super(key: key);

  @override
  State<MPOSTInsuranceAddCover> createState() => _MPOSTInsuranceAddCoverState();
}

class _MPOSTInsuranceAddCoverState extends State<MPOSTInsuranceAddCover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 17, top: 5),
        color: Constants.msureRed,
        child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  "Add cover",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ],
            )),
      ),
      Expanded(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add cover",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: Constants.msureRed.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: const Color(0xffD8364D),
                        size: 30,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Service not available",
                        style: TextStyle(
                            color: const Color(0xffD8364D),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "This future of our product is not yet available, watch this space for more exciting insurance benefits",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ))
    ]));
  }
}
