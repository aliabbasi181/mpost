import 'package:dio/dio.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/user.dart';
import 'package:mpost/models/virtual_address_model.dart';
import 'package:mpost/services/database.dart';

class UserService {
  getUser(bool loggedin) async {
    String url = Constants.hostUrl + "users/me?with[]=addresses.status";
    var response = await Dio()
        .get(url, options: Options(headers: Constants.requestHeadersWithToken));
    UserModel user;
    if (response.statusCode == 200) {
      dynamic data = response.data;
      user = UserModel.fromJsonLogingIn(data);
      VirtualAddressModel virtualAddressModel;
      if (user.addresses!.isNotEmpty) {
        print(data['addresses']);
        virtualAddressModel =
            VirtualAddressModel.fromJson(data['addresses'][0]);
        Constants.virtualAddress = virtualAddressModel;
      } else {
        Constants.virtualAddress = VirtualAddressModel(id: -1);
      }
      loggedin ? null : await DatabaseHandler.instance.addUser(user);
    } else {
      print("error getting user");
    }
  }

  Future<bool> updateUser(String firstName, String lastName, String email,
      String phoneNumber, String mpostVirtualCode, String city) async {
    String url = Constants.hostUrl + "users/${Constants.user.userId}/";
    print(url);
    Map<String, dynamic> payload = {};
    payload = {"first_name": firstName, "last_name": lastName, "email": email};

    var response = await Dio().patch(url,
        data: payload,
        options: Options(headers: Constants.requestHeadersWithToken));

    if (response.statusCode == 200) {
      DatabaseHandler.instance.removeUser();
      await getUser(false);
      return true;
    }
    return false;
  }
}
