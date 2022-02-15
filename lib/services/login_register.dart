import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mpost/constants.dart';

class LoginRegisterService {
  // login
  Future<bool> loginService(String phone) async {
    try {
      String url = Constants.hostUrl + "auth/login";
      var response = await http.post(
        Uri.parse(url),
        headers: Constants.requestHeaders,
        body: jsonEncode(<String, String>{
          'username': phone,
        }),
      );
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return true;
        //var json = jsonDecode(response.body.toString());
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> verifyOtpLogin(String code, String phone) async {
    try {
      String url = Constants.hostUrl + "auth/verify-otp";
      var response = await http.post(
        Uri.parse(url),
        headers: Constants.requestHeaders,
        body: jsonEncode(
            <String, dynamic>{"mobile": phone, "login": true, "otp": code}),
      );
      print(response.body);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Constants.token = json['access_token'];
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> verifyOtp(String code, String phone) async {
    try {
      String url = Constants.hostUrl + "auth/verify-otp";
      print(phone);
      var response = await http.post(
        Uri.parse(url),
        headers: Constants.requestHeaders,
        body: jsonEncode(<String, dynamic>{"mobile": phone, "otp": code}),
      );
      print(response.body);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> requestOtp(String phone) async {
    try {
      String url = "http://13.36.21.26/api/auth/request-otp";
      print(url);
      print(phone);
      var response = await http.post(
        Uri.parse(url),
        headers: Constants.requestHeaders,
        body: jsonEncode(<String, String>{"mobile": phone}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return true;
        //var json = jsonDecode(response.body.toString());
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  // register
  Future<bool> register() async {
    try {
      String url = Constants.hostUrl + "auth/register";
      String firstName = Constants.registerName.split(' ').first.trim();
      String lastName = Constants.registerName.trim().split(' ').last.trim();
      print(firstName);
      print(lastName);
      print(Constants.registerEmail);
      print(Constants.registerMobile);
      print(Constants.postal_code_id);
      var response = await http.post(
        Uri.parse(url),
        headers: Constants.requestHeaders,
        body: jsonEncode(<String, dynamic>{
          "first_name": firstName,
          "last_name": lastName,
          "mobile": Constants.registerMobile,
          "email": Constants.registerEmail,
          "postal_code_id": Constants.postal_code_id,
          "request_otp": true,
          "type": Constants.registerType
        }),
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Constants.token = json['access_token'];
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
