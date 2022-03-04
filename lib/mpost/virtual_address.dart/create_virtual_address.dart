import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/postal_code_model.dart';
import 'package:mpost/mpost/payment/choose_payment.dart';
import 'package:mpost/mpost/profile/widgets.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/user_service.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class CreateVirtualAddress extends StatefulWidget {
  const CreateVirtualAddress({Key? key}) : super(key: key);

  @override
  _CreateVirtualAddressState createState() => _CreateVirtualAddressState();
}

class _CreateVirtualAddressState extends State<CreateVirtualAddress> {
  String userName = "";
  TextEditingController postalBox = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController phone = TextEditingController();
  String city = "";
  String postalCode = "";
  List<PostalCodeModel> sugestedPostalCodses = [];
  PostalCodeModel selectedPostalCode = PostalCodeModel();
  @override
  void initState() {
    phone.text = Constants.user.mobile.toString();
    _getPostalCodes();
    super.initState();
  }

  _getPostalCodes() async {
    final applicationBloc =
        Provider.of<ApplicaitonBloc>(context, listen: false);
    await applicationBloc.getPostalCodes();
  }

  _generatePostalCode(String value) {
    sugestedPostalCodses.clear();
    if (value.isEmpty) {
      postalCode = "";
      setState(() {});
      return;
    }
    final applicationBloc =
        Provider.of<ApplicaitonBloc>(context, listen: false);
    for (var item in applicationBloc.postalCodes) {
      if (item.name!.toLowerCase().contains(value.toLowerCase())) {
        sugestedPostalCodses.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Constants.getHeight(context) * 0.86,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Expanded(
                              child: Text(
                                'Mpost virtual address',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Provide details below to get one. ',
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Constants.descriptionColor),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => messageDialog(
                                      context,
                                      Constants.user.fullName.toString(),
                                      "Enjoy Postal Services at home, in the office, or on the go through your mobile phone.",
                                      "OK"),
                                );
                              },
                              child: Text(
                                'Learn more.',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Constants.primaryColor),
                              ),
                            )
                          ],
                        ),
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
                                  onChanged: (value) {
                                    _generatePostalCode(value);
                                  },
                                  controller: postalBox,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                  decoration: const InputDecoration(
                                      labelText: "Prefered postal office",
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
                                      hintText: "e.g GPO"))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: sugestedPostalCodses.length > 0,
                          child: Container(
                            height: 100,
                            width: Constants.getWidth(context),
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: ListView.builder(
                                itemCount: sugestedPostalCodses.length,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    onTap: () {
                                      postalBox.text =
                                          sugestedPostalCodses[index]
                                              .name
                                              .toString();
                                      postalCode = sugestedPostalCodses[index]
                                          .postalCode
                                          .toString();
                                      selectedPostalCode =
                                          sugestedPostalCodses[index];
                                      sugestedPostalCodses.clear();
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 8, 15, 8),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black
                                                      .withOpacity(0.1)))),
                                      child: Text(
                                        sugestedPostalCodses[index]
                                            .name
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your postal code (auto generated)",
                                style: TextStyle(
                                    color: Color(0XFFFC4C4C4),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    postalCode.isEmpty
                                        ? "e.g 00100"
                                        : postalCode,
                                    style: TextStyle(
                                        color: postalCode.isEmpty
                                            ? const Color(0XFFFC4C4C4)
                                            : Colors.black,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  Visibility(
                                    visible: postalCode.isEmpty,
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Constants.descriptionColor,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color(0XFFFbbbbbb),
                          thickness: 1.5,
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
                        //         "City/Town",
                        //         style: TextStyle(
                        //             color: Color(0XFFFC4C4C4),
                        //             fontFamily: "Montserrat",
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 13),
                        //       ),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             city.isEmpty ? "Select" : city,
                        //             style: TextStyle(
                        //                 color: city.isEmpty
                        //                     ? const Color(0XFFFC4C4C4)
                        //                     : Colors.black,
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
                        // DetailField(
                        //   label: "Area",
                        //   controller: area,
                        //   hint: "Enter",
                        // ),
                      ],
                    )),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: InputButton(
                    label: !applicationBloc.loading
                        ? "Activate"
                        : "Please wait...",
                    onPress: () async {
                      if (postalBox.text.isEmpty) {
                        showSnackBar("Validation Error",
                            "Postal box can not empty.", context);
                        return;
                      } else if (postalCode.isEmpty) {
                        showSnackBar(
                            "Validation Error",
                            "Please choose a postal box to generate postal code.",
                            context);
                        return;
                      } else {
                        await applicationBloc.checkConnection(context);
                        String result = await applicationBloc
                            .createVirtualAddress(selectedPostalCode);
                        if (result.isNotEmpty) {
                          UserService userService = UserService();
                          userService.getUser(false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChoosePayment(
                                      cost: result.split(',')[1],
                                      id: result.split(',')[0])));
                        } else {
                          showSnackBar("Error",
                              "Error creating virtual address.", context);
                          return;
                        }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
