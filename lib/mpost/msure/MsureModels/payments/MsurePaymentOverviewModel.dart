class MsurePaymentOverviewModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? merchantRequestID;
  String? checkoutRequestID;
  String? responseCode;
  String? responseDescription;
  String? customerMessage;
  String? amount;
  String? phoneNumber;
  String? policyGuid;
  String? transactionDate;
  String? mpesaReceiptNumber;
  String? status;
  String? userId;

  MsurePaymentOverviewModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.merchantRequestID,
      this.checkoutRequestID,
      this.responseCode,
      this.responseDescription,
      this.customerMessage,
      this.amount,
      this.phoneNumber,
      this.policyGuid,
      this.transactionDate,
      this.mpesaReceiptNumber,
      this.status,
      this.userId});

  MsurePaymentOverviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    merchantRequestID = json['MerchantRequestID'];
    checkoutRequestID = json['CheckoutRequestID'];
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    customerMessage = json['CustomerMessage'];
    amount = json['Amount'];
    phoneNumber = json['PhoneNumber'];
    policyGuid = json['PolicyGuid'];
    transactionDate = json['TransactionDate'];
    mpesaReceiptNumber = json['MpesaReceiptNumber'];
    status = json['Status'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['MerchantRequestID'] = this.merchantRequestID;
    data['CheckoutRequestID'] = this.checkoutRequestID;
    data['ResponseCode'] = this.responseCode;
    data['ResponseDescription'] = this.responseDescription;
    data['CustomerMessage'] = this.customerMessage;
    data['Amount'] = this.amount;
    data['PhoneNumber'] = this.phoneNumber;
    data['PolicyGuid'] = this.policyGuid;
    data['TransactionDate'] = this.transactionDate;
    data['MpesaReceiptNumber'] = this.mpesaReceiptNumber;
    data['Status'] = this.status;
    data['UserId'] = this.userId;
    return data;
  }
}
