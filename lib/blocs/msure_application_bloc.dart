import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/msure_services/msure_claim_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_auth_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_policy_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_product_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_user_service.dart';

class MSUREApplicationBloc with ChangeNotifier {
  final MsureAuthService msureAuthServices = MsureAuthService();
  final MsureUserService msureUserService = MsureUserService();
  final MsureClaimService msureClaimService = MsureClaimService();
  final MsurePolicyService msurePolicyService = MsurePolicyService();
  final MsureProductService msureProductService = MsureProductService();

  MSUREApplicationBloc() {
    print("Msure BLOC working");
  }

  // variables
  bool loading = false;

  // Auth services
  Future<bool> msureLogin(String username, String password) async {
    if (await msureAuthServices.login(username, password)) {
      return true;
    }
    return false;
  }

  Future<bool> msureRegister(
      var name,
      var surname,
      var phone,
      var email,
      var password,
      var nationalId,
      var dateOfBirth,
      var location,
      var ntsaNumber) async {
    Constants.showLoader("Signing up...");
    if (await msureAuthServices.register(name, surname, phone, email, password,
        nationalId, dateOfBirth, location, ntsaNumber)) {
      loading = false;
      notifyListeners();
      EasyLoading.showSuccess("Account created");
      Constants.showLoader("Please wait...");
      await getUser();
      EasyLoading.dismiss();
      return true;
    }
    EasyLoading.showError("Registration failed.");
    return false;
  }

  // user service
  Future<MsureUserModel> getUser() async {
    MsureUserModel user = await msureUserService.getUserDetail();
    return user;
  }

  Future<int> getUserStatus() async {
    return await msureUserService.getUserStatus();
  }

  Future<bool> updateUser(Map<String, dynamic> params) async {
    Constants.showLoader("Updating");
    if (await msureUserService.updateUser(params)) {
      EasyLoading.dismiss();
      return true;
    } else {
      EasyLoading.showError("Error while updating");
      return false;
    }
  }

  updateUserProfile(Map<String, dynamic> params) async {
    loading = true;
    notifyListeners();
    await msureUserService.updateUserProfile(params);
    loading = false;
    notifyListeners();
  }

  Future<List<MsureUserModel>> getAllUsers() async {
    loading = true;
    notifyListeners();
    List<MsureUserModel> users = await msureUserService.getAllUsers();
    loading = false;
    notifyListeners();
    return users;
  }

  // claim service
  Future<List<dynamic>> getClaimReasons() async {
    Constants.showLoader("Please wait...");
    List<dynamic> reasons = await msureClaimService.getClaimReasons();
    EasyLoading.dismiss();
    return reasons;
  }

  createClaimReasons(var reason) async {
    loading = true;
    notifyListeners();
    await msureClaimService.createClaimReasons(reason);
    loading = false;
    notifyListeners();
  }

  Future<bool> initiateClaim(var type, var relationToMainMember,
      var hospitalAdmissionDate, var hospitalDischargeDate) async {
    Constants.showLoader("Initiating claim...");
    if (await msureClaimService.initiateClaim(type, relationToMainMember,
        hospitalAdmissionDate, hospitalDischargeDate)) {
      EasyLoading.dismiss();
      return true;
    } else {
      EasyLoading.showError("Error initiating claim");
      //EasyLoading.dismiss();
      return false;
    }
  }

  Future<List<dynamic>> getClaims() async {
    Constants.showLoader("Please wait...");
    List<dynamic> claims = await msureClaimService.getClaims();
    EasyLoading.dismiss();
    return claims;
  }

  claimDetails(var id) async {
    loading = true;
    notifyListeners();
    await msureClaimService.claimDetails(id);
    loading = false;
    notifyListeners();
  }

  // policy service

  getPolicies() async {
    Constants.showLoader("Please wait...");
    String policyStatus = await msurePolicyService.getPolicies();
    EasyLoading.dismiss();
    return policyStatus;
  }

  buyPolicy(var amount, var productCode) async {
    loading = true;
    notifyListeners();
    await msurePolicyService.buyPolicy(amount, productCode);
    loading = false;
    notifyListeners();
  }

  cancelPolicy(var id) async {
    loading = true;
    notifyListeners();
    await msurePolicyService.cancelPolicy(id);
    loading = false;
    notifyListeners();
  }

  activePolicy() async {
    loading = true;
    notifyListeners();
    await msurePolicyService.activePolicy();
    loading = false;
    notifyListeners();
  }

  // product service
  getProducts() async {
    loading = true;
    notifyListeners();
    await msureProductService.getProducts();
    loading = false;
    notifyListeners();
  }
}
