import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mpost/mpost/activity/activity.dart';
import 'package:mpost/mpost/home.dart';
import 'package:mpost/mpost/payment.dart';
import 'package:mpost/mpost/profile/profile.dart';
import 'package:mpost/services/notifications.dart';
import 'package:provider/provider.dart';

import '../blocs/application_bloc.dart';

const List<Widget> _screens = <Widget>[Home(), Payment(), UserProfile()];

int _selectedIndex = 0;

class BottomNav extends StatefulWidget {
  bool loadDeliveries;
  BottomNav({Key? key, required this.loadDeliveries}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    widget.loadDeliveries ? _getDeliveries() : null;
    _selectedIndex = 0;
    print(_selectedIndex);
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
          child: BottomNavigationBar(
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: Constants.primaryColor,
            selectedLabelStyle: TextStyle(
              color: Constants.primaryColor,
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
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  label: "Payment"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
            ],
          ),
          // child: GNav(
          //   gap: 8,
          //   backgroundColor: Colors.transparent,
          //   iconSize: 30,
          //   textStyle: TextStyle(
          //       color: Constants.primaryColor,
          //       fontFamily: "Montserrat",
          //       fontWeight: FontWeight.w500,
          //       fontSize: 16),
          //   activeColor: Constants.primaryColor,
          //   tabs: [
          //     GButton(
          //       iconColor: Constants.primaryColor,
          //       icon: CupertinoIcons.compass_fill,
          //       text: 'Home',
          //       iconActiveColor: Constants.primaryColor,
          //       border: Border.all(width: 1.5, color: Constants.primaryColor),
          //       activeBorder:
          //           Border.all(width: 2, color: Constants.primaryColor),
          //       padding: const EdgeInsets.all(6),
          //       curve: Curves.ease,
          //       duration: const Duration(seconds: 1),
          //     ),
          //     GButton(
          //       iconColor: Constants.primaryColor,
          //       icon: Icons.account_balance_wallet_outlined,
          //       text: 'Payment',
          //       iconActiveColor: Constants.primaryColor,
          //       border: Border.all(width: 1.5, color: Constants.primaryColor),
          //       padding: const EdgeInsets.all(6),
          //       activeBorder:
          //           Border.all(width: 2, color: Constants.primaryColor),
          //     ),
          //     GButton(
          //       iconColor: Constants.primaryColor,
          //       icon: CupertinoIcons.person,
          //       text: 'Profile',
          //       iconActiveColor: Constants.primaryColor,
          //       border: Border.all(width: 1.5, color: Constants.primaryColor),
          //       padding: const EdgeInsets.all(6),
          //       activeBorder:
          //           Border.all(width: 2, color: Constants.primaryColor),
          //     ),
          //   ],
          //   selectedIndex: _selectedIndex,
          //   onTabChange: (index) {
          //     setState(() {
          //       _selectedIndex = index;
          //       _screens[index];
          //       _pageController.jumpToPage(index);
          //     });
          //   },
          // ),
        ),
      ),
    );
  }
}
