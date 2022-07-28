import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureProductModel.dart';
import 'package:mpost/mpost/msure/MsureModels/MsureUserModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesCountryModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesRegionModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesStagesModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesSub_CountryModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesWardModel.dart';
import 'package:mpost/mpost/msure/msure_services/msure_claim_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_auth_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_contact_us.dart';
import 'package:mpost/mpost/msure/msure_services/msure_places_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_policy_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_product_service.dart';
import 'package:mpost/mpost/msure/msure_services/msure_user_service.dart';

class MSUREApplicationBloc with ChangeNotifier {
  final MsureAuthService msureAuthServices = MsureAuthService();
  final MsureUserService msureUserService = MsureUserService();
  final MsureClaimService msureClaimService = MsureClaimService();
  final MsurePolicyService msurePolicyService = MsurePolicyService();
  final MsureProductService msureProductService = MsureProductService();
  final MsurePlacesService msurePlacesService = MsurePlacesService();
  final MsureContactService msureContactService = MsureContactService();

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
      var stageId,
      var ntsaNumber) async {
    Constants.showLoader("Signing up...");
    if (await msureAuthServices.register(name, surname, phone, email, password,
        nationalId, dateOfBirth, location, stageId, ntsaNumber)) {
      loading = false;
      notifyListeners();
      EasyLoading.showSuccess("Account created");
      Constants.showLoader("Please wait...");
      await getUser();
      EasyLoading.dismiss();
      return true;
    }
    //EasyLoading.showError("Registration failed.");
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

  getUserStatusData() async {
    return await msureUserService.getUserStatusData();
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
    //Constants.showLoader("Please wait...");
    var policyStatus = await msurePolicyService.getPolicies();
    //EasyLoading.dismiss();
    return policyStatus;
  }

  buyPolicy(var amount, var mobile, var policyId) async {
    Constants.showLoader("Initializing payment");
    bool key = await msurePolicyService.buyPolicy(amount, mobile, policyId);
    EasyLoading.dismiss();
    return key;
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
    Constants.showLoader("Please wait...");
    List<MsureProductModel> products = await msureProductService.getProducts();
    if (products.length > 0) {
      EasyLoading.dismiss();
    } else {
      EasyLoading.showError("No products found.");
    }
    return products;
  }

  Future<List<MsurePlacesRegionModel>> getRegions() async {
    return await msurePlacesService.getRegions();
  }

  Future<MsurePlacesCountryModel> getCounty(id) async {
    return await msurePlacesService.getCounty(id);
  }

  Future<MsurePlacesSub_CountryModel> getSubCounty(id) async {
    return await msurePlacesService.getSubCounty(id);
  }

  Future<MsurePlacesWardModel> getWards(id) async {
    return await msurePlacesService.getWards(id);
  }

  Future<MsurePlacesStagesModel> getStages(id) async {
    return await msurePlacesService.getStages(id);
  }

  userServiceAccounts() async {
    return await msureUserService.userServiceAccounts();
  }

  getUserPayments(String key) async {
    return await msureUserService.getUserPayments(key);
  }

  postContact(subject, message) async {
    Constants.showLoader("Please wait...");
    bool key = await msureContactService.postContact(subject, message);
    EasyLoading.isShow ? EasyLoading.dismiss() : null;
    return key;
  }
}
