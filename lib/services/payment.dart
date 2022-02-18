import 'dart:convert';

import 'package:dio/dio.dart';
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
}
