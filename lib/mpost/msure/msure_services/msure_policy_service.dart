import 'package:dio/dio.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';

class MsurePolicyService {
  getPolicies() async {
    try {
      String url = MsureConstants.msureBaseUrl + "/policy";
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  buyPolicy(var amount, var productCode) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/policy/buy";
      var payload = {'amount': amount, 'product_code': productCode};
      var response = await Dio().post(url,
          data: payload, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  cancelPolicy(var id) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/policy/$id";
      var response = await Dio().delete(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  activePolicy() async {
    try {
      String url = MsureConstants.msureBaseUrl + "/policy/active";
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }
}



// try {} catch (ex) {print(ex);}
