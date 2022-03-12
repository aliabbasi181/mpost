import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/connectivity.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/delivery.dart';
import 'package:mpost/models/places_search.dart';
import 'package:mpost/models/postal_code_model.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/payment/processing.dart';
import 'package:mpost/services/delivery_services.dart';
import 'package:mpost/services/login_register.dart';
import 'package:mpost/services/notifications.dart';
import 'package:mpost/services/payment.dart';
import 'package:mpost/services/places_service.dart';
import 'package:mpost/services/user_service.dart';
import 'package:mpost/services/virtual_address.dart';

class ApplicaitonBloc with ChangeNotifier {
  final placesService = PlacesService();
  final loginRegisterService = LoginRegisterService();
  final delivaryService = DeliveryService();
  final PaymentService paymentService = PaymentService();
  final UserService userService = UserService();
  final VirtualAddressService virtualAddressService = VirtualAddressService();

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
  int pendingPayments = 0;
  List<PostalCodeModel> postalCodes = [];

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

  Future<bool> login(String phone, BuildContext context) async {
    loading = true;
    notifyListeners();
    loginOTPSent = await loginRegisterService.loginService(phone, context);
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

  Future<bool> register(BuildContext context) async {
    loading = true;
    notifyListeners();
    if (await loginRegisterService.register(context)) {
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
    String timeString0 = time.split('|')[1].trim().split(':')[0];

    if (time.split('|')[0].trim() == "Today") {
      DateTime getTime = DateTime.now();
      String timeString = getTime.year.toString() +
          "-" +
          getTime.month.toString() +
          "-" +
          (getTime.day - 1).toString() +
          " $timeString0:00:00";
      final_time = timeString;
    } else {
      DateTime now = DateTime.now();
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      String timeString = tomorrow.year.toString() +
          "-" +
          tomorrow.month.toString() +
          "-" +
          tomorrow.day.toString() +
          " $timeString0:00:00";
      final_time = timeString;
    }
    print(final_time);
    loading = true;
    notifyListeners();
    String res =
        await delivaryService.confirmOrder(from, to, recpDetail, final_time);
    var cost = res.split(',');
    if (cost.first != "-1") {
      totalCost = int.parse(cost.first);
      paymentRequestId = int.parse(cost.last);
      loading = false;
      notifyListeners();
      return true;
    }
    loading = false;
    notifyListeners();
    return false;
  }

  Future<int> getDistance(LatLng from, LatLng to) async {
    int cost = 0;
    cost = await placesService.calculateDistance(from, to);
    if (cost == -1) {
      return -1;
    }
    print(cost);
    return cost;
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
            "Dear user your payment has been successfully initialized and its on pending. Put your security PIN to complete delivery process.",
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

  initializeDeliveryPayment(
      String operator,
      String txref,
      String phone,
      String amount,
      BuildContext context,
      String email,
      String currency) async {
    paymentRequestStatus = "loading";
    notifyListeners();
    if (operator == "Safaricom") {
      if (await paymentService.initializeFlutterwavePayment(
          txref, phone, amount, context, email, currency)) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const PaymentSuccess(),
          ),
          (route) => false,
        );
        MpostNotification.notify(
            "Payment has been initialized.",
            "Dear user your payment has been successfully initialized and its on pending. You can now continue using MPOST",
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

  Future<bool> checkConnection(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ConnectivityStatus()));
    }
    return false;
  }

  getMyDeliveries() async {
    pendingPayments = 0;
    try {
      deliveries = await delivaryService.getAllDeliveries();
      for (var item in deliveries) {
        if (item.paymentRequest != null) {
          if (int.parse(item.paymentRequest!.balance.toString()) > 0) {
            pendingPayments++;
          }
        }
      }
    } catch (ex) {
      print(ex);
    }
    notifyListeners();
  }

  Future<List<Address>> getAddress(double lat, lng) async {
    loading = true;
    notifyListeners();
    List<Address> address = await placesService.getAddress(lat, lng);
    loading = false;
    notifyListeners();
    return address;
  }

  Future<bool> updateUser(String firstName, String lastName, String email,
      String phoneNumber, String mpostVirtualCode, String city) async {
    loading = true;
    notifyListeners();
    if (await userService.updateUser(
        firstName, lastName, email, phoneNumber, mpostVirtualCode, city)) {
      loading = false;
      notifyListeners();
      return true;
    }
    loading = false;
    notifyListeners();
    return false;
  }

  getPostalCodes() async {
    postalCodes = await virtualAddressService.getPostalCode();
  }

  Future<String> createVirtualAddress(PostalCodeModel postalCode) async {
    loading = true;
    notifyListeners();
    String result =
        await virtualAddressService.createVirtualAddress(postalCode);
    loading = false;
    notifyListeners();
    return result;
  }
}
