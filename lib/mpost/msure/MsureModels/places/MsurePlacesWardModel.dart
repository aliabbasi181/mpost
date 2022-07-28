class MsurePlacesWardModel {
  SubCounty? subCounty;
  List<Wards>? wards;

  MsurePlacesWardModel({this.subCounty, this.wards});

  MsurePlacesWardModel.fromJson(Map<String, dynamic> json) {
    subCounty = json['sub_county'] != null
        ? new SubCounty.fromJson(json['sub_county'])
        : null;
    if (json['wards'] != null) {
      wards = <Wards>[];
      json['wards'].forEach((v) {
        wards!.add(new Wards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subCounty != null) {
      data['sub_county'] = this.subCounty!.toJson();
    }
    if (this.wards != null) {
      data['wards'] = this.wards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCounty {
  int? id;
  String? name;
  String? code;
  String? countyId;
  String? createdAt;
  String? updatedAt;

  SubCounty(
      {this.id,
      this.name,
      this.code,
      this.countyId,
      this.createdAt,
      this.updatedAt});

  SubCounty.fromJson(Map<String, dynamic> json) {
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

class Wards {
  int? id;
  String? name;
  String? subCountyId;
  String? createdAt;
  String? updatedAt;

  Wards({this.id, this.name, this.subCountyId, this.createdAt, this.updatedAt});

  Wards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subCountyId = json['sub_county_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sub_county_id'] = this.subCountyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
