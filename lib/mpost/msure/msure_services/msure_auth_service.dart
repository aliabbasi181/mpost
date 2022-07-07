import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:mpost/mpost/msure/msure_services/msure_user_service.dart';

class MsureAuthService {
  Future<bool> login(String username, String password) async {
    var headers = {'Accept': 'application/json'};
    var payload = {'username': username, 'password': password};
    String url = MsureConstants.msureBaseUrl + "/login";
    try {
      Constants.showLoader("Logging In...");
      var response = await Dio()
          .post(url, options: Options(headers: headers), data: payload);
      if (response.statusCode == 200) {
        MsureConstants.token = "Bearer " + response.data['token'];
        SPLocalStorage.setMsureToken(MsureConstants.token);
        MsureUserService msureUserService = MsureUserService();
        Constants.showLoader("Validating...");
        int status = await msureUserService.getUserStatus();
        if (status == -1) {
          EasyLoading.showError("You are Unauthorised.");
          return false;
        } else if (status == 0) {
          EasyLoading.showError("An error occured while validationg...");
          return false;
        }
        Constants.showLoader("Fetching details...");
        await msureUserService.getUserDetail();
        EasyLoading.dismiss();
        MsureConstants.token =
            "${response.data['token_type']} ${response.data['token']}";
        MsureConstants.setToken(
            "${response.data['token_type']} ${response.data['token']}");
        return true;
      } else {
        print(response.data);
        EasyLoading.showError("One or more details are incorrect.");
      }
    } catch (ex) {
      print(ex);
      EasyLoading.showError("One or more details are incorrect.");
    }
    if (!EasyLoading.isShow) {
      EasyLoading.showError("Error while loggin in.");
    }
    return false;
  }

  Future<bool> register(
      var name,
      var surname,
      var phone,
      var email,
      var password,
      var nationalId,
      var dateOfBirth,
      var location,
      var ntsaNumber) async {
    var headers = {'Accept': 'application/json'};
    Map<String, dynamic> payload = {
      "name": name,
      "surname": surname,
      "phone": phone,
      "email": email,
      "password": password,
      "national_id": nationalId,
      "date_of_birth": dateOfBirth,
      "location": location,
      "ntsa_number": ntsaNumber
    };
    print(payload);
    String url = MsureConstants.msureBaseUrl + "/register";
    try {
      var response =
          await http.post(Uri.parse(url), body: payload, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        MsureConstants.token = "${json['token_type']} ${json['token']}";
        MsureConstants.setToken("${json['token_type']} ${json['token']}");
        SPLocalStorage.setMsureToken(MsureConstants.token);
        print(await SPLocalStorage.preferences!
            .getString(SPLocalStorage.keyMsureToken));
        return true;
      }
    } catch (ex) {
      print(ex);
    }
    return false;
  }
}
