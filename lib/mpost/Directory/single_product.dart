import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mpost/blocs/directory_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/Directory/directory_constants.dart';
import 'package:mpost/mpost/Directory/directory_models/DirectoryCategoryModel.dart';
import 'package:mpost/mpost/Directory/directory_models/DirectoryProductModel.dart';
import 'package:mpost/mpost/Directory/single_category.dart';
import 'package:mpost/mpost/Directory/widgets.dart';
import 'package:provider/provider.dart';

class SingleProductDirectory extends StatefulWidget {
  DirectoryProductModel product;
  DirectoryCategoryModel categoryModel;
  SingleProductDirectory(
      {Key? key, required this.product, required this.categoryModel})
      : super(key: key);

  @override
  State<SingleProductDirectory> createState() => _SingleProductDirectoryState();
}

class _SingleProductDirectoryState extends State<SingleProductDirectory> {
  List<String> images = [];
  int selectedImage = 0;
  List<DirectoryProductModel> relatedProducts = [];
  DateTime? createdDate;
  @override
  void initState() {
    widget.product.images!.forEach((element) {
      images.add(element.src.toString());
    });
    selectedImage = (images.length - 1);
    createdDate = DateTime.parse(widget.product.dateCreated.toString());
    print(createdDate);
    if (widget.product.relatedIds!.length > 0) {
      print(widget.product.relatedIds!.length);
      _getRelatedProducts();
    }
    super.initState();
  }

  _getRelatedProducts() async {
    final directoryApplicationBloc =
        Provider.of<DirectoryApplicationBloc>(context, listen: false);
    relatedProducts = await directoryApplicationBloc
        .getRelatedProducts(widget.product.relatedIds);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final directoryApplicationBloc =
        Provider.of<DirectoryApplicationBloc>(context);
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
                                      widget.product.name.toString(),
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
                                      "KSh ${widget.product.price.toString()}",
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
                                              Jiffy(createdDate).fromNow(),
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
                                            itemCount: images.length,
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
                                      DirectoryConstants.parseHtmlString(widget
                                          .product.description
                                          .toString()),
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
                                    Visibility(
                                      visible: directoryApplicationBloc.loading,
                                      child: Container(
                                        height: 225,
                                        child: GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    childAspectRatio: 3 / 4.2,
                                                    maxCrossAxisExtent: 200,
                                                    mainAxisSpacing: 10,
                                                    crossAxisSpacing: 10),
                                            itemCount: 2,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return ProductShimmer();
                                            }),
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          !directoryApplicationBloc.loading,
                                      child: Container(
                                        height: 225,
                                        child: GridView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    childAspectRatio: 3 / 4.2,
                                                    maxCrossAxisExtent: 200,
                                                    mainAxisSpacing: 10,
                                                    crossAxisSpacing: 10),
                                            itemCount: 2,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return ProductCardDirectory(
                                                product: relatedProducts[index],
                                                category: widget.categoryModel,
                                              );
                                            }),
                                      ),
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
