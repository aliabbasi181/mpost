import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpost/blocs/directory_application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/Directory/directory_models/DirectoryCategoryModel.dart';
import 'package:mpost/mpost/Directory/single_category.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class DirectoryCategories {
  String image, name;
  DirectoryCategories(this.image, this.name);
}

// class Directory extends StatefulWidget {
//   const Directory({Key? key}) : super(key: key);

//   @override
//   State<Directory> createState() => _DirectoryState();
// }

// class _DirectoryState extends State<Directory> {
//   List<DirectoryCategories> directoryCategories = [];
//   bool isScrollingDown = false;
//   @override
//   void initState() {
//     directoryCategories.add(
//         DirectoryCategories("asset/images/buy-sell-icon.png", "Buy & Sell"));
//     directoryCategories
//         .add(DirectoryCategories("asset/images/services-icon.png", "Services"));
//     directoryCategories.add(
//         DirectoryCategories("asset/images/car-icon.png", "Cars & Vehicles"));
//     directoryCategories
//         .add(DirectoryCategories("asset/images/house-icon.png", "Real Estate"));
//     directoryCategories.add(
//         DirectoryCategories("asset/images/buy-sell-icon.png", "Buy & Sell"));
//     directoryCategories
//         .add(DirectoryCategories("asset/images/services-icon.png", "Services"));
//     directoryCategories.add(
//         DirectoryCategories("asset/images/car-icon.png", "Cars & Vehicles"));
//     directoryCategories
//         .add(DirectoryCategories("asset/images/house-icon.png", "Real Estate"));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         bottom: Platform.isAndroid,
//         child: SingleChildScrollView(
//           child: Container(
//             width: Constants.getWidth(context),
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(
//                           Icons.arrow_back_rounded,
//                           size: 25,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Expanded(
//                           child: Image(
//                               height: 18,
//                               width: 63,
//                               image: AssetImage(
//                                   "asset/images/mpost_blue_logo.png"))),
//                       Container(
//                         height: 30,
//                         width: 30,
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   color: Colors.black.withOpacity(0.2),
//                   thickness: 0.5,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
//                   padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Color(0xffD2D3D7).withOpacity(0.4),
//                             blurRadius: 2)
//                       ],
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(color: Color(0xffD2D3D7), width: 0.5)),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: Constants.getWidth(context) * 0.7,
//                         child: TextField(
//                             cursorColor: Constants.primaryColor,
//                             scrollPadding: const EdgeInsets.all(0),
//                             autocorrect: false,
//                             style: TextStyle(
//                                 color: const Color(0xff9FA3A6),
//                                 fontFamily: "Montserrat",
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14),
//                             decoration: InputDecoration(
//                                 isCollapsed: true,
//                                 contentPadding:
//                                     const EdgeInsets.only(top: 10, bottom: 10),
//                                 border: const OutlineInputBorder(
//                                     borderSide: BorderSide.none),
//                                 hintText: "Search for anything...",
//                                 hintStyle: TextStyle(
//                                     color: const Color(0xff9FA3A6),
//                                     fontFamily: "Montserrat",
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 12))),
//                       ),
//                       const Spacer(),
//                       Icon(
//                         Icons.location_on_outlined,
//                         color: const Color(0xff9FA3A6),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                     height: 100,
//                     //color: Colors.amber.withOpacity(0.2),
//                     padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
//                     width: Constants.getWidth(context),
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: directoryCategories.length,
//                         itemBuilder: ((context, index) {
//                           return Container(
//                             margin: index == (directoryCategories.length - 1)
//                                 ? const EdgeInsets.fromLTRB(20, 0, 20, 2)
//                                 : index == 0
//                                     ? const EdgeInsets.fromLTRB(20, 0, 0, 2)
//                                     : const EdgeInsets.fromLTRB(15, 0, 0, 2),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xff0175B2)
//                                         .withOpacity(0.08),
//                                     borderRadius: BorderRadius.circular(100),
//                                   ),
//                                   child: Center(
//                                     child: Image(
//                                       height: 22,
//                                       width: 22,
//                                       image: AssetImage(
//                                           directoryCategories[index].image),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 Container(
//                                   width: 70,
//                                   child: Text(
//                                     directoryCategories[index].name,
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Constants.primaryColor,
//                                         fontFamily: "Montserrat",
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           );
//                         }))),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(colors: [
//                     const Color(0xff187bb2),
//                     const Color(0xffcd2631),
//                   ])),
//                   child: Column(
//                     children: [
//                       RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                               text: "When life gets pricey, ",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: "Montserrat",
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14),
//                               children: [
//                                 TextSpan(
//                                   text: "save money shopping ",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: "Montserrat",
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                                 const TextSpan(
//                                     text: "with MPost Classifieds every day."),
//                               ])),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 126,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.fill,
//                                     image:
//                                         AssetImage("asset/images/bicycle.png")),
//                                 borderRadius: BorderRadius.circular(6)),
//                             child: Center(
//                               child: Container(
//                                 height: 28,
//                                 width: 104,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(1)),
//                                 child: Center(
//                                   child: Text(
//                                     "Bikes",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Constants.primaryColor,
//                                         fontFamily: "Montserrat",
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 126,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.fill,
//                                     image: AssetImage(
//                                         "asset/images/outdoor-&-garden.png")),
//                                 borderRadius: BorderRadius.circular(6)),
//                             child: Center(
//                               child: Container(
//                                 height: 28,
//                                 width: 125,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(1)),
//                                 child: Center(
//                                   child: Text(
//                                     "Outdoor & garden",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Constants.primaryColor,
//                                         fontFamily: "Montserrat",
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SectionLabel(
//                   title: "Recommended for you",
//                   icon: CupertinoIcons.arrow_right,
//                 ),
//                 Container(
//                     height: 195,
//                     //color: Colors.amber.withOpacity(0.2),
//                     width: Constants.getWidth(context),
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: ActivityCategory.activityTabs.length,
//                         itemBuilder: ((context, index) {
//                           return Container(
//                               margin: index ==
//                                       (ActivityCategory.activityTabs.length - 1)
//                                   ? const EdgeInsets.fromLTRB(20, 0, 20, 2)
//                                   : index == 0
//                                       ? const EdgeInsets.fromLTRB(20, 0, 0, 2)
//                                       : const EdgeInsets.fromLTRB(15, 0, 0, 2),
//                               width: Constants.getWidth(context) * 0.43,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(6),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Color(0xffD2D3D7).withOpacity(1),
//                                         blurRadius: 2)
//                                   ]),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             fit: BoxFit.fill,
//                                             image: NetworkImage(
//                                                 "https://www.india.com/wp-content/uploads/2020/05/table-tennis.jpg")),
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(6),
//                                             topRight: Radius.circular(6))),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         11, 11, 11, 15),
//                                     child: Text(
//                                       "Kspace booking space for events, meetings and productions.",
//                                       textAlign: TextAlign.left,
//                                       maxLines: 4,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: "Montserrat",
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12),
//                                     ),
//                                   ),
//                                 ],
//                               ));
//                         }))),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SectionLabel(
//                   title: "Hand picked for you",
//                   icon: CupertinoIcons.arrow_right,
//                 ),
//                 Container(
//                     height: 190,
//                     //color: Colors.amber.withOpacity(0.2),
//                     width: Constants.getWidth(context),
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: ActivityCategory.activityTabs.length,
//                         itemBuilder: ((context, index) {
//                           return Container(
//                               margin: index ==
//                                       (ActivityCategory.activityTabs.length - 1)
//                                   ? const EdgeInsets.fromLTRB(20, 0, 20, 2)
//                                   : index == 0
//                                       ? const EdgeInsets.fromLTRB(20, 0, 0, 2)
//                                       : const EdgeInsets.fromLTRB(15, 0, 0, 2),
//                               width: Constants.getWidth(context) * 0.35,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(6),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color:
//                                             Color(0xffD2D3D7).withOpacity(0.43),
//                                         blurRadius: 2)
//                                   ]),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             fit: BoxFit.fill,
//                                             image: NetworkImage(
//                                                 "https://mymodernmet.com/wp/wp-content/uploads/2018/05/painting-ideas-3-1.jpg")),
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(6),
//                                             topRight: Radius.circular(6))),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         11, 11, 11, 15),
//                                     child: Text(
//                                       "Kspace booking space for events, meetings and productions.",
//                                       textAlign: TextAlign.left,
//                                       maxLines: 4,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: "Montserrat",
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12),
//                                     ),
//                                   ),
//                                 ],
//                               ));
//                         }))),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SectionLabel(
//                   title: "Hand picked for you",
//                   icon: CupertinoIcons.arrow_right,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 112,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color:
//                                           Color(0xffD2D3D7).withOpacity(0.43),
//                                       blurRadius: 2)
//                                 ],
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(6)),
//                           ),
//                           Container(
//                             height: 112,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color:
//                                           Color(0xffD2D3D7).withOpacity(0.43),
//                                       blurRadius: 2)
//                                 ],
//                                 image: DecorationImage(
//                                     fit: BoxFit.fill,
//                                     image: NetworkImage(
//                                         "https://s.yimg.com/uu/api/res/1.2/Z7jFGzCKLpv3m2N5uRi12Q--~B/aD0xMzAwO3c9MjAwMDthcHBpZD15dGFjaHlvbg--/https://s.yimg.com/os/creatr-uploaded-images/2021-11/a179f550-3b11-11ec-86df-fa28310e5588.cf.jpg")),
//                                 borderRadius: BorderRadius.circular(6)),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 112,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color:
//                                           Color(0xffD2D3D7).withOpacity(0.43),
//                                       blurRadius: 2)
//                                 ],
//                                 borderRadius: BorderRadius.circular(6)),
//                           ),
//                           Container(
//                             height: 112,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color:
//                                           Color(0xffD2D3D7).withOpacity(0.43),
//                                       blurRadius: 2)
//                                 ],
//                                 borderRadius: BorderRadius.circular(6)),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 112,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color:
//                                           Color(0xffD2D3D7).withOpacity(0.43),
//                                       blurRadius: 2)
//                                 ],
//                                 borderRadius: BorderRadius.circular(6)),
//                           ),
//                           Container(
//                             height: 112,
//                             width: Constants.getWidth(context) * 0.43,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color:
//                                           Color(0xffD2D3D7).withOpacity(0.43),
//                                       blurRadius: 2)
//                                 ],
//                                 borderRadius: BorderRadius.circular(6)),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SectionLabel(
//                   title: "Hand picked for you",
//                   icon: CupertinoIcons.arrow_right,
//                 ),
//                 Container(
//                     height: 190,
//                     //color: Colors.amber.withOpacity(0.2),
//                     width: Constants.getWidth(context),
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: ActivityCategory.activityTabs.length,
//                         itemBuilder: ((context, index) {
//                           return Container(
//                               margin: index ==
//                                       (ActivityCategory.activityTabs.length - 1)
//                                   ? const EdgeInsets.fromLTRB(20, 0, 20, 2)
//                                   : index == 0
//                                       ? const EdgeInsets.fromLTRB(20, 0, 0, 2)
//                                       : const EdgeInsets.fromLTRB(15, 0, 0, 2),
//                               width: Constants.getWidth(context) * 0.75,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(6),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color:
//                                             Color(0xffD2D3D7).withOpacity(0.43),
//                                         blurRadius: 2)
//                                   ]),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: NetworkImage(
//                                                 "https://s.yimg.com/uu/api/res/1.2/Z7jFGzCKLpv3m2N5uRi12Q--~B/aD0xMzAwO3c9MjAwMDthcHBpZD15dGFjaHlvbg--/https://s.yimg.com/os/creatr-uploaded-images/2021-11/a179f550-3b11-11ec-86df-fa28310e5588.cf.jpg")),
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(6),
//                                             topRight: Radius.circular(6))),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         11, 11, 11, 15),
//                                     child: Text(
//                                       "Kspace booking space for events, meetings and productions.",
//                                       textAlign: TextAlign.left,
//                                       maxLines: 4,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: "Montserrat",
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12),
//                                     ),
//                                   ),
//                                 ],
//                               ));
//                         }))),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SectionLabel(
//                   title: "Hand picked for you",
//                   icon: CupertinoIcons.arrow_right,
//                 ),
//                 Container(
//                     height: 190,
//                     //color: Colors.amber.withOpacity(0.2),
//                     width: Constants.getWidth(context),
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: ActivityCategory.activityTabs.length,
//                         itemBuilder: ((context, index) {
//                           return Container(
//                               margin: index ==
//                                       (ActivityCategory.activityTabs.length - 1)
//                                   ? const EdgeInsets.fromLTRB(20, 0, 20, 2)
//                                   : index == 0
//                                       ? const EdgeInsets.fromLTRB(20, 0, 0, 2)
//                                       : const EdgeInsets.fromLTRB(15, 0, 0, 2),
//                               width: Constants.getWidth(context) * 0.75,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(6),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color:
//                                             Color(0xffD2D3D7).withOpacity(0.43),
//                                         blurRadius: 2)
//                                   ]),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: NetworkImage(
//                                                 "https://foodtank.com/wp-content/uploads/2021/09/gemma-stpjHJGqZyw-unsplash.jpg")),
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(6),
//                                             topRight: Radius.circular(6))),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         11, 11, 11, 15),
//                                     child: Text(
//                                       "Kspace booking space for events, meetings and productions.",
//                                       textAlign: TextAlign.left,
//                                       maxLines: 4,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: "Montserrat",
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 12),
//                                     ),
//                                   ),
//                                 ],
//                               ));
//                         }))),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Directory extends StatefulWidget {
  const Directory({Key? key}) : super(key: key);

  @override
  State<Directory> createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  List<DirectoryCategoryModel> seacrchResults = [];
  TextEditingController searchResultController = TextEditingController();
  List<DirectoryCategoryModel> categories = [];
  @override
  void initState() {
    _getDirectoryCategories();
    super.initState();
  }

  _getDirectoryCategories() async {
    final directoryApplicationBloc =
        Provider.of<DirectoryApplicationBloc>(context, listen: false);
    categories = await directoryApplicationBloc.getCategories();
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
                      onTap: () {},
                      child: Image(
                          height: 18,
                          width: 63,
                          image:
                              AssetImage("asset/images/mpost_blue_logo.png")),
                    )),
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
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  color: const Color(0XFFFBE1515),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                        ],
                      ),
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
                            onChanged: (value) {
                              seacrchResults = [];
                              setState(() {
                                for (var item in categories) {
                                  if (item.name!
                                      .toLowerCase()
                                      .contains(value.toLowerCase())) {
                                    seacrchResults.add(item);
                                  }
                                }
                              });
                            },
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
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.black.withOpacity(0.2),
                thickness: 0.5,
                height: 0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "Welcome to MPOST classifieds",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: const Color(0xff808689),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: directoryApplicationBloc.loading,
                child: Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                crossAxisCount: 3),
                        itemCount: 9,
                        itemBuilder: (BuildContext context, index) {
                          return ShimmerBox(
                            height: 200,
                            width: 200,
                          );
                        }),
                  ),
                ),
              ),
              Visibility(
                visible: !directoryApplicationBloc.loading,
                child: Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: seacrchResults.isEmpty,
                          child: Expanded(
                            child: Container(
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 15,
                                          crossAxisCount: 3),
                                  itemCount: categories.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleCategoryDirectory(
                                                      categoryModel:
                                                          categories[index],
                                                    )));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(child: Icon(Icons.image)),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Flexible(
                                              child: Text(
                                                categories[index]
                                                    .name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xffDEDEDE),
                                                width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.07),
                                                  blurRadius: 8)
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: seacrchResults.isNotEmpty,
                          child: Expanded(
                            child: Container(
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 15,
                                          crossAxisCount: 3),
                                  itemCount: seacrchResults.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleCategoryDirectory(
                                                      categoryModel:
                                                          categories[index],
                                                    )));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(child: Icon(Icons.image)),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Flexible(
                                              child: Text(
                                                seacrchResults[index]
                                                    .name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xffDEDEDE),
                                                width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.07),
                                                  blurRadius: 8)
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
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
