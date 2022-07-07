import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mpost/mpost/Directory/directory_constants.dart';
import 'package:mpost/mpost/Directory/directory_models/DirectoryCategoryModel.dart';

class DirectoryCategoryService {
  getCategories() async {
    try {
      String url = DirectoryConstants.setUrl(
          '/wc/v3/products/categories?orderby=name&order=asc');
      print(url);
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<DirectoryCategoryModel> categories = [];
        for (var item in response.data) {
          if (item['name'] != "Uncateorized") {
            item['name'] =
                item['name'].toString().replaceAll(RegExp('[^A-Za-z]'), ' ');
            categories.add(DirectoryCategoryModel.fromJson(item));
          }
        }
        return categories;
      }
    } catch (ex) {
      print(ex);
    }
  }
}
