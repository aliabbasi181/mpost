import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/insurance/add_cover/add_cover.dart';
import 'package:mpost/mpost/msure/insurance/claim/claim_home.dart';
import 'package:mpost/mpost/msure/insurance/policy_status/policy_status.dart';

class MSUREInsuranceHome extends StatefulWidget {
  const MSUREInsuranceHome({Key? key}) : super(key: key);

  @override
  State<MSUREInsuranceHome> createState() => _MSUREInsuranceHomeState();
}

class _MSUREInsuranceHomeState extends State<MSUREInsuranceHome> {
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
                  "Insurance",
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
              "Payments",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            RichText(
                text: TextSpan(
              text:
                  "Fill the following required information and kick start  your insurance payments.",
              style: TextStyle(
                  height: 1.5,
                  color: const Color(0xff808689),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            )),
            const SizedBox(height: 30),
            MSUREInsuranceDetailCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MPOSTInsurancePolicyStatus()));
                },
                image: "asset/images/buy-sell-icon.png",
                title: "Policy status"),
            const SizedBox(
              height: 10,
            ),
            MSUREInsuranceDetailCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MPOSTInsuranceAddCover()));
                },
                image: "asset/images/buy-sell-icon.png",
                title: "Add cover"),
            const SizedBox(
              height: 10,
            ),
            MSUREInsuranceDetailCard(
                onTap: () {
                  Navigator.pushNamed(context, '/msure_insurance_claim');
                },
                image: "asset/images/buy-sell-icon.png",
                title: "Claim"),
            const SizedBox(
              height: 10,
            ),
            MSUREInsuranceDetailCard(
                onTap: () {},
                image: "asset/images/buy-sell-icon.png",
                title: "What is covered?"),
            const SizedBox(
              height: 10,
            ),
            MSUREInsuranceDetailCard(
                onTap: () {},
                image: "asset/images/buy-sell-icon.png",
                title: "FAQs"),
          ],
        ),
      ))
    ]));
  }
}

class MSUREInsuranceDetailCard extends StatelessWidget {
  VoidCallback onTap;
  String image, title;
  MSUREInsuranceDetailCard(
      {Key? key, required this.onTap, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.07)),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
              )
            ]),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 17,
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyle(
                  height: 1.5,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: const Color(0xffC1C1C1),
            )
          ],
        ),
      ),
    );
  }
}
