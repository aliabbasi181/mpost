class DayPaymentModel {
  int? year;
  String? month;
  int? date;
  String? day;
  int? amount;

  DayPaymentModel({this.year, this.month, this.date, this.day, this.amount});

  DayPaymentModel.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    date = json['date'];
    day = json['day'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['date'] = this.date;
    data['day'] = this.day;
    data['amount'] = this.amount;
    return data;
  }
}
