import 'package:dio/dio.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureProductModel.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';

class MsureProductService {
  getProducts() async {
    List<MsureProductModel> products = [];
    try {
      String url = MsureConstants.msureBaseUrl + "/products";
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
        for (var item in response.data) {
          products.add(MsureProductModel.fromJson(item));
        }
      }
    } catch (ex) {
      print(ex);
    }
    return products;
  }
}
