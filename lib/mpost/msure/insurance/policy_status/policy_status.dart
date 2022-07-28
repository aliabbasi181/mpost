import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/MsureModels/MsurePolicyStatusModel.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserServiceAccountModel.dart';
import 'package:mpost/mpost/msure/single_msure_plain.dart';
import 'package:mpost/mpost/widgets.dart';
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
  MsurePolicyStatusModel? policyStatusModel;
  @override
  void initState() {
    _getPolicyStatus();
    super.initState();
  }

  _getPolicyStatus() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    policyStatusModel = await msureApplicationBloc.getPolicies();
    print(policyStatusModel);
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
            policyStatusModel == null
                ? ShimmerBox(height: 250, width: Constants.getWidth(context))
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    width: Constants.getWidth(context),
                    child: Column(
                      children: [
                        Container(
                          width: Constants.getWidth(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(colors: [
                                const Color(0xff187bb2),
                                const Color(0xffcd2631),
                              ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(26, 13, 20, 13),
                                child: Text(
                                  policyStatusModel?.productName ?? "...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                              Divider(
                                height: 0,
                                color: Colors.white.withOpacity(0.08),
                                thickness: 1,
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Fixed Benifit",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11),
                                            ),
                                            Text(
                                              policyStatusModel
                                                      ?.productFixedBenefit
                                                      .toString() ??
                                                  "...",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 32),
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.doc_text,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                                const SizedBox(
                                                  width: 19,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "COVERAGE TYPE",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 11),
                                                    ),
                                                    Text(
                                                      "Personal cover",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(23),
                                      margin: const EdgeInsets.only(
                                          top: 20, right: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.white.withOpacity(0.2)),
                                      child: const Image(
                                          width: 30,
                                          height: 30,
                                          image: AssetImage(
                                              "asset/images/heart_icon.png")),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                height: 0,
                                color: Colors.white.withOpacity(0.08),
                                thickness: 1,
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             SingleMSUREPlain(
                                  //               plain: "Basic",
                                  //             )));
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(26, 13, 20, 13),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "View details",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      const Spacer(),
                                      Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Icon(
                                            CupertinoIcons.arrow_right,
                                            size: 16,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   height: 247,
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         fit: BoxFit.cover,
                        //         image: AssetImage(
                        //             "asset/images/msure_banner_image.png")),
                        //     borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(6),
                        //         topRight: Radius.circular(6)),
                        //   ),
                        // ),
                        // Container(
                        //   width: Constants.getWidth(context),
                        //   padding: const EdgeInsets.all(20),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.only(
                        //           bottomLeft: Radius.circular(6),
                        //           bottomRight: Radius.circular(6)),
                        //       gradient: LinearGradient(
                        //           begin: Alignment.centerLeft,
                        //           end: Alignment.centerRight,
                        //           colors: [
                        //             const Color(0xff1582BE),
                        //             const Color(0xff00C0C4),
                        //           ])),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Fixed Benifit",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontFamily: "Montserrat",
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 11),
                        //       ),
                        //       Text(
                        //         policyStatusModel?.productFixedBenefit
                        //                 .toString() ??
                        //             "...",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontFamily: "Montserrat",
                        //             fontWeight: FontWeight.w700,
                        //             fontSize: 32),
                        //       ),
                        //       const SizedBox(
                        //         height: 35,
                        //       ),
                        //       Row(
                        //         children: [
                        //           Icon(
                        //             CupertinoIcons.doc_text,
                        //             color: Colors.white,
                        //             size: 32,
                        //           ),
                        //           const SizedBox(
                        //             width: 19,
                        //           ),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 "COVERAGE TYPE",
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontFamily: "Montserrat",
                        //                     fontWeight: FontWeight.w500,
                        //                     fontSize: 11),
                        //               ),
                        //               Text(
                        //                 "Personal cover",
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontFamily: "Montserrat",
                        //                     fontWeight: FontWeight.w700,
                        //                     fontSize: 18),
                        //               ),
                        //             ],
                        //           )
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        //   // child: RichText(
                        //   //     text: TextSpan(
                        //   //         text:
                        //   //             "You are covered in the event that you have to go to Hospital. your renewal date is on ",
                        //   //         style: TextStyle(
                        //   //             height: 1.3,
                        //   //             color: Colors.white,
                        //   //             fontFamily: "Montserrat",
                        //   //             fontWeight: FontWeight.w400,
                        //   //             fontSize: 15),
                        //   //         children: [
                        //   //       TextSpan(
                        //   //         text: "18/04/2022",
                        //   //         style: TextStyle(
                        //   //             height: 1.3,
                        //   //             color: Colors.white,
                        //   //             fontFamily: "Montserrat",
                        //   //             fontWeight: FontWeight.w600,
                        //   //             fontSize: 14),
                        //   //       ),
                        //   //       TextSpan(
                        //   //         text:
                        //   //             ". do not forget to make daily payment to stay covered",
                        //   //         style: TextStyle(
                        //   //             height: 1.3,
                        //   //             color: Colors.white,
                        //   //             fontFamily: "Montserrat",
                        //   //             fontWeight: FontWeight.w400,
                        //   //             fontSize: 15),
                        //   //       ),
                        //   //     ])),
                        // )
                      ],
                    ),
                  )
          ],
        ),
      ))
    ]));
  }
}
