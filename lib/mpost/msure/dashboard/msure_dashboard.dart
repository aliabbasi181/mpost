import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserServiceAccountModel.dart';
import 'package:mpost/mpost/msure/MsureModels/payments/DayPaymentModel.dart';
import 'package:mpost/mpost/msure/MsureModels/payments/MonthPaymentModel.dart';
import 'package:mpost/mpost/msure/MsureModels/payments/MsurePaymentOverviewModel.dart';
import 'package:mpost/mpost/msure/MsureModels/payments/YearPaymentModel.dart';
import 'package:mpost/mpost/msure/dashboard/all_payments.dart';
import 'package:mpost/mpost/msure/insurance/claim/all_claims.dart';
import 'package:mpost/mpost/msure/msure_payments/payments_select_amount.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MsureDashboard extends StatefulWidget {
  const MsureDashboard({Key? key}) : super(key: key);

  @override
  State<MsureDashboard> createState() => _MsureDashboardState();
}

class _MsureDashboardState extends State<MsureDashboard> {
  List<MsurePaymentOverviewModel> payments = [];
  bool loadingPayments = false;
  bool loadingGraph = false;
  List<FlSpot> graphSpots = [];
  var graphSelection = "Monthly";
  double maxYVal = 5;
  MsureUserServiceAccountModel userServiceAccount =
      MsureUserServiceAccountModel(
          billingCycleAccount: BillingCycleAccount(amount: null));

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    //_getServiceAccountsData();
    _getUserPayments("", true);
    _getGraphPayment(graphSelection);
    _getServiceAccountsData();
    super.initState();
  }

  _getUserServiceAccount() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    userServiceAccount = await msureApplicationBloc.userServiceAccounts();
    setState(() {});
  }

  _getServiceAccountsData() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    userServiceAccount = await msureApplicationBloc.userServiceAccounts();
    setState(() {});
  }

  _getUserPayments(String key, bool first) async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    setState(() {
      first ? loadingPayments = true : null;
    });
    var data = await msureApplicationBloc.getUserPayments(key);
    for (var item in data) {
      payments.add(MsurePaymentOverviewModel.fromJson(item));
    }
    if (payments.length > 1) {
      List<MsurePaymentOverviewModel> tempPayments = [];
      for (var i = payments.length - 1; i >= 0; i--) {
        tempPayments.add(payments[i]);
      }
      payments = tempPayments;
    }
    setState(() {
      first ? loadingPayments = false : null;
    });
    print(payments.length);
  }

  _getGraphPayment(String key) async {
    setState(() {
      graphSpots.clear();
    });
    switch (key) {
      case "Monthly":
        key = "/month";
        break;
      case "Daily":
        key = "/day";
        break;
      case "Yearly":
        key = "/year";
        break;
      default:
    }
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    setState(() {
      loadingGraph = true;
    });
    var data = await msureApplicationBloc.getUserPayments(key);
    print(data);
    switch (key) {
      case "/month":
        List<MonthPaymentModel> payments = [];

        for (var item in data) {
          payments.add(MonthPaymentModel.fromJson(item));
        }
        maxYVal = 2000;
        payments.forEach((element) {
          if (element.month!.toLowerCase().contains('january')) {
            graphSpots.add(FlSpot(1, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('february')) {
            graphSpots.add(FlSpot(2, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('march')) {
            graphSpots.add(FlSpot(3, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('april')) {
            graphSpots.add(FlSpot(4, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('may')) {
            graphSpots.add(FlSpot(5, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('june')) {
            graphSpots.add(FlSpot(6, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('july')) {
            graphSpots.add(FlSpot(7, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('august')) {
            graphSpots.add(FlSpot(8, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('september')) {
            graphSpots.add(FlSpot(9, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('october')) {
            graphSpots.add(FlSpot(10, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('november')) {
            graphSpots.add(FlSpot(11, double.parse(element.amount.toString())));
          } else if (element.month!.toLowerCase().contains('december')) {
            graphSpots.add(FlSpot(12, double.parse(element.amount.toString())));
          }
        });
        setState(() {});
        break;
      case "/day":
        List<DayPaymentModel> payments = [];
        for (var item in data) {
          payments.add(DayPaymentModel.fromJson(item));
        }
        payments.forEach((element) {
          print(element.date);
        });
        break;
      case "/year":
        List<YearPaymentModel> payments = [];
        for (var item in data) {
          payments.add(YearPaymentModel.fromJson(item));
        }
        payments.forEach((element) {
          print(element.year);
        });
        break;
      default:
    }
    setState(() {
      loadingGraph = false;
    });
  }

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
                          onTap: () async {
                            try {
                              graphSelection = await showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CupertinoActionSheet(
                                      actions: [
                                        CupertinoActionSheetAction(
                                            onPressed: () {
                                              Navigator.pop(context, "Daily");
                                            },
                                            child: Text(
                                              "Daily",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading,
                                                  fontFamily: "Montserrat",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                        CupertinoActionSheetAction(
                                            onPressed: () {
                                              Navigator.pop(context, "Monthly");
                                            },
                                            child: Text(
                                              "Monthly",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading,
                                                  fontFamily: "Montserrat",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                        CupertinoActionSheetAction(
                                            onPressed: () {
                                              Navigator.pop(context, "Yearly");
                                            },
                                            child: Text(
                                              "Yearly",
                                              style: TextStyle(
                                                  color: Constants
                                                      .transportHeading,
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
                              _getGraphPayment(graphSelection);
                              setState(() {});
                            } catch (ex) {
                              print(ex);
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                graphSelection,
                                style: TextStyle(
                                    fontFamily: "Motnserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                              Icon(
                                CupertinoIcons.chevron_down,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          width: Constants.getWidth(context),
                          child: LineChart(
                            LineChartData(
                                minX: 1,
                                maxX: 12,
                                maxY: maxYVal,
                                minY: 1,
                                gridData: FlGridData(
                                    drawHorizontalLine: true,
                                    drawVerticalLine: true),
                                borderData: FlBorderData(show: false),
                                titlesData: FlTitlesData(
                                    show: true,
                                    topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                            reservedSize: 30,
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              if (value == 1) {
                                                return MsureDashGraphTitle(
                                                    title: "");
                                              }
                                              var data =
                                                  (value / 1000.0).toString() +
                                                      "K";
                                              return MsureDashGraphTitle(
                                                  title: data);

                                              // return const Text("");
                                            })),
                                    bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              switch (
                                                  value.toDouble().toString()) {
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
                                                case "6.0":
                                                  return MsureDashGraphTitle(
                                                      title: "JUN");
                                                case "7.0":
                                                  return MsureDashGraphTitle(
                                                      title: "JUL");
                                                case "8.0":
                                                  return MsureDashGraphTitle(
                                                      title: "AUG");
                                                case "9.0":
                                                  return MsureDashGraphTitle(
                                                      title: "SEP");
                                                case "10.0":
                                                  return MsureDashGraphTitle(
                                                      title: "OCT");
                                                case "11.0":
                                                  return MsureDashGraphTitle(
                                                      title: "NOV");
                                                case "12.0":
                                                  return MsureDashGraphTitle(
                                                      title: "DEC");
                                              }
                                              return const Text("");
                                            }))),
                                lineBarsData: [
                                  LineChartBarData(
                                      spots: graphSpots,
                                      //color: Constants.msureRed,
                                      barWidth: 3,
                                      isCurved: true,
                                      shadow: Shadow(
                                          blurRadius: 10,
                                          color: Constants.msureRed)),
                                ]),
                            swapAnimationCurve: Curves.easeIn,
                            swapAnimationDuration: Duration(seconds: 1),
                          ),
                        ),
                        Visibility(
                          visible: loadingGraph,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1)),
                            height: 300,
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      ],
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
                  Row(
                    children: [
                      Visibility(
                        visible: !loadingPayments,
                        child: InkWell(
                          onTap: () {
                            try {
                              //Timestamp stamp = Timestamp.now();
                              //DateTime date = stamp.toDate();
                            } catch (ex) {
                              print(ex);
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MsureDashboardAllPayments(
                                          payments: payments,
                                        )));
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
                      ),
                      Visibility(
                          visible: loadingPayments,
                          child: ShimmerBox(height: 20, width: 60)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: loadingPayments,
                child: Column(
                  children: [
                    ShimmerBox(height: 60, width: Constants.getWidth(context)),
                    const SizedBox(
                      height: 10,
                    ),
                    ShimmerBox(height: 60, width: Constants.getWidth(context)),
                    const SizedBox(
                      height: 10,
                    ),
                    ShimmerBox(height: 60, width: Constants.getWidth(context)),
                  ],
                ),
              ),
              Visibility(
                  visible: payments.length >= 1,
                  child: MsurePaymentTile(
                    payment: payments.isNotEmpty
                        ? payments[0]
                        : MsurePaymentOverviewModel(),
                  )),
              Visibility(
                  visible: payments.length >= 2,
                  child: MsurePaymentTile(
                      payment: payments.isNotEmpty
                          ? payments[1]
                          : MsurePaymentOverviewModel())),
              Visibility(
                  visible: payments.length >= 3,
                  child: MsurePaymentTile(
                      payment: payments.isNotEmpty
                          ? payments[2]
                          : MsurePaymentOverviewModel())),
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
                                    "Ksh ${userServiceAccount.insuranceAmount == null ? "..." : userServiceAccount.insuranceAmount.toString()}",
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
                                    "Ksh ${userServiceAccount.billingCycleAccount == null ? "..." : userServiceAccount.billingCycleAccount!.amount.toString()}",
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MSUREPaymentSelect()));
                            },
                            child: Container(
                                padding: const EdgeInsets.all(13),
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white.withOpacity(1)),
                                child: Icon(
                                  CupertinoIcons.add,
                                  color: Color(0xff1483BE),
                                  size: 35,
                                )),
                          )
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MsureClaimsAllClaims()));
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
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: Color(0xff808689),
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ));
  }
}

class MsurePaymentTile extends StatelessWidget {
  MsurePaymentOverviewModel payment;
  MsurePaymentTile({Key? key, required this.payment}) : super(key: key);

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
              child: Icon(
                Icons.payment_outlined,
                size: 20,
                color: Constants.msureRed,
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
                  DateFormat('yyyy-MM-dd')
                      .format(DateTime.parse(payment.updatedAt.toString())),
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
            "KSH ${payment.amount}",
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
