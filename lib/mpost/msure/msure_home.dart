import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/about_msure.dart';
import 'package:mpost/mpost/msure/contact_msure.dart';
import 'package:mpost/mpost/msure/insurance/insurance_home.dart';
import 'package:mpost/mpost/msure/msure_payments/payments_select_amount.dart';
import 'package:mpost/mpost/msure/update_profile.dart';
import 'package:mpost/mpost/msure/widgets.dart';

class MSUREHome2 extends StatefulWidget {
  const MSUREHome2({Key? key}) : super(key: key);

  @override
  State<MSUREHome2> createState() => _MSUREHome2State();
}

class _MSUREHome2State extends State<MSUREHome2> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bus Tickets",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                                "https://static.toiimg.com/thumb/61343824.cms?width=170&height=240&imgsize=20882"))),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ${Constants.user.fullName}",
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
                    onTap: () {},
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
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MSUREUpdateProfile()));
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.09),
                            blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shield_moon_rounded,
                        color: Constants.msureRed,
                        size: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Update your profile",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Complete your account registration by adding your personal details e.g ID number, NTSA number etc",
                            style: TextStyle(
                                height: 1.3,
                                color: const Color(0xff808689),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                fontSize: 11),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSUREMenuCard(
                    icon: Icon(
                      CupertinoIcons.square_grid_2x2,
                      color: Colors.white,
                    ),
                    title: "Dashboard",
                    subTitle: "Maecenas egestas donec sed interdum tristique",
                    iconBackgroundColor: const Color(0xff60D836),
                    onTap: () {},
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
