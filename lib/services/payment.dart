import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';
import 'package:mpost/constants.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  Future<bool> safaricomInitialize(String phone, int paymentRequestId) async {
    String url = Constants.hostUrl + "payment/initialize";
    Map<String, dynamic> payload = {
      "payment_request_id": paymentRequestId,
      "mobile": phone
    };
    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(payload),
          headers: Constants.requestHeadersWithToken);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (ex) {
      print(ex.toString());
      return false;
    }
    // var response = await Dio().post(url,
    //     data: jsonEncode(payload),
    //     options: Options(headers: Constants.requestHeadersWithToken));
  }

  Future<bool> initializeFlutterwavePayment(
      String txref,
      String phone,
      String amount,
      BuildContext context,
      String email,
      String currency) async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: context,
        encryptionKey: Constants.flutterwaveEncryptionKey,
        publicKey: Constants.flutterwavePublicKey,
        currency: currency,
        amount: amount,
        email: email,
        fullName: Constants.user.fullName.toString(),
        txRef: txref,
        isDebugMode: true,
        phoneNumber: phone,
        acceptCardPayment: false,
        acceptUSSDPayment: false,
        acceptAccountPayment: false,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: false,
        acceptMpesaPayment: true,
        acceptRwandaMoneyPayment: false,
        acceptUgandaPayment: false,
        acceptZambiaPayment: false);

    try {
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        return false;
      } else {
        final isSuccessful =
            checkPaymentIsSuccessful(response, txref, currency, amount);
        if (isSuccessful) {
          print("payment sucess");

          return true;
        } else {
          // check message
          print(response.message);

          // check status
          print(response.status);

          // check processor error
          print(response.data!.processorResponse);
          return false;
        }
      }
    } catch (error, stacktrace) {
      print(error);
      return false;
    }
  }

  bool checkPaymentIsSuccessful(final ChargeResponse response, String txref,
      String currency, String amount) {
    return response.data!.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data!.currency == currency &&
        response.data!.amount == amount &&
        response.data!.txRef == txref;
  }
}
