import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/Directory/single_category.dart';

class SingleProductDirectory extends StatefulWidget {
  const SingleProductDirectory({Key? key}) : super(key: key);

  @override
  State<SingleProductDirectory> createState() => _SingleProductDirectoryState();
}

class _SingleProductDirectoryState extends State<SingleProductDirectory> {
  List<String> images = [
    "https://s3-prod.autonews.com/s3fs-public/HELLCAT-MAIN_0.jpg",
    "https://di-uploads-pod18.dealerinspire.com/shavercdjr/uploads/2020/06/2020-dodge-charger-blue.jpg",
    "https://cdn.jdpower.com/JDPA_2020%20Dodge%20Charger%20SRT%20Hellcat%20Widebody%20Blue%20Rear%20View.jpg",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-dodge-charger-1599055642.jpg?crop=0.879xw:0.877xh;0.0780xw,0.0646xh&resize=640:*",
    "https://www.dodge.com/content/dam/cross-regional/asean/dodge/common/charger-promotile-500x242.png.img.500.png",
    "https://pictures.topspeed.com/IMG/crop/201902/2019-dodge-challenger-32_1600x0w.jpg",
  ];
  int selectedImage = 0;
  @override
  void initState() {
    selectedImage = (images.length - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            bottom: Platform.isAndroid,
            child: Container(
                width: Constants.getWidth(context),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black.withOpacity(0.1)))),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Image(
                                    height: 18,
                                    width: 63,
                                    image: AssetImage(
                                        "asset/images/mpost_blue_logo.png"))),
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image(
                                      height: 30,
                                      width: 30,
                                      image: AssetImage(
                                          "asset/images/notification-icon.png")),
                                  Visibility(
                                    visible: false,
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
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Container(
                          width: Constants.getWidth(context),
                          decoration:
                              BoxDecoration(color: const Color(0xfff7faf9)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Toyota Wish 2013 White",
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xff1c282f),
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 23),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "KSh 1,180,000",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xff659447),
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.location,
                                          color: const Color(0xff808689),
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Posted  over a month ago",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff808689),
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "Yala Towers, Biashara Street Nairobi",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 220,
                                width: Constants.getWidth(context),
                                decoration: BoxDecoration(
                                    color: const Color(0xff0175B2)
                                        .withOpacity(0.08),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            images[selectedImage]))),
                              ),
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 100,
                                        padding: EdgeInsets.zero,
                                        width: Constants.getWidth(context),
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: ((context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedImage = index;
                                                  });
                                                },
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  margin: const EdgeInsets.only(
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            images[index])),
                                                    color:
                                                        const Color(0xff0175B2)
                                                            .withOpacity(0.08),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                              );
                                            }))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Description",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut ut ullamcorper blandit lectus lorem libero eros scelerisque. Faucibus augue montes, ut sed ac morbi ultrices eros. Congue adipiscing auctor mollis magna dui. Blandit proin accumsan faucibus malesuada nam velit eget. \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut ut ullamcorper blandit lectus lorem libero eros scelerisque. ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          height: 2,
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 25),
                                      width: Constants.getWidth(context),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 5)
                                          ]),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Kazi Enterprise",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 23,
                                          ),
                                          Container(
                                            width: Constants.getWidth(context),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD2D3D7)),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Your Message",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff8E909B),
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  "Hi, I’m interested! Please contact me if this is still available",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      height: 2,
                                                      color: Colors.black,
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: Constants.getWidth(context),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 13),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Constants
                                                    .classifieldsPrimaryColor),
                                            child: Text(
                                              "Send message",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(
                                              "To deter and identify potential fraud, spam or suspicious behaviour, we anonymize your email address (as applicable) and reserve the right to monitor conversations. By sending the message you agree to our Terms of Use and Privacy Policy",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 9),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      "Similar Adverts",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      height: 550,
                                      child: GridView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  childAspectRatio: 3 / 4.2,
                                                  maxCrossAxisExtent: 200,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10),
                                          itemCount: 4,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return ProductCardDirectory();
                                          }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                    ]))));
  }
}
