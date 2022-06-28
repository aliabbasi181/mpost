import 'package:flutter/material.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:provider/provider.dart';

class MPOSTInsurancePolicyStatus extends StatefulWidget {
  const MPOSTInsurancePolicyStatus({Key? key}) : super(key: key);

  @override
  State<MPOSTInsurancePolicyStatus> createState() =>
      _MPOSTInsurancePolicyStatusState();
}

class _MPOSTInsurancePolicyStatusState
    extends State<MPOSTInsurancePolicyStatus> {
  String policyStatus = "";
  @override
  void initState() {
    _getPolicyStatus();
    // TODO: implement initState
    super.initState();
  }

  _getPolicyStatus() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    var data = await msureApplicationBloc.getPolicies();
    policyStatus = data;
    setState(() {});
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
                  "Plicy status",
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
              "Policy Status",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(6)),
              width: Constants.getWidth(context),
              child: Column(
                children: [
                  Container(
                    height: 247,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "asset/images/msure_banner_image.png")),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                    ),
                  ),
                  Container(
                    width: Constants.getWidth(context),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              const Color(0xff1582BE),
                              const Color(0xff00C0C4),
                            ])),
                    child: Text(
                      policyStatus.isEmpty
                          ? "Fetching you policy status..."
                          : policyStatus,
                      style: TextStyle(
                          height: 1.3,
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    // child: RichText(
                    //     text: TextSpan(
                    //         text:
                    //             "You are covered in the event that you have to go to Hospital. your renewal date is on ",
                    //         style: TextStyle(
                    //             height: 1.3,
                    //             color: Colors.white,
                    //             fontFamily: "Montserrat",
                    //             fontWeight: FontWeight.w400,
                    //             fontSize: 15),
                    //         children: [
                    //       TextSpan(
                    //         text: "18/04/2022",
                    //         style: TextStyle(
                    //             height: 1.3,
                    //             color: Colors.white,
                    //             fontFamily: "Montserrat",
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 14),
                    //       ),
                    //       TextSpan(
                    //         text:
                    //             ". do not forget to make daily payment to stay covered",
                    //         style: TextStyle(
                    //             height: 1.3,
                    //             color: Colors.white,
                    //             fontFamily: "Montserrat",
                    //             fontWeight: FontWeight.w400,
                    //             fontSize: 15),
                    //       ),
                    //     ])),
                  )
                ],
              ),
            )
          ],
        ),
      ))
    ]));
  }
}
