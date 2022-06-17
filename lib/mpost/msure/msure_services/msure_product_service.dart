import 'package:dio/dio.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';

class MsureProductService {
  getProducts() async {
    try {
      String url = MsureConstants.msureBaseUrl + "/products";
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }
}
