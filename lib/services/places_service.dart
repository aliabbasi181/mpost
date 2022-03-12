import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mpost/constants.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/places_search.dart';

class PlacesService {
  final key = 'AIzaSyBDOjOJB4-uVM2YssqKA0KNOwv8WSRxBd4';
  Future<List<PlacesSerch>> getAutocomplete(String query) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&language=en&key=$key';
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

  Future<int> calculateDistance(LatLng from, LatLng to) async {
    try {
      var url = Constants.hostUrl + "delivery-requests/distance";
      Map<String, dynamic> payload = {
        "pickup_address": {
          "latitude": from.latitude,
          "longitude": from.longitude,
        },
        "delivery_address": {
          "latitude": to.latitude,
          "longitude": to.longitude,
        },
      };
      var response = await Dio().post(url,
          options: Options(headers: Constants.requestHeadersWithToken),
          data: payload);
      print(response.data);
      if (response.statusCode == 200) {
        return int.parse(response.data['total_delivery_cost'].toString());
      }
      return -1;
    } catch (ex) {
      print(ex);
      return -1;
    }
  }

  Future<List<Address>> getAddress(double lat, lng) async {
    List<Address> address = [];
    String result, result2, result3, placeId;
    try {
      var url =
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${Constants.googleAPIkey}";
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        //print(response);
        result = response.data['results'][0]['formatted_address'].toString();
        result2 = response.data['plus_code']['compound_code'].toString();
        result3 = response.data['results'][0]['address_components'][0]
                ['long_name']
            .toString();
        String res1 = '';
        String res2 = '';
        String res3 = '';
        for (var item in result.split(' ')) {
          if (!item.contains('+')) {
            res1 += item + " ";
          }
        }
        for (var item in result2.split(' ')) {
          if (!item.contains('+')) {
            res2 += item + " ";
          }
        }
        for (var item in result3.split(' ')) {
          if (!item.contains('+')) {
            res3 += item + " ";
          }
        }
        placeId = response.data['results'][0]['place_id'].toString();
        address.add(Address(lat, lng, res1, res1, placeId));
        address.add(Address(lat, lng, res2, res2, placeId));
        address.add(Address(lat, lng, res3, res3, placeId));
      } else {
        address.add(Address(lat, lng, "Error", "Error", ""));
      }
    } catch (ex) {
      print(ex);
      address.add(Address(lat, lng, "Error", "Error", ""));
    }
    return address;
  }
}
