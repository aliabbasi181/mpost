import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/msure/insurance/claim/claim_home.dart';
import 'package:mpost/mpost/msure/msure_nav.dart';
import 'package:mpost/mpost/msure/msure_splash.dart';
import 'package:mpost/services/notifications.dart';
import 'package:mpost/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
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
  await SPLocalStorage.init();
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ApplicaitonBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => MSUREApplicationBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Splash(),
            '/msure_splash': (context) => MsureSplashScreen(),
            '/msure_home': (context) => MSUREBottomNav(loadDeliveries: false),
            '/msure_insurance_claim': (context) => MPOSTInsuranceClaimHome(),
          },
          initialRoute: '/',
          builder: EasyLoading.init(),
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //       create: (context) => ApplicaitonBloc(),
  //       child: MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         routes: {
  //           '/': (context) => Splash(),
  //           '/msure_home': (context) => MSUREBottomNav(loadDeliveries: false),
  //           '/msure_insurance_claim': (context) => MPOSTInsuranceClaimHome(),
  //         },
  //         initialRoute: '/',
  //       ));
  // }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
