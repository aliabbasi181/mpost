class PlacesSerch {
  final String description;
  final String placeID;
  final Map<String, dynamic> country;

  PlacesSerch(
      {required this.description,
      required this.placeID,
      required this.country});

  factory PlacesSerch.fromJson(Map<String, dynamic> json) {
    return PlacesSerch(
        description: json['description'],
        placeID: json['place_id'],
        country: json['structured_formatting']);
  }
}
