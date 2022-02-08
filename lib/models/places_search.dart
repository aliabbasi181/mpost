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


// {
//             "description": "İstanbul, Turkey",
//             "matched_substrings": [
//                 {
//                     "length": 2,
//                     "offset": 0
//                 }
//             ],
//             "place_id": "ChIJawhoAASnyhQR0LABvJj-zOE",
//             "reference": "ChIJawhoAASnyhQR0LABvJj-zOE",
//             "structured_formatting": {
//                 "main_text": "İstanbul",
//                 "main_text_matched_substrings": [
//                     {
//                         "length": 2,
//                         "offset": 0
//                     }
//                 ],
//                 "secondary_text": "Turkey"
//             },
//             "terms": [
//                 {
//                     "offset": 0,
//                     "value": "İstanbul"
//                 },
//                 {
//                     "offset": 10,
//                     "value": "Turkey"
//                 }
//             ],
//             "types": [
//                 "locality",
//                 "political",
//                 "geocode"
//             ]
//         }