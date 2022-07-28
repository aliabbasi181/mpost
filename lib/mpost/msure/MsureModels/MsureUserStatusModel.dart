class MsureUserStatusModel {
  bool? ussdWhitelistActive;
  String? guid;
  String? msisdn;
  String? nationalId;
  String? fullName;
  String? displayLanguage;
  String? language;
  String? dateOfBirth;
  bool? agent;
  bool? acceptAgentLoyalty;
  String? paymentMethod;
  bool? registered;
  String? experiment;
  int? upsellNightCover;
  String? upsellCoverEnd;
  int? monthlyMobileMoneyPremium;
  int? monthlyAirtimePremium;
  Policies? policies;
  List<Premiums>? premiums;
  String? displayDateFormatPattern;
  String? callCentreNumber;
  String? serviceName;
  bool? checkAgeRange;
  String? ussdShortcode;
  String? whatsAppNumber;
  int? minimumAge;
  int? maximumAge;
  List<Products>? products;
  int? generalWaitingPeriod;
  String? currentMonth;
  String? previousMonth;
  Upsell? upsell;
  String? message;

  MsureUserStatusModel(
      {this.ussdWhitelistActive,
      this.guid,
      this.msisdn,
      this.nationalId,
      this.fullName,
      this.displayLanguage,
      this.language,
      this.dateOfBirth,
      this.agent,
      this.acceptAgentLoyalty,
      this.paymentMethod,
      this.registered,
      this.experiment,
      this.upsellNightCover,
      this.upsellCoverEnd,
      this.monthlyMobileMoneyPremium,
      this.monthlyAirtimePremium,
      this.policies,
      this.premiums,
      this.displayDateFormatPattern,
      this.callCentreNumber,
      this.serviceName,
      this.checkAgeRange,
      this.ussdShortcode,
      this.whatsAppNumber,
      this.minimumAge,
      this.maximumAge,
      this.products,
      this.generalWaitingPeriod,
      this.currentMonth,
      this.previousMonth,
      this.upsell,
      this.message});

  MsureUserStatusModel.fromJson(Map<String, dynamic> json) {
    ussdWhitelistActive = json['ussd_whitelist_active'];
    guid = json['guid'];
    msisdn = json['msisdn'];
    nationalId = json['national_id'];
    fullName = json['full_name'];
    displayLanguage = json['display_language'];
    language = json['language'];
    dateOfBirth = json['date_of_birth'];
    agent = json['agent'];
    acceptAgentLoyalty = json['accept_agent_loyalty'];
    paymentMethod = json['payment_method'];
    registered = json['registered'];
    experiment = json['experiment'];
    upsellNightCover = json['upsell_night_cover'];
    upsellCoverEnd = json['upsell_cover_end'];
    monthlyMobileMoneyPremium = json['monthly_mobile_money_premium'];
    monthlyAirtimePremium = json['monthly_airtime_premium'];
    policies = json['policies'] != null
        ? new Policies.fromJson(json['policies'])
        : null;
    if (json['premiums'] != null) {
      premiums = <Premiums>[];
      json['premiums'].forEach((v) {
        premiums!.add(new Premiums.fromJson(v));
      });
    }
    displayDateFormatPattern = json['display_date_format_pattern'];
    callCentreNumber = json['call_centre_number'];
    serviceName = json['service_name'];
    checkAgeRange = json['check_age_range'];
    ussdShortcode = json['ussd_shortcode'];
    whatsAppNumber = json['whats_app_number'];
    minimumAge = json['minimum_age'];
    maximumAge = json['maximum_age'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    generalWaitingPeriod = json['general_waiting_period'];
    currentMonth = json['current_month'];
    previousMonth = json['previous_month'];
    upsell =
        json['upsell'] != null ? new Upsell.fromJson(json['upsell']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ussd_whitelist_active'] = this.ussdWhitelistActive;
    data['guid'] = this.guid;
    data['msisdn'] = this.msisdn;
    data['national_id'] = this.nationalId;
    data['full_name'] = this.fullName;
    data['display_language'] = this.displayLanguage;
    data['language'] = this.language;
    data['date_of_birth'] = this.dateOfBirth;
    data['agent'] = this.agent;
    data['accept_agent_loyalty'] = this.acceptAgentLoyalty;
    data['payment_method'] = this.paymentMethod;
    data['registered'] = this.registered;
    data['experiment'] = this.experiment;
    data['upsell_night_cover'] = this.upsellNightCover;
    data['upsell_cover_end'] = this.upsellCoverEnd;
    data['monthly_mobile_money_premium'] = this.monthlyMobileMoneyPremium;
    data['monthly_airtime_premium'] = this.monthlyAirtimePremium;
    if (this.policies != null) {
      data['policies'] = this.policies!.toJson();
    }
    if (this.premiums != null) {
      data['premiums'] = this.premiums!.map((v) => v.toJson()).toList();
    }
    data['display_date_format_pattern'] = this.displayDateFormatPattern;
    data['call_centre_number'] = this.callCentreNumber;
    data['service_name'] = this.serviceName;
    data['check_age_range'] = this.checkAgeRange;
    data['ussd_shortcode'] = this.ussdShortcode;
    data['whats_app_number'] = this.whatsAppNumber;
    data['minimum_age'] = this.minimumAge;
    data['maximum_age'] = this.maximumAge;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['general_waiting_period'] = this.generalWaitingPeriod;
    data['current_month'] = this.currentMonth;
    data['previous_month'] = this.previousMonth;
    if (this.upsell != null) {
      data['upsell'] = this.upsell!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Policies {
  List<MshuaIndividual>? mshuaIndividual;

  Policies({this.mshuaIndividual});

  Policies.fromJson(Map<String, dynamic> json) {
    if (json['mshua_individual'] != null) {
      mshuaIndividual = <MshuaIndividual>[];
      json['mshua_individual'].forEach((v) {
        mshuaIndividual!.add(new MshuaIndividual.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mshuaIndividual != null) {
      data['mshua_individual'] =
          this.mshuaIndividual!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MshuaIndividual {
  String? guid;
  String? channel;
  String? status;
  bool? active;
  bool? debit;
  String? customerGuid;
  String? policyNumber;
  String? customerFullName;
  String? customerMsisdn;
  String? productGuid;
  String? partnerGuid;
  String? productName;
  String? productType;
  String? productCoverType;
  int? productVariableBenefit;
  int? productFixedBenefit;
  bool? productCashbackEnabled;
  String? startDate;
  String? endDate;
  bool? hasCoolOff;
  String? paymentMethod;
  int? balanceInCents;

  MshuaIndividual(
      {this.guid,
      this.channel,
      this.status,
      this.active,
      this.debit,
      this.customerGuid,
      this.policyNumber,
      this.customerFullName,
      this.customerMsisdn,
      this.productGuid,
      this.partnerGuid,
      this.productName,
      this.productType,
      this.productCoverType,
      this.productVariableBenefit,
      this.productFixedBenefit,
      this.productCashbackEnabled,
      this.startDate,
      this.endDate,
      this.hasCoolOff,
      this.paymentMethod,
      this.balanceInCents});

  MshuaIndividual.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    channel = json['channel'];
    status = json['status'];
    active = json['active'];
    debit = json['debit'];
    customerGuid = json['customer_guid'];
    policyNumber = json['policy_number'];
    customerFullName = json['customer_full_name'];
    customerMsisdn = json['customer_msisdn'];
    productGuid = json['product_guid'];
    partnerGuid = json['partner_guid'];
    productName = json['product_name'];
    productType = json['product_type'];
    productCoverType = json['product_cover_type'];
    productVariableBenefit = json['product_variable_benefit'];
    productFixedBenefit = json['product_fixed_benefit'];
    productCashbackEnabled = json['product_cashback_enabled'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    hasCoolOff = json['has_cool_off'];
    paymentMethod = json['payment_method'];
    balanceInCents = json['balance_in_cents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['channel'] = this.channel;
    data['status'] = this.status;
    data['active'] = this.active;
    data['debit'] = this.debit;
    data['customer_guid'] = this.customerGuid;
    data['policy_number'] = this.policyNumber;
    data['customer_full_name'] = this.customerFullName;
    data['customer_msisdn'] = this.customerMsisdn;
    data['product_guid'] = this.productGuid;
    data['partner_guid'] = this.partnerGuid;
    data['product_name'] = this.productName;
    data['product_type'] = this.productType;
    data['product_cover_type'] = this.productCoverType;
    data['product_variable_benefit'] = this.productVariableBenefit;
    data['product_fixed_benefit'] = this.productFixedBenefit;
    data['product_cashback_enabled'] = this.productCashbackEnabled;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['has_cool_off'] = this.hasCoolOff;
    data['payment_method'] = this.paymentMethod;
    data['balance_in_cents'] = this.balanceInCents;
    return data;
  }
}

class Premiums {
  String? guid;
  bool? valid;
  bool? active;
  String? channel;
  String? policyGuid;
  String? productName;
  int? amountInCents;
  String? startDate;
  String? endDate;
  String? mnoReference;
  String? subChannel;
  String? createdAt;

  Premiums(
      {this.guid,
      this.valid,
      this.active,
      this.channel,
      this.policyGuid,
      this.productName,
      this.amountInCents,
      this.startDate,
      this.endDate,
      this.mnoReference,
      this.subChannel,
      this.createdAt});

  Premiums.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    valid = json['valid'];
    active = json['active'];
    channel = json['channel'];
    policyGuid = json['policy_guid'];
    productName = json['product_name'];
    amountInCents = json['amount_in_cents'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    mnoReference = json['mno_reference'];
    subChannel = json['sub_channel'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['valid'] = this.valid;
    data['active'] = this.active;
    data['channel'] = this.channel;
    data['policy_guid'] = this.policyGuid;
    data['product_name'] = this.productName;
    data['amount_in_cents'] = this.amountInCents;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['mno_reference'] = this.mnoReference;
    data['sub_channel'] = this.subChannel;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Products {
  String? guid;
  String? name;
  String? type;
  String? code;
  String? coverType;
  int? waitingPeriodDays;
  List<Premiums>? premiums;

  Products(
      {this.guid,
      this.name,
      this.type,
      this.code,
      this.coverType,
      this.waitingPeriodDays,
      this.premiums});

  Products.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    type = json['type'];
    code = json['code'];
    coverType = json['cover_type'];
    waitingPeriodDays = json['waiting_period_days'];
    if (json['premiums'] != null) {
      premiums = <Premiums>[];
      json['premiums'].forEach((v) {
        premiums!.add(new Premiums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['type'] = this.type;
    data['code'] = this.code;
    data['cover_type'] = this.coverType;
    data['waiting_period_days'] = this.waitingPeriodDays;
    if (this.premiums != null) {
      data['premiums'] = this.premiums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Upsell {
  int? nightCover;
  int? minimumNights;
  int? maximumNights;
  int? fixedBenefitAmount;
  int? waitingPeriodDays;
  int? minimumAge;
  int? maximumAge;
  bool? cashBackEnabled;

  Upsell(
      {this.nightCover,
      this.minimumNights,
      this.maximumNights,
      this.fixedBenefitAmount,
      this.waitingPeriodDays,
      this.minimumAge,
      this.maximumAge,
      this.cashBackEnabled});

  Upsell.fromJson(Map<String, dynamic> json) {
    nightCover = json['night_cover'];
    minimumNights = json['minimum_nights'];
    maximumNights = json['maximum_nights'];
    fixedBenefitAmount = json['fixed_benefit_amount'];
    waitingPeriodDays = json['waiting_period_days'];
    minimumAge = json['minimum_age'];
    maximumAge = json['maximum_age'];
    cashBackEnabled = json['cash_back_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['night_cover'] = this.nightCover;
    data['minimum_nights'] = this.minimumNights;
    data['maximum_nights'] = this.maximumNights;
    data['fixed_benefit_amount'] = this.fixedBenefitAmount;
    data['waiting_period_days'] = this.waitingPeriodDays;
    data['minimum_age'] = this.minimumAge;
    data['maximum_age'] = this.maximumAge;
    data['cash_back_enabled'] = this.cashBackEnabled;
    return data;
  }
}
