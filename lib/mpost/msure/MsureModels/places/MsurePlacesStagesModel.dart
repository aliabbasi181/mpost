class MsurePlacesStagesModel {
  Ward? ward;
  List<Stages>? stages;

  MsurePlacesStagesModel({this.ward, this.stages});

  MsurePlacesStagesModel.fromJson(Map<String, dynamic> json) {
    ward = json['ward'] != null ? new Ward.fromJson(json['ward']) : null;
    if (json['stages'] != null) {
      stages = <Stages>[];
      json['stages'].forEach((v) {
        stages!.add(new Stages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ward != null) {
      data['ward'] = this.ward!.toJson();
    }
    if (this.stages != null) {
      data['stages'] = this.stages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ward {
  int? id;
  String? name;
  String? subCountyId;
  String? createdAt;
  String? updatedAt;

  Ward({this.id, this.name, this.subCountyId, this.createdAt, this.updatedAt});

  Ward.fromJson(Map<String, dynamic> json) {
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

class Stages {
  int? id;
  String? name;
  String? wardId;
  String? latitude;
  String? longitude;
  String? leaderName;
  String? leaderPhone;
  String? dailyContribution;
  String? createdAt;
  String? updatedAt;

  Stages(
      {this.id,
      this.name,
      this.wardId,
      this.latitude,
      this.longitude,
      this.leaderName,
      this.leaderPhone,
      this.dailyContribution,
      this.createdAt,
      this.updatedAt});

  Stages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    wardId = json['ward_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    leaderName = json['leader_name'];
    leaderPhone = json['leader_phone'];
    dailyContribution = json['daily_contribution'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ward_id'] = this.wardId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['leader_name'] = this.leaderName;
    data['leader_phone'] = this.leaderPhone;
    data['daily_contribution'] = this.dailyContribution;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
