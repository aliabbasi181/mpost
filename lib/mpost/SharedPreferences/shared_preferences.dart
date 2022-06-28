import 'dart:convert';

import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPLocalStorage {
  static SharedPreferences? preferences;
  static const keyMsureToken = 'msureToken';
  static const keyMsureUser = 'msureUser';
  static Future init() async {
    preferences = await SharedPreferences.getInstance();
    print("Shared Preferences Initialized");
  }

  static Future setMsureToken(String token) async {
    await preferences?.setString(keyMsureToken, token);
    print("saved msure token");
  }

  static Future removeMsureToken() async {
    await preferences?.setString(keyMsureToken, "null");
    print("removed msure token");
  }

  static Future setMsureUserDetail(MsureUserModel msureUserModel) async {
    await preferences?.setString(keyMsureUser, jsonEncode(msureUserModel));
  }

  static Future<MsureUserModel> getMsureUserDetail() async {
    var data = await preferences!.getString(keyMsureUser);
    if (data != null) {
      MsureUserModel msureUserModel = MsureUserModel.fromJson(jsonDecode(data));
      return msureUserModel;
    } else {}
    MsureUserModel msureUserModel = MsureUserModel(name: "N/A");
    return msureUserModel;
  }
}
