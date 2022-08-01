//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/blocs/msure_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/log_and_reg.dart';
import 'package:mpost/mpost/Directory/directory.dart';
import 'package:mpost/mpost/SharedPreferences/shared_preferences.dart';
import 'package:mpost/mpost/activity/activity.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/delivery/post_delivery.dart';
import 'package:mpost/mpost/msure/home.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:mpost/mpost/msure/msure_nav.dart';
import 'package:mpost/mpost/msure/msure_splash.dart';
import 'package:mpost/mpost/payment/choose_payment.dart';
import 'package:mpost/mpost/transport/home.dart';
import 'package:mpost/mpost/virtual_address.dart/create_virtual_address.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/database.dart';
import 'package:mpost/services/login_register.dart';
import 'package:mpost/services/utilities.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  LoginRegisterService service = LoginRegisterService();
  String userName = "";
  LinkingService Linking = LinkingService();

  @override
  void initState() {
    userName = Constants.user.firstName![0].toString() +
        Constants.user.lastName![0].toString();
    final applicationBloc =
        Provider.of<ApplicaitonBloc>(context, listen: false);
    applicationBloc.getMyDeliveries();
    super.initState();
  }

  // _getDeliveries() async {
  //   final applicationBloc =
  //       Provider.of<ApplicaitonBloc>(context, listen: false);
  //   if (await applicationBloc.checkConnection(context)) {
  //     applicationBloc.getMyDeliveries();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0XFFF00C0C4),
                    Color(0XFFF1582BE),
                  ],
                )),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            //padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white.withOpacity(0.7)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(userName,
                                  style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            ),
                          ),
                          const Expanded(
                              child: Image(
                                  width: 76,
                                  height: 22,
                                  image: AssetImage(
                                      "asset/images/mpost_white_logo.png"))),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Activity()));
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image(
                                    height: 30,
                                    width: 30,
                                    image: AssetImage(
                                        "asset/images/notification-icon.png")),
                                Visibility(
                                  visible: applicationBloc.pendingPayments > 0,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        color: const Color(0XFFFBE1515),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // SearchInputField(
                      //   hint: "Search the MPost App",
                      //   controller: searchController,
                      // )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      height: 111,
                      width: Constants.getWidth(context),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0XFFF0DB48B), Color(0XFFF08C890)]),
                          borderRadius: BorderRadius.circular(6)),
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Image(
                              image: AssetImage(
                                  "asset/images/banner-bg-image.png"),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 20, 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color(0XFFFCAC20C)),
                                  child: const Center(
                                    child: Image(
                                        height: 25,
                                        width: 25,
                                        image: AssetImage(
                                            "asset/images/welcome-icon.png")),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Welcome to our new fresh look",
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    const Text(
                                      "Your new one stop shop",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                wellcomeDialog(context));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        padding: const EdgeInsets.fromLTRB(
                                            13, 7, 13, 7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white),
                                        child: const Text(
                                          "Learn more",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: Constants.virtualAddress.id == -1,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(252, 246, 248, 10),
                            borderRadius: BorderRadius.circular(6)),
                        width: Constants.getWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                      text: "Mpost virtual address\n",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      children: [
                                        TextSpan(
                                            text:
                                                "Use your number ${Constants.user.mobile.toString()} ",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w400))
                                      ])),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateVirtualAddress()));
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(13, 10, 13, 10),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color(0XFFFF673BC),
                                            Color(0XFFFBC4788),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Color(0XFFFBC4788), width: 1)),
                                  child: const Text("Register now",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700))),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Constants.virtualAddress.id != -1
                        ? Constants.virtualAddress.statusId != "1"
                            ? Container(
                                padding:
                                    const EdgeInsets.fromLTRB(14, 14, 14, 14),
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(252, 246, 248, 10),
                                    borderRadius: BorderRadius.circular(6)),
                                width: Constants.getWidth(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(
                                            text: "Mpost virtual address\n",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Montserrat",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "You created your virtual address \n\"${Constants.virtualAddress.address} - ${Constants.virtualAddress.postalCode!.postalCode}\n(${Constants.virtualAddress.postalCode!.name})\".\nBut you have not paid yet.",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w400))
                                            ])),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChoosePayment(
                                                      cost: "300",
                                                      id: Constants
                                                          .virtualAddress
                                                          .paymentRequestId
                                                          .toString(),
                                                      isDelivery: false,
                                                    )));
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 10, 13, 10),
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0XFFFF673BC),
                                                    Color(0XFFFBC4788),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color: Color(0XFFFBC4788),
                                                  width: 1)),
                                          child: const Text("Pay now",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontFamily: "Montserrat",
                                                  fontWeight:
                                                      FontWeight.w700))),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding:
                                    const EdgeInsets.fromLTRB(14, 14, 14, 14),
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(252, 246, 248, 10),
                                    borderRadius: BorderRadius.circular(6)),
                                width: Constants.getWidth(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(
                                            text: "Mpost virtual address\n",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Montserrat",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "${Constants.virtualAddress.address} - ${Constants.virtualAddress.postalCode!.postalCode}(${Constants.virtualAddress.postalCode!.name})",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w400))
                                            ])),
                                    // InkWell(
                                    //   onTap: () {
                                    //     Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 const CreateVirtualAddress()));
                                    //   },
                                    //   child: Container(
                                    //       padding: const EdgeInsets.fromLTRB(
                                    //           13, 10, 13, 10),
                                    //       decoration: BoxDecoration(
                                    //           gradient: const LinearGradient(
                                    //               colors: [
                                    //                 Color(0XFFFF673BC),
                                    //                 Color(0XFFFBC4788),
                                    //               ],
                                    //               begin: Alignment.topCenter,
                                    //               end: Alignment.bottomCenter),
                                    //           borderRadius: BorderRadius.circular(4),
                                    //           border: Border.all(
                                    //               color: Color(0XFFFBC4788),
                                    //               width: 1)),
                                    //       child: const Text("Register one",
                                    //           style: TextStyle(
                                    //               fontSize: 12,
                                    //               color: Colors.white,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w700))),
                                    // ),
                                  ],
                                ),
                              )
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () async {
                                await applicationBloc.checkConnection(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DeliveryHome()));
                              },
                              title: "Delivery",
                              image: "asset/images/delivery-icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => messageDialog(
                                      context,
                                      "Coming soon!",
                                      "Stay tuned to this. We are launching soon",
                                      "OK"),
                                );
                                // String URL =
                                //     "https://directory.mpostfintech.co.ke/";
                                // Linking.openMyLink(URL, context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const Directory()));
                              },
                              title: "Directory",
                              image: "asset/images/directory-icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () async {
                                Navigator.pushNamed(context, '/msure_splash');
                                // var token = SPLocalStorage.preferences!
                                //     .getString(SPLocalStorage.keyMsureToken);
                                // if (token == "null") {
                                //   Navigator.pushNamed(context, '/msure_splash');
                                // } else {
                                //   MsureConstants.token = "$token";
                                //   MsureConstants.setToken("$token");
                                //   final msureApplicationBloc =
                                //       Provider.of<MSUREApplicationBloc>(context,
                                //           listen: false);
                                //   await msureApplicationBloc.getUser();
                                //   Navigator.pushNamed(context, '/msure_home');
                                // }
                                //Navigator.pushNamed(context, '/msure_home');

                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) => messageDialog(
                                //       context,
                                //       "Coming soon!",
                                //       "Stay tuned to this. We are launching soon",
                                //       "OK"),
                                // );
                              },
                              title: "Msure",
                              image: "asset/images/shopping-icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => messageDialog(
                                      context,
                                      "Coming soon!",
                                      "Stay tuned to this. We are launching soon",
                                      "OK"),
                                );
                              },
                              title: "Events",
                              image: "asset/images/events-icon.png"),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) => messageDialog(
                                //       context,
                                //       "Coming soon!",
                                //       "Stay tuned to this. We are launching soon",
                                //       "OK"),
                                // );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TransportHome()));
                              },
                              title: "Transport",
                              image: "asset/images/transport-icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => messageDialog(
                                      context,
                                      "Coming soon!",
                                      "Stay tuned to this. We are launching soon",
                                      "OK"),
                                );
                              },
                              title: "Movies",
                              image: "asset/images/movies-icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => messageDialog(
                                      context,
                                      "Coming soon!",
                                      "Stay tuned to this. We are launching soon",
                                      "OK"),
                                );
                              },
                              title: "NFT Stamps",
                              image: "asset/images/nft-icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => messageDialog(
                                      context,
                                      "Coming soon!",
                                      "Stay tuned to this. We are launching soon",
                                      "OK"),
                                );
                              },
                              title: "More",
                              image: "asset/images/more-icon.png"),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTiles(
                            title: "Wallets",
                            subTitle: "Active",
                            icon: Icons.account_balance_wallet_outlined),
                        FadeTiles(
                            title: "1000",
                            subTitle: "Use Points",
                            icon: Icons.card_giftcard_rounded),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SectionLabel(
                      title: "Get Showtimes",
                      icon: CupertinoIcons.arrow_right,
                    ),
                    Container(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: Constants.getWidth(context),
                            child: CinemaSection(
                                poster:
                                    "https://imageio.forbes.com/blogs-images/scottmendelson/files/2018/06/jurassic-world-2B-1200x594.jpg?format=jpg&width=1200&fit=bounds",
                                movieName: "Jurassic World Dominion",
                                location: "Westage Cinema"),
                          ),
                          Container(
                            width: Constants.getWidth(context),
                            child: CinemaSection(
                                poster:
                                    "https://images.thedirect.com/media/article_full/captain-carter-doctor-strange-2.jpg",
                                movieName:
                                    "Doctor Strange in the Multiverse of Madness",
                                location: "Marvel Studio"),
                          ),
                          Container(
                            width: Constants.getWidth(context),
                            child: CinemaSection(
                                poster:
                                    "https://i.ytimg.com/vi/r2GZHjFBhp4/maxresdefault.jpg",
                                movieName: "Top Gun: Maverick",
                                location: "Coorperative Bank Building"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SectionLabel(
                      title: "New Year Awesome Offers",
                      icon: CupertinoIcons.arrow_right,
                    ),
                    Container(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: OfferSection(
                                poster:
                                    "https://cdn.sanity.io/images/92ui5egz/production/e800a8eabc6f17a0eaed1bf6621b46aefa57b8cb-990x557.jpg?w=800&h=450&auto=format",
                                category: "Bundle",
                                title: "Great Unilever home bundle"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: OfferSection(
                                poster:
                                    "https://media.allure.com/photos/5e9f44a64677ea0008ff4974/master/pass/reporter-wild-beauty-river.jpg",
                                category: "Skin Care",
                                title: "Herbal Stretch marks remover"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SectionLabel(
                      title: "More for your everyday",
                      icon: Icons.ac_unit,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MoreForYouSection(
                            title: "Hotels",
                            subTitle: "Best Deals",
                            icon: "asset/images/hotel_icon.png"),
                        MoreForYouSection(
                            title: "Shopping",
                            subTitle: "Top Offers",
                            icon: "asset/images/shopping_offers_icon.png"),
                        MoreForYouSection(
                            title: "GrabGifts",
                            subTitle: "Fun & Useful",
                            icon: "asset/images/grabgifts_icon.png")
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SectionLabel(
                      title: "Best events",
                      icon: CupertinoIcons.arrow_right,
                    ),
                    Container(
                      height: 280,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: BestEventsSection(
                                poster:
                                    "https://www.niva4cap.eu/wp-content/uploads/2021/05/home_banner_conferences_44976472.jpg",
                                category: "Best events",
                                title: "Bro code"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: BestEventsSection(
                                poster:
                                    "https://www.niva4cap.eu/wp-content/uploads/2021/05/home_banner_conferences_44976472.jpg",
                                category: "Book Now",
                                title: "Look Me in the I"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    BannerSection(
                        image: "asset/images/delivery_man.png",
                        imageHeight: 150,
                        imageWidth: 150,
                        title: "Tap a delivery",
                        titleColor: Colors.black,
                        subTitle: "Pick a delivery package",
                        subTitleColor: Colors.black,
                        buttonText: "Learn more",
                        onPress: () {},
                        backgroundColor: const Color(0XFFFfecb7d)),
                    const SizedBox(
                      height: 25,
                    ),
                    SectionLabel(
                      title: "Shop Now",
                      icon: CupertinoIcons.arrow_right,
                    ),
                    Container(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: OfferSection(
                                poster:
                                    "https://www.niva4cap.eu/wp-content/uploads/2021/05/home_banner_conferences_44976472.jpg",
                                category: "Women's Fashion",
                                title: "Foot Candy Pink Elegant Flat Shoes"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: OfferSection(
                                poster:
                                    "https://www.niva4cap.eu/wp-content/uploads/2021/05/home_banner_conferences_44976472.jpg",
                                category: "Mens Fashion",
                                title: "Tracksuits Men's Suits Track Suit"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SectionLabel(
                      title: "Book Bus",
                      icon: CupertinoIcons.arrow_right,
                    ),
                    BannerSection(
                        image: "asset/images/bus_icon.png",
                        imageHeight: 150,
                        imageWidth: 200,
                        title: "Transport",
                        titleColor: Colors.white,
                        subTitle: "Book affordable busses",
                        subTitleColor: Colors.white,
                        buttonText: "Learn more",
                        onPress: () {},
                        backgroundColor: const Color(0XFFF16a1be)),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
