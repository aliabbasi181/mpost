import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mpost/models/places_search.dart';

class PlacesService {
  final key = 'AIzaSyBDOjOJB4-uVM2YssqKA0KNOwv8WSRxBd4';
  Future<List<PlacesSerch>> getAutocomplete(String query) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&language=en&types=geocode&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body.toString());
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((e) => PlacesSerch.fromJson(e)).toList();
  }

  Future<LatLng> getLocation(String place_id) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$place_id&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body.toString());
    LatLng latLng = LatLng(json['result']['geometry']['location']['lat'],
        json['result']['geometry']['location']['lng']);
    return latLng;
  }

  Future<LatLng> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var res = await Geolocator.getCurrentPosition();
    // try {
    //   List<Placemark> placemarks =
    //       await placemarkFromCoordinates(52.2165157, 6.9437819);
    //   print(placemarks.first.toString());
    // } catch (ex) {
    //   print(ex);
    // }
    return LatLng(res.latitude, res.longitude);
  }

  Future<String> calculateDistance(String from, String to) async {
    try {
      var url =
          "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=place_id:$to&origins=place_id:$from&key=$key";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body)['rows'][0]['elements'][0]['distance']
            ['text']);
        String distance = jsonDecode(response.body)['rows'][0]['elements'][0]
                ['distance']['text']
            .toString()
            .split(' ')[0];
        return distance;
      }
      return "error";
    } catch (ex) {
      print(ex);
      return "error";
    }
  }
}
