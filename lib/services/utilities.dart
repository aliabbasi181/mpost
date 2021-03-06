import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities {
  static int generateKey() {
    return DateTime.now().microsecondsSinceEpoch.remainder(40000);
  }
}

class LinkingService {
  var connectivityResult;
  void openMyLink(String url, BuildContext context) async {
    try {
      if (await checkMyConnectivity(connectivityResult)) {
        await launch(url,
            forceSafariVC: true, forceWebView: true, enableJavaScript: true);
        if (await canLaunch(url)) {}
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Your are not connected with internet")));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Can't open at this moment.")));
    }
  }

  Future<bool> checkMyConnectivity(var connectivityResult) async {
    connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
