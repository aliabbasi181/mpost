// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class InputField extends StatefulWidget {
  String hint;
  TextEditingController controller = TextEditingController();
  InputField({Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFFFd9d9d9), width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        autocorrect: false,
        controller: widget.controller,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat"),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(
                color: Color(0XFFFbdbfc1),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat")),
      ),
    );
  }
}

class InputLabel extends StatelessWidget {
  String label;
  bool isReq;
  InputLabel({Key? key, required this.label, required this.isReq})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      margin: const EdgeInsets.only(left: 2),
      child: RichText(
        text: TextSpan(
            text: label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                color: Colors.black),
            children: [
              TextSpan(
                  text: isReq ? " *" : null,
                  style: const TextStyle(color: Colors.red))
            ]),
      ),
    );
  }
}

class InputPhoneNumber extends StatelessWidget {
  String hint, countryCode;
  TextEditingController controller = TextEditingController();
  InputPhoneNumber(
      {Key? key,
      required this.hint,
      required this.countryCode,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFFFd9d9d9), width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Text(
            countryCode + "  ",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat"),
          ),
          Expanded(
            child: TextField(
              autocorrect: false,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: const TextStyle(
                      color: Color(0XFFFBDBFC0),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat")),
            ),
          ),
        ],
      ),
    );
  }
}

class InputButton extends StatelessWidget {
  String label;
  VoidCallback onPress;
  InputButton({Key? key, required this.label, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: Constants.getWidth(context),
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
            color: const Color(0XFFF1482be),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class InputEmailField extends StatefulWidget {
  String hint;
  TextEditingController controller = TextEditingController();
  InputEmailField({Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  _InputEmailFieldState createState() => _InputEmailFieldState();
}

class _InputEmailFieldState extends State<InputEmailField> {
  bool isEmail(String input) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
  }

  bool validEmail = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          border: Border.all(
              color: validEmail ? const Color(0XFFFd9d9d9) : Colors.red,
              width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat"),
        onChanged: (input) {
          if (isEmail(input)) {
            setState(() {
              validEmail = true;
            });
          } else {
            setState(() {
              validEmail = false;
            });
          }
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(
                color: Color(0XFFFbdbfc1),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat")),
      ),
    );
  }
}

class SearchInputField extends StatefulWidget {
  String hint;
  TextEditingController controller = TextEditingController();
  SearchInputField({Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat"),
        decoration: InputDecoration(
            prefixIcon: const Icon(
              CupertinoIcons.search,
              size: 25,
              color: Color(0XFFFbdbfc1),
            ),
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(
                color: Color(0XFFFbdbfc1),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat")),
      ),
    );
  }
}
