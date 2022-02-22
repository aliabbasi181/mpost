//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class MpostNotification {
  static late BuildContext context;
  setContext(BuildContext cont) {
    context = cont;
  }

  static listenMpostNotification() {
    AwesomeNotifications()
        .actionStream
        .listen((ReceivedNotification receivedNotification) async {
      print(receivedNotification.body);
      await AwesomeNotifications().getGlobalBadgeCounter().then(
          (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1));
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ));
    });
  }

  static notify(String title, body, channelKey) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: channelKey,
            title: title,
            autoDismissible: true,
            color: Constants.primaryColor,
            backgroundColor: Colors.black,
            body: body));
  }
}
