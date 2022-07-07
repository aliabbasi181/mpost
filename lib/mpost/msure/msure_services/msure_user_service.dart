import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:http/http.dart' as http;

class MsureUserService {
  Future<MsureUserModel> getUserDetail() async {
    MsureUserModel user = MsureUserModel();
    try {
      String url = MsureConstants.msureBaseUrl + '/user';
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
        //var json = jsonDecode(response.data);
        user = MsureUserModel.fromJson(response.data);
        await SPLocalStorage.setMsureUserDetail(user);
        user = await SPLocalStorage.getMsureUserDetail();
        print(user);
      }
    } catch (ex) {
      print(ex);
    }
    return user;
  }

  Future<int> getUserStatus() async {
    try {
      String url = MsureConstants.msureBaseUrl + '/user-status';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': MsureConstants.token,
          'Accept': 'application/json'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return 1;
      } else if (response.statusCode == 401) {
        return -1;
      } else {
        return 0;
      }
    } catch (ex) {
      return 0;
    }
  }

  Future<bool> updateUser(Map<String, dynamic> params) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/users";
      var response = await Dio().put(url,
          options: Options(headers: MsureConstants.msureheaderWithToken),
          queryParameters: params);
      if (response.statusCode == 200) {
        await getUserDetail();
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
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
