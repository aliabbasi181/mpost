class MonthPaymentModel {
  int? year;
  String? month;
  int? amount;

  MonthPaymentModel({this.year, this.month, this.amount});

  MonthPaymentModel.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['amount'] = this.amount;
    return data;
  }
}
