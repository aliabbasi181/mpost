// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:mpost/models/user.dart';

class Constants {
  static Color primaryColor = const Color(0XFFF1582BE);
  static Color descriptionColor = const Color(0XFFF808689);
  static String hostUrl = "http://13.36.21.26/api/";
  static String token = "58|RebiSzLsIwhSTLzXjM0tXSZtuRa2L7RUYDeSgjXw";
  static String registerName = '';
  static String registerEmail = '';
  static String registerMobile = '';
  static String registerPassword = '';
  static String registerType = '';
  static String postal_code_id = '1';
  static String googleAPIkey = 'AIzaSyBDOjOJB4-uVM2YssqKA0KNOwv8WSRxBd4';
  static final String oneSignalAppId = "9793f58f-6acb-4a6d-ba2b-40fd882f345e";
  static final String oneSignalAPIKey =
      "ODM4NzU2ZWUtY2FjZS00MTk1LWJiNjMtMjY0N2YwMDZkZjA2";
  static UserModel user = UserModel();
  static Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static Map<String, String> requestHeadersWithToken = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

class ActivityCategory {
  String name;
  bool active;
  ActivityCategory(this.name, this.active);
  static List<ActivityCategory> activityTabs = [
    ActivityCategory("Deliveries", true),
    ActivityCategory("Shopping", false),
    ActivityCategory("Events", false),
    ActivityCategory("Transport", false),
    ActivityCategory("Movies", false),
    ActivityCategory("Gift Card", false),
  ];
}
