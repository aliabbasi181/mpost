import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mpost/mpost/Directory/directory_constants.dart';
import 'package:mpost/mpost/Directory/directory_models/DirectoryProductModel.dart';

class DirectoryProductService {
  getAllProducts(categoryId) async {
    try {
      String url = DirectoryConstants.setUrl(
          '/wc/v3/products?context=view&order=desc&orderby=date&category=$categoryId&per_page=30');
      print(url);
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<DirectoryProductModel> products = [];
        for (var item in response.data) {
          products.add(DirectoryProductModel.fromJson(item));
        }
        return products;
      }
    } catch (ex) {
      print(ex);
    }
  }

  getRelatedProducts(ids) async {
    try {
      List<DirectoryProductModel> products = [];
      for (var id in ids) {
        String url =
            DirectoryConstants.setUrl('/wc/v3/products/$id?context=view');
        print(url);
        var response = await Dio().get(url);
        if (response.statusCode == 200) {
          products.add(DirectoryProductModel.fromJson(response.data));
        }
      }
      return products;
    } catch (ex) {
      print(ex);
    }
  }
}
