import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserServiceAccountModel.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserStatusModel.dart';
import 'package:mpost/mpost/msure/about_msure.dart';
import 'package:mpost/mpost/msure/contact_msure.dart';
import 'package:mpost/mpost/msure/dashboard/msure_dashboard.dart';
import 'package:mpost/mpost/msure/insurance/insurance_home.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:mpost/mpost/msure/msure_payments/payments_select_amount.dart';
import 'package:mpost/mpost/msure/single_msure_plain.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:provider/provider.dart';

class MSUREHome2 extends StatefulWidget {
  const MSUREHome2({Key? key}) : super(key: key);

  @override
  State<MSUREHome2> createState() => _MSUREHome2State();
}

class _MSUREHome2State extends State<MSUREHome2> {
  @override
  void initState() {
    _getUser();
    _getUserStaus();
    _getUserServiceAccount();
    super.initState();
  }

  MsureUserModel user = MsureUserModel();
  MsureUserServiceAccountModel userServiceAccount =
      MsureUserServiceAccountModel(
          billingCycleAccount: BillingCycleAccount(amount: null));
  MsureUserStatusModel userStatus =
      MsureUserStatusModel(products: [Products(name: null)]);

  _getUser() async {
    user = await SPLocalStorage.getMsureUserDetail();
    // final msureApplicationBloc =
    //     Provider.of<MSUREApplicationBloc>(context, listen: false);

    // if (await msureApplicationBloc.msureLogin()) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: Colors.green,
    //       content: const Text("Login Success!")));
    //   user = await msureApplicationBloc.getUser();
    //   setState(() {});
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: Colors.red, content: const Text("Login failed!")));
    // }
  }

  _getUserServiceAccount() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    userServiceAccount = await msureApplicationBloc.userServiceAccounts();
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {});
  }

  _getUserStaus() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    userStatus = await msureApplicationBloc.getUserStatusData();
    await Future.delayed(Duration(milliseconds: 150));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final msureApplicationBloc = Provider.of<MSUREApplicationBloc>(context);
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 17, top: 5),
        color: Constants.msureRed,
        child: SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MSURE",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Icon(
                      CupertinoIcons.clear_circled,
                      color: Colors.white,
                    ))
              ],
            )),
      ),
      Expanded(
          child: SingleChildScrollView(
        child: Container(
          width: Constants.getWidth(context),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?k=20&m=1300845620&s=612x612&w=0&h=f4XTZDAv7NPuZbG0habSpU0sNgECM0X7nbKzTUta3n8="))),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ${user.name == null ? "N/A" : user.name}",
                        style: TextStyle(
                            color: Color(0xff9FA3A6),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ],
                  )),
                  InkWell(
                    onTap: () async {
                      print(MsureConstants.msureUserStatus.policies!
                          .mshuaIndividual!.first.guid);
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          size: 35,
                        ),
                        Visibility(
                          visible: true,
                          child: Container(
                            alignment: Alignment.center,
                            height: 21,
                            width: 21,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                color: Constants.errorColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: Text(
                              "2",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: Constants.getWidth(context),
              //   height: 170,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(6),
              //       gradient: LinearGradient(colors: [
              //         const Color(0xff1582BE),
              //         const Color(0xff00C0C4),
              //       ])),
              //   alignment: Alignment.center,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Expanded(
              //               child: Container(
              //                 padding: const EdgeInsets.all(20),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       "Total insurance savings",
              //                       style: TextStyle(
              //                           color: Colors.white,
              //                           fontFamily: "Montserrat",
              //                           fontWeight: FontWeight.w600,
              //                           fontSize: 13),
              //                     ),
              //                     Text(
              //                       "Ksh 10,000",
              //                       style: TextStyle(
              //                           color: Colors.white,
              //                           fontFamily: "Montserrat",
              //                           fontWeight: FontWeight.w900,
              //                           fontSize: 32),
              //                     ),
              //                     const SizedBox(
              //                       height: 35,
              //                     ),
              //                     Text(
              //                       "Total balance",
              //                       style: TextStyle(
              //                           color: Colors.white,
              //                           fontFamily: "Montserrat",
              //                           fontWeight: FontWeight.w600,
              //                           fontSize: 13),
              //                     ),
              //                     Text(
              //                       "Ksh 5,000",
              //                       style: TextStyle(
              //                           color: Colors.white,
              //                           fontFamily: "Montserrat",
              //                           fontWeight: FontWeight.w700,
              //                           fontSize: 19),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             InkWell(
              //               onTap: () {},
              //               child: Container(
              //                   padding: const EdgeInsets.all(13),
              //                   margin: const EdgeInsets.only(right: 20),
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(100),
              //                       color: Colors.white.withOpacity(1)),
              //                   child: Icon(
              //                     CupertinoIcons.add,
              //                     color: Color(0xff1483BE),
              //                     size: 35,
              //                   )),
              //             )
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
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
                      padding: const EdgeInsets.fromLTRB(26, 13, 20, 13),
                      child: Text(
                        userStatus.products!.first.name.toString() == 'null'
                            ? "Fetching plain..."
                            : userStatus.products!.first.name.toString(),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Insured",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11),
                                  ),
                                  Text(
                                    userServiceAccount.insuranceAmount
                                                .toString() ==
                                            'null'
                                        ? "..."
                                        : userServiceAccount.insuranceAmount
                                            .toString(),
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
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 11),
                                          ),
                                          Text(
                                            "Personal cover",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700,
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
                            margin: const EdgeInsets.only(top: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white.withOpacity(0.2)),
                            child: const Image(
                                width: 30,
                                height: 30,
                                image:
                                    AssetImage("asset/images/heart_icon.png")),
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
                        //         builder: (context) => SingleMSUREPlain(
                        //               plain: "Basic",
                        //             )));
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(26, 13, 20, 13),
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
                                    borderRadius: BorderRadius.circular(100)),
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
              // SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const MSUREUpdateProfile()));
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.all(13),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: Colors.black12),
              //         boxShadow: [
              //           BoxShadow(
              //               color: Colors.black.withOpacity(0.09),
              //               blurRadius: 20)
              //         ],
              //         borderRadius: BorderRadius.circular(6)),
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.shield_moon_rounded,
              //           color: Constants.msureRed,
              //           size: 50,
              //         ),
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Expanded(
              //             child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Update your profile",
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontFamily: "Montserrat",
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 14),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               "Complete your account registration by adding your personal details e.g ID number, NTSA number etc",
              //               style: TextStyle(
              //                   height: 1.3,
              //                   color: const Color(0xff808689),
              //                   fontFamily: "Montserrat",
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 11),
              //             ),
              //           ],
              //         )),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSUREMenuCard(
                    icon: Image.asset(
                      "asset/images/msure_dashboard_icon.png",
                      width: 27,
                      height: 27,
                    ),
                    title: "Dashboard",
                    subTitle: "Maecenas egestas donec sed interdum tristique",
                    iconBackgroundColor: const Color(0xff60D836),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MsureDashboard()));
                    },
                  ),
                  MSUREMenuCard(
                    icon: Icon(
                      Icons.payments_sharp,
                      color: Colors.white,
                    ),
                    title: "Payments",
                    subTitle: "Maecenas egestas donec sed interdum tristique",
                    iconBackgroundColor: const Color(0xff4D36D8),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MSUREPaymentSelect()));
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSUREMenuCard(
                    icon: Icon(
                      CupertinoIcons.umbrella,
                      color: Colors.white,
                    ),
                    title: "Insurance",
                    subTitle: "Maecenas egestas donec sed interdum tristique",
                    iconBackgroundColor: const Color(0xff36D8CE),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MSUREInsuranceHome()));
                    },
                  ),
                  MSUREMenuCard(
                    icon: Icon(
                      Icons.credit_card_rounded,
                      color: Colors.white,
                    ),
                    title: "Personal Details",
                    subTitle: "Maecenas egestas donec sed interdum tristique",
                    iconBackgroundColor: const Color(0xffD8AB36),
                    onTap: () {},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSUREMenuCard(
                    icon: Icon(
                      CupertinoIcons.phone,
                      color: Colors.white,
                    ),
                    title: "Contact us",
                    subTitle: "Maecenas egestas donec sed interdum tristique",
                    iconBackgroundColor: const Color(0xffD536D8),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MSUREContact()));
                    },
                  ),
                  MSUREMenuCard(
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                    ),
                    title: "About Msure",
                    subTitle: "Maecenas egestas donec sed interdum tristique",
                    iconBackgroundColor: const Color(0xffD8364D),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MSUREAbout()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ))
    ]));
  }
}
