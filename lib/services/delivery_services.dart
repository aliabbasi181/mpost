import 'package:dio/dio.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/models/address.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/delivery.dart';

class DeliveryService {
  Future<String> confirmOrder(
      Address from, Address to, DeliveryDetail recpDetail) async {
    String url = Constants.hostUrl + "delivery-requests";
    if (Constants.token.isNotEmpty) {
      Map<String, dynamic> payload = {
        "pickup_address": {
          "latitude": from.lat,
          "longitude": from.lng,
          "address": from.address,
          "detailed_address": from.detailedAddress
        },
        "delivery_address": {
          "latitude": to.lat,
          "longitude": to.lng,
          "address": to.address,
          "detailed_address": to.detailedAddress
        },
        "recipient_name": recpDetail.recpName,
        "recipient_mobile": recpDetail.phone,
        "type_of_item": recpDetail.typeOfItem,
        "note": recpDetail.note,
        "instructions": recpDetail.instructions,
      };
      try {
        var response = await Dio().post(url,
            data: jsonEncode(payload),
            options: Options(headers: Constants.requestHeadersWithToken));
        if (response.statusCode == 200) {
          print(response.data['delivery_cost']);
          return "${response.data['delivery_cost'].toString()},${response.data['payment_request_id'].toString()}";
        } else {
          return "-1";
        }
      } catch (ex) {
        print(ex);
        return "-1";
      }
    } else {
      print("you are not loggedin");
      return "-1";
    }
  }
}
