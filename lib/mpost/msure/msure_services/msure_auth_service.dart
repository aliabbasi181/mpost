import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';

class MsureAuthService {
  Future<bool> login() async {
    var headers = {'Accept': 'application/json'};
    var payload = {
      'username': "Eliasbaya1223@gmail.com",
      'password': "Eliasbaya@1223"
    };
    String url = MsureConstants.msureBaseUrl + "/login";
    try {
      var response = await Dio()
          .post(url, options: Options(headers: headers), data: payload);
      if (response.statusCode == 200) {
        MsureConstants.token =
            "${response.data['token_type']} ${response.data['token']}";
        MsureConstants.setToken(
            "${response.data['token_type']} ${response.data['token']}");
        return true;
      }
    } catch (ex) {}
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
    var payload = {
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
    String url = MsureConstants.msureBaseUrl + "/register";
    try {
      var response = await Dio()
          .post(url, options: Options(headers: headers), data: payload);
      if (response.statusCode == 200) {
        MsureConstants.token =
            "${response.data['token_type']} ${response.data['token']}";
        MsureConstants.setToken(
            "${response.data['token_type']} ${response.data['token']}");
        return true;
      }
    } catch (ex) {}
    return false;
  }
}
