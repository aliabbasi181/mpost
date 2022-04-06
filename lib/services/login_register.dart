import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mpost/constants.dart';
import 'package:mpost/login_register/register.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/user_service.dart';

class LoginRegisterService {
  // login
  Future<bool> loginService(String phone, BuildContext context) async {
    try {
      String url = Constants.hostUrl + "auth/login";
      print(url);
      var response = await http.post(
        Uri.parse(url),
        headers: Constants.requestHeaders,
        body: jsonEncode(<String, String>{
          'username': phone,
        }),
      );
      Constants.error =
          "status code: ${response.statusCode}\n message: ${response.body}";
      if (response.statusCode == 200) {
        return true;
        //var json = jsonDecode(response.body.toString());
      } else {
        var json = jsonDecode(response.body);
        if (json['message'] ==
            "User with mobile 254704145555 is not registered.") {
          await showSnackBar("Login failed.",
              "User with mobile 254704145555 is not registered.", context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Register()));
        }
        return false;
      }
    } catch (ex) {
      print(ex);
      Constants.error = ex.toString();
      return false;
    }
  }

  UserService userService = UserService();

  Future<bool> verifyOtpLogin(String code, String phone) async {
    try {
      String url = Constants.hostUrl + "auth/verify-otp";
      var response = await http.post(
        Uri.parse(url),
        headers: Constants.requestHeaders,
        body: jsonEncode(
            <String, dynamic>{"mobile": phone, "login": true, "otp": code}),
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
        Constants.token = json['access_token'];
        Constants.setToken();
        await userService.getUser(false);
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> loginWithUsernamePassword(
      String username, String password, BuildContext context) async {
    try {
      String url = "https://mpost-app.co.ke/api/auth/login";
      Map<String, dynamic> payload = {
        "username": username,
        "password": password,
      };
      print(payload);
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(payload), headers: Constants.requestHeaders);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Constants.token = json['access_token'];
        Constants.setToken();
        await userService.getUser(false);
        return true;
      } else if (response.statusCode == 401) {
        showSnackBar("Login failed", "Invalid login details", context);
        return false;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex.toString());
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
      String url = Constants.hostUrl + "auth/request-otp";
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
  Future<bool> register(BuildContext context, bool withPhone) async {
    try {
      String url = Constants.hostUrl + "auth/register";
      String firstName = Constants.registerName.split(' ').first.trim();
      String lastName = Constants.registerName.trim().split(' ').last.trim();
      Map<String, dynamic> payload = {};
      if (withPhone) {
        print("phone");
        if (Constants.isNational) {
          payload = {
            "first_name": firstName,
            "last_name": lastName,
            "mobile": Constants.registerMobile,
            "email": Constants.registerEmail,
            "postal_code_id": Constants.postal_code_id,
            "request_otp": true,
            "type": Constants.registerType,
            "national_id_number": Constants.identityNumber
          };
        } else {
          payload = {
            "first_name": firstName,
            "last_name": lastName,
            "mobile": Constants.registerMobile,
            "email": Constants.registerEmail,
            "postal_code_id": Constants.postal_code_id,
            "request_otp": true,
            "type": Constants.registerType,
            "passport_number": Constants.identityNumber
          };
        }
      } else {
        if (Constants.isNational) {
          payload = {
            "first_name": firstName,
            "last_name": lastName,
            "mobile": Constants.registerMobile,
            "email": Constants.registerEmail,
            "postal_code_id": Constants.postal_code_id,
            "request_otp": true,
            "type": Constants.registerType,
            "national_id_number": Constants.identityNumber,
            "password": Constants.registerPassword,
            "password_confirmation": Constants.registerPassword
          };
        } else {
          payload = {
            "first_name": firstName,
            "last_name": lastName,
            "mobile": Constants.registerMobile,
            "email": Constants.registerEmail,
            "postal_code_id": Constants.postal_code_id,
            "request_otp": true,
            "type": Constants.registerType,
            "passport_number": Constants.identityNumber,
            "password": Constants.registerPassword,
            "password_confirmation": Constants.registerPassword
          };
        }
      }
      print(payload);
      var response = await http.post(Uri.parse(url),
          headers: Constants.requestHeaders, body: jsonEncode(payload));
      print(response.body);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Constants.token = json['access_token'];
        Constants.setToken();
        print(Constants.requestHeadersWithToken);
        await userService.getUser(false);
        return true;
      } else {
        var json = jsonDecode(response.body);
        showSnackBar("Registration failed.", json.toString(), context);
        if (json['errors']['mobile'].toString() ==
            "[The mobile has already been taken.]") {
          showSnackBar("Registration failed.",
              "THIS NUMBER ALREADY HAS AN ACCOUNT", context);
        }
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  // getUser() async {
  //   String url = Constants.hostUrl + "users/me?with[]=addresses.status";
  //   var response = await Dio()
  //       .get(url, options: Options(headers: Constants.requestHeadersWithToken));
  //   UserModel user;
  //   if (response.statusCode == 200) {
  //     dynamic data = response.data;
  //     user = UserModel.fromJson(data);
  //     print(user.bearerToken);
  //     await DatabaseHandler.instance.addUser(user);
  //   } else {
  //     print("error getting user");
  //   }
  // }
}
