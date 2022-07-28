class MsureUserServiceAccountModel {
  String? insuranceAmount;
  String? dailyContribution;
  BillingCycleAccount? billingCycleAccount;
  List<SettledDays>? settledDays;

  MsureUserServiceAccountModel(
      {this.insuranceAmount,
      this.dailyContribution,
      this.billingCycleAccount,
      this.settledDays});

  MsureUserServiceAccountModel.fromJson(Map<String, dynamic> json) {
    insuranceAmount = json['insurance_amount'];
    dailyContribution = json['daily_contribution'];
    billingCycleAccount = json['billingCycleAccount'] != null
        ? new BillingCycleAccount.fromJson(json['billingCycleAccount'])
        : null;
    if (json['settledDays'] != null) {
      settledDays = <SettledDays>[];
      json['settledDays'].forEach((v) {
        settledDays!.add(new SettledDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insurance_amount'] = this.insuranceAmount;
    data['daily_contribution'] = this.dailyContribution;
    if (this.billingCycleAccount != null) {
      data['billingCycleAccount'] = this.billingCycleAccount!.toJson();
    }
    if (this.settledDays != null) {
      data['settledDays'] = this.settledDays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillingCycleAccount {
  String? accountId;
  String? userId;
  String? amount;
  String? createdAt;

  BillingCycleAccount(
      {this.accountId, this.userId, this.amount, this.createdAt});

  BillingCycleAccount.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    userId = json['user_id'];
    amount = json['amount'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class SettledDays {
  String? accountId;
  String? userId;
  String? date;
  String? reference;
  String? createdAt;

  SettledDays(
      {this.accountId, this.userId, this.date, this.reference, this.createdAt});

  SettledDays.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    userId = json['user_id'];
    date = json['date'];
    reference = json['reference'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['reference'] = this.reference;
    data['created_at'] = this.createdAt;
    return data;
  }
}
