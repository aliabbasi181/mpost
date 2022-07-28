import 'package:dio/dio.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesCountryModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesRegionModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesStagesModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesSub_CountryModel.dart';
import 'package:mpost/mpost/msure/MsureModels/places/MsurePlacesWardModel.dart';
import 'package:mpost/mpost/msure/msure_constants.dart';
import 'package:http/http.dart' as http;

class MsurePlacesService {
  Future<List<MsurePlacesRegionModel>> getRegions() async {
    List<MsurePlacesRegionModel> regions = [];
    try {
      String url = MsureConstants.msureBaseUrl + '/places/regions';
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      print(response.data);
      if (response.statusCode == 200) {
        for (var item in response.data) {
          regions.add(MsurePlacesRegionModel.fromJson(item));
        }
      }
    } catch (ex) {
      print(ex);
    }
    return regions;
  }

  Future<MsurePlacesCountryModel> getCounty(id) async {
    MsurePlacesCountryModel county = MsurePlacesCountryModel();
    try {
      String url = MsureConstants.msureBaseUrl + '/places/counties/$id';
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        county = MsurePlacesCountryModel.fromJson(response.data);
      }
    } catch (ex) {
      print(ex);
    }
    print(county);
    return county;
  }

  Future<MsurePlacesSub_CountryModel> getSubCounty(id) async {
    MsurePlacesSub_CountryModel subCounty = MsurePlacesSub_CountryModel();
    try {
      String url = MsureConstants.msureBaseUrl + '/places/sub_counties/$id';
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        subCounty = MsurePlacesSub_CountryModel.fromJson(response.data);
      }
    } catch (ex) {
      print(ex);
    }
    return subCounty;
  }

  Future<MsurePlacesWardModel> getWards(id) async {
    MsurePlacesWardModel ward = MsurePlacesWardModel();
    try {
      String url = MsureConstants.msureBaseUrl + '/places/wards/$id';
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        ward = MsurePlacesWardModel.fromJson(response.data);
      }
    } catch (ex) {
      print(ex);
    }
    print(ward);
    return ward;
  }

  Future<MsurePlacesStagesModel> getStages(id) async {
    MsurePlacesStagesModel stage = MsurePlacesStagesModel();
    try {
      String url = MsureConstants.msureBaseUrl + '/places/stages/$id';
      var response = await Dio()
          .get(url, options: Options(headers: MsureConstants.msureheader));
      if (response.statusCode == 200) {
        stage = MsurePlacesStagesModel.fromJson(response.data);
      }
    } catch (ex) {
      print(ex);
    }
    print(stage);
    return stage;
  }
}
