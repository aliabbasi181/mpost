import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:mpost/constants.dart';

class MyFlutterWave extends StatefulWidget {
  const MyFlutterWave({Key? key}) : super(key: key);

  @override
  State<MyFlutterWave> createState() => _MyFlutterWaveState();
}

class _MyFlutterWaveState extends State<MyFlutterWave> {
  TextEditingController _number = TextEditingController();
  TextEditingController _amount = TextEditingController();
  String? _ref;
  _setRef() {
    Random random = Random();
    int num = random.nextInt(100000);
    if (Platform.isAndroid) {
      _ref = "AndroidRef56789$num";
    } else {
      _ref = "IOSRef1234$num";
    }
    print(_ref);
  }

  @override
  void initState() {
    _setRef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Wave"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _number,
                decoration: InputDecoration(hintText: "number"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _amount,
                decoration: InputDecoration(hintText: "amount"),
                keyboardType: TextInputType.number,
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () async {
                    _amount.text = _amount.text.trim();
                    _number.text = _number.text.trim();
                    //_makePayment(context, _amount.text, _number.text, _ref!);
                    try {
                      Flutterwave flutterwave = Flutterwave.forUIPayment(
                          context: context,
                          encryptionKey: "FLWSECK_TEST9c989b7790e8",
                          publicKey:
                              "FLWPUBK_TEST-2966ad8684f3219de6c2594b113461b2-X",
                          currency: "KES",
                          amount: _amount.text,
                          email: "twahirmohamed@gmail.com",
                          fullName: "Twahir Mohamed",
                          txRef: _ref!,
                          isDebugMode: true,
                          phoneNumber: _number.text,
                          acceptCardPayment: true,
                          acceptUSSDPayment: false,
                          acceptAccountPayment: false,
                          acceptFrancophoneMobileMoney: false,
                          acceptGhanaPayment: false,
                          acceptMpesaPayment: true,
                          acceptRwandaMoneyPayment: true,
                          acceptUgandaPayment: false,
                          acceptZambiaPayment: false);

                      final ChargeResponse response =
                          await flutterwave.initializeForUiPayments();
                      if (response.data == null) {
                        print("Transaction Failed");
                      } else {
                        print(
                            "Transaction Sucessfull\n ${response.message}\n ${response.status}");
                      }
                    } catch (error) {
                      print(error);
                    }
                  },
                  child: const Text("Pay"))
            ],
          ),
        ),
      ),
    );
  }
}

// _makePayment(
//     BuildContext context, String amount, String number, String ref) async {
//   try {
//     Flutterwave flutterwave = Flutterwave.forUIPayment(
//         context: context,
//         encryptionKey: "FLWSECK_TEST9c989b7790e8",
//         publicKey: "FLWPUBK_TEST-2966ad8684f3219de6c2594b113461b2-X",
//         currency: "KES",
//         amount: amount,
//         email: "twahirmohamed@gmail.com",
//         fullName: "Valid Full Name",
//         txRef: ref,
//         isDebugMode: true,
//         phoneNumber: number,
//         acceptCardPayment: true,
//         acceptUSSDPayment: false,
//         acceptAccountPayment: false,
//         acceptFrancophoneMobileMoney: false,
//         acceptGhanaPayment: false,
//         acceptMpesaPayment: true,
//         acceptRwandaMoneyPayment: true,
//         acceptUgandaPayment: false,
//         acceptZambiaPayment: false);

//     final ChargeResponse response = await flutterwave.initializeForUiPayments();
//     if (response.data == null) {
//       print("Transaction Failed");
//     } else {
//       print(
//           "Transaction Sucessfull\n ${response.message}\n ${response.status}");
//     }
//   } catch (error) {
//     print(error);
//   }
// }
