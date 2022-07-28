class MsureProductModel {
  String? guid;
  String? partnerGuid;
  String? name;
  String? type;
  String? code;
  bool? active;
  String? coverType;
  int? minimumAge;
  int? maximumAge;
  int? waitingPeriodDays;
  int? debitGraceDays;
  List<Premiums>? premiums;
  List<FixedIndemnities>? fixedIndemnities;
  List<VariableIndemnities>? variableIndemnities;

  MsureProductModel(
      {this.guid,
      this.partnerGuid,
      this.name,
      this.type,
      this.code,
      this.active,
      this.coverType,
      this.minimumAge,
      this.maximumAge,
      this.waitingPeriodDays,
      this.debitGraceDays,
      this.premiums,
      this.fixedIndemnities,
      this.variableIndemnities});

  MsureProductModel.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    partnerGuid = json['partnerGuid'];
    name = json['name'];
    type = json['type'];
    code = json['code'];
    active = json['active'];
    coverType = json['cover_type'];
    minimumAge = json['minimum_age'];
    maximumAge = json['maximum_age'];
    waitingPeriodDays = json['waiting_period_days'];
    debitGraceDays = json['debit_grace_days'];
    if (json['premiums'] != null) {
      premiums = <Premiums>[];
      json['premiums'].forEach((v) {
        premiums!.add(new Premiums.fromJson(v));
      });
    }
    if (json['fixed_indemnities'] != null) {
      fixedIndemnities = <FixedIndemnities>[];
      json['fixed_indemnities'].forEach((v) {
        fixedIndemnities!.add(new FixedIndemnities.fromJson(v));
      });
    }
    if (json['variable_indemnities'] != null) {
      variableIndemnities = <VariableIndemnities>[];
      json['variable_indemnities'].forEach((v) {
        variableIndemnities!.add(new VariableIndemnities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['partnerGuid'] = this.partnerGuid;
    data['name'] = this.name;
    data['type'] = this.type;
    data['code'] = this.code;
    data['active'] = this.active;
    data['cover_type'] = this.coverType;
    data['minimum_age'] = this.minimumAge;
    data['maximum_age'] = this.maximumAge;
    data['waiting_period_days'] = this.waitingPeriodDays;
    data['debit_grace_days'] = this.debitGraceDays;
    if (this.premiums != null) {
      data['premiums'] = this.premiums!.map((v) => v.toJson()).toList();
    }
    if (this.fixedIndemnities != null) {
      data['fixed_indemnities'] =
          this.fixedIndemnities!.map((v) => v.toJson()).toList();
    }
    if (this.variableIndemnities != null) {
      data['variable_indemnities'] =
          this.variableIndemnities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Premiums {
  String? guid;
  String? granularity;
  int? cardinality;
  bool? active;
  String? productGuid;
  int? amountInCents;
  String? paymentMethod;

  Premiums(
      {this.guid,
      this.granularity,
      this.cardinality,
      this.active,
      this.productGuid,
      this.amountInCents,
      this.paymentMethod});

  Premiums.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    granularity = json['granularity'];
    cardinality = json['cardinality'];
    active = json['active'];
    productGuid = json['product_guid'];
    amountInCents = json['amount_in_cents'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['granularity'] = this.granularity;
    data['cardinality'] = this.cardinality;
    data['active'] = this.active;
    data['product_guid'] = this.productGuid;
    data['amount_in_cents'] = this.amountInCents;
    data['payment_method'] = this.paymentMethod;
    return data;
  }
}

class FixedIndemnities {
  String? guid;
  String? name;
  String? productGuid;
  int? amountBenefit;
  int? principalMaxAgeLimit;
  int? spouseMaxAgeLimit;
  int? spouseMinAgeLimit;
  int? childMaxAgeLimit;

  FixedIndemnities(
      {this.guid,
      this.name,
      this.productGuid,
      this.amountBenefit,
      this.principalMaxAgeLimit,
      this.spouseMaxAgeLimit,
      this.spouseMinAgeLimit,
      this.childMaxAgeLimit});

  FixedIndemnities.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    productGuid = json['product_guid'];
    amountBenefit = json['amount_benefit'];
    principalMaxAgeLimit = json['principal_max_age_limit'];
    spouseMaxAgeLimit = json['spouse_max_age_limit'];
    spouseMinAgeLimit = json['spouse_min_age_limit'];
    childMaxAgeLimit = json['child_max_age_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['product_guid'] = this.productGuid;
    data['amount_benefit'] = this.amountBenefit;
    data['principal_max_age_limit'] = this.principalMaxAgeLimit;
    data['spouse_max_age_limit'] = this.spouseMaxAgeLimit;
    data['spouse_min_age_limit'] = this.spouseMinAgeLimit;
    data['child_max_age_limit'] = this.childMaxAgeLimit;
    return data;
  }
}

class VariableIndemnities {
  String? guid;
  String? name;
  int? amount;
  String? productGuid;
  String? amountGranularity;
  int? maximumPeriod;
  String? maximumPeriodGranularity;
  String? maximumPeriodApplicableGranularity;
  int? minimumPeriod;
  String? minimumPeriodGranularity;

  VariableIndemnities(
      {this.guid,
      this.name,
      this.amount,
      this.productGuid,
      this.amountGranularity,
      this.maximumPeriod,
      this.maximumPeriodGranularity,
      this.maximumPeriodApplicableGranularity,
      this.minimumPeriod,
      this.minimumPeriodGranularity});

  VariableIndemnities.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    amount = json['amount'];
    productGuid = json['product_guid'];
    amountGranularity = json['amount_granularity'];
    maximumPeriod = json['maximum_period'];
    maximumPeriodGranularity = json['maximum_period_granularity'];
    maximumPeriodApplicableGranularity =
        json['maximum_period_applicable_granularity'];
    minimumPeriod = json['minimum_period'];
    minimumPeriodGranularity = json['minimum_period_granularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['product_guid'] = this.productGuid;
    data['amount_granularity'] = this.amountGranularity;
    data['maximum_period'] = this.maximumPeriod;
    data['maximum_period_granularity'] = this.maximumPeriodGranularity;
    data['maximum_period_applicable_granularity'] =
        this.maximumPeriodApplicableGranularity;
    data['minimum_period'] = this.minimumPeriod;
    data['minimum_period_granularity'] = this.minimumPeriodGranularity;
    return data;
  }
}
