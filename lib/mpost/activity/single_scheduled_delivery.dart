import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/delivery.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/payment/choose_payment.dart';
import 'package:provider/provider.dart';

class SingleScheduledDelivery extends StatefulWidget {
  DeliveryModel deliveryDetail;
  SingleScheduledDelivery({Key? key, required this.deliveryDetail})
      : super(key: key);

  @override
  _SingleScheduledDeliveryState createState() =>
      _SingleScheduledDeliveryState();
}

class _SingleScheduledDeliveryState extends State<SingleScheduledDelivery> {
  @override
  void initState() {
    print(widget.deliveryDetail.paymentRequestId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0XFFFE5E5E5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 5),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Scheduled booking',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: Constants.getHeight(context) * 0.84,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  width: Constants.getWidth(context),
                  //height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(136, 21, 190, 0.1)),
                          child: const Icon(
                            CupertinoIcons.cube_box_fill,
                            color: Color(0XFFF1C282F),
                            size: 25,
                          ),
                        ),
                        title: const Text(
                          "Package delivery type",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFFF808689),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          widget.deliveryDetail.itemType.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          try {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return SafeArea(
                                    bottom: false,
                                    child: Container(
                                      // margin: EdgeInsets.only(
                                      //     top: Constants.getHeight(context) *
                                      //         0.6),
                                      width: Constants.getWidth(context),
                                      height: Constants.getHeight(context),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      child: DeliveryViewDetails(
                                        deliveryDetails: widget.deliveryDetail,
                                      ),
                                    ),
                                  );
                                });
                            setState(() {});
                          } catch (ex) {}
                        }),
                        child: Container(
                          width: Constants.getWidth(context),
                          padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                            color: Color(0XFFFE2E2E2),
                          ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("View details",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.w600)),
                              const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0XFFF8D8D92),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                paymentStatus(context, widget.deliveryDetail),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: Constants.getWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Point to point delivery",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 12,
                                    color: Color(0XFFF808689),
                                    fontWeight: FontWeight.w500)),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              minLeadingWidth: 0,
                              onTap: () async {},
                              leading: const Icon(
                                CupertinoIcons.smallcircle_fill_circle_fill,
                                color: Color(0XFFF70C6F4),
                                size: 20,
                              ),
                              title: Text(
                                widget.deliveryDetail.pickupAddress!
                                    .detailedAddress
                                    .toString(),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0XFFF1C282F),
                                    fontSize: 13,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Text(
                                "10:00 AM",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0XFFF1C282F),
                                    fontSize: 10,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              minLeadingWidth: 0,
                              onTap: () async {},
                              leading: const Icon(
                                Icons.location_on_rounded,
                                color: Color(0XFFFBE157A),
                                size: 20,
                              ),
                              title: Text(
                                widget.deliveryDetail.deliveryAddress!
                                    .detailedAddress
                                    .toString(),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0XFFF1C282F),
                                    fontSize: 13,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Text(
                                "11:00 AM",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0XFFF1C282F),
                                    fontSize: 10,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryViewDetails extends StatefulWidget {
  DeliveryModel deliveryDetails;
  DeliveryViewDetails({Key? key, required this.deliveryDetails})
      : super(key: key);

  @override
  _DeliveryViewDetailsState createState() => _DeliveryViewDetailsState();
}

class _DeliveryViewDetailsState extends State<DeliveryViewDetails> {
  String time = "";
  @override
  initState() {
    var d = widget.deliveryDetails.createdAt.toString().split('T');
    var t = d[1].split('.')[0];
    time = d[0] + " | " + t;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Details',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 27,
            ),
            const Text(
              "Package type",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  color: Color(0XFFF808689),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              widget.deliveryDetails.itemType.toString(),
              style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 17,
            ),
            const Text(
              "Booked time",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  color: Color(0XFFF808689),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              time,
              style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 17,
            ),
            const Text(
              "Add a note to driver",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  color: Color(0XFFF808689),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              widget.deliveryDetails.note.toString(),
              style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

pendingPayment(BuildContext context, DeliveryModel delivery) {
  final applicationBloc = Provider.of<ApplicaitonBloc>(context);
  return Container(
    width: Constants.getWidth(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Status",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0XFFF8D8D92),
                      fontWeight: FontWeight.w500)),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0XFFFBE6615)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(delivery.status!.name.toString(),
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          color: Color(0XFFF1C282F),
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const Text("Payment method",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0XFFF8D8D92),
                      fontWeight: FontWeight.w500)),
              const Text("Mpesa",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: Color(0XFFF1C282F),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Container(
          width: Constants.getWidth(context),
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Color(0XFFFE2E2E2),
          ))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Text("Ksh ${delivery.paymentRequest?.balance.toString()}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await applicationBloc.checkConnection(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosePayment(
                              cost: delivery.paymentRequest!.balance.toString(),
                              isDelivery: false,
                              id: delivery.paymentRequestId.toString())));
                },
                child: Container(
                  width: Constants.getWidth(context),
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: const Text("Initiate payment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Constants.primaryColor),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

sucessPayment(BuildContext context, DeliveryModel delivery) {
  return Container(
    width: Constants.getWidth(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Status",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0XFFF8D8D92),
                      fontWeight: FontWeight.w500)),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0XFFF18B284)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(delivery.status!.name.toString(),
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          color: Color(0XFFF1C282F),
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const Text("Payment method",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0XFFF8D8D92),
                      fontWeight: FontWeight.w500)),
              Text("MPesa",
                  style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: Color(0XFFF1C282F),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Container(
          width: Constants.getWidth(context),
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Color(0XFFFE2E2E2),
          ))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Text("Ksh ${delivery.paymentRequest!.balance.toString()}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              // Container(
              //   width: Constants.getWidth(context),
              //   padding: const EdgeInsets.only(top: 15, bottom: 15),
              //   child: const Text("Initiate payment",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           fontFamily: "Montserrat",
              //           fontSize: 14,
              //           color: Colors.white,
              //           fontWeight: FontWeight.w600)),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(6),
              //       color: Constants.primaryColor),
              // )
            ],
          ),
        ),
      ],
    ),
  );
}

failedPayment(BuildContext context, DeliveryModel delivery) {
  return Container(
    width: Constants.getWidth(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Status",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0XFFF8D8D92),
                      fontWeight: FontWeight.w500)),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0XFFF18B284)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(delivery.status!.name.toString(),
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          color: Color(0XFFF1C282F),
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const Text("Payment method",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0XFFF8D8D92),
                      fontWeight: FontWeight.w500)),
              const Text("Mpesa",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: Color(0XFFF1C282F),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Container(
          width: Constants.getWidth(context),
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Color(0XFFFE2E2E2),
          ))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Text("Ksh ${delivery.paymentRequest!.balance.toString()}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              // Container(
              //   width: Constants.getWidth(context),
              //   padding: const EdgeInsets.only(top: 15, bottom: 15),
              //   child: const Text("Initiate payment",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           fontFamily: "Montserrat",
              //           fontSize: 14,
              //           color: Colors.white,
              //           fontWeight: FontWeight.w600)),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(6),
              //       color: Constants.primaryColor),
              // )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget paymentStatus(BuildContext context, DeliveryModel delivery) {
  switch (delivery.status!.id) {
    case "3":
      return sucessPayment(context, delivery);
    case "5":
      return pendingPayment(context, delivery);
    case "13":
      return failedPayment(context, delivery);
    default:
      return const SizedBox();
  }
}
