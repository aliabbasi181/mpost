import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:provider/provider.dart';

class MsureClaimsAllClaims extends StatefulWidget {
  const MsureClaimsAllClaims({Key? key}) : super(key: key);

  @override
  State<MsureClaimsAllClaims> createState() => _MsureClaimsAllClaimsState();
}

class _MsureClaimsAllClaimsState extends State<MsureClaimsAllClaims> {
  List<dynamic> claims = [];
  @override
  void initState() {
    // TODO: implement initState
    _getClaims();
    super.initState();
  }

  _getClaims() async {
    final msureApplicationBloc =
        Provider.of<MSUREApplicationBloc>(context, listen: false);
    claims = await msureApplicationBloc.getClaims();
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
                  "All claims",
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
                "Claims",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              RichText(
                  text: TextSpan(
                text: "Tabulations of all claims",
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
                  itemCount: claims.length,
                  itemBuilder: (context, index) {
                    return MsureClaimTile(
                      claim: claims[index],
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

class MsureClaimTile extends StatelessWidget {
  dynamic claim;
  MsureClaimTile({Key? key, required this.claim}) : super(key: key);

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
              alignment: Alignment.center,
              height: 33,
              width: 33,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xff37d8ce).withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage("asset/images/claim_icon.png"),
                  height: 20,
                  width: 20,
                ),
              )),
          const SizedBox(
            width: 18,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  claim['reference'],
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                Text(
                  claim['submitted_at'],
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
            claim['status'],
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
