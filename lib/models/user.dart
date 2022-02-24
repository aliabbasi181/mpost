import 'package:mpost/constants.dart';
import 'package:mpost/services/utilities.dart';

class UserModel {
  int? id;
  String? userId;
  String? bearerToken;
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobile;
  String? email;
  String? isSuperuser;
  String? roleId;
  String? mobileVerifiedAt;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? fullName;
  List<Addresses>? addresses;

  UserModel(
      {this.id,
      this.userId,
      this.bearerToken,
      this.firstName,
      this.middleName,
      this.lastName,
      this.mobile,
      this.email,
      this.isSuperuser,
      this.roleId,
      this.mobileVerifiedAt,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.fullName,
      this.addresses});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = Utilities.generateKey();
    userId = json['id'].toString();
    bearerToken = Constants.token;
    firstName = json['first_name'].toString();
    middleName = json['middle_name'].toString();
    lastName = json['last_name'].toString();
    mobile = json['mobile'].toString();
    email = json['email'].toString();
    isSuperuser = json['is_superuser'].toString();
    roleId = json['role_id'].toString();
    mobileVerifiedAt = json['mobile_verified_at'].toString();
    emailVerifiedAt = json['email_verified_at'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    fullName = json['full_name'].toString();
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'bearer_token': bearerToken,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'mobile': mobile,
      'email': email,
      'is_superuser': isSuperuser,
      'role_id': roleId,
      'mobile_verified_at': mobileVerifiedAt,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'full_name': fullName,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['bearer_token'] = Constants.token;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['is_superuser'] = this.isSuperuser;
    data['role_id'] = this.roleId;
    data['mobile_verified_at'] = this.mobileVerifiedAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['full_name'] = this.fullName;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? id;
  String? addressId;
  bool? isPersonal;
  int? userId;
  String? address;
  int? postalCodeId;
  int? statusId;
  String? paymentRequestId;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  PostalCode? postalCode;
  Status? status;

  Addresses(
      {this.id,
      this.addressId,
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
      this.postalCode,
      this.status});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = Utilities.generateKey();
    addressId = json['id'].toString();
    isPersonal = json['is_personal'];
    userId = json['user_id'];
    address = json['address'].toString();
    postalCodeId = json['postal_code_id'];
    statusId = json['status_id'];
    paymentRequestId = json['payment_request_id'].toString();
    expiresAt = json['expires_at'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
    postalCode = json['postal_code'] != null
        ? new PostalCode.fromJson(json['postal_code'])
        : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_id'] = this.addressId;
    data['user_id'] = this.userId;
    data['is_personal'] = this.isPersonal;
    data['address'] = this.address;
    data['postal_code_id'] = this.postalCodeId;
    data['status_id'] = this.statusId;
    data['payment_request_id'] = this.paymentRequestId;
    data['expires_at'] = this.expiresAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.postalCode != null) {
      data['postal_code'] = this.postalCode!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
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
