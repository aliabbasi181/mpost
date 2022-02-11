// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class Constants {
  static Color primaryColor = const Color(0XFFF1582BE);
  static Color descriptionColor = const Color(0XFFF80868a);
  static String hostUrl = "http://13.36.21.26/api/";
  static String token = '11|4QLLomk5frq3wRyRYbGrQndLCFppuvewxDW7IuG2';
  static String registerName = '';
  static String registerEmail = '';
  static String registerMobile = '';
  static String registerPassword = '';
  static String registerType = '';
  static String postal_code_id = '1';
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
