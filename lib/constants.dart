// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:mpost/models/user.dart';
import 'package:mpost/models/virtual_address_model.dart';

class Constants {
  static Color primaryColor = const Color(0XFFF1582BE);
  static Color classifieldsPrimaryColor = const Color(0XFFBDDFA8);
  static Color descriptionColor = const Color(0XFFF808689);
  static Color msureRed = const Color(0XFFD8364D);
  static Color transportColor1 = const Color(0XFFFFC432);
  static Color transportColor2 = const Color(0XFF6F1369);
  static Color transportHeading = const Color(0XFF1B3442);
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

  static var countries = [
    {"country": "Afghanistan", "code": "93", "ISO3": "AF / AFG"},
    {"country": "Albania", "code": "355", "ISO3": "AL / ALB"},
    {"country": "Algeria", "code": "213", "ISO3": "DZ / DZA"},
    {"country": "American Samoa", "code": "1-684", "ISO3": "AS / ASM"},
    {"country": "Andorra", "code": "376", "ISO3": "AD / AND"},
    {"country": "Angola", "code": "244", "ISO3": "AO / AGO"},
    {"country": "Anguilla", "code": "1-264", "ISO3": "AI / AIA"},
    {"country": "Antarctica", "code": "672", "ISO3": "AQ / ATA"},
    {"country": "Antigua and Barbuda", "code": "1-268", "ISO3": "AG / ATG"},
    {"country": "Argentina", "code": "54", "ISO3": "AR / ARG"},
    {"country": "Armenia", "code": "374", "ISO3": "AM / ARM"},
    {"country": "Aruba", "code": "297", "ISO3": "AW / ABW"},
    {"country": "Australia", "code": "61", "ISO3": "AU / AUS"},
    {"country": "Austria", "code": "43", "ISO3": "AT / AUT"},
    {"country": "Azerbaijan", "code": "994", "ISO3": "AZ / AZE"},
    {"country": "Bahamas", "code": "1-242", "ISO3": "BS / BHS"},
    {"country": "Bahrain", "code": "973", "ISO3": "BH / BHR"},
    {"country": "Bangladesh", "code": "880", "ISO3": "BD / BGD"},
    {"country": "Barbados", "code": "1-246", "ISO3": "BB / BRB"},
    {"country": "Belarus", "code": "375", "ISO3": "BY / BLR"},
    {"country": "Belgium", "code": "32", "ISO3": "BE / BEL"},
    {"country": "Belize", "code": "501", "ISO3": "BZ / BLZ"},
    {"country": "Benin", "code": "229", "ISO3": "BJ / BEN"},
    {"country": "Bermuda", "code": "1-441", "ISO3": "BM / BMU"},
    {"country": "Bhutan", "code": "975", "ISO3": "BT / BTN"},
    {"country": "Bolivia", "code": "591", "ISO3": "BO / BOL"},
    {"country": "Bosnia and Herzegovina", "code": "387", "ISO3": "BA / BIH"},
    {"country": "Botswana", "code": "267", "ISO3": "BW / BWA"},
    {"country": "Brazil", "code": "55", "ISO3": "BR / BRA"},
    {
      "country": "British Indian Ocean Territory",
      "code": "246",
      "ISO3": "IO / IOT"
    },
    {"country": "British Virgin Islands", "code": "1-284", "ISO3": "VG / VGB"},
    {"country": "Brunei", "code": "673", "ISO3": "BN / BRN"},
    {"country": "Bulgaria", "code": "359", "ISO3": "BG / BGR"},
    {"country": "Burkina Faso", "code": "226", "ISO3": "BF / BFA"},
    {"country": "Burundi", "code": "257", "ISO3": "BI / BDI"},
    {"country": "Cambodia", "code": "855", "ISO3": "KH / KHM"},
    {"country": "Cameroon", "code": "237", "ISO3": "CM / CMR"},
    {"country": "Canada", "code": "1", "ISO3": "CA / CAN"},
    {"country": "Cape Verde", "code": "238", "ISO3": "CV / CPV"},
    {"country": "Cayman Islands", "code": "1-345", "ISO3": "KY / CYM"},
    {"country": "Central African Republic", "code": "236", "ISO3": "CF / CAF"},
    {"country": "Chad", "code": "235", "ISO3": "TD / TCD"},
    {"country": "Chile", "code": "56", "ISO3": "CL / CHL"},
    {"country": "China", "code": "86", "ISO3": "CN / CHN"},
    {"country": "Christmas Island", "code": "61", "ISO3": "CX / CXR"},
    {"country": "Cocos Islands", "code": "61", "ISO3": "CC / CCK"},
    {"country": "Colombia", "code": "57", "ISO3": "CO / COL"},
    {"country": "Comoros", "code": "269", "ISO3": "KM / COM"},
    {"country": "Cook Islands", "code": "682", "ISO3": "CK / COK"},
    {"country": "Costa Rica", "code": "506", "ISO3": "CR / CRI"},
    {"country": "Croatia", "code": "385", "ISO3": "HR / HRV"},
    {"country": "Cuba", "code": "53", "ISO3": "CU / CUB"},
    {"country": "Curacao", "code": "599", "ISO3": "CW / CUW"},
    {"country": "Cyprus", "code": "357", "ISO3": "CY / CYP"},
    {"country": "Czech Republic", "code": "420", "ISO3": "CZ / CZE"},
    {
      "country": "Democratic Republic of the Congo",
      "code": "243",
      "ISO3": "CD / COD"
    },
    {"country": "Denmark", "code": "45", "ISO3": "DK / DNK"},
    {"country": "Djibouti", "code": "253", "ISO3": "DJ / DJI"},
    {"country": "Dominica", "code": "1-767", "ISO3": "DM / DMA"},
    {
      "country": "Dominican Republic",
      "code": "1-809, 1-829, 1-849",
      "ISO3": "DO / DOM"
    },
    {"country": "East Timor", "code": "670", "ISO3": "TL / TLS"},
    {"country": "Ecuador", "code": "593", "ISO3": "EC / ECU"},
    {"country": "Egypt", "code": "20", "ISO3": "EG / EGY"},
    {"country": "El Salvador", "code": "503", "ISO3": "SV / SLV"},
    {"country": "Equatorial Guinea", "code": "240", "ISO3": "GQ / GNQ"},
    {"country": "Eritrea", "code": "291", "ISO3": "ER / ERI"},
    {"country": "Estonia", "code": "372", "ISO3": "EE / EST"},
    {"country": "Ethiopia", "code": "251", "ISO3": "ET / ETH"},
    {"country": "Falkland Islands", "code": "500", "ISO3": "FK / FLK"},
    {"country": "Faroe Islands", "code": "298", "ISO3": "FO / FRO"},
    {"country": "Fiji", "code": "679", "ISO3": "FJ / FJI"},
    {"country": "Finland", "code": "358", "ISO3": "FI / FIN"},
    {"country": "France", "code": "33", "ISO3": "FR / FRA"},
    {"country": "French Polynesia", "code": "689", "ISO3": "PF / PYF"},
    {"country": "Gabon", "code": "241", "ISO3": "GA / GAB"},
    {"country": "Gambia", "code": "220", "ISO3": "GM / GMB"},
    {"country": "Georgia", "code": "995", "ISO3": "GE / GEO"},
    {"country": "Germany", "code": "49", "ISO3": "DE / DEU"},
    {"country": "Ghana", "code": "233", "ISO3": "GH / GHA"},
    {"country": "Gibraltar", "code": "350", "ISO3": "GI / GIB"},
    {"country": "Greece", "code": "30", "ISO3": "GR / GRC"},
    {"country": "Greenland", "code": "299", "ISO3": "GL / GRL"},
    {"country": "Grenada", "code": "1-473", "ISO3": "GD / GRD"},
    {"country": "Guam", "code": "1-671", "ISO3": "GU / GUM"},
    {"country": "Guatemala", "code": "502", "ISO3": "GT / GTM"},
    {"country": "Guernsey", "code": "44-1481", "ISO3": "GG / GGY"},
    {"country": "Guinea", "code": "224", "ISO3": "GN / GIN"},
    {"country": "Guinea-Bissau", "code": "245", "ISO3": "GW / GNB"},
    {"country": "Guyana", "code": "592", "ISO3": "GY / GUY"},
    {"country": "Haiti", "code": "509", "ISO3": "HT / HTI"},
    {"country": "Honduras", "code": "504", "ISO3": "HN / HND"},
    {"country": "Hong Kong", "code": "852", "ISO3": "HK / HKG"},
    {"country": "Hungary", "code": "36", "ISO3": "HU / HUN"},
    {"country": "Iceland", "code": "354", "ISO3": "IS / ISL"},
    {"country": "India", "code": "91", "ISO3": "IN / IND"},
    {"country": "Indonesia", "code": "62", "ISO3": "ID / IDN"},
    {"country": "Iran", "code": "98", "ISO3": "IR / IRN"},
    {"country": "Iraq", "code": "964", "ISO3": "IQ / IRQ"},
    {"country": "Ireland", "code": "353", "ISO3": "IE / IRL"},
    {"country": "Isle of Man", "code": "44-1624", "ISO3": "IM / IMN"},
    {"country": "Israel", "code": "972", "ISO3": "IL / ISR"},
    {"country": "Italy", "code": "39", "ISO3": "IT / ITA"},
    {"country": "Ivory Coast", "code": "225", "ISO3": "CI / CIV"},
    {"country": "Jamaica", "code": "1-876", "ISO3": "JM / JAM"},
    {"country": "Japan", "code": "81", "ISO3": "JP / JPN"},
    {"country": "Jersey", "code": "44-1534", "ISO3": "JE / JEY"},
    {"country": "Jordan", "code": "962", "ISO3": "JO / JOR"},
    {"country": "Kazakhstan", "code": "7", "ISO3": "KZ / KAZ"},
    {"country": "Kenya", "code": "254", "ISO3": "KE / KEN"},
    {"country": "Kiribati", "code": "686", "ISO3": "KI / KIR"},
    {"country": "Kosovo", "code": "383", "ISO3": "XK / XKX"},
    {"country": "Kuwait", "code": "965", "ISO3": "KW / KWT"},
    {"country": "Kyrgyzstan", "code": "996", "ISO3": "KG / KGZ"},
    {"country": "Laos", "code": "856", "ISO3": "LA / LAO"},
    {"country": "Latvia", "code": "371", "ISO3": "LV / LVA"},
    {"country": "Lebanon", "code": "961", "ISO3": "LB / LBN"},
    {"country": "Lesotho", "code": "266", "ISO3": "LS / LSO"},
    {"country": "Liberia", "code": "231", "ISO3": "LR / LBR"},
    {"country": "Libya", "code": "218", "ISO3": "LY / LBY"},
    {"country": "Liechtenstein", "code": "423", "ISO3": "LI / LIE"},
    {"country": "Lithuania", "code": "370", "ISO3": "LT / LTU"},
    {"country": "Luxembourg", "code": "352", "ISO3": "LU / LUX"},
    {"country": "Macau", "code": "853", "ISO3": "MO / MAC"},
    {"country": "Macedonia", "code": "389", "ISO3": "MK / MKD"},
    {"country": "Madagascar", "code": "261", "ISO3": "MG / MDG"},
    {"country": "Malawi", "code": "265", "ISO3": "MW / MWI"},
    {"country": "Malaysia", "code": "60", "ISO3": "MY / MYS"},
    {"country": "Maldives", "code": "960", "ISO3": "MV / MDV"},
    {"country": "Mali", "code": "223", "ISO3": "ML / MLI"},
    {"country": "Malta", "code": "356", "ISO3": "MT / MLT"},
    {"country": "Marshall Islands", "code": "692", "ISO3": "MH / MHL"},
    {"country": "Mauritania", "code": "222", "ISO3": "MR / MRT"},
    {"country": "Mauritius", "code": "230", "ISO3": "MU / MUS"},
    {"country": "Mayotte", "code": "262", "ISO3": "YT / MYT"},
    {"country": "Mexico", "code": "52", "ISO3": "MX / MEX"},
    {"country": "Micronesia", "code": "691", "ISO3": "FM / FSM"},
    {"country": "Moldova", "code": "373", "ISO3": "MD / MDA"},
    {"country": "Monaco", "code": "377", "ISO3": "MC / MCO"},
    {"country": "Mongolia", "code": "976", "ISO3": "MN / MNG"},
    {"country": "Montenegro", "code": "382", "ISO3": "ME / MNE"},
    {"country": "Montserrat", "code": "1-664", "ISO3": "MS / MSR"},
    {"country": "Morocco", "code": "212", "ISO3": "MA / MAR"},
    {"country": "Mozambique", "code": "258", "ISO3": "MZ / MOZ"},
    {"country": "Myanmar", "code": "95", "ISO3": "MM / MMR"},
    {"country": "Namibia", "code": "264", "ISO3": "NA / NAM"},
    {"country": "Nauru", "code": "674", "ISO3": "NR / NRU"},
    {"country": "Nepal", "code": "977", "ISO3": "NP / NPL"},
    {"country": "Netherlands", "code": "31", "ISO3": "NL / NLD"},
    {"country": "Netherlands Antilles", "code": "599", "ISO3": "AN / ANT"},
    {"country": "New Caledonia", "code": "687", "ISO3": "NC / NCL"},
    {"country": "New Zealand", "code": "64", "ISO3": "NZ / NZL"},
    {"country": "Nicaragua", "code": "505", "ISO3": "NI / NIC"},
    {"country": "Niger", "code": "227", "ISO3": "NE / NER"},
    {"country": "Nigeria", "code": "234", "ISO3": "NG / NGA"},
    {"country": "Niue", "code": "683", "ISO3": "NU / NIU"},
    {"country": "North Korea", "code": "850", "ISO3": "KP / PRK"},
    {
      "country": "Northern Mariana Islands",
      "code": "1-670",
      "ISO3": "MP / MNP"
    },
    {"country": "Norway", "code": "47", "ISO3": "NO / NOR"},
    {"country": "Oman", "code": "968", "ISO3": "OM / OMN"},
    {"country": "Pakistan", "code": "92", "ISO3": "PK / PAK"},
    {"country": "Palau", "code": "680", "ISO3": "PW / PLW"},
    {"country": "Palestine", "code": "970", "ISO3": "PS / PSE"},
    {"country": "Panama", "code": "507", "ISO3": "PA / PAN"},
    {"country": "Papua New Guinea", "code": "675", "ISO3": "PG / PNG"},
    {"country": "Paraguay", "code": "595", "ISO3": "PY / PRY"},
    {"country": "Peru", "code": "51", "ISO3": "PE / PER"},
    {"country": "Philippines", "code": "63", "ISO3": "PH / PHL"},
    {"country": "Pitcairn", "code": "64", "ISO3": "PN / PCN"},
    {"country": "Poland", "code": "48", "ISO3": "PL / POL"},
    {"country": "Portugal", "code": "351", "ISO3": "PT / PRT"},
    {"country": "Puerto Rico", "code": "1-787, 1-939", "ISO3": "PR / PRI"},
    {"country": "Qatar", "code": "974", "ISO3": "QA / QAT"},
    {"country": "Republic of the Congo", "code": "242", "ISO3": "CG / COG"},
    {"country": "Reunion", "code": "262", "ISO3": "RE / REU"},
    {"country": "Romania", "code": "40", "ISO3": "RO / ROU"},
    {"country": "Russia", "code": "7", "ISO3": "RU / RUS"},
    {"country": "Rwanda", "code": "250", "ISO3": "RW / RWA"},
    {"country": "Saint Barthelemy", "code": "590", "ISO3": "BL / BLM"},
    {"country": "Saint Helena", "code": "290", "ISO3": "SH / SHN"},
    {"country": "Saint Kitts and Nevis", "code": "1-869", "ISO3": "KN / KNA"},
    {"country": "Saint Lucia", "code": "1-758", "ISO3": "LC / LCA"},
    {"country": "Saint Martin", "code": "590", "ISO3": "MF / MAF"},
    {"country": "Saint Pierre and Miquelon", "code": "508", "ISO3": "PM / SPM"},
    {
      "country": "Saint Vincent and the Grenadines",
      "code": "1-784",
      "ISO3": "VC / VCT"
    },
    {"country": "Samoa", "code": "685", "ISO3": "WS / WSM"},
    {"country": "San Marino", "code": "378", "ISO3": "SM / SMR"},
    {"country": "Sao Tome and Principe", "code": "239", "ISO3": "ST / STP"},
    {"country": "Saudi Arabia", "code": "966", "ISO3": "SA / SAU"},
    {"country": "Senegal", "code": "221", "ISO3": "SN / SEN"},
    {"country": "Serbia", "code": "381", "ISO3": "RS / SRB"},
    {"country": "Seychelles", "code": "248", "ISO3": "SC / SYC"},
    {"country": "Sierra Leone", "code": "232", "ISO3": "SL / SLE"},
    {"country": "Singapore", "code": "65", "ISO3": "SG / SGP"},
    {"country": "Sint Maarten", "code": "1-721", "ISO3": "SX / SXM"},
    {"country": "Slovakia", "code": "421", "ISO3": "SK / SVK"},
    {"country": "Slovenia", "code": "386", "ISO3": "SI / SVN"},
    {"country": "Solomon Islands", "code": "677", "ISO3": "SB / SLB"},
    {"country": "Somalia", "code": "252", "ISO3": "SO / SOM"},
    {"country": "South Africa", "code": "27", "ISO3": "ZA / ZAF"},
    {"country": "South Korea", "code": "82", "ISO3": "KR / KOR"},
    {"country": "South Sudan", "code": "211", "ISO3": "SS / SSD"},
    {"country": "Spain", "code": "34", "ISO3": "ES / ESP"},
    {"country": "Sri Lanka", "code": "94", "ISO3": "LK / LKA"},
    {"country": "Sudan", "code": "249", "ISO3": "SD / SDN"},
    {"country": "Suriname", "code": "597", "ISO3": "SR / SUR"},
    {"country": "Svalbard and Jan Mayen", "code": "47", "ISO3": "SJ / SJM"},
    {"country": "Swaziland", "code": "268", "ISO3": "SZ / SWZ"},
    {"country": "Sweden", "code": "46", "ISO3": "SE / SWE"},
    {"country": "Switzerland", "code": "41", "ISO3": "CH / CHE"},
    {"country": "Syria", "code": "963", "ISO3": "SY / SYR"},
    {"country": "Taiwan", "code": "886", "ISO3": "TW / TWN"},
    {"country": "Tajikistan", "code": "992", "ISO3": "TJ / TJK"},
    {"country": "Tanzania", "code": "255", "ISO3": "TZ / TZA"},
    {"country": "Thailand", "code": "66", "ISO3": "TH / THA"},
    {"country": "Togo", "code": "228", "ISO3": "TG / TGO"},
    {"country": "Tokelau", "code": "690", "ISO3": "TK / TKL"},
    {"country": "Tonga", "code": "676", "ISO3": "TO / TON"},
    {"country": "Trinidad and Tobago", "code": "1-868", "ISO3": "TT / TTO"},
    {"country": "Tunisia", "code": "216", "ISO3": "TN / TUN"},
    {"country": "Turkey", "code": "90", "ISO3": "TR / TUR"},
    {"country": "Turkmenistan", "code": "993", "ISO3": "TM / TKM"},
    {
      "country": "Turks and Caicos Islands",
      "code": "1-649",
      "ISO3": "TC / TCA"
    },
    {"country": "Tuvalu", "code": "688", "ISO3": "TV / TUV"},
    {"country": "U.S. Virgin Islands", "code": "1-340", "ISO3": "VI / VIR"},
    {"country": "Uganda", "code": "256", "ISO3": "UG / UGA"},
    {"country": "Ukraine", "code": "380", "ISO3": "UA / UKR"},
    {"country": "United Arab Emirates", "code": "971", "ISO3": "AE / ARE"},
    {"country": "United Kingdom", "code": "44", "ISO3": "GB / GBR"},
    {"country": "United States", "code": "1", "ISO3": "US / USA"},
    {"country": "Uruguay", "code": "598", "ISO3": "UY / URY"},
    {"country": "Uzbekistan", "code": "998", "ISO3": "UZ / UZB"},
    {"country": "Vanuatu", "code": "678", "ISO3": "VU / VUT"},
    {"country": "Vatican", "code": "379", "ISO3": "VA / VAT"},
    {"country": "Venezuela", "code": "58", "ISO3": "VE / VEN"},
    {"country": "Vietnam", "code": "84", "ISO3": "VN / VNM"},
    {"country": "Wallis and Futuna", "code": "681", "ISO3": "WF / WLF"},
    {"country": "Western Sahara", "code": "212", "ISO3": "EH / ESH"},
    {"country": "Yemen", "code": "967", "ISO3": "YE / YEM"},
    {"country": "Zambia", "code": "260", "ISO3": "ZM / ZMB"},
    {"country": "Zimbabwe", "code": "263", "ISO3": "ZW / ZWE"}
  ];
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

