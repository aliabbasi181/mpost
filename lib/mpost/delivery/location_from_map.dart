import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/delivery.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';

class ChoseLocationFromMap extends StatefulWidget {
  const ChoseLocationFromMap({Key? key}) : super(key: key);

  @override
  _ChoseLocationFromMapState createState() => _ChoseLocationFromMapState();
}

class _ChoseLocationFromMapState extends State<ChoseLocationFromMap> {
  final Set<Marker> markers = Set();
  late LatLng _latLng;
  late Address address;
  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicaitonBloc>(context, listen: false);
    applicationBloc.getUserLocation();
    _latLng = applicationBloc.userLocation;
    markers.add(Marker(
        draggable: true,
        onDragEnd: (latlng) {
          _latLng = latlng;
        },
        markerId: const MarkerId("Current Location"),
        position: _latLng,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(title: "Drag it")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      body: Container(
        height: Constants.getHeight(context),
        width: Constants.getWidth(context),
        child: applicationBloc.userLocation ==
                const LatLng(-1.2888736, 36.7913343)
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
            : Stack(
                children: [
                  Container(
                      width: Constants.getWidth(context),
                      height: Constants.getHeight(context),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: applicationBloc.userLocation, zoom: 13),
                        mapType: MapType.terrain,
                        onTap: (latlng) {
                          print(latlng);
                          markers.clear();
                          markers.add(Marker(
                              markerId: MarkerId(latlng.latitude.toString()),
                              position: latlng,
                              icon: BitmapDescriptor.defaultMarker,
                              infoWindow: const InfoWindow(title: "Drag it")));
                          _latLng = latlng;
                          setState(() {});
                        },
                        markers: markers,
                        myLocationButtonEnabled: false,
                      )),
                  SafeArea(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      width: Constants.getWidth(context),
                      decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Text(
                        "Tap on map to select custom location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: InkWell(
                        onTap: () async {
                          address = await applicationBloc.getAddress(
                              _latLng.latitude, _latLng.longitude);
                          Navigator.pop(context, address);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          width: Constants.getWidth(context),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            !applicationBloc.loading
                                ? "SELECT"
                                : "Please wait...",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
