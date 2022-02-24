import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/connectivity.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/delivery.dart';
import 'package:mpost/models/places_search.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/payment/processing.dart';
import 'package:mpost/services/delivery_services.dart';
import 'package:mpost/services/login_register.dart';
import 'package:mpost/services/notifications.dart';
import 'package:mpost/services/payment.dart';
import 'package:mpost/services/places_service.dart';

class ApplicaitonBloc with ChangeNotifier {
  final placesService = PlacesService();
  final loginRegisterService = LoginRegisterService();
  final delivaryService = DeliveryService();
  final PaymentService paymentService = PaymentService();

  ApplicaitonBloc() {
    print("BLOC working");
    //getMyDeliveries();
  }

  // variables
  List<PlacesSerch> searchResults = [];
  LatLng userLocation = const LatLng(-1.2888736, 36.7913343);
  bool loginOTPSent = true;
  bool otpVerified = true;
  bool loading = false;
  bool newPhone = true;
  int totalCost = -1;
  int paymentRequestId = -1;
  String paymentRequestStatus = "";
  List<DeliveryModel> deliveries = [];

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
      Address from, Address to, DeliveryDetail recpDetail, String time) async {
    String final_time;
    if (time == "Today | 16:00 - 17:00") {
      DateTime getTime = DateTime.now();
      String timeString = getTime.year.toString() +
          "-" +
          getTime.month.toString() +
          "-" +
          (getTime.day - 1).toString() +
          " 16:00:00";
      print(timeString);
      final_time = timeString;
    } else {
      DateTime now = DateTime.now();
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      String timeString = tomorrow.year.toString() +
          "-" +
          tomorrow.month.toString() +
          "-" +
          tomorrow.day.toString() +
          " 16:00:00";
      print(tomorrow);
      final_time = timeString;
    }
    loading = true;
    notifyListeners();
    String res = await delivaryService.confirmOrder(from, to, recpDetail, time);
    var cost = res.split(',');
    if (cost.first != "-1") {
      totalCost = int.parse(cost.first);
      paymentRequestId = int.parse(cost.last);
      print(paymentRequestId);
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

  initializeMobilePayment(String operator, String phone, paymentRequestId,
      BuildContext context) async {
    paymentRequestStatus = "loading";
    notifyListeners();
    if (operator == "Safaricom") {
      if (await paymentService.safaricomInitialize(
          phone, int.parse(paymentRequestId))) {
        paymentRequestStatus = "pending";
        notifyListeners();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const PaymentSuccess(),
          ),
          (route) => false,
        );
        MpostNotification.notify(
            "Payment has been initialized.",
            "Dear user your payment has been successfully initialized nad its on pending. Put your security PIN to complete delivery process.",
            "basic_channel");
      } else {
        MpostNotification.notify(
            "Payment has been faild.",
            "Dear user your payment has been failed due to tachnical issue. We are sorry for the inconvinence please try again.",
            "basic_channel");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const PaymentError(),
          ),
          (route) => false,
        );
      }
    }
    paymentRequestStatus = "error";
    notifyListeners();
  }

  checkConnection(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
    } else if (connectivityResult == ConnectivityResult.none) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ConnectivityStatus()));
    }
  }

  getMyDeliveries() async {
    print("Getting deliveries");
    try {
      deliveries = await delivaryService.getAllDeliveries();
    } catch (ex) {
      print(ex);
    }
    notifyListeners();
  }
}
