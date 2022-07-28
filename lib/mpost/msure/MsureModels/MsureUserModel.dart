class MsureUserModel {
  String? userId;
  String? customerId;
  String? stageId;
  String? email;
  String? phone;
  String? name;
  String? surname;
  String? displayLanguage;
  String? nationalId;
  String? beneficiaryPhone;
  String? beneficiaryName;
  String? dateOfBirth;
  String? registrationChannel;
  String? location;
  String? ntsaNumber;
  String? branchCode;
  String? image;
  String? guid;
  String? createdAt;
  String? updatedAt;
  Stage? stage;

  MsureUserModel(
      {this.userId,
      this.customerId,
      this.stageId,
      this.email,
      this.phone,
      this.name,
      this.surname,
      this.displayLanguage,
      this.nationalId,
      this.beneficiaryPhone,
      this.beneficiaryName,
      this.dateOfBirth,
      this.registrationChannel,
      this.location,
      this.ntsaNumber,
      this.branchCode,
      this.image,
      this.guid,
      this.createdAt,
      this.updatedAt,
      this.stage});

  MsureUserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    customerId = json['customer_id'];
    stageId = json['stage_id'];
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    surname = json['surname'];
    displayLanguage = json['display_language'];
    nationalId = json['national_id'];
    beneficiaryPhone = json['beneficiary_phone'];
    beneficiaryName = json['beneficiary_name'];
    dateOfBirth = json['date_of_birth'];
    registrationChannel = json['registration_channel'];
    location = json['location'];
    ntsaNumber = json['ntsa_number'];
    branchCode = json['branch_code'];
    image = json['image'];
    guid = json['guid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stage = json['stage'] != null ? new Stage.fromJson(json['stage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    data['stage_id'] = this.stageId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['display_language'] = this.displayLanguage;
    data['national_id'] = this.nationalId;
    data['beneficiary_phone'] = this.beneficiaryPhone;
    data['beneficiary_name'] = this.beneficiaryName;
    data['date_of_birth'] = this.dateOfBirth;
    data['registration_channel'] = this.registrationChannel;
    data['location'] = this.location;
    data['ntsa_number'] = this.ntsaNumber;
    data['branch_code'] = this.branchCode;
    data['image'] = this.image;
    data['guid'] = this.guid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.stage != null) {
      data['stage'] = this.stage!.toJson();
    }
    return data;
  }
}

class Stage {
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

  Stage(
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

  Stage.fromJson(Map<String, dynamic> json) {
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
