import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/update_profile.dart';
import 'package:mpost/mpost/msure/widgets.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:provider/provider.dart';

import '../../blocs/msure_application_bloc.dart';

class MSUREProfile extends StatefulWidget {
  const MSUREProfile({Key? key}) : super(key: key);

  @override
  State<MSUREProfile> createState() => _MSUREProfileState();
}

class _MSUREProfileState extends State<MSUREProfile> {
  int selectedValue = 1;
  String nameTag = '';
  MsureUserModel user = MsureUserModel();

  _getUserDetails() async {
    user = await SPLocalStorage.getMsureUserDetail();
    nameTag = user.name.toString()[0] + user.surname.toString()[0];
    setState(() {});
  }

  @override
  void initState() {
    _getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Profile",
                //   style: TextStyle(
                //       fontFamily: "Montserrat",
                //       fontWeight: FontWeight.w700,
                //       fontSize: 22),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.09),
                                  blurRadius: 20)
                            ],
                            color: Colors.grey),
                        child: Text(nameTag,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 26)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () async {
                          await SPLocalStorage.removeMsureToken();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/msure_splash', (Route<dynamic> route) => false);
                        },
                        child: Icon(
                          Icons.logout,
                          color: Constants.msureRed,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                Container(
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
                  child: Column(
                    children: [
                      MsureProfileTile(
                          label: "Name",
                          title: "${user.name} (${user.surname})",
                          leading: Icons.person,
                          isEdit: true),
                      MsureProfileTile(
                          label: "Email",
                          title: user.email.toString(),
                          leading: Icons.mail,
                          isEdit: true),
                      MsureProfileTile(
                          label: "Phone",
                          title: "${user.phone}",
                          leading: Icons.phone,
                          isEdit: true),
                      MsureProfileTile(
                          label: "Identitly",
                          title: "${user.nationalId}",
                          leading: Icons.perm_contact_cal_rounded,
                          isEdit: true),
                      MsureProfileTile(
                          label: "Location",
                          title: "${user.location}",
                          leading: Icons.location_on,
                          isEdit: true),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                  child: Column(
                    children: [
                      MsureProfileTile(
                          label: "Stage name",
                          title:
                              "${user.stage == null ? "..." : user.stage!.name}",
                          leading: Icons.location_searching_sharp,
                          isEdit: true),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                  child: Column(
                    children: [
                      MsureProfileTile(
                          label: "Beneficiary name",
                          title:
                              "${user.beneficiaryName == null ? "..." : user.beneficiaryName}",
                          leading: Icons.person,
                          isEdit: true),
                      MsureProfileTile(
                          label: "Beneficiary phone",
                          title:
                              "${user.beneficiaryPhone == null ? "..." : user.beneficiaryPhone}",
                          leading: Icons.phone,
                          isEdit: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
