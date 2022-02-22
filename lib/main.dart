import 'dart:async';
//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/log_and_reg.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/payment.dart';
import 'package:mpost/services/notifications.dart';
import 'package:mpost/splash.dart';
import 'package:provider/provider.dart';
import 'mpost/payment/choose_payment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
          channelKey: "basic_channel",
          channelName: "Basic Channel",
          channelDescription: "channelDescription",
          importance: NotificationImportance.High,
          defaultColor: const Color.fromARGB(255, 0, 0, 0),
          channelShowBadge: true)
    ]);
    MpostNotification.listenMpostNotification();
  } catch (ex) {
    print(ex);
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApplicaitonBloc(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNav(),
        ));
  }
}
