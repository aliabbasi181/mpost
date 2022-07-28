import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:dio/dio.dart';

class MsureContactService {
  postContact(subject, message) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/messages";
      Map<String, dynamic> payload = {
        "subject": subject.toString(),
        "body": message.toString(),
      };
      print(payload);
      var response = await Dio().post(url,
          data: payload,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      print(response.statusCode);
      if (response.statusCode == 200) {
        EasyLoading.showSuccess(response.data['message']);
        return true;
      } else {
        EasyLoading.showError("Error sending message!");
        return false;
      }
    } catch (ex) {
      print(ex);
      EasyLoading.showError("Error sending message!");
      return false;
    }
  }
}
