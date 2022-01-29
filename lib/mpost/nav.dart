import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mpost/mpost/activity.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/mpost/payment.dart';
import 'package:mpost/mpost/profile.dart';

const List<Widget> _screens = <Widget>[
  Home(),
  Activity(),
  Payment(),
  Profile()
];

int _selectedIndex = 0;

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final PageController _pageController = PageController(initialPage: 0);
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
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: SafeArea(
          child: GNav(
            gap: 8,
            backgroundColor: Colors.transparent,
            iconSize: 30,
            textStyle: const TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 18),
            tabs: [
              GButton(
                iconColor: Colors.white,
                icon: CupertinoIcons.compass_fill,
                text: 'Home',
                iconActiveColor: Colors.white,
                border: Border.all(width: 1.5, color: Colors.white),
                activeBorder: Border.all(width: 2, color: Colors.white),
                padding: const EdgeInsets.all(10),
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
              ),
              GButton(
                iconColor: Colors.white,
                icon: CupertinoIcons.square_list_fill,
                text: 'Activity',
                iconActiveColor: Colors.white,
                border: Border.all(width: 1.5, color: Colors.white),
                padding: const EdgeInsets.all(10),
              ),
              GButton(
                iconColor: Colors.white,
                icon: Icons.account_balance_wallet_outlined,
                text: 'Payment',
                iconActiveColor: Colors.white,
                border: Border.all(width: 1.5, color: Colors.white),
                padding: const EdgeInsets.all(10),
              ),
              GButton(
                iconColor: Colors.white,
                icon: CupertinoIcons.person,
                text: 'Profile',
                iconActiveColor: Colors.white,
                border: Border.all(width: 1.5, color: Colors.white),
                padding: const EdgeInsets.all(10),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                _screens[index];
                _pageController.jumpToPage(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
