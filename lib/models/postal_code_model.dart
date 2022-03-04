class PostalCodeModel {
  int? id;
  String? postalCode;
  String? name;
  String? town;
  String? county;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  PostalCodeModel(
      {this.id,
      this.postalCode,
      this.name,
      this.town,
      this.county,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PostalCodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postalCode = json['postal_code'];
    name = json['name'];
    town = json['town'];
    county = json['county'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['postal_code'] = this.postalCode;
    data['name'] = this.name;
    data['town'] = this.town;
    data['county'] = this.county;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
