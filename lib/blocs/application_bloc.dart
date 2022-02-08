import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpost/models/places_search.dart';
import 'package:mpost/services/places_service.dart';

class ApplicaitonBloc with ChangeNotifier {
  final placesService = PlacesService();

  ApplicaitonBloc() {
    print("BLOC working");
  }

  // variables
  List<PlacesSerch> searchResults = [];
  LatLng userLocation = const LatLng(-1.2888736, 36.7913343);

  searchPlaces(String query) async {
    searchResults = await placesService.getAutocomplete(query);
    //print(searchResults);
    notifyListeners();
  }

  getUserLocation() async {
    userLocation = await placesService.getCurrentLocation();
    notifyListeners();
  }

  Future<LatLng> getPlace(String place_id) async {
    return await placesService.getLocation(place_id);
  }
}
