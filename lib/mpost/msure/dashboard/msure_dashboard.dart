import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/dashboard/all_payments.dart';

class MsureDashboard extends StatefulWidget {
  const MsureDashboard({Key? key}) : super(key: key);

  @override
  State<MsureDashboard> createState() => _MsureDashboardState();
}

class _MsureDashboardState extends State<MsureDashboard> {
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
                  "Dashboard",
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
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              RichText(
                  text: TextSpan(
                text: "See below  overview analytics.",
                style: TextStyle(
                    height: 1.5,
                    color: const Color(0xff808689),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.11), blurRadius: 10)
                    ]),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payments Overview",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        InkWell(
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoActionSheet(
                                    actions: [
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context, "Male");
                                          },
                                          child: Text(
                                            "Daily",
                                            style: TextStyle(
                                                color:
                                                    Constants.transportHeading,
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context, "Female");
                                          },
                                          child: Text(
                                            "Monthly",
                                            style: TextStyle(
                                                color:
                                                    Constants.transportHeading,
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context, "Female");
                                          },
                                          child: Text(
                                            "Yearly",
                                            style: TextStyle(
                                                color:
                                                    Constants.transportHeading,
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Close",
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontFamily: "Montserrat",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Text(
                                "Monthly",
                                style: TextStyle(
                                    fontFamily: "Motnserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 300,
                      width: Constants.getWidth(context),
                      child: LineChart(
                        LineChartData(
                            minX: 1,
                            maxX: 5,
                            maxY: 5,
                            minY: 1,
                            gridData: FlGridData(
                                drawHorizontalLine: true,
                                drawVerticalLine: false),
                            borderData: FlBorderData(show: false),
                            titlesData: FlTitlesData(
                                show: true,
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          switch (value.toDouble().toString()) {
                                            case "1.0":
                                              return MsureDashGraphTitle(
                                                  title: "1K");
                                            case "2.0":
                                              return MsureDashGraphTitle(
                                                  title: "2K");
                                            case "3.0":
                                              return MsureDashGraphTitle(
                                                  title: "3K");
                                            case "4.0":
                                              return MsureDashGraphTitle(
                                                  title: "5K");
                                            case "5.0":
                                              return MsureDashGraphTitle(
                                                  title: "10K");
                                          }
                                          return const Text("");
                                        })),
                                bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          switch (value.toDouble().toString()) {
                                            case "1.0":
                                              return MsureDashGraphTitle(
                                                  title: "JAN");
                                            case "2.0":
                                              return MsureDashGraphTitle(
                                                  title: "FAB");
                                            case "3.0":
                                              return MsureDashGraphTitle(
                                                  title: "MAR");
                                            case "4.0":
                                              return MsureDashGraphTitle(
                                                  title: "APR");
                                            case "5.0":
                                              return MsureDashGraphTitle(
                                                  title: "MAY");
                                          }
                                          return const Text("");
                                        }))),
                            lineBarsData: [
                              LineChartBarData(
                                  spots: [
                                    FlSpot(1, 1),
                                    FlSpot(3.5, 3),
                                    FlSpot(4, 4),
                                    FlSpot(5, 5)
                                  ],
                                  color: Constants.msureRed,
                                  barWidth: 3,
                                  isCurved: true,
                                  shadow: Shadow(
                                      blurRadius: 10,
                                      color: Constants.msureRed)),
                            ]),
                        swapAnimationCurve: Curves.bounceIn,
                        swapAnimationDuration: Duration(seconds: 1),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent payments",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MsureDashboardAllPayments()));
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MsurePaymentTile(),
              MsurePaymentTile(),
              MsurePaymentTile(),
              const SizedBox(height: 20),
              Container(
                width: Constants.getWidth(context),
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(colors: [
                      const Color(0xff1582BE),
                      const Color(0xff00C0C4),
                    ])),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total insurance savings",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    "Ksh 10,000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w900,
                                        fontSize: 32),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    "Total balance",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    "Ksh 5,000",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 19),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(13),
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white.withOpacity(1)),
                              child: Icon(
                                CupertinoIcons.add,
                                color: Color(0xff1483BE),
                                size: 35,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Claims",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ))
    ]));
  }
}

// class SalesData {
//   SalesData(this.year, this.sales);

//   final String year;
//   final double sales;
// }

class MsureDashGraphTitle extends StatelessWidget {
  String title;
  MsureDashGraphTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      title,
      style: TextStyle(color: Color(0xff808689), fontSize: 12),
    ));
  }
}

class MsurePaymentTile extends StatelessWidget {
  const MsurePaymentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xffF1F1F1))),
      child: Row(
        children: [
          Container(
              height: 33,
              width: 33,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Constants.msureRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                image: AssetImage("asset/images/services-icon.png"),
                height: 20,
                width: 20,
              )),
          const SizedBox(
            width: 18,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                Text(
                  "12/08/2021",
                  style: TextStyle(
                      color: const Color(0xff808689),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
              ],
            ),
          ),
          Text(
            "KSH 500",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
