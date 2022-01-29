import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/otp_verify.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/widgets.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                              size: 40,
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
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Please fill in a few details below',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
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
                        flagWidth: 40,
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
                  InputButton(
                      label: "CONTINUE",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPVerify(
                                    phone: "$countryCode ${phone.text}")));
                      })
                ],
              )),
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
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Chose from one of the options below to help us personalise your experience',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
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
                                fontSize: 16,
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
                                fontSize: 16,
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
                    label: "FINISH",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()));
                    })
              ],
            )),
      ),
    );
  }
}
