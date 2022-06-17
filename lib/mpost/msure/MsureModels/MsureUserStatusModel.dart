class MsureUserStatusModel {
  bool? ussdWhitelistActive;
  String? ussdWhitelist;
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
  List<Premiums>? premiums;
  String? debitOrders;
  String? displayDateFormatPattern;
  String? callCentreNumber;
  String? serviceName;
  bool? checkAgeRange;
  String? languages;
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
      this.ussdWhitelist,
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
      this.premiums,
      this.debitOrders,
      this.displayDateFormatPattern,
      this.callCentreNumber,
      this.serviceName,
      this.checkAgeRange,
      this.languages,
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
    ussdWhitelist = json['ussd_whitelist'];
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
    if (json['premiums'] != null) {
      premiums = <Premiums>[];
      json['premiums'].forEach((v) {
        premiums!.add(new Premiums.fromJson(v));
      });
    }
    debitOrders = json['debitOrders'];
    displayDateFormatPattern = json['display_date_format_pattern'];
    callCentreNumber = json['call_centre_number'];
    serviceName = json['service_name'];
    checkAgeRange = json['check_age_range'];
    languages = json['languages'];
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
    data['ussd_whitelist'] = this.ussdWhitelist;
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
    if (this.premiums != null) {
      data['premiums'] = this.premiums!.map((v) => v.toJson()).toList();
    }
    data['debitOrders'] = this.debitOrders;
    data['display_date_format_pattern'] = this.displayDateFormatPattern;
    data['call_centre_number'] = this.callCentreNumber;
    data['service_name'] = this.serviceName;
    data['check_age_range'] = this.checkAgeRange;
    data['languages'] = this.languages;
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

class Premiums {
  String? guid;
  String? granularity;
  int? cardinality;
  String? productGuid;
  int? amountInCents;
  String? paymentMethod;

  Premiums(
      {this.guid,
      this.granularity,
      this.cardinality,
      this.productGuid,
      this.amountInCents,
      this.paymentMethod});

  Premiums.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    granularity = json['granularity'];
    cardinality = json['cardinality'];
    productGuid = json['product_guid'];
    amountInCents = json['amount_in_cents'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['granularity'] = this.granularity;
    data['cardinality'] = this.cardinality;
    data['product_guid'] = this.productGuid;
    data['amount_in_cents'] = this.amountInCents;
    data['payment_method'] = this.paymentMethod;
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
  Null? eligibilityThreshold;
  int? waitingPeriodDays;
  int? minimumAge;
  int? maximumAge;
  bool? cashBackEnabled;

  Upsell(
      {this.nightCover,
      this.minimumNights,
      this.maximumNights,
      this.fixedBenefitAmount,
      this.eligibilityThreshold,
      this.waitingPeriodDays,
      this.minimumAge,
      this.maximumAge,
      this.cashBackEnabled});

  Upsell.fromJson(Map<String, dynamic> json) {
    nightCover = json['night_cover'];
    minimumNights = json['minimum_nights'];
    maximumNights = json['maximum_nights'];
    fixedBenefitAmount = json['fixed_benefit_amount'];
    eligibilityThreshold = json['eligibility_threshold'];
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
    data['eligibility_threshold'] = this.eligibilityThreshold;
    data['waiting_period_days'] = this.waitingPeriodDays;
    data['minimum_age'] = this.minimumAge;
    data['maximum_age'] = this.maximumAge;
    data['cash_back_enabled'] = this.cashBackEnabled;
    return data;
  }
}
