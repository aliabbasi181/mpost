import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/login.dart';
import 'package:mpost/login_register/otp_verify.dart';
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
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: Constants.getHeight(context) * 0.85,
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                                    size: 35,
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
                                  fontWeight: FontWeight.bold),
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
                            InputLabel(label: "Phone Number", isReq: true),
                            CountryCodePicker(
                              initialSelection: "Kenya",
                              showDropDownButton: true,
                              showCountryOnly: true,
                              favorite: const ['+254', 'KE'],
                              flagWidth: 30,
                              onChanged: (code) {
                                setState(() {
                                  countryCode = code.toString();
                                });
                              },
                            ),
                            InputLabel(label: "Mobile Number", isReq: true),
                            InputPhoneNumber(
                              hint: "Mobile Number",
                              countryCode: countryCode,
                              controller: phone,
                            ),
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
                  label:
                      !applicationBloc.loading ? "CONTINUE" : "Please wait...",
                  onPress: () async {
                    if (name.text.isEmpty) {
                      showSnackBar(
                          "Validation Error", "Name is required", context);
                      return;
                    } else if (email.text.isEmpty) {
                      showSnackBar(
                          "Validation Error", "Email is required", context);
                      return;
                    } else if (phone.text.isEmpty) {
                      showSnackBar("Validation Error",
                          "Phone number is required", context);
                      return;
                    }
                    Constants.registerName = name.text;
                    Constants.registerEmail = email.text;
                    Constants.registerPassword = "Test@123";
                    Constants.registerMobile = countryCode + phone.text;
                    await applicationBloc.checkConnection(context);
                    if (await applicationBloc
                        .requestOTP(countryCode + phone.text)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPVerify(
                                  phone: "$countryCode${phone.text}")));
                    }
                  }),
            )
          ],
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            size: 40,
                          ),
                        )
                      ],
                    ),
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
                      'Chose from one of the options below to help us personalise your experience',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
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
                        subtitle: Text("Shoping and paying for services",
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
                        setState(() {
                          _value = 2;
                        });
                      },
                      child: ListTile(
                        title: InputLabel(label: "Business", isReq: false),
                        subtitle: Text("Shoping and paying for services",
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
                      if (await applicationBloc.register()) {}
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    })
              ],
            )),
      ),
    );
  }
}
