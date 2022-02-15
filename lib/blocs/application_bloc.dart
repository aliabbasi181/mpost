import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/places_search.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/services/delivery_services.dart';
import 'package:mpost/services/login_register.dart';
import 'package:mpost/services/places_service.dart';

class ApplicaitonBloc with ChangeNotifier {
  final placesService = PlacesService();
  final loginRegisterService = LoginRegisterService();
  final delivaryService = DeliveryService();

  ApplicaitonBloc() {
    print("BLOC working");
  }

  // variables
  List<PlacesSerch> searchResults = [];
  LatLng userLocation = const LatLng(-1.2888736, 36.7913343);
  bool loginOTPSent = true;
  bool otpVerified = true;
  bool loading = false;
  bool newPhone = true;
  int totalCost = -1;

  // register variables

  searchPlaces(String query) async {
    searchResults = await placesService.getAutocomplete(query);
    //print(searchResults);
    notifyListeners();
  }

  getUserLocation() async {
    userLocation = await placesService.getCurrentLocation();
    notifyListeners();
  }

  Future<LatLng> getPlace(String place_id) async {
    return await placesService.getLocation(place_id);
  }

  Future<bool> login(String phone) async {
    loading = true;
    notifyListeners();
    loginOTPSent = await loginRegisterService.loginService(phone);
    loading = false;
    notifyListeners();
    return loginOTPSent;
  }

  Future<bool> verifyLoginOTP(String code, String phone) async {
    loading = true;
    notifyListeners();
    otpVerified = await loginRegisterService.verifyOtpLogin(code, phone);
    loading = false;
    notifyListeners();
    return otpVerified;
  }

  Future<bool> verifyOTP(String code, String phone) async {
    loading = true;
    notifyListeners();
    if (await loginRegisterService.verifyOtp(code, phone)) {
      loading = false;
      notifyListeners();
      return true;
    }
    loading = false;
    notifyListeners();
    return false;
  }

  Future<bool> requestOTP(String phone) async {
    loading = true;
    notifyListeners();
    if (await loginRegisterService.requestOtp(phone)) {
      loading = false;
      notifyListeners();
      return true;
    }
    loading = false;
    newPhone = false;
    notifyListeners();
    return false;
  }

  Future<bool> register() async {
    loading = true;
    notifyListeners();
    if (await loginRegisterService.register()) {
      loading = false;
      notifyListeners();
      return true;
    }
    loading = false;
    notifyListeners();
    return false;
  }

  Future<bool> confirmOrder(
      Address from, Address to, DeliveryDetail recpDetail) async {
    loading = true;
    notifyListeners();
    if (await delivaryService.confirmOrder(from, to, recpDetail)) {
      loading = false;
      notifyListeners();
      return true;
    }
    loading = false;
    notifyListeners();
    return false;
  }

  getDistance(String from, String to) async {
    loading = true;
    notifyListeners();
    String distance = await placesService.calculateDistance(from, to);
    if (distance == "error") {
      totalCost = -2;
    }
    print(distance);
    double cost = double.parse(distance);
    totalCost = (135 + (cost * 25)).round();
    loading = false;
    notifyListeners();
  }
}
