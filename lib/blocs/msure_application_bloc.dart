import 'package:flutter/material.dart';
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

  // Auth services
  Future<bool> msureLogin() async {
    return await msureAuthServices.login();
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
    return await msureAuthServices.register(name, surname, phone, email,
        password, nationalId, dateOfBirth, location, ntsaNumber);
  }

  // user service
  Future<MsureUserModel> getUser() async {
    return await msureUserService.getUserDetail();
  }

  getUserStatus() async {
    await msureUserService.getUserStatus();
  }

  updateUser(Map<String, dynamic> params) async {
    await msureUserService.updateUser(params);
  }

  updateUserProfile(Map<String, dynamic> params) async {
    await msureUserService.updateUserProfile(params);
  }

  Future<List<MsureUserModel>> getAllUsers() async {
    return await msureUserService.getAllUsers();
  }

  // claim service
  getClaimReasons() async {
    await msureClaimService.getClaimReasons();
  }

  createClaimReasons(var reason) async {
    await msureClaimService.createClaimReasons(reason);
  }

  initiateClaim(var type, var relationToMainMember, var hospitalAdmissionDate,
      var hospitalDischargeDate) async {
    await msureClaimService.initiateClaim(type, relationToMainMember,
        hospitalAdmissionDate, hospitalDischargeDate);
  }

  claimDetails(var id) async {
    await msureClaimService.claimDetails(id);
  }

  // policy service

  getPolicies() async {
    await msurePolicyService.getPolicies();
  }

  buyPolicy(var amount, var productCode) async {
    await msurePolicyService.buyPolicy(amount, productCode);
  }

  cancelPolicy(var id) async {
    await msurePolicyService.cancelPolicy(id);
  }

  activePolicy() async {
    await msurePolicyService.activePolicy();
  }

  // product service
  getProducts() async {
    await msureProductService.getProducts();
  }
}
