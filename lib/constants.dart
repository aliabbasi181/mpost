// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:mpost/models/user.dart';
import 'package:mpost/models/virtual_address_model.dart';

class Constants {
  static Color primaryColor = const Color(0XFFF1582BE);
  static Color descriptionColor = const Color(0XFFF808689);
  static String hostUrl = "https://mpost-app.co.ke/api/";
  static String token = "";
  static String registerName = '';
  static String registerEmail = '';
  static String registerMobile = '';
  static String registerPassword = '';
  static String error = "";
  static String registerType = '';
  static String identityNumber = '';
  static String postal_code_id = '1';
  static bool isNational = true;
  static String flutterwaveEncryptionKey = "FLWSECK_TEST9c989b7790e8";
  static String flutterwavePublicKey =
      "FLWPUBK_TEST-2966ad8684f3219de6c2594b113461b2-X";
  static VirtualAddressModel virtualAddress = VirtualAddressModel();
  static String googleAPIkey = 'AIzaSyBDOjOJB4-uVM2YssqKA0KNOwv8WSRxBd4';
  static const String oneSignalAppId = "9793f58f-6acb-4a6d-ba2b-40fd882f345e";
  static const String oneSignalAPIKey =
      "ODM4NzU2ZWUtY2FjZS00MTk1LWJiNjMtMjY0N2YwMDZkZjA2";
  static UserModel user = UserModel();
  static Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static Map<String, String> requestHeadersWithToken = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static setToken() {
    requestHeadersWithToken = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  // {
  //   "city": "Nairobi",
  //   "lat": "-1.2864",
  //   "lng": "36.8172",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Nairobi City",
  //   "capital": "primary",
  //   "population": "5545000",
  //   "population_proper": "5545000"
  // },
  // {
  //   "city": "Meru",
  //   "lat": "0.0500",
  //   "lng": "37.6500",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Meru",
  //   "capital": "admin",
  //   "population": "1833000",
  //   "population_proper": "1833000"
  // },
  // {
  //   "city": "Mombasa",
  //   "lat": "-4.0500",
  //   "lng": "39.6667",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Mombasa",
  //   "capital": "admin",
  //   "population": "1200000",
  //   "population_proper": "1200000"
  // },
  // {
  //   "city": "Kisumu",
  //   "lat": "-0.1000",
  //   "lng": "34.7500",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kisumu",
  //   "capital": "admin",
  //   "population": "409928",
  //   "population_proper": "409928"
  // },
  // {
  //   "city": "Nakuru",
  //   "lat": "-0.2833",
  //   "lng": "36.0667",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Nakuru",
  //   "capital": "admin",
  //   "population": "307990",
  //   "population_proper": "307990"
  // },
  // {
  //   "city": "Eldoret",
  //   "lat": "0.5167",
  //   "lng": "35.2833",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Uasin Gishu",
  //   "capital": "admin",
  //   "population": "193830",
  //   "population_proper": "193830"
  // },
  // {
  //   "city": "Machakos",
  //   "lat": "-1.5167",
  //   "lng": "37.2667",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Machakos",
  //   "capital": "admin",
  //   "population": "114109",
  //   "population_proper": "114109"
  // },
  // {
  //   "city": "Kisii",
  //   "lat": "-0.6698",
  //   "lng": "34.7675",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kisii",
  //   "capital": "admin",
  //   "population": "112417",
  //   "population_proper": "112417"
  // },
  // {
  //   "city": "Mumias",
  //   "lat": "0.3333",
  //   "lng": "34.4833",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kakamega",
  //   "capital": "",
  //   "population": "99987",
  //   "population_proper": "99987"
  // },
  // {
  //   "city": "Thika",
  //   "lat": "-1.0396",
  //   "lng": "37.0900",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kiambu",
  //   "capital": "",
  //   "population": "99322",
  //   "population_proper": "87821"
  // },
  // {
  //   "city": "Nyeri",
  //   "lat": "-0.4167",
  //   "lng": "36.9500",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Nyeri",
  //   "capital": "admin",
  //   "population": "98908",
  //   "population_proper": "98908"
  // },
  // {
  //   "city": "Malindi",
  //   "lat": "-3.2100",
  //   "lng": "40.1000",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kilifi",
  //   "capital": "",
  //   "population": "94016",
  //   "population_proper": "68304"
  // },
  // {
  //   "city": "Kakamega",
  //   "lat": "0.2833",
  //   "lng": "34.7500",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kakamega",
  //   "capital": "admin",
  //   "population": "91778",
  //   "population_proper": "91778"
  // },
  // {
  //   "city": "Kendu Bay",
  //   "lat": "-0.3596",
  //   "lng": "34.6400",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Homa Bay",
  //   "capital": "",
  //   "population": "91248",
  //   "population_proper": "91248"
  // },
  // {
  //   "city": "Lodwar",
  //   "lat": "3.1167",
  //   "lng": "35.6000",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Turkana",
  //   "capital": "admin",
  //   "population": "82970",
  //   "population_proper": "82970"
  // },
  // {
  //   "city": "Athi River",
  //   "lat": "-1.4500",
  //   "lng": "36.9833",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Machakos",
  //   "capital": "",
  //   "population": "81302",
  //   "population_proper": "81302"
  // },
  // {
  //   "city": "Kilifi",
  //   "lat": "-3.6333",
  //   "lng": "39.8500",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kilifi",
  //   "capital": "",
  //   "population": "80339",
  //   "population_proper": "46118"
  // },
  // {
  //   "city": "Sotik",
  //   "lat": "-0.6796",
  //   "lng": "35.1200",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Bomet",
  //   "capital": "",
  //   "population": "71285",
  //   "population_proper": "2600"
  // },
  // {
  //   "city": "Garissa",
  //   "lat": "-0.4569",
  //   "lng": "39.6583",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Garissa",
  //   "capital": "admin",
  //   "population": "65881",
  //   "population_proper": "65881"
  // },
  // {
  //   "city": "Kitale",
  //   "lat": "1.0167",
  //   "lng": "35.0000",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Trans Nzoia",
  //   "capital": "admin",
  //   "population": "63245",
  //   "population_proper": "63245"
  // },
  // {
  //   "city": "Bungoma",
  //   "lat": "0.5666",
  //   "lng": "34.5666",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Bungoma",
  //   "capital": "admin",
  //   "population": "55857",
  //   "population_proper": "55857"
  // },
  // {
  //   "city": "Isiolo",
  //   "lat": "0.3500",
  //   "lng": "37.5833",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Isiolo",
  //   "capital": "admin",
  //   "population": "45989",
  //   "population_proper": "45989"
  // },
  // {
  //   "city": "Wajir",
  //   "lat": "1.7500",
  //   "lng": "40.0667",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Wajir",
  //   "capital": "admin",
  //   "population": "45771",
  //   "population_proper": "34709"
  // },
  // {
  //   "city": "Embu",
  //   "lat": "-0.5333",
  //   "lng": "37.4500",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Embu",
  //   "capital": "admin",
  //   "population": "41092",
  //   "population_proper": "41092"
  // },
  // {
  //   "city": "Voi",
  //   "lat": "-3.3696",
  //   "lng": "38.5700",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Taita/Taveta",
  //   "capital": "",
  //   "population": "36487",
  //   "population_proper": "19624"
  // },
  // {
  //   "city": "Homa Bay",
  //   "lat": "-0.5167",
  //   "lng": "34.4500",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Homa Bay",
  //   "capital": "admin",
  //   "population": "32174",
  //   "population_proper": "32174"
  // },
  // {
  //   "city": "Nanyuki",
  //   "lat": "0.0167",
  //   "lng": "37.0667",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Laikipia",
  //   "capital": "",
  //   "population": "31577",
  //   "population_proper": "31577"
  // },
  // {
  //   "city": "Busia",
  //   "lat": "0.4608",
  //   "lng": "34.1108",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Busia",
  //   "capital": "admin",
  //   "population": "30777",
  //   "population_proper": "30777"
  // },
  // {
  //   "city": "Mandera",
  //   "lat": "3.9167",
  //   "lng": "41.8333",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Mandera",
  //   "capital": "admin",
  //   "population": "30433",
  //   "population_proper": "30433"
  // },
  // {
  //   "city": "Kericho",
  //   "lat": "-0.3692",
  //   "lng": "35.2839",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kericho",
  //   "capital": "admin",
  //   "population": "30023",
  //   "population_proper": "30023"
  // },
  // {
  //   "city": "Kitui",
  //   "lat": "-1.3667",
  //   "lng": "38.0167",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kitui",
  //   "capital": "admin",
  //   "population": "29062",
  //   "population_proper": "29062"
  // },
  // {
  //   "city": "Maralal",
  //   "lat": "1.1000",
  //   "lng": "36.7000",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Samburu",
  //   "capital": "admin",
  //   "population": "20841",
  //   "population_proper": "20841"
  // },
  // {
  //   "city": "Lamu",
  //   "lat": "-2.2686",
  //   "lng": "40.9003",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Lamu",
  //   "capital": "admin",
  //   "population": "18382",
  //   "population_proper": "18382"
  // },
  // {
  //   "city": "Kapsabet",
  //   "lat": "0.2000",
  //   "lng": "35.1000",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Nandi",
  //   "capital": "admin",
  //   "population": "17918",
  //   "population_proper": "17918"
  // },
  // {
  //   "city": "Marsabit",
  //   "lat": "2.3333",
  //   "lng": "37.9833",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Marsabit",
  //   "capital": "admin",
  //   "population": "17127",
  //   "population_proper": "17127"
  // },
  // {
  //   "city": "Hola",
  //   "lat": "-1.5000",
  //   "lng": "40.0300",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Tana River",
  //   "capital": "admin",
  //   "population": "6931",
  //   "population_proper": "6931"
  // },
  // {
  //   "city": "Kiambu",
  //   "lat": "-1.1714",
  //   "lng": "36.8356",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kiambu",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Kabarnet",
  //   "lat": "0.4919",
  //   "lng": "35.7430",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Baringo",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Migori",
  //   "lat": "-1.0634",
  //   "lng": "34.4731",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Migori",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Kerugoya",
  //   "lat": "-0.4989",
  //   "lng": "37.2803",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kirinyaga",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Iten",
  //   "lat": "0.6703",
  //   "lng": "35.5081",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Elgeyo/Marakwet",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Nyamira",
  //   "lat": "-0.5633",
  //   "lng": "34.9358",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Nyamira",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Murang’a",
  //   "lat": "-0.7210",
  //   "lng": "37.1526",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Murang’a",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Sotik Post",
  //   "lat": "-0.7813",
  //   "lng": "35.3416",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Bomet",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Siaya",
  //   "lat": "0.0607",
  //   "lng": "34.2881",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Siaya",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Kapenguria",
  //   "lat": "1.2389",
  //   "lng": "35.1119",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "West Pokot",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Wote",
  //   "lat": "-1.7808",
  //   "lng": "37.6288",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Makueni",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Mwatate",
  //   "lat": "-3.5050",
  //   "lng": "38.3772",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Taita/Taveta",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Kajiado",
  //   "lat": "-1.8500",
  //   "lng": "36.7833",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kajiado",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Ol Kalou",
  //   "lat": "-0.2643",
  //   "lng": "36.3788",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Nyandarua",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Narok",
  //   "lat": "-1.0833",
  //   "lng": "35.8667",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Narok",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Kwale",
  //   "lat": "-4.1737",
  //   "lng": "39.4521",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Kwale",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // },
  // {
  //   "city": "Rumuruti",
  //   "lat": "0.2725",
  //   "lng": "36.5381",
  //   "country": "Kenya",
  //   "iso2": "KE",
  //   "admin_name": "Laikipia",
  //   "capital": "admin",
  //   "population": "",
  //   "population_proper": ""
  // }

}

class ActivityCategory {
  String name;
  bool active;
  ActivityCategory(this.name, this.active);
  static List<ActivityCategory> activityTabs = [
    ActivityCategory("Deliveries", true),
    ActivityCategory("Shopping", false),
    ActivityCategory("Events", false),
    ActivityCategory("Transport", false),
    ActivityCategory("Movies", false),
    ActivityCategory("Gift Card", false),
  ];
}

class City {
  String name, lat, lng;
  City(this.name, this.lat, this.lng);
}


// Container(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(15, 7, 15, 0),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(100),
//                                         color: ActivityCategory
//                                                 .activityTabs[index].active
//                                             ? Constants.primaryColor
//                                             : null),
//                                     child: Text(
//                                       ActivityCategory.activityTabs[index].name,
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           color: ActivityCategory
//                                                   .activityTabs[index].active
//                                               ? Colors.white
//                                               : const Color(0XFFF808689),
//                                           fontFamily: 'Montserrat',
//                                           fontWeight: FontWeight.w600),
//                                     )),
//                               ),
//                             );
//                           }))),

