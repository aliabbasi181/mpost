import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/delivery.dart';
import 'package:mpost/mpost/activity/single_scheduled_delivery.dart';
import 'package:provider/provider.dart';

class ActivityDeliveries extends StatefulWidget {
  const ActivityDeliveries({Key? key}) : super(key: key);

  @override
  _ActivityDeliveriesState createState() => _ActivityDeliveriesState();
}

class _ActivityDeliveriesState extends State<ActivityDeliveries> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    //applicationBloc.getMyDeliveries();
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
              if (applicationBloc.deliveries.length == 0) {
                return;
              }
              applicationBloc.deliveries.length > 1
                  ? showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return SafeArea(
                          bottom: false,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: ScheduledDeliveriesList(
                              deliveries: applicationBloc.deliveries,
                            ),
                          ),
                        );
                      })
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleScheduledDelivery(
                                deliveryDetail:
                                    applicationBloc.deliveries.first,
                              )));
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
                children: [
                  const Expanded(
                    child: Text("Scheduled booking",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            color: Color(0XFFF808689),
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0XFFFBE157A)),
                    child: Text(applicationBloc.deliveries.length.toString(),
                        style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
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

class ScheduledDeliveriesList extends StatefulWidget {
  List<DeliveryModel> deliveries;
  ScheduledDeliveriesList({Key? key, required this.deliveries})
      : super(key: key);

  @override
  _ScheduledDeliveriesListState createState() =>
      _ScheduledDeliveriesListState();
}

class _ScheduledDeliveriesListState extends State<ScheduledDeliveriesList> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    //applicationBloc.getMyDeliveries();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        // height: Constants.getHeight(context) * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Scheduled bookings',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              height: Constants.getHeight(context) * 0.45,
              child: ListView.builder(
                  itemCount: widget.deliveries.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            minLeadingWidth: 0,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SingleScheduledDelivery(
                                              deliveryDetail:
                                                  widget.deliveries[index])));
                            },
                            title: const Text(
                              "Package type",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  color: Color(0XFFF808689),
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              widget.deliveries[index].itemType.toString(),
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Color(0XFFF8D8D92),
                              size: 20,
                            )),
                        const Divider(
                          color: Color.fromRGBO(237, 238, 240, 0.5),
                          thickness: 1,
                          height: 0,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
