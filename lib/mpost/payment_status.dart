import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class MPOSTPaymentSuccessGeneral extends StatefulWidget {
  String title, message, buttonText;
  VoidCallback onTap;
  MPOSTPaymentSuccessGeneral(
      {Key? key,
      required this.buttonText,
      required this.message,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  _MPOSTPaymentSuccessGeneralState createState() =>
      _MPOSTPaymentSuccessGeneralState();
}

class _MPOSTPaymentSuccessGeneralState
    extends State<MPOSTPaymentSuccessGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(60),
        height: Constants.getHeight(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xff15BE8B),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.check,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff808689),
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: widget.onTap,
                child: Container(
                  width: Constants.getWidth(context),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: const Color(0xff15BE8B)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    widget.buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff15BE8B),
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MPOSTPaymentFailedGeneral extends StatefulWidget {
  String title, message, buttonText;
  VoidCallback onTap;
  MPOSTPaymentFailedGeneral(
      {Key? key,
      required this.buttonText,
      required this.message,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  _MPOSTPaymentFailedGeneralState createState() =>
      _MPOSTPaymentFailedGeneralState();
}

class _MPOSTPaymentFailedGeneralState extends State<MPOSTPaymentFailedGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(60),
        height: Constants.getHeight(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color(0xffBE1515),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.cancel_outlined,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 23,
                    color: const Color(0xffBE1515),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff808689),
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: widget.onTap,
                child: Container(
                  width: Constants.getWidth(context),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: const Color(0xffBE1515)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    widget.buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xffBE1515),
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
