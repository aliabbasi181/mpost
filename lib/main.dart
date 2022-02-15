import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/log_and_reg.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/mpost/nav.dart';
import 'package:mpost/mpost/payment.dart';
import 'package:mpost/splash.dart';
import 'package:provider/provider.dart';

import 'mpost/payment/choose_payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApplicaitonBloc(),
        child: const MaterialApp(
          home: Delivery(),
        ));
  }
}
