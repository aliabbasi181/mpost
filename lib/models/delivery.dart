class DeliveryModel {
  String? id;
  String? userId;
  String? paymentRequestId;
  String? statusId;
  String? pickupAddressId;
  String? deliveryAddressId;
  String? estimatedDistance;
  String? actualDistance;
  String? estimatedDuration;
  String? deliveryCost;
  String? recipientName;
  String? recipientMobile;
  String? itemType;
  String? note;
  String? instructions;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  PaymentRequest? paymentRequest;
  PickupAddress? pickupAddress;
  DeliveryAddress? deliveryAddress;

  DeliveryModel(
      {this.id,
      this.userId,
      this.paymentRequestId,
      this.statusId,
      this.pickupAddressId,
      this.deliveryAddressId,
      this.estimatedDistance,
      this.actualDistance,
      this.estimatedDuration,
      this.deliveryCost,
      this.recipientName,
      this.recipientMobile,
      this.itemType,
      this.note,
      this.instructions,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.paymentRequest,
      this.pickupAddress,
      this.deliveryAddress});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userId = json['user_id'].toString();
    paymentRequestId = json['payment_request_id'].toString();
    statusId = json['status_id'].toString();
    pickupAddressId = json['pickup_address_id'].toString();
    deliveryAddressId = json['delivery_address_id'].toString();
    estimatedDistance = json['estimated_distance'].toString();
    actualDistance = json['actual_distance'].toString();
    estimatedDuration = json['estimated_duration'].toString();
    deliveryCost = json['delivery_cost'].toString();
    recipientName = json['recipient_name'].toString();
    recipientMobile = json['recipient_mobile'].toString();
    itemType = json['item_type'].toString();
    note = json['note'].toString();
    instructions = json['instructions'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
    paymentRequest = json['payment_request'] != null
        ? new PaymentRequest.fromJson(json['payment_request'])
        : null;
    pickupAddress = json['pickup_address'] != null
        ? new PickupAddress.fromJson(json['pickup_address'])
        : null;
    deliveryAddress = json['delivery_address'] != null
        ? new DeliveryAddress.fromJson(json['delivery_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['payment_request_id'] = this.paymentRequestId;
    data['status_id'] = this.statusId;
    data['pickup_address_id'] = this.pickupAddressId;
    data['delivery_address_id'] = this.deliveryAddressId;
    data['estimated_distance'] = this.estimatedDistance;
    data['actual_distance'] = this.actualDistance;
    data['estimated_duration'] = this.estimatedDuration;
    data['delivery_cost'] = this.deliveryCost;
    data['recipient_name'] = this.recipientName;
    data['recipient_mobile'] = this.recipientMobile;
    data['item_type'] = this.itemType;
    data['note'] = this.note;
    data['instructions'] = this.instructions;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.paymentRequest != null) {
      data['payment_request'] = this.paymentRequest!.toJson();
    }
    if (this.pickupAddress != null) {
      data['pickup_address'] = this.pickupAddress!.toJson();
    }
    if (this.deliveryAddress != null) {
      data['delivery_address'] = this.deliveryAddress!.toJson();
    }
    return data;
  }
}

class PaymentRequest {
  String? id;
  String? userId;
  String? statusId;
  String? clientId;
  String? account;
  String? amount;
  String? totalPaid;
  String? balance;
  String? mobile;
  String? reference;
  String? transID;
  String? merchantRequestID;
  String? firstName;
  String? middleName;
  String? lastName;
  String? transTime;
  String? checkoutRequestID;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  PaymentRequest(
      {this.id,
      this.userId,
      this.statusId,
      this.clientId,
      this.account,
      this.amount,
      this.totalPaid,
      this.balance,
      this.mobile,
      this.reference,
      this.transID,
      this.merchantRequestID,
      this.firstName,
      this.middleName,
      this.lastName,
      this.transTime,
      this.checkoutRequestID,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userId = json['user_id'].toString();
    statusId = json['status_id'].toString();
    clientId = json['client_id'].toString();
    account = json['account'].toString();
    amount = json['amount'].toString();
    totalPaid = json['total_paid'].toString();
    balance = json['balance'].toString();
    mobile = json['mobile'].toString();
    reference = json['reference'].toString();
    transID = json['TransID'].toString();
    merchantRequestID = json['MerchantRequestID'].toString();
    firstName = json['FirstName'].toString();
    middleName = json['MiddleName'].toString();
    lastName = json['LastName'].toString();
    transTime = json['TransTime'].toString();
    checkoutRequestID = json['CheckoutRequestID'].toString();
    description = json['description'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status_id'] = this.statusId;
    data['client_id'] = this.clientId;
    data['account'] = this.account;
    data['amount'] = this.amount;
    data['total_paid'] = this.totalPaid;
    data['balance'] = this.balance;
    data['mobile'] = this.mobile;
    data['reference'] = this.reference;
    data['TransID'] = this.transID;
    data['MerchantRequestID'] = this.merchantRequestID;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['TransTime'] = this.transTime;
    data['CheckoutRequestID'] = this.checkoutRequestID;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class PickupAddress {
  String? id;
  String? userId;
  String? latitude;
  String? longitude;
  String? address;
  String? detailedAddress;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  PickupAddress(
      {this.id,
      this.userId,
      this.latitude,
      this.longitude,
      this.address,
      this.detailedAddress,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PickupAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userId = json['user_id'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    address = json['address'].toString();
    detailedAddress = json['detailed_address'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['detailed_address'] = this.detailedAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class DeliveryAddress {
  String? id;
  String? userId;
  String? latitude;
  String? longitude;
  String? address;
  String? detailedAddress;
  String? recipientName;
  String? recipientMobile;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  DeliveryAddress(
      {this.id,
      this.userId,
      this.latitude,
      this.longitude,
      this.address,
      this.detailedAddress,
      this.recipientName,
      this.recipientMobile,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userId = json['user_id'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    address = json['address'].toString();
    detailedAddress = json['detailed_address'].toString();
    recipientName = json['recipient_name'].toString();
    recipientMobile = json['recipient_mobile'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['detailed_address'] = this.detailedAddress;
    data['recipient_name'] = this.recipientName;
    data['recipient_mobile'] = this.recipientMobile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
