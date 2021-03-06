import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/places_search.dart';
import 'package:mpost/mpost/delivery/confirm_address.dart';
import 'package:mpost/mpost/delivery/location_from_map.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class AddressPicker extends StatefulWidget {
  const AddressPicker({Key? key}) : super(key: key);

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  late Address address;
  @override
  initState() {
    final applicationBloc =
        Provider.of<ApplicaitonBloc>(context, listen: false);
    applicationBloc.getUserLocation();
    super.initState();
  }

  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          applicationBloc.userLocation == const LatLng(-1.2888736, 36.7913343)
              ? Container(
                  height: Constants.getHeight(context),
                  width: Constants.getWidth(context),
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: Platform.isIOS
                        ? const CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 20,
                          )
                        : const CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    Container(
                        width: Constants.getWidth(context),
                        height: Constants.getHeight(context) * 0.7,
                        child: GoogleMap(
                          zoomControlsEnabled: false,
                          initialCameraPosition: CameraPosition(
                              target: applicationBloc.userLocation, zoom: 13),
                          mapType: MapType.terrain,
                          onTap: (latlng) {},
                          markers: <Marker>{
                            Marker(
                              markerId: const MarkerId("Current Location"),
                              position: applicationBloc.userLocation,
                              icon: BitmapDescriptor.defaultMarker,
                            )
                          },
                          myLocationButtonEnabled: false,
                        )),
                    Container(
                      height: Constants.getHeight(context) * 0.3,
                    )
                  ],
                ),
          Container(
            width: Constants.getWidth(context),
            height: Constants.getHeight(context) * 0.35,
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 30, spreadRadius: 10)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add a pick-up address',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      address = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return SafeArea(
                              bottom: false,
                              child: Container(
                                margin: const EdgeInsets.only(top: 50),
                                width: Constants.getWidth(context),
                                height: Constants.getHeight(context),
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Container(
                                  child: const MyBottomSheet(),
                                ),
                              ),
                            );
                          });
                      Navigator.pop(context, address);
                    } catch (ex) {}
                  },
                  child: Container(
                      width: Constants.getWidth(context),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0XFFFefefef)),
                          color: const Color(0XFFFfcfcfc),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Icon(CupertinoIcons.search, size: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search street, city, district",
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0XFFFbdbfc1),
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
                ListTile(
                  onTap: () async {
                    if (applicationBloc.userLocation !=
                        const LatLng(-1.2888736, 36.7913343)) {
                      try {
                        List<Address> addresses =
                            await applicationBloc.getAddress(
                                applicationBloc.userLocation.latitude,
                                applicationBloc.userLocation.longitude);
                        for (var item in addresses) {
                          if (item.address.isNotEmpty) {
                            print(item.address);
                          }
                        }
                        address = await showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return SafeArea(
                                bottom: false,
                                child: Container(
                                  // margin: EdgeInsets.only(
                                  //     top: Constants.getHeight(context) *
                                  //         0.7),
                                  width: Constants.getWidth(context),
                                  height: Constants.getHeight(context),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: AddressSuggestions(
                                    addresses: addresses,
                                  ),
                                ),
                              );
                            });
                        setState(() {});
                        Navigator.pop(context, address);
                      } catch (ex) {}
                    }
                  },
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    child: const Image(
                        width: 30,
                        image: AssetImage(
                            "asset/images/use_my_location_icon.png")),
                  ),
                  title: Text(
                    applicationBloc.userLocation ==
                            const LatLng(-1.2888736, 36.7913343)
                        ? "Please wait..."
                        : "Use current location",
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            bottom: Platform.isIOS ? false : true,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () async {
                    try {
                      address = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ChoseLocationFromMap(
                                    latLng: applicationBloc.userLocation,
                                  ))));
                      print(address.address);
                      Navigator.pop(context, address);
                    } catch (ex) {}
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: Constants.getWidth(context),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 5)
                    ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Color(0XFFFBE157A),
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            applicationBloc.userLocation ==
                                    const LatLng(-1.2888736, 36.7913343)
                                ? "Please wait..."
                                : "Choose from map",
                            style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  TextEditingController searchController = TextEditingController();
  late Address address;
  String detailAddress = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return SingleChildScrollView(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Expanded(
                    child: Text(
                      'Search Location',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 30, 0),
                decoration: BoxDecoration(
                    color: const Color(0XFFFfcfcfc),
                    border:
                        Border.all(color: const Color(0XFFFefefef), width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  autofocus: true,
                  autocorrect: false,
                  controller: searchController,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat"),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        size: 25,
                        color: Color(0XFFFbdbfc1),
                      ),
                      border: InputBorder.none,
                      hintText: "Search street, city, district",
                      hintStyle: TextStyle(
                          color: Color(0XFFFbdbfc1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat")),
                  onChanged: (value) => applicationBloc.searchPlaces(value),
                ),
              ),
              Container(
                height: Constants.getHeight(context) * 0.7,
                child: ListView.builder(
                    itemCount: applicationBloc.searchResults.length,
                    itemBuilder: (context, index) {
                      PlacesSerch place = applicationBloc.searchResults[index];
                      String country;
                      try {
                        country = place.country["secondary_text"];
                      } catch (ex) {
                        country = "";
                      }
                      Color backGroundColor = Colors.white;
                      return Column(children: [
                        ListTile(
                          onTap: () async {
                            try {
                              LatLng latlng =
                                  await applicationBloc.getPlace(place.placeID);
                              //address = Address(latlng.latitude, latlng.longitude, place.description, "");
                              detailAddress = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfirmAddress(
                                            address: place.description,
                                            subAddress: country,
                                            latLng: latlng,
                                          )));
                              address = Address(
                                  latlng.latitude,
                                  latlng.longitude,
                                  place.description,
                                  detailAddress,
                                  place.placeID);
                              Navigator.pop(context, address);
                            } catch (ex) {}
                          },
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            child: const Icon(Icons.location_on_rounded,
                                size: 18, color: Color(0XFFF80868a)),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color(0XFFFefefef),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          title: Text(
                            place.description,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              country,
                              style: const TextStyle(
                                  color: Color(0XFFF80868a),
                                  fontSize: 10,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color(0XFFFeceef0),
                          thickness: 1,
                          height: 5,
                        ),
                      ]);
                    }),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
