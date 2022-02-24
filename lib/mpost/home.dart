//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/services/database.dart';
import 'package:mpost/services/login_register.dart';
import 'package:mpost/services/notifications.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  LoginRegisterService service = LoginRegisterService();

  @override
  void initState() {
    super.initState();
    print(Constants.user.bearerToken);
  }

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
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          // Container(
                          //   height: 35,
                          //   width: 35,
                          //   decoration: BoxDecoration(
                          //       image: const DecorationImage(
                          //           image: NetworkImage(
                          //               "https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo="),
                          //           fit: BoxFit.cover),
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(100)),
                          // ),
                          Expanded(
                            child: Text(
                              "MPOST",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     try {
                          //       MpostNotification.notify(
                          //           "title", "body", "basic_channel");
                          //     } catch (ex) {
                          //       print(ex);
                          //     }
                          //   },
                          //   child: const Icon(
                          //     Icons.notifications_none_rounded,
                          //     size: 35,
                          //     color: Colors.white,
                          //   ),
                          // ),
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
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: const Color.fromRGBO(252, 246, 248, 10),
                width: Constants.getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                            text: "Mpost virtual address\n",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text: "Use you number 0711305097 ",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400))
                            ])),
                    Container(
                        padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: Color(0XFFFBC4788), width: 1)),
                        child: const Text("Get one",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFFFBC4788),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700))),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children: [
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
                              image: "asset/images/delievery_icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () async {
                                await DatabaseHandler.instance.removeUser();
                              },
                              title: "Pay",
                              image: "asset/images/pay_icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {
                                MpostNotification.notify(
                                    "title", "body", "basic_channel");
                              },
                              title: "Shopping",
                              image: "asset/images/shopping_icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {},
                              title: "Events",
                              image: "asset/images/events_icon.png"),
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
                              onPress: () {},
                              title: "Transport",
                              image: "asset/images/transport_icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {},
                              title: "Movies",
                              image: "asset/images/cinemas_icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {},
                              title: "NFT Stamps",
                              image: "asset/images/gift_icon.png"),
                        ),
                        Container(
                          width: Constants.getWidth(context) * 0.20,
                          child: MenuIcon(
                              onPress: () {},
                              title: "More",
                              image: "asset/images/seemore_icon.png"),
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
                            title: "MPesa",
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
