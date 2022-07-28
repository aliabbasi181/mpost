class MsurePolicyStatusModel {
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

  MsurePolicyStatusModel(
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

  MsurePolicyStatusModel.fromJson(Map<String, dynamic> json) {
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
