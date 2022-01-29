import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery.dart';
import 'package:mpost/mpost/drawer.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Constants.primaryColor),
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 15),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.menu_rounded,
                        size: 45,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Text(
                          "MPOST",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                      Icon(
                        Icons.notifications_none_rounded,
                        size: 35,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SearchInputField(
                    hint: "Search the MPost App",
                    controller: searchController,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            color: const Color(0XFFFf2f8fa),
            width: Constants.getWidth(context),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Your mpost digital address ",
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: "0711305097",
                          style: TextStyle(
                              color: Constants.primaryColor,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500))
                    ])),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: Constants.getWidth(context) * 0.20,
                      child: MenuIcon(
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Delivery()));
                          },
                          title: "Delivery",
                          image: "asset/images/delievery_icon.png"),
                    ),
                    Container(
                      width: Constants.getWidth(context) * 0.20,
                      child: MenuIcon(
                          onPress: () {},
                          title: "Pay",
                          image: "asset/images/pay_icon.png"),
                    ),
                    Container(
                      width: Constants.getWidth(context) * 0.20,
                      child: MenuIcon(
                          onPress: () {},
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
                  height: 25,
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
                          title: "Gift Card",
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
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTiles(
                        title: "SentiPay",
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
                  height: 270,
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
                            poster: "https://wallpapercave.com/wp/AFtCNLt.jpg",
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
                  height: 300,
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
                  height: 300,
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
                    imageHeight: 200,
                    imageWidth: 200,
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
                  height: 300,
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
                    imageHeight: 200,
                    imageWidth: 250,
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
