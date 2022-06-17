import 'package:dio/dio.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';

class MsureClaimService {
  getClaimReasons() async {
    try {
      String url = MsureConstants.msureBaseUrl + "/reasons";
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (ex) {
      print(ex);
    }
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

  initiateClaim(var type, var relationToMainMember, var hospitalAdmissionDate,
      var hospitalDischargeDate) async {
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
        print(response.data);
      }
    } catch (ex) {
      print(ex);
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
}



// try {} catch (ex) {print(ex);}
