import 'package:dio/dio.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';

class MsureUserService {
  Future<MsureUserModel> getUserDetail() async {
    MsureUserModel user = MsureUserModel();
    try {
      String url = MsureConstants.msureBaseUrl + '/user';
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        user = MsureUserModel.fromJson(response.data);
      }
    } catch (ex) {}
    return user;
  }

  getUserStatus() async {
    try {
      String url = MsureConstants.msureBaseUrl + '/user-status';
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {}
  }

  updateUser(Map<String, dynamic> params) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/users";
      var response = await Dio().put(url,
          options: Options(headers: MsureConstants.msureheaderWithToken),
          queryParameters: params);
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  updateUserProfile(Map<String, dynamic> params) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/users/profile";
      var response = await Dio().put(url,
          options: Options(headers: MsureConstants.msureheaderWithToken),
          queryParameters: params);
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<MsureUserModel>> getAllUsers() async {
    List<MsureUserModel> users = [];
    try {
      String url = MsureConstants.msureBaseUrl + '/users';
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        if (response.data['success']) {
          for (var user in response.data['users']) {
            users.add(MsureUserModel.fromJson(user));
          }
        }
      }
    } catch (ex) {}
    return users;
  }
}
