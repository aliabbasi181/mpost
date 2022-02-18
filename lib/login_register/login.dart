import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/otp_verify_login.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      'Login',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Login to continue using mpost',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Constants.descriptionColor),
                    ),
                    SizedBox(
                      height: Constants.getWidth(context) * 0.05,
                    ),
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
                    InputPhoneNumber(
                      hint: "Mobile Number",
                      countryCode: countryCode,
                      controller: phone,
                    ),
                    applicationBloc.loginOTPSent != true
                        ? const Text(
                            "Error sending OTP.\nCheck your phone number, country code and make sure you are connected to internet.",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        : const Text("")
                  ],
                ),
                const Spacer(),
                InputButton(
                    label:
                        !applicationBloc.loading ? "GET OTP" : "Please wait...",
                    onPress: () async {
                      if (phone.text.isEmpty) {
                        showSnackBar("Validation Error",
                            "Phone number is required.", context);
                        return;
                      }
                      await applicationBloc.checkConnection(context);
                      if (await applicationBloc
                          .login(countryCode + phone.text)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPVerifyLogin(
                                    phone: "$countryCode${phone.text}")));
                      }
                    })
              ],
            )),
      ),
    );
  }
}
