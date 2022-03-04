class VirtualAddressModel {
  int? id;
  String? isPersonal;
  String? userId;
  String? address;
  String? postalCodeId;
  String? statusId;
  String? paymentRequestId;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Status? status;
  PostalCode? postalCode;

  VirtualAddressModel(
      {this.id,
      this.isPersonal,
      this.userId,
      this.address,
      this.postalCodeId,
      this.statusId,
      this.paymentRequestId,
      this.expiresAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.postalCode});

  VirtualAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isPersonal = json['is_personal'].toString();
    userId = json['user_id'].toString();
    address = json['address'].toString();
    postalCodeId = json['postal_code_id'].toString();
    statusId = json['status_id'].toString();
    paymentRequestId = json['payment_request_id'].toString();
    expiresAt = json['expires_at'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    postalCode = json['postal_code'] != null
        ? new PostalCode.fromJson(json['postal_code'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_personal'] = this.isPersonal;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['postal_code_id'] = this.postalCodeId;
    data['status_id'] = this.statusId;
    data['payment_request_id'] = this.paymentRequestId;
    data['expires_at'] = this.expiresAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.postalCode != null) {
      data['postal_code'] = this.postalCode!.toJson();
    }
    return data;
  }
}

class Status {
  int? id;
  String? name;
  String? colorCode;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Status(
      {this.id,
      this.name,
      this.colorCode,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    colorCode = json['color_code'].toString();
    description = json['description'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color_code'] = this.colorCode;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class PostalCode {
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

  PostalCode(
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

  PostalCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postalCode = json['postal_code'].toString();
    name = json['name'].toString();
    town = json['town'].toString();
    county = json['county'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
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
