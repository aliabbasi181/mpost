import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/activity/single_scheduled_delivery.dart';

class ActivityDeliveries extends StatefulWidget {
  const ActivityDeliveries({Key? key}) : super(key: key);

  @override
  _ActivityDeliveriesState createState() => _ActivityDeliveriesState();
}

class _ActivityDeliveriesState extends State<ActivityDeliveries> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Constants.getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Constants.getWidth(context),
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: const Text(
              "Ongoing",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SingleScheduledDelivery()));
            },
            child: Container(
              width: Constants.getWidth(context),
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color(0XFFFE2E2E2), width: 13))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Scheduled booking",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          color: Color(0XFFF808689),
                          fontWeight: FontWeight.w600)),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Color(0XFFF8D8D92),
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          // Container(
          //   width: Constants.getWidth(context),
          //   padding: const EdgeInsets.all(18),
          //   decoration: const BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Color(0XFFFE2E2E2)))),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [
          //       Text("Rider on the way to sender",
          //           style: TextStyle(
          //               fontFamily: "Montserrat",
          //               fontSize: 14,
          //               color: Color(0XFFF808689),
          //               fontWeight: FontWeight.w600)),
          //       Icon(
          //         Icons.keyboard_arrow_right_rounded,
          //         color: Color(0XFFF8D8D92),
          //         size: 20,
          //       )
          //     ],
          //   ),
          // ),
          // Container(
          //   width: Constants.getWidth(context),
          //   padding: const EdgeInsets.all(18),
          //   decoration: const BoxDecoration(
          //       border: Border(bottom: BorderSide(color: Color(0XFFFE2E2E2)))),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [
          //       Text("Item(s) picked up",
          //           style: TextStyle(
          //               fontFamily: "Montserrat",
          //               fontSize: 14,
          //               color: Color(0XFFF808689),
          //               fontWeight: FontWeight.w600)),
          //       Icon(
          //         Icons.keyboard_arrow_right_rounded,
          //         color: Color(0XFFF8D8D92),
          //         size: 20,
          //       )
          //     ],
          //   ),
          // ),
          // Container(
          //   width: Constants.getWidth(context),
          //   padding: const EdgeInsets.all(18),
          //   decoration: const BoxDecoration(
          //       border: Border(
          //           bottom: BorderSide(color: Color(0XFFFE2E2E2), width: 13))),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [
          //       Text("Driver on the way to recipient",
          //           style: TextStyle(
          //               fontFamily: "Montserrat",
          //               fontSize: 14,
          //               color: Color(0XFFF808689),
          //               fontWeight: FontWeight.w600)),
          //       Icon(
          //         Icons.keyboard_arrow_right_rounded,
          //         color: Color(0XFFF8D8D92),
          //         size: 20,
          //       )
          //     ],
          //   ),
          // ),
          Container(
            width: Constants.getWidth(context),
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0XFFFE2E2E2)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Past",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0XFFF8D8D92),
                  size: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
