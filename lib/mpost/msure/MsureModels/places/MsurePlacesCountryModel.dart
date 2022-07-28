class MsurePlacesCountryModel {
  Region? region;
  List<Counties>? counties;

  MsurePlacesCountryModel({this.region, this.counties});

  MsurePlacesCountryModel.fromJson(Map<String, dynamic> json) {
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
    if (json['counties'] != null) {
      counties = <Counties>[];
      json['counties'].forEach((v) {
        counties!.add(new Counties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.counties != null) {
      data['counties'] = this.counties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Region({this.id, this.name, this.createdAt, this.updatedAt});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Counties {
  int? id;
  String? name;
  String? code;
  String? regionId;
  String? createdAt;
  String? updatedAt;

  Counties(
      {this.id,
      this.name,
      this.code,
      this.regionId,
      this.createdAt,
      this.updatedAt});

  Counties.fromJson(Map<String, dynamic> json) {
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
