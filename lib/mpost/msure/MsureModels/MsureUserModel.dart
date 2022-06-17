class MsureUserModel {
  String? email;
  String? phone;
  String? userId;
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

  MsureUserModel(
      {this.email,
      this.phone,
      this.userId,
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
      this.createdAt});

  MsureUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'].toString();
    phone = json['phone'].toString();
    userId = json['user_id'].toString();
    name = json['name'].toString();
    surname = json['surname'].toString();
    displayLanguage = json['display_language'].toString();
    nationalId = json['national_id'].toString();
    beneficiaryPhone = json['beneficiary_phone'].toString();
    beneficiaryName = json['beneficiary_name'].toString();
    dateOfBirth = json['date_of_birth'].toString();
    registrationChannel = json['registration_channel'].toString();
    location = json['location'].toString();
    ntsaNumber = json['ntsa_number'].toString();
    branchCode = json['branch_code'].toString();
    image = json['image'].toString();
    guid = json['guid'].toString();
    createdAt = json['created_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['user_id'] = this.userId;
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
    return data;
  }
}
