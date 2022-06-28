import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';

class MsureClaimService {
  Future<List<dynamic>> getClaimReasons() async {
    List<dynamic> reasons = [];
    try {
      String url = MsureConstants.msureBaseUrl + "/reasons";
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        reasons = response.data['data'];
      }
    } catch (ex) {
      print(ex);
    }
    return reasons;
  }

  createClaimReasons(var reason) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/reasons";
      var payload = {'description': reason};
      var response = await Dio().post(url,
          data: payload, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<bool> initiateClaim(var type, var relationToMainMember,
      var hospitalAdmissionDate, var hospitalDischargeDate) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/claims";
      var payload = {
        "type": type,
        "relation_to_main_member": relationToMainMember,
        "hospital_admission_date": hospitalAdmissionDate,
        "hospital_discharge_date": hospitalDischargeDate
      };
      var response = await Dio().post(url,
          data: payload,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        if (response.data['errors'] != null) {
          EasyLoading.showError(response.data['errors']);
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  claimDetails(var id) async {
    try {
      String url = MsureConstants.msureBaseUrl + "/claims/$id";

      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<dynamic>> getClaims() async {
    List<dynamic> claims = [];
    try {
      String url = MsureConstants.msureBaseUrl + "/claims";
      var response = await Dio().get(url,
          options: Options(headers: MsureConstants.msureheaderWithToken));
      if (response.statusCode == 200) {
        claims = response.data;
      }
    } catch (ex) {
      print(ex);
      EasyLoading.showError("Error getting claim");
      return claims;
    }
    return claims;
  }
}



// try {} catch (ex) {print(ex);}
