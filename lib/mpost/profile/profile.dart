import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/log_and_reg.dart';
import 'package:mpost/mpost/activity/activity.dart';
import 'package:mpost/mpost/profile/widgets.dart';
import 'package:mpost/mpost/virtual_address.dart/create_virtual_address.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/database.dart';
import 'package:provider/provider.dart';

import '../../blocs/application_bloc.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userName = "";
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController virtualCode = TextEditingController();
  String city = "";

  @override
  void initState() {
    print(Constants.identityNumber);
    print(Constants.user.passportNumber);
    print(Constants.user.bearerToken);
    _setUserDetails();
    super.initState();
  }

  _setUserDetails() {
    userName = Constants.user.firstName![0].toString() +
        Constants.user.lastName![0].toString();
    firstName.text = Constants.user.firstName.toString();
    lastName.text = Constants.user.lastName.toString();
    email.text = Constants.user.email.toString();
    phone.text = Constants.user.mobile.toString();
    if (Constants.virtualAddress.id == -1) {
      virtualCode.text = "Not registered";
    } else {
      virtualCode.text =
          "${Constants.virtualAddress.address} - ${Constants.virtualAddress.postalCode!.postalCode}(${Constants.virtualAddress.postalCode!.name})";
    }
  }

  bool isEmail(String input) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0XFFF00C0C4),
                  Color(0XFFF1582BE),
                ],
              )),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          //padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(0.7)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(userName,
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                          ),
                        ),
                        const Expanded(
                            child: Image(
                                width: 76,
                                height: 22,
                                image: AssetImage(
                                    "asset/images/mpost_white_logo.png"))),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Activity()));
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              const Image(
                                  height: 30,
                                  width: 30,
                                  image: AssetImage(
                                      "asset/images/notification-icon.png")),
                              Visibility(
                                visible: applicationBloc.pendingPayments > 0,
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      color: const Color(0XFFFBE1515),
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // SearchInputField(
                    //   hint: "Search the MPost App",
                    //   controller: searchController,
                    // )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: Color(0XFFF15BE8B), width: 1),
                            color: Color(0XFFF15BE8B).withOpacity(0.1)),
                        child: const Icon(
                          Icons.person_outline_rounded,
                          color: Color(0XFFF15BE8B),
                          size: 25,
                        )),
                    title: Text(
                      Constants.user.fullName.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    // subtitle: Row(
                    //   children: const [
                    //     Icon(
                    //       Icons.add_circle_rounded,
                    //       size: 17,
                    //       color: Color(0XFFFC4C4C4),
                    //     ),
                    //     SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text(
                    //       "Add profile pic",
                    //       style: TextStyle(
                    //           color: Color(0XFFFC4C4C4),
                    //           fontFamily: "Montserrat",
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 11),
                    //     )
                    //   ],
                    // ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  DetailField(
                    label: "First name",
                    controller: firstName,
                    hint: "Your first name",
                  ),
                  DetailField(
                      label: "Last name",
                      controller: lastName,
                      hint: "Your last name"),
                  DetailField(
                      label: "Email", controller: email, hint: "Your email"),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                            readOnly: true,
                            autocorrect: false,
                            controller: phone,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            decoration: const InputDecoration(
                                labelText: "Phone number",
                                floatingLabelStyle: TextStyle(
                                    color: Color(0XFFFC4C4C4),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                labelStyle: TextStyle(
                                    color: Color(0XFFFC4C4C4),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                hintText: "Your phone number"))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                            readOnly: true,
                            autocorrect: false,
                            controller: virtualCode,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            decoration: InputDecoration(
                                suffix: virtualCode.text == "Not registered"
                                    ? TextButton(
                                        onPressed: () {
                                          if (virtualCode.text ==
                                              "Not registered") {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CreateVirtualAddress()));
                                          }
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                13, 10, 13, 10),
                                            decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0XFFFF673BC),
                                                      Color(0XFFFBC4788),
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end:
                                                        Alignment.bottomCenter),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: Color(0XFFFBC4788),
                                                    width: 1)),
                                            child: Text(
                                                virtualCode.text ==
                                                        "Not registered"
                                                    ? "Register one"
                                                    : "Change",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontFamily: "Montserrat",
                                                    fontWeight:
                                                        FontWeight.w700))),
                                      )
                                    : const SizedBox(),
                                labelText: "Mpost virtual code",
                                floatingLabelStyle: const TextStyle(
                                    color: Color(0XFFFC4C4C4),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                labelStyle: const TextStyle(
                                    color: Color(0XFFFC4C4C4),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                hintText: "Your virtual code"))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () async {
                  //     try {
                  //       city = await showModalBottomSheet(
                  //           context: context,
                  //           backgroundColor: Colors.transparent,
                  //           builder: (context) {
                  //             return SafeArea(
                  //               bottom: false,
                  //               child: Container(
                  //                 width: Constants.getWidth(context),
                  //                 height: Constants.getHeight(context),
                  //                 decoration: const BoxDecoration(
                  //                     color: Colors.white,
                  //                     borderRadius: BorderRadius.only(
                  //                         topLeft: Radius.circular(20),
                  //                         topRight: Radius.circular(20))),
                  //                 child: const PickCity(),
                  //               ),
                  //             );
                  //           });
                  //       setState(() {});
                  //     } catch (ex) {}
                  //   },
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         "City",
                  //         style: TextStyle(
                  //             color: Color(0XFFFC4C4C4),
                  //             fontFamily: "Montserrat",
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 13),
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             city.isEmpty ? "Select" : city,
                  //             style: const TextStyle(
                  //                 color: Colors.black,
                  //                 fontFamily: "Montserrat",
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 18),
                  //           ),
                  //           Icon(
                  //             Icons.keyboard_arrow_down_rounded,
                  //             color: Constants.descriptionColor,
                  //             size: 25,
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Divider(
                  //   color: Color(0XFFFbbbbbb),
                  //   thickness: 1.5,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      phone.text =
                          int.parse(phone.text.replaceAll(' ', '')).toString();
                      if (phone.text.isEmpty) {
                        showSnackBar("Validation Error",
                            "Phone number can not be empty.", context);
                        return;
                      } else if (int.parse(phone.text.length.toString()) < 9) {
                        showSnackBar(
                            "Validation Error",
                            "Phone number can not less then 9 digits.",
                            context);
                        return;
                      } else if (email.text.isEmpty) {
                        showSnackBar("Validation Error",
                            "Email can not less then 9 digits.", context);
                        return;
                      } else if (!isEmail(email.text)) {
                        showSnackBar("Validation Error",
                            "Email is not correct.", context);
                        return;
                      } else if (firstName.text.isEmpty) {
                        showSnackBar("Validation Error",
                            "First name can not less then 9 digits.", context);
                        return;
                      } else if (lastName.text.isEmpty) {
                        showSnackBar("Validation Error",
                            "Last name can not less then 9 digits.", context);
                        return;
                      }
                      await applicationBloc.checkConnection(context);
                      if (await applicationBloc.updateUser(
                          firstName.text,
                          lastName.text,
                          email.text,
                          phone.text,
                          virtualCode.text,
                          city)) {
                        setState(() {
                          _setUserDetails();
                        });
                        showSnackBar("Profile successfully updated",
                            "Your profile is successfully updated.", context);
                        return;
                      } else {
                        showSnackBar(
                            "Profile update failed!",
                            "Sorry to inturupt, unable to update your details.",
                            context);
                        return;
                      }
                    },
                    child: Container(
                      width: Constants.getWidth(context),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: const Color(0XFFF1482be)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        !applicationBloc.loading
                            ? "UPDATE PROFILE"
                            : "Please wait...",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: const Color(0XFFF1482be),
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        Constants.getWidth(context) * 0.3,
                        0,
                        Constants.getWidth(context) * 0.3,
                        0),
                    child: InkWell(
                      onTap: () async {
                        switch (await showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                                  title: const Text("LOGOUT ALERT!"),
                                  content: const Text(
                                      "Are you sure you want to logout from MPOST?"),
                                  actions: [
                                    CupertinoDialogAction(
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop("No");
                                        }),
                                    CupertinoDialogAction(
                                        child: const Text(
                                          "LOGOUT",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: "Montserrat",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop("Logout");
                                        }),
                                  ],
                                ))) {
                          case "Logout":
                            await DatabaseHandler.instance.removeUser();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginAndRegister()),
                                (route) => false);
                            break;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage("asset/images/logout-icon.png"),
                            width: 18,
                            height: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                color: Color(0XFFF80868a),
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
