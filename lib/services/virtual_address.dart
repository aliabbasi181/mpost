import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/postal_code_model.dart';
import 'package:http/http.dart' as http;
import 'package:mpost/models/virtual_address_model.dart';

class VirtualAddressService {
  Future<List<PostalCodeModel>> getPostalCode() async {
    String url = Constants.hostUrl + "postal-codes?limit=3000";
    var response = await Dio().get(url);
    List<PostalCodeModel> postalCodeModel = [];
    if (response.statusCode == 200) {
      for (var item in response.data['data']) {
        postalCodeModel.add(PostalCodeModel(
            id: item['id'],
            postalCode: item['postal_code'],
            name: item['name'],
            county: item['country'],
            latitude: item['latitude'].toString(),
            longitude: item['longitude'].toString(),
            town: item['town']));
      }
    }
    return postalCodeModel;
  }

  Future<String> createVirtualAddress(PostalCodeModel postalCode) async {
    String url = Constants.hostUrl + "virtual-addresses";
    print(url);
    Map<String, dynamic> payload = {
      "address": Constants.user.mobile.toString(),
      "postal_code_id": postalCode.id,
      "is_personal": true,
      "user_id": Constants.user.userId
    };
    String result = "";
    try {
      var response = await http.post(Uri.parse(url),
          headers: Constants.requestHeadersWithToken,
          body: jsonEncode(payload));
      VirtualAddressModel virtualAddressModel;
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        virtualAddressModel = VirtualAddressModel.fromJson(json);
        print(virtualAddressModel.paymentRequestId);
        Constants.virtualAddress = virtualAddressModel;
        result = virtualAddressModel.paymentRequestId.toString() + ",300";
      } else {
        print(response.body);
      }
    } catch (ex) {}
    return result;
  }
}
