import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/mpost/delivery/add_building.dart';
import 'package:mpost/mpost/delivery/add_floor.dart';
import 'package:mpost/mpost/delivery/delivery.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/mpost/delivery/location_from_map.dart';

class ConfirmAddress extends StatefulWidget {
  String address, subAddress;
  LatLng latLng;
  ConfirmAddress(
      {Key? key,
      required this.address,
      required this.subAddress,
      required this.latLng})
      : super(key: key);

  @override
  _ConfirmAddressState createState() => _ConfirmAddressState();
}

class _ConfirmAddressState extends State<ConfirmAddress> {
  String building = "", floor = "";
  final Set<Marker> markers = Set();
  Completer<GoogleMapController> _controller = Completer();

  Future<void> moveCamera() async {
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: widget.latLng,
      zoom: 13,
    )));
  }

  @override
  initState() {
    markers.add(Marker(
      //add first marker
      markerId: MarkerId(widget.address),
      position: widget.latLng,
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              width: Constants.getWidth(context),
              height: Constants.getHeight(context),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target:
                        LatLng(widget.latLng.latitude, widget.latLng.longitude),
                    zoom: 13),
                mapType: MapType.normal,
                markers: markers,
                zoomControlsEnabled: false,
                onTap: (latlng) {},
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              )),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Constants.primaryColor)),
                    onPressed: () async {
                      try {
                        Address address = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ChoseLocationFromMap(
                                      latLng: widget.latLng,
                                    ))));
                        setState(() {
                          widget.address = address.address;
                          widget.latLng = LatLng(address.lat, address.lng);
                          markers.clear();
                          markers.add(Marker(
                            //add first marker
                            markerId: MarkerId(widget.address),
                            position: widget.latLng,
                            icon: BitmapDescriptor
                                .defaultMarker, //Icon for Marker
                          ));
                          moveCamera();
                        });
                      } catch (ex) {}
                    },
                    child: const Text(
                      "Pick from map",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ),
          Container(
            width: Constants.getWidth(context),
            height: Constants.getHeight(context) * 0.40,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 30, spreadRadius: 10)
                ]),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      widget.address,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      widget.subAddress,
                      style: const TextStyle(
                          color: Color(0XFFF80868a),
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0XFFFc1c1c1),
                      size: 25,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFFeceef0),
                    thickness: 1,
                    height: 0,
                  ),
                  ListTile(
                    onTap: () async {
                      try {
                        building = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBuilding(
                                      text: building,
                                    )));
                        setState(() {});
                      } catch (ex) {}
                    },
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Building, landmark",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      building.isEmpty ? "Missing Details" : building,
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0XFFFc1c1c1),
                      size: 25,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFFeceef0),
                    thickness: 1,
                    height: 0,
                  ),
                  ListTile(
                    onTap: () async {
                      try {
                        floor = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddFloor(
                                      text: floor,
                                    )));
                        setState(() {});
                      } catch (ex) {}
                    },
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Floor, door, etc",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      floor.isEmpty ? "Missing Details" : floor,
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0XFFFc1c1c1),
                      size: 25,
                    ),
                  ),
                  const Divider(
                    color: Color(0XFFFeceef0),
                    thickness: 1,
                    height: 0,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(
                  context, widget.address + " " + building + " " + floor);
            },
            child: Container(
              width: Constants.getWidth(context),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                  color: const Color(0XFFF1482be),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "CONFIRM ADDRESS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
