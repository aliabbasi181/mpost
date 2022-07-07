import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/Directory/directory_models/DirectoryCategoryModel.dart';
import 'package:mpost/mpost/Directory/directory_models/DirectoryProductModel.dart';
import 'package:mpost/mpost/Directory/single_product.dart';
import 'package:mpost/mpost/Directory/widgets.dart';
import 'package:provider/provider.dart';

import '../../blocs/directory_application_bloc.dart';

class SingleCategoryDirectory extends StatefulWidget {
  DirectoryCategoryModel categoryModel;
  SingleCategoryDirectory({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  State<SingleCategoryDirectory> createState() =>
      _SingleCategoryDirectoryState();
}

class _SingleCategoryDirectoryState extends State<SingleCategoryDirectory> {
  TextEditingController searchResultController = TextEditingController();
  List<DirectoryProductModel> products = [];
  double screenWidth = 0;
  @override
  void initState() {
    _getProducts();
    super.initState();
  }

  _getProducts() async {
    final directoryApplicationBloc =
        Provider.of<DirectoryApplicationBloc>(context, listen: false);
    products =
        await directoryApplicationBloc.getAllProducts(widget.categoryModel.id);
    print(products.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final directoryApplicationBloc =
        Provider.of<DirectoryApplicationBloc>(context);
    screenWidth = Constants.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: Platform.isAndroid,
        child: Container(
          width: Constants.getWidth(context),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                        child: InkWell(
                      onTap: () {
                        print(screenWidth * 0.5);
                      },
                      child: Image(
                          height: 18,
                          width: 63,
                          image:
                              AssetImage("asset/images/mpost_blue_logo.png")),
                    )),
                    Stack(
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
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                color: const Color(0XFFFBE1515),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                decoration: BoxDecoration(
                  color: const Color(0xffF8F9F9),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: const Color(0xff808689),
                      size: 22,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        width: Constants.getWidth(context) * 0.7,
                        child: TextField(
                            controller: searchResultController,
                            cursorColor: Constants.primaryColor,
                            scrollPadding: const EdgeInsets.all(0),
                            autocorrect: false,
                            onChanged: (value) {},
                            style: TextStyle(
                                color: const Color(0xff9FA3A6),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    color: const Color(0xff808689),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16))),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.2),
                thickness: 0.5,
                height: 40,
              ),
              Container(
                  height: 30,
                  width: Constants.getHeight(context),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ActivityCategory.activityTabs.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0, right: 7),
                          child: ElevatedButton(
                              onPressed: () {
                                for (int i = 0;
                                    i < ActivityCategory.activityTabs.length;
                                    i++) {
                                  if (ActivityCategory.activityTabs[i].name ==
                                      ActivityCategory
                                          .activityTabs[index].name) {
                                    ActivityCategory
                                        .activityTabs[index].active = true;
                                  } else {
                                    ActivityCategory.activityTabs[i].active =
                                        false;
                                  }
                                }
                                setState(() {});
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: const Color(0xffDEDEDE)),
                                          borderRadius:
                                              BorderRadius.circular(100))),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: ActivityCategory
                                          .activityTabs[index].active
                                      ? MaterialStateProperty.all(
                                          const Color(0xff1C282F))
                                      : MaterialStateProperty.all(
                                          Color.fromRGBO(222, 222, 222, 0.2))),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 12),
                                child: Text(
                                  ActivityCategory.activityTabs[index].name,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ActivityCategory
                                              .activityTabs[index].active
                                          ? Colors.white
                                          : const Color(0XFF606060),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        );
                      }))),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.categoryModel.name.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            "Filter",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0xff808689),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            CupertinoIcons.slider_horizontal_3,
                            color: const Color(0xff808689),
                            size: 22,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: directoryApplicationBloc.loading,
                        child: Expanded(
                          child: Container(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        childAspectRatio: 3 / 4.2,
                                        maxCrossAxisExtent: 200,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemCount: 4,
                                itemBuilder: (BuildContext context, index) {
                                  return ProductShimmer();
                                }),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: true && !directoryApplicationBloc.loading,
                        child: Expanded(
                          child: Container(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        childAspectRatio: 3 / 4.2,
                                        maxCrossAxisExtent: 200,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemCount: products.length,
                                itemBuilder: (BuildContext context, index) {
                                  return ProductCardDirectory(
                                    category: widget.categoryModel,
                                    product: products[index],
                                  );
                                }),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: Expanded(
                          child: Container(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        childAspectRatio: 3 / 4.2,
                                        maxCrossAxisExtent: 200,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemCount: 50,
                                itemBuilder: (BuildContext context, index) {
                                  return ProductCardDirectory(
                                      category: widget.categoryModel,
                                      product: products[index]);
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardDirectory extends StatefulWidget {
  DirectoryProductModel product;
  DirectoryCategoryModel category;
  ProductCardDirectory(
      {Key? key, required this.product, required this.category})
      : super(key: key);

  @override
  State<ProductCardDirectory> createState() => _ProductCardDirectoryState();
}

class _ProductCardDirectoryState extends State<ProductCardDirectory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleProductDirectory(
                      product: widget.product,
                      categoryModel: widget.category,
                    )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 120,
              decoration: BoxDecoration(),
              child: CachedNetworkImage(
                imageUrl: widget.product.images!.first.src.toString(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Container(
                  height: 10,
                  width: 100,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: downloadProgress.progress,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Constants.primaryColor),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Image(
                    image: AssetImage(
                        "asset/images/classified_image_placeholder.png")),
                fit: BoxFit.cover,
                height: 120,
                width: 200,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.category.name.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: const Color(0xff9f9f9f),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
            SizedBox(
              height: 2,
            ),
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
                  fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "KSh ${widget.product.price.toString()}",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff659447),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            Divider(
              color: Colors.black.withOpacity(0.2),
              thickness: 0.5,
              height: 20,
            ),
            Text(
              "Nairobi, Ridgeways",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: const Color(0xff9f9f9f),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
