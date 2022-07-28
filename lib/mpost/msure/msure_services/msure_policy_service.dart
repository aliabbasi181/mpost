import 'package:dio/dio.dart';
import 'package:mpost/mpost/msure/MsureModels/MsurePolicyStatusModel.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:mpost/services/notifications.dart';

class MsurePolicyService {
  getPolicies() async {
    MsurePolicyStatusModel policyStatusModel = MsurePolicyStatusModel();
    try {
      String url = MsureConstants.msureBaseUrl + "/policy";
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
        policyStatusModel = MsurePolicyStatusModel.fromJson(response.data);
        return policyStatusModel;
      }
    } catch (ex) {
      print(ex);
    }
  }

  buyPolicy(var amount, var mobile, var policyId) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/policy/buy";
      var payload = {'amount': amount, 'policy_id': policyId, "mobile": mobile};
      var response = await Dio().post(url,
          data: payload,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
        MpostNotification.notify("Payment has been initialized.",
            response.data['message'], "basic_channel");
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  cancelPolicy(var id) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/policy/$id";
      var response = await Dio().delete(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  activePolicy() async {
    try {
      String url = MsureConstants.msureBaseUrl + "/policy/active";
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }
}



// try {} catch (ex) {print(ex);}




