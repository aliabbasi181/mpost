import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/mpost/payment/processing.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';
import 'package:accordion/accordion.dart';

import '../../constants.dart';

class ChoosePayment extends StatefulWidget {
  String cost;
  ChoosePayment({Key? key, required this.cost}) : super(key: key);

  @override
  _ChoosePaymentState createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  int _value = 1;
  bool mobile = true, card = false, cash = false;
  String pickMobilePayment = "";
  TextEditingController account_phonenumber = TextEditingController();
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
                          width: 10,
                        ),
                        const Text(
                          'Choose payment method',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Constants.getWidth(context) * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _value = 1;
                          mobile = true;
                          card = false;
                          cash = false;
                        });
                      },
                      child: ListTile(
                        title: InputLabel(label: "Mobile Money", isReq: false),
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
                    mobile
                        ? Container(
                            margin: EdgeInsets.only(
                                left: Constants.getWidth(context) * 0.12),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0XFFd9d9d9))),
                                  child: ListTile(
                                    onTap: () async {
                                      try {
                                        pickMobilePayment =
                                            await showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                builder: (context) {
                                                  return SafeArea(
                                                    bottom: false,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: Constants
                                                                  .getHeight(
                                                                      context) *
                                                              0.6),
                                                      width: Constants.getWidth(
                                                          context),
                                                      height:
                                                          Constants.getHeight(
                                                              context),
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20))),
                                                      child:
                                                          const PickMobilePayment(),
                                                    ),
                                                  );
                                                });
                                        setState(() {});
                                      } catch (ex) {}
                                    },
                                    minLeadingWidth: 0,
                                    title: Text(
                                      pickMobilePayment.isEmpty
                                          ? "Select your operator"
                                          : pickMobilePayment,
                                      style: TextStyle(
                                          color: pickMobilePayment.isEmpty
                                              ? Color(0XFFFbdbfc1)
                                              : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Montserrat"),
                                    ),
                                    trailing: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0XFFFc1c1c1),
                                      size: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1.5,
                                            color: const Color(0XFFd9d9d9)),
                                      ),
                                      child: const Text("+254"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: InputField(
                                          hint: "Phone number",
                                          controller: account_phonenumber),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 0,
                                ),
                                Row(
                                  children: const [
                                    Image(
                                      image: NetworkImage(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/M-PESA_LOGO-01.svg/1200px-M-PESA_LOGO-01.svg.png"),
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image(
                                      image: NetworkImage(
                                          "https://gadgets.ndtv.com/static/v1/images/og_airtel.png"),
                                      height: 50,
                                      width: 50,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                    !mobile ? const Divider() : const SizedBox(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _value = 2;
                          card = true;
                          mobile = false;
                          cash = false;
                        });
                      },
                      child: ListTile(
                        title: InputLabel(label: "Add new card", isReq: false),
                        minLeadingWidth: 0,
                        contentPadding: const EdgeInsets.all(0),
                        leading: Radio(
                            value: 2,
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
                          _value = 3;
                          cash = true;
                          mobile = false;
                          card = false;
                        });
                      },
                      child: ListTile(
                        title: InputLabel(label: "Pay with cash", isReq: false),
                        minLeadingWidth: 0,
                        contentPadding: const EdgeInsets.all(0),
                        leading: Radio(
                            value: 3,
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
                const Divider(
                  color: Color(0XFFFeceef0),
                  thickness: 1.5,
                  height: 15,
                ),
                ListTile(
                  title: const Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    "KSH " + applicationBloc.totalCost.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                InputButton(
                    label:
                        !applicationBloc.loading ? "PAY NOW" : "Please wait...",
                    onPress: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProcessingPayment()));
                    })
              ],
            )),
      ),
    );
  }
}

class PickMobilePayment extends StatefulWidget {
  const PickMobilePayment({Key? key}) : super(key: key);

  @override
  _PickMobilePaymentState createState() => _PickMobilePaymentState();
}

class MobilePaymentCategories {
  String title, image;
  MobilePaymentCategories(this.image, this.title);
}

class _PickMobilePaymentState extends State<PickMobilePayment> {
  Color optionColor = Color(0XFFFbdbfc1);
  bool airtel = true, safricom = false;
  String selection = "Safaricom";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
        height: Constants.getHeight(context) * 0.4,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Mobile Operator',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, "");
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, selection);
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Constants.primaryColor,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Center(
              child: Container(
                height: Constants.getHeight(context) * 0.2,
                child: CupertinoPicker(
                    selectionOverlay: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color(0XFFFeceef0), width: 1),
                              bottom: BorderSide(
                                  color: Color(0XFFFeceef0), width: 1))),
                    ),
                    itemExtent: 50,
                    onSelectedItemChanged: (value) {
                      value == 0
                          ? selection = "Safaricom"
                          : selection = "Airtel";
                    },
                    children: const [
                      Center(
                          child: Text('Safaricom',
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))),
                      Center(
                          child: Text('Airtel',
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
