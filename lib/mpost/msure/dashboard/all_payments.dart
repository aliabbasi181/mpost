import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/MsureModels/payments/MsurePaymentOverviewModel.dart';
import 'package:mpost/mpost/msure/dashboard/msure_dashboard.dart';

class MsureDashboardAllPayments extends StatefulWidget {
  List<MsurePaymentOverviewModel> payments;
  MsureDashboardAllPayments({Key? key, required this.payments})
      : super(key: key);

  @override
  State<MsureDashboardAllPayments> createState() =>
      _MsureDashboardAllPaymentsState();
}

class _MsureDashboardAllPaymentsState extends State<MsureDashboardAllPayments> {
  List<MsurePaymentOverviewModel> payments = [];
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
                  "All payments",
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
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          width: Constants.getWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payments",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              RichText(
                  text: TextSpan(
                text: "Tabulations of all payments made",
                style: TextStyle(
                    height: 1.5,
                    color: const Color(0xff808689),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )),
              Expanded(
                  child: SafeArea(
                top: false,
                bottom: Platform.isAndroid,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: widget.payments.length,
                  itemBuilder: (context, index) {
                    return MsurePaymentTile(
                      payment: widget.payments[index],
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      )
    ]));
  }
}
