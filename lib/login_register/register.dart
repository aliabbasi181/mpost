import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String countryCode = "254";
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController identity = TextEditingController();
  TextEditingController passport = TextEditingController();
  int _value = 2;
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: Constants.getHeight(context) * 0.85,
                child: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
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
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Register',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Please fill in a few details below',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Constants.descriptionColor),
                              ),
                              SizedBox(
                                height: Constants.getWidth(context) * 0.05,
                              ),
                              InputLabel(label: "Name", isReq: true),
                              InputField(
                                hint: "e.g John Deo",
                                controller: name,
                              ),
                              SizedBox(
                                height: Constants.getWidth(context) * 0.04,
                              ),
                              InputLabel(label: "Email", isReq: true),
                              InputEmailField(
                                hint: "e.g name@email.com",
                                controller: email,
                              ),
                              SizedBox(
                                height: Constants.getWidth(context) * 0.05,
                              ),
                              InkWell(
                                onTap: () {
                                  _value = 0;
                                  passport.text = "";
                                  setState(() {});
                                },
                                child: ListTile(
                                  title: InputLabel(
                                      label: "National Identity", isReq: false),
                                  minLeadingWidth: 0,
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: Radio(
                                      value: 0,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = int.parse(value.toString());
                                        });
                                      }),
                                ),
                              ),
                              Visibility(
                                  visible: _value == 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InputLabel(
                                          label: "ID Number", isReq: true),
                                      InputField(
                                        hint: "e.g, 012345678",
                                        controller: identity,
                                      ),
                                    ],
                                  )),
                              InkWell(
                                onTap: () {
                                  _value = 1;
                                  identity.text = "";
                                  setState(() {});
                                },
                                child: ListTile(
                                  title: InputLabel(
                                      label: "Passport", isReq: false),
                                  minLeadingWidth: 0,
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: Radio(
                                      value: 1,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = int.parse(value.toString());
                                        });
                                      }),
                                ),
                              ),
                              Visibility(
                                  visible: _value == 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InputLabel(
                                          label: "Passport Number",
                                          isReq: true),
                                      InputField(
                                        hint: "e.g, A-Z45678",
                                        controller: passport,
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: Constants.getWidth(context) * 0.05,
                              ),
                              // InputLabel(label: "Phone Number", isReq: true),
                              // CountryCodePicker(
                              //   initialSelection: "Kenya",
                              //   showDropDownButton: true,
                              //   showCountryOnly: true,
                              //   textStyle: const TextStyle(
                              //     fontFamily: "Montserrat",
                              //     fontSize: 14,
                              //     color: Colors.black,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              //   showOnlyCountryWhenClosed: true,
                              //   favorite: const ['+254', 'KE'],
                              //   flagWidth: 30,
                              //   onChanged: (code) {
                              //     setState(() {
                              //       countryCode = code.toString();
                              //     });
                              //   },
                              // ),
                              // InputLabel(label: "Mobile Number", isReq: true),
                              // InputPhoneNumber(
                              //   hint: "Mobile Number",
                              //   countryCode: countryCode,
                              //   controller: phone,
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: InputButton(
                    label: !applicationBloc.loading
                        ? "CONTINUE"
                        : "Please wait...",
                    onPress: () async {
                      if (name.text.isEmpty) {
                        showSnackBar(
                            "Validation Error", "Name is required", context);
                        return;
                      } else if (email.text.isEmpty) {
                        showSnackBar(
                            "Validation Error", "Email is required", context);
                        return;
                      } else if (identity.text.isEmpty &&
                          passport.text.isEmpty) {
                        showSnackBar(
                            "Validation Error",
                            "National identity or passport number is required",
                            context);
                        return;
                      }
                      Constants.registerName = name.text;
                      Constants.registerEmail = email.text;
                      if (identity.text.isNotEmpty) {
                        Constants.identityNumber = identity.text;
                        Constants.isNational = true;
                      }
                      if (passport.text.isNotEmpty) {
                        Constants.identityNumber = passport.text;
                        Constants.isNational = false;
                      }
                      //print(Constants.registerMobile);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HowYouWillUse()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HowYouWillUse extends StatefulWidget {
  const HowYouWillUse({Key? key}) : super(key: key);

  @override
  _HowYouWillUseState createState() => _HowYouWillUseState();
}

class _HowYouWillUseState extends State<HowYouWillUse> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         Navigator.pop(context);
                    //       },
                    //       child: const Icon(
                    //         Icons.arrow_back_rounded,
                    //         size: 40,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'How you will use Mpost',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Choose from one of the options below to help us personalise your experience',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          color: Constants.descriptionColor),
                    ),
                    SizedBox(
                      height: Constants.getWidth(context) * 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _value = 1;
                        });
                      },
                      child: ListTile(
                        title: InputLabel(label: "Personal", isReq: false),
                        subtitle: Text("Shopping and paying for services",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Constants.descriptionColor)),
                        trailing: Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = int.parse(value.toString());
                              });
                            }),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => messageDialog(
                              context,
                              "Coming soon!",
                              "Stay tuned to this. We are launching soon",
                              "OK"),
                        );
                      },
                      child: ListTile(
                        title: InputLabel(label: "Business", isReq: false),
                        subtitle: Text("To sell products to customers",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Constants.descriptionColor)),
                        trailing: Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = int.parse(value.toString());
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InputButton(
                    label:
                        !applicationBloc.loading ? "FINISH" : "Please wait...",
                    onPress: () async {
                      Constants.registerType =
                          _value == 2 ? "Business" : "Personal";
                      await applicationBloc.checkConnection(context);
                      if (await applicationBloc.register(context, true)) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BottomNav(
                              loadDeliveries: false,
                            ),
                          ),
                          (route) => false,
                        );
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const BottomNav()));
                    })
              ],
            )),
      ),
    );
  }
}
