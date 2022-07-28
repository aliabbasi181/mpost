class MsurePlacesSub_CountryModel {
  County? county;
  List<SubCounties>? subCounties;

  MsurePlacesSub_CountryModel({this.county, this.subCounties});

  MsurePlacesSub_CountryModel.fromJson(Map<String, dynamic> json) {
    county =
        json['county'] != null ? new County.fromJson(json['county']) : null;
    if (json['sub_counties'] != null) {
      subCounties = <SubCounties>[];
      json['sub_counties'].forEach((v) {
        subCounties!.add(new SubCounties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.county != null) {
      data['county'] = this.county!.toJson();
    }
    if (this.subCounties != null) {
      data['sub_counties'] = this.subCounties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class County {
  int? id;
  String? name;
  String? code;
  String? regionId;
  String? createdAt;
  String? updatedAt;

  County(
      {this.id,
      this.name,
      this.code,
      this.regionId,
      this.createdAt,
      this.updatedAt});

  County.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    regionId = json['region_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['region_id'] = this.regionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SubCounties {
  int? id;
  String? name;
  String? code;
  String? countyId;
  String? createdAt;
  String? updatedAt;

  SubCounties(
      {this.id,
      this.name,
      this.code,
      this.countyId,
      this.createdAt,
      this.updatedAt});

  SubCounties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    countyId = json['county_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['county_id'] = this.countyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
