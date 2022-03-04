import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/blocs/application_bloc.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/delivery/addPhoneNumber.dart';
import 'package:mpost/mpost/delivery/address_picker.dart';
import 'package:mpost/mpost/delivery/delivery_details.dart';
import 'package:mpost/mpost/payment/choose_payment.dart';
import 'package:mpost/mpost/widgets.dart';
import 'package:mpost/widgets.dart';
import 'package:provider/provider.dart';
import 'package:mpost/models/address.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class DeliveryDetail {
  String recpName, phone, typeOfItem, note, instructions;
  DeliveryDetail(
      this.recpName, this.phone, this.typeOfItem, this.note, this.instructions);
}

class _DeliveryState extends State<Delivery> {
  Address pickFrom = Address(0, 0, "", "", ""),
      deliver = Address(0, 0, "", "", "");
  var cameraPosition =
      const CameraPosition(target: LatLng(-1.2888736, 36.7913343));
  late GoogleMapController googleMapController;
  String pickupTime = "";
  String phone = "";
  late DeliveryDetail recpDetail;
  String itemType = "Delivery details";
  int price = 135;
  final Set<Polyline> polyline = Set();
  final Set<Marker> markers = Set();

  createPolyline() async {
    if (pickFrom.lat != 0 && deliver.lat != 0) {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.googleAPIkey,
        PointLatLng(
          pickFrom.lat,
          pickFrom.lng,
        ),
        PointLatLng(deliver.lat, deliver.lng),
      );
      print(result);
      List<LatLng> points = [];
      for (PointLatLng item in result.points) {
        points.add(LatLng(item.latitude, item.longitude));
      }
      polyline.add(Polyline(
          polylineId: const PolylineId("value"),
          points: points,
          width: 5,
          color: Constants.primaryColor));
      setState(() {});
    }
  }

  setMarkers() {
    if (pickFrom.lat != 0 && deliver.lat != 0) {
      if (pickFrom.lat != 0 && deliver.lat == 0) {
        markers.clear();
        markers.add(Marker(
          markerId: MarkerId(pickFrom.address),
          position: LatLng(pickFrom.lat, pickFrom.lng),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      } else if (pickFrom.lat == 0 && deliver.lat != 0) {
        markers.clear();
        markers.add(Marker(
          markerId: MarkerId(deliver.address),
          position: LatLng(deliver.lat, deliver.lng),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      } else {
        markers.clear();
        markers.add(Marker(
          markerId: MarkerId(pickFrom.address),
          position: LatLng(pickFrom.lat, pickFrom.lng),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
        markers.add(Marker(
          markerId: MarkerId(deliver.address),
          position: LatLng(deliver.lat, deliver.lng),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicaitonBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Constants.getHeight(context) * 0.83,
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20),
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
                                    'Delivery',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const Image(
                                    width: 30,
                                    image: AssetImage(
                                        "asset/images/location_history.png"))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              onTap: () async {
                                try {
                                  pickFrom = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddressPicker()));
                                  setMarkers();
                                  if (pickFrom.lat != 0 && deliver.lat != 0) {
                                    createPolyline();
                                    price = await applicationBloc.getDistance(
                                        LatLng(pickFrom.lat, pickFrom.lng),
                                        LatLng(deliver.lat, deliver.lng));
                                  }
                                  setState(() {});
                                } catch (ex) {}
                                setState(() {});
                              },
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                CupertinoIcons.smallcircle_fill_circle_fill,
                                color: Color(0XFFF39bacd),
                                size: 25,
                              ),
                              title: Text(
                                pickFrom.address.isEmpty
                                    ? "Pick up item at?"
                                    : pickFrom.detailedAddress,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0XFFF80868a),
                                    fontSize: 17,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 25,
                              ),
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              onTap: () async {
                                try {
                                  deliver = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddressPicker()));
                                  setMarkers();
                                  if (pickFrom.lat != 0 && deliver.lat != 0) {
                                    createPolyline();
                                    price = await applicationBloc.getDistance(
                                        LatLng(pickFrom.lat, pickFrom.lng),
                                        LatLng(deliver.lat, deliver.lng));
                                  }
                                  setState(() {});
                                } catch (ex) {}
                                setState(() {});
                              },
                              leading: const Icon(
                                Icons.location_on_rounded,
                                color: Color(0XFFFbf157a),
                                size: 25,
                              ),
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                deliver.address.isEmpty
                                    ? "Deliver to?"
                                    : deliver.detailedAddress,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0XFFF80868a),
                                    fontSize: 17,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            pickFrom.lat != 0
                                ? Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: Constants.getWidth(context),
                                    child: GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                          target: LatLng(
                                              pickFrom.lat, pickFrom.lng),
                                          zoom: 7.5),
                                      mapType: MapType.normal,
                                      markers: markers,
                                      onTap: (latlng) {},
                                      polylines: polyline,
                                      myLocationButtonEnabled: false,
                                    ))
                                : Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "asset/images/map.png"),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(5)),
                                    width: Constants.getWidth(context),
                                  ),
                            const SizedBox(
                              height: 5,
                            ),
                            ListTile(
                              onTap: () async {
                                try {
                                  recpDetail = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DeliveryDetails()));
                                  itemType = recpDetail.typeOfItem;
                                  setState(() {});
                                } catch (ex) {}
                              },
                              contentPadding: EdgeInsets.zero,
                              title: const Text(
                                "Your order",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  itemType,
                                  style: const TextStyle(
                                      color: Color(0XFFF80868a),
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 25,
                              ),
                            ),
                            const Divider(
                              color: Color(0XFFFeceef0),
                              thickness: 1.5,
                              height: 15,
                            ),
                            ListTile(
                              onTap: () async {
                                try {
                                  pickupTime = await showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return SafeArea(
                                          bottom: false,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: Constants.getHeight(
                                                        context) *
                                                    0.6),
                                            width: Constants.getWidth(context),
                                            height:
                                                Constants.getHeight(context),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            child: const TimePicker(),
                                          ),
                                        );
                                      });
                                  print(pickupTime);
                                  setState(() {});
                                } catch (ex) {}
                              },
                              contentPadding: EdgeInsets.zero,
                              title: const Text(
                                "Pickup time",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  pickupTime.isEmpty
                                      ? "As soon as possible"
                                      : pickupTime,
                                  style: const TextStyle(
                                      color: Color(0XFFF80868a),
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 25,
                              ),
                            ),
                            const Divider(
                              color: Color(0XFFFeceef0),
                              thickness: 1.5,
                              height: 15,
                            ),
                            ListTile(
                              onTap: () async {
                                try {
                                  phone = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddPhoneNumber()));
                                  setState(() {});
                                } catch (ex) {}
                              },
                              contentPadding: EdgeInsets.zero,
                              title: const Text(
                                "Add your phone number (optional)",
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  phone.isEmpty
                                      ? "In case we need to contact you about your package"
                                      : phone,
                                  style: const TextStyle(
                                      color: Color(0XFFF80868a),
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0XFFFc1c1c1),
                                size: 25,
                              ),
                            ),
                            const Divider(
                              color: Color(0XFFFeceef0),
                              thickness: 1.5,
                              height: 15,
                            ),
                            ListTile(
                              title: const Text(
                                "Total",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                              ),
                              contentPadding: EdgeInsets.zero,
                              trailing: Text(
                                "KSH ${price.toString()}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: InputButton(
                  label: !applicationBloc.loading
                      ? "CONFIRM ORDER"
                      : "Please wait...",
                  onPress: () async {
                    // applicationBloc.initializeMobilePayment(
                    //     "", "phone", "paymentRequestId");
                    // return;
                    if (pickFrom.detailedAddress == "") {
                      showSnackBar("Validation error",
                          "Pickup address is required.", context);
                      return;
                    } else if (deliver.detailedAddress == "") {
                      showSnackBar("Validation error",
                          "Delivery address is required.", context);
                      return;
                    } else if (pickupTime == "") {
                      showSnackBar("Validation error",
                          "Pickup time is required.", context);
                      return;
                    } else if (pickFrom.detailedAddress ==
                        deliver.detailedAddress) {
                      showSnackBar(
                          "Validation error",
                          "Both pickup and deliver address can not be same.",
                          context);
                      return;
                    } else if (itemType == "Delivery details") {
                      showSnackBar("Validation error",
                          "Recipient details can not be empty.", context);
                      return;
                    } else {
                      await applicationBloc.checkConnection(context);
                      if (await applicationBloc.confirmOrder(
                          pickFrom, deliver, recpDetail, pickupTime)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosePayment(
                                      cost:
                                          applicationBloc.totalCost.toString(),
                                      id: applicationBloc.paymentRequestId
                                          .toString(),
                                    )));
                      }
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  Color optionColor = Color(0XFFFbdbfc1);
  bool today = true, tomorrow = false;
  String selection = "Today | 16:00 - 17:00";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
        height: Constants.getHeight(context) * 0.4,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Schedule a time',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, "");
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, selection);
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Constants.primaryColor,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Center(
              child: Container(
                height: Constants.getHeight(context) * 0.2,
                child: CupertinoPicker(
                    selectionOverlay: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color(0XFFFeceef0), width: 1),
                              bottom: BorderSide(
                                  color: Color(0XFFFeceef0), width: 1))),
                    ),
                    itemExtent: 50,
                    onSelectedItemChanged: (value) {
                      value == 0
                          ? selection = "Today | 16:00 - 17:00"
                          : selection = "Tommorow | 16:00 - 17:00";
                    },
                    children: const [
                      Center(
                          child: Text('Today | 16:00 - 17:00',
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))),
                      Center(
                          child: Text('Tommorow | 16:00 - 17:00',
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
