import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class MSUREInputField extends StatefulWidget {
  String labelText;
  TextEditingController controller;
  FocusNode focusNode;
  MSUREInputField(
      {Key? key,
      required this.labelText,
      required this.controller,
      required this.focusNode})
      : super(key: key);

  @override
  State<MSUREInputField> createState() => _MSUREInputFieldState();
}

class _MSUREInputFieldState extends State<MSUREInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17),
      child: TextField(
        onTap: () {
          setState(() {
            FocusScope.of(context).requestFocus(widget.focusNode);
          });
        },
        controller: widget.controller,
        focusNode: widget.focusNode,
        autocorrect: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  BorderSide(color: const Color(0xffCBCBCB), width: 1.5)),
          labelText: widget.labelText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Constants.msureRed, width: 1.5)),
          labelStyle: TextStyle(
              color: widget.focusNode.hasFocus
                  ? Constants.msureRed
                  : const Color(0xffCBCBCB),
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MSUREMenuCard extends StatefulWidget {
  Widget icon;
  String title, subTitle;
  Color iconBackgroundColor;
  VoidCallback onTap;
  MSUREMenuCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.onTap,
      required this.iconBackgroundColor})
      : super(key: key);

  @override
  State<MSUREMenuCard> createState() => _MSUREMenuCardState();
}

class _MSUREMenuCardState extends State<MSUREMenuCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: Constants.getWidth(context) / 2.3,
        margin: EdgeInsets.only(bottom: Constants.getWidth(context) / 27),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 5)
            ],
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: widget.iconBackgroundColor,
                    borderRadius: BorderRadius.circular(100)),
                child: widget.icon),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.subTitle,
              style: TextStyle(
                  height: 1.3,
                  color: const Color(0xff808689),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
