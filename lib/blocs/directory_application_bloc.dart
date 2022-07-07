import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/Directory/directory_services/directory_categories/directory_categories.dart';
import 'package:mpost/mpost/Directory/directory_services/directory_products/directory_products.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/msure_services/msure_claim_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_auth_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_policy_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_product_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_user_service.dart';

class DirectoryApplicationBloc with ChangeNotifier {
  final DirectoryCategoryService directoryCategoryService =
      DirectoryCategoryService();
  final DirectoryProductService directoryProductService =
      DirectoryProductService();

  DirectoryApplicationBloc() {
    print("Directory BLOC working");
  }

  // variables
  bool loading = false;

  // directory catigories

  getCategories() async {
    loading = true;
    await Future.delayed(Duration(microseconds: 200));
    notifyListeners();
    var data = await directoryCategoryService.getCategories();
    loading = false;
    notifyListeners();
    return data;
  }

  getAllProducts(categoryId) async {
    loading = true;
    await Future.delayed(Duration(microseconds: 200));
    notifyListeners();
    var data = await directoryProductService.getAllProducts(categoryId);
    loading = false;
    notifyListeners();
    return data;
  }

  getRelatedProducts(ids) async {
    loading = true;
    await Future.delayed(Duration(microseconds: 200));
    notifyListeners();
    var data = await directoryProductService.getRelatedProducts(ids);
    loading = false;
    notifyListeners();
    return data;
  }
}
