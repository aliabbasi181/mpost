import 'package:dio/dio.dart';
import 'package:mpost/models/address.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mpost/constants.dart';
import 'package:mpost/models/delivery.dart';
import 'package:mpost/mpost/delivery/delivery.dart';

class DeliveryService {
  Future<String> confirmOrder(
      Address from, Address to, DeliveryDetail recpDetail, String time) async {
    String url = Constants.hostUrl + "delivery-requests";
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
      "item_type": recpDetail.typeOfItem,
      "note": recpDetail.note,
      "instructions": recpDetail.instructions,
      "pickup_time": "2022-2-22 16:00:00"
    };
    try {
      var response = await http.post(Uri.parse(url),
          headers: Constants.requestHeadersWithToken,
          body: jsonEncode(payload));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return "${json['delivery_cost'].toString()},${json['payment_request_id'].toString()}";
      } else {
        return "-1";
      }
    } catch (ex) {
      print(ex);
      return "-1";
    }
  }

  Future<List<DeliveryModel>> getAllDeliveries() async {
    String url = Constants.hostUrl +
        "delivery-requests?with[]=payment_request.payment_method&with[]=pickup_address&with[]=delivery_address&with[]=status&self=true";
    List<DeliveryModel> deliveries = [];
    try {
      var response = await Dio().get(url,
          options: Options(headers: Constants.requestHeadersWithToken));
      List<dynamic> data = response.data;
      deliveries = List<DeliveryModel>.from(
          data.reversed.map((e) => DeliveryModel.fromJson(e)));
      deliveries = List.from(deliveries.reversed);
    } catch (ex) {
      print(ex);
    }
    return deliveries;
  }
}
