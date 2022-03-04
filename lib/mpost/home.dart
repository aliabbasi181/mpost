//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/log_and_reg.dart';
import 'package:mpost/mpost/activity/activity.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/payment/choose_payment.dart';
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
    //_getDeliveries();
    userName = Constants.user.firstName![0].toString() +
        Constants.user.lastName![0].toString();
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
                                const Icon(
                                  Icons.notifications_none_rounded,
                                  size: 35,
                                  color: Colors.white,
                                ),
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
                                              "Use your number ${Constants.user.mobile.toString()} ",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400))
                                    ])),
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
                        ? Constants.virtualAddress.status!.name ==
                                "Pending Payment"
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
                                                      "You created your virtual address \n\"${Constants.virtualAddress.address} - ${Constants.virtualAddress.postalCode!.postalCode}\n(${Constants.virtualAddress.postalCode!.name})\".\nBut you have not payed yet.",
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
                                            const Delivery()));
                              },
                              title: "Delivery",
                              image: "asset/images/delivery-icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () async {
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) => messageDialog(
                                //       context,
                                //       "Coming soon!",
                                //       "Stay tuned to this. We are launching soon",
                                //       "OK"),
                                // );
                                String URL =
                                    "https://directory.mpostfintech.co.ke/";
                                Linking.openMyLink(URL, context);
                              },
                              title: "Directory",
                              image: "asset/images/directory-icon.png"),
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
                              title: "Shopping",
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
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => messageDialog(
                                      context,
                                      "Coming soon!",
                                      "Stay tuned to this. We are launching soon",
                                      "OK"),
                                );
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
                      height: 210,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: Constants.getWidth(context),
                            child: CinemaSection(
                                poster:
                                    "https://c4.wallpaperflare.com/wallpaper/64/469/259/spider-man-spider-man-3-hd-wallpaper-preview.jpg",
                                movieName: "Spider-Man - No Way Home",
                                location: "Westage Cinema"),
                          ),
                          Container(
                            width: Constants.getWidth(context),
                            child: CinemaSection(
                                poster:
                                    "https://wallpapercave.com/wp/AFtCNLt.jpg",
                                movieName: "Iron Man 2 - PA KINO NA",
                                location: "Marvel Studio"),
                          ),
                          Container(
                            width: Constants.getWidth(context),
                            child: CinemaSection(
                                poster:
                                    "https://i.ytimg.com/vi/5IQLdgLliS4/maxresdefault.jpg",
                                movieName: "Mad Love - Every Thing Has A Price",
                                location: "Coorperative Bank Building"),
                          ),
                          Container(
                            width: Constants.getWidth(context),
                            child: CinemaSection(
                                poster:
                                    "https://sudarshanpurohit.com/wp-content/uploads/2020/04/3_idiots-1140x641.jpeg",
                                movieName: "3 idiots",
                                location: "6th Road Rawalpindi"),
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
                                    "https://gomudigo.com/wp-content/uploads/2021/02/Surf-Excel-Washing-Powder-Free-one-bucket-1-kg-220-tk-1.jpg",
                                category: "Bundle",
                                title:
                                    "Surf Excel Washing Powder (Free one bucket) 1 kg"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: OfferSection(
                                poster:
                                    "https://i0.wp.com/menuprices.pk/wp-content/uploads/2021/04/McDonalds-Ramadan-Deal-1-scaled.jpg?ssl=1",
                                category: "Restaurant",
                                title:
                                    "McDonald's Ramadan Deal 2021 With Prices Sehri Iftar"),
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
                      title: "Best events in January",
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
                                    "https://americanhiking.org/wp-content/uploads/2013/04/NTD_2013_copyright3_RGB-1024x941.jpg",
                                category: "Best events",
                                title: "MT Longonot hike for natural lovers"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: BestEventsSection(
                                poster:
                                    "https://www.wellnessliving.com/blog/wp-content/uploads/2020/11/yoga-workshops-image-1.jpg",
                                category: "Book Now",
                                title:
                                    "Annual youa festival and spiritual healing"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: BestEventsSection(
                                poster:
                                    "https://americanhiking.org/wp-content/uploads/2013/04/NTD_2013_copyright3_RGB-1024x941.jpg",
                                category: "Best events",
                                title: "MT Longonot hike for natural lovers"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: BestEventsSection(
                                poster:
                                    "https://www.wellnessliving.com/blog/wp-content/uploads/2020/11/yoga-workshops-image-1.jpg",
                                category: "Book Now",
                                title:
                                    "Annual youa festival and spiritual healing"),
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
                                    "https://media.istockphoto.com/photos/women-clothes-hanging-on-hangers-clothing-rails-fashion-design-picture-id916092484?k=20&m=916092484&s=612x612&w=0&h=2aTLAucj_-qbbfhBiJEXfdiY3-k0gx0el8OrKFpi3O8=",
                                category: "Womens Fashion",
                                title: "Foot Candy Pink Elegent Flat Shoes"),
                          ),
                          Container(
                            width: Constants.getWidth(context) * 0.5,
                            child: OfferSection(
                                poster:
                                    "https://i.pinimg.com/originals/f4/6a/6c/f46a6c6eead8a975ee38520a016023a4.jpg",
                                category: "Womens Fashion",
                                title: "Herbal stretch marks removal"),
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
                    SectionLabel(
                      title: "Holiday deals just for you",
                      icon: CupertinoIcons.add,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
