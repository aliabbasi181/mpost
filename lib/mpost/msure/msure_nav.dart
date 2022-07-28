import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mpost/mpost/activity/activity.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/mpost/msure/about_msure.dart';
import 'package:mpost/mpost/msure/contact_msure.dart';
import 'package:mpost/mpost/msure/home.dart';
import 'package:mpost/mpost/msure/msure_home.dart';
import 'package:mpost/mpost/msure/msure_profile.dart';
import 'package:mpost/mpost/payment.dart';
import 'package:mpost/mpost/profile/profile.dart';
import 'package:mpost/services/notifications.dart';
import 'package:provider/provider.dart';

const List<Widget> _screens = <Widget>[
  MSUREHome2(),
  MSUREHome(),
  MSUREProfile()
];

int _selectedIndex = 0;

class MSUREBottomNav extends StatefulWidget {
  bool loadDeliveries;
  MSUREBottomNav({Key? key, required this.loadDeliveries}) : super(key: key);

  @override
  _MSUREBottomNavState createState() => _MSUREBottomNavState();
}

class _MSUREBottomNavState extends State<MSUREBottomNav> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  _getDeliveries() async {
    final applicationBloc =
        Provider.of<ApplicaitonBloc>(context, listen: false);
    if (await applicationBloc.checkConnection(context)) {
      applicationBloc.getMyDeliveries();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _pageController,
        itemCount: _screens.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: Container(
        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)]),
        child: SafeArea(
          bottom: Platform.isIOS ? false : true,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: Constants.msureRed,
            selectedLabelStyle: TextStyle(
              color: Constants.msureRed,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Color(0XFFF808689),
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
            iconSize: 25,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                _screens[index];
                _pageController.jumpToPage(index);
              });
            },
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_grid_2x2), label: "Payment"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
