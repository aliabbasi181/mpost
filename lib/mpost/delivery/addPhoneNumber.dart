import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/otp_verify_login.dart';
import 'package:mpost/mpost/delivery/verifyPhone.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({Key? key}) : super(key: key);

  @override
  _AddPhoneNumberState createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  String countryCode = "254";
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
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Text(
                            'Add your number',
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Constants.getWidth(context) * 0.05,
                    ),
                    CountryCodePicker(
                      initialSelection: "Kenya",
                      showDropDownButton: true,
                      showOnlyCountryWhenClosed: true,
                      textStyle: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'You’ll receice an SMS with a code to verify you number',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Constants.descriptionColor),
                    ),
                  ],
                ),
                const Spacer(),
                InputButton(
                    label: "CONTINUE",
                    onPress: () async {
                      phone.text = int.parse(phone.text).toString();
                      try {
                        if (phone.text.length < 9) {
                          showSnackBar(
                              "Validation error",
                              "Phone number can not be less then 9 digits",
                              context);
                          return;
                        } else if (phone.text.length > 9) {
                          showSnackBar(
                              "Validation error",
                              "Phone number can not be up to 9 digits",
                              context);
                          return;
                        }
                        String res = "$countryCode${phone.text}";
                        Navigator.pop(context, res);
                      } catch (ex) {}
                    })
              ],
            )),
      ),
    );
  }
}
