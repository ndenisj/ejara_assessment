import 'dart:convert';

PaymentTypeModel paymentTypeModelFromMap(String str) =>
    PaymentTypeModel.fromMap(json.decode(str));

String paymentTypeModelToMap(PaymentTypeModel data) =>
    json.encode(data.toMap());

class PaymentTypeModel {
  PaymentTypeModel({
    this.responseCode,
    this.message,
    this.data,
  });

  String? responseCode;
  String? message;
  List<PaymentType>? data;

  PaymentTypeModel copyWith({
    String? responseCode,
    String? message,
    List<PaymentType>? data,
  }) =>
      PaymentTypeModel(
        responseCode: responseCode ?? this.responseCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PaymentTypeModel.fromMap(Map<String, dynamic> json) =>
      PaymentTypeModel(
        responseCode: json["responseCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PaymentType>.from(
                json["data"]!.map((x) => PaymentType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "responseCode": responseCode,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class PaymentType {
  PaymentType({
    this.dateCreation,
    this.dateUpdate,
    this.id,
    this.identification,
    this.status,
    this.data,
    this.fullName,
    this.address,
    this.accountName,
    this.imageLink,
    this.lastUsed,
    this.customer,
    this.country,
    this.paymentType,
    this.paymentMode,
    this.transactionType,
  });

  int? dateCreation;
  int? dateUpdate;
  int? id;
  String? identification;
  String? status;
  String? data;
  String? fullName;
  String? address;
  dynamic accountName;
  dynamic imageLink;
  int? lastUsed;
  int? customer;
  int? country;
  int? paymentType;
  int? paymentMode;
  int? transactionType;

  PaymentType copyWith({
    int? dateCreation,
    int? dateUpdate,
    int? id,
    String? identification,
    String? status,
    String? data,
    String? fullName,
    String? address,
    dynamic accountName,
    dynamic imageLink,
    int? lastUsed,
    int? customer,
    int? country,
    int? paymentType,
    int? paymentMode,
    int? transactionType,
  }) =>
      PaymentType(
        dateCreation: dateCreation ?? this.dateCreation,
        dateUpdate: dateUpdate ?? this.dateUpdate,
        id: id ?? this.id,
        identification: identification ?? this.identification,
        status: status ?? this.status,
        data: data ?? this.data,
        fullName: fullName ?? this.fullName,
        address: address ?? this.address,
        accountName: accountName ?? this.accountName,
        imageLink: imageLink ?? this.imageLink,
        lastUsed: lastUsed ?? this.lastUsed,
        customer: customer ?? this.customer,
        country: country ?? this.country,
        paymentType: paymentType ?? this.paymentType,
        paymentMode: paymentMode ?? this.paymentMode,
        transactionType: transactionType ?? this.transactionType,
      );

  factory PaymentType.fromMap(Map<String, dynamic> json) => PaymentType(
        dateCreation: json["date_creation"],
        dateUpdate: json["date_update"],
        id: json["id"],
        identification: json["identification"],
        status: json["status"],
        data: json["data"],
        fullName: json["fullName"],
        address: json["address"],
        accountName: json["accountName"],
        imageLink: json["imageLink"],
        lastUsed: json["lastUsed"],
        customer: json["customer"],
        country: json["country"],
        paymentType: json["paymentType"],
        paymentMode: json["paymentMode"],
        transactionType: json["transactionType"],
      );

  Map<String, dynamic> toMap() => {
        "date_creation": dateCreation,
        "date_update": dateUpdate,
        "id": id,
        "identification": identification,
        "status": status,
        "data": data,
        "fullName": fullName,
        "address": address,
        "accountName": accountName,
        "imageLink": imageLink,
        "lastUsed": lastUsed,
        "customer": customer,
        "country": country,
        "paymentType": paymentType,
        "paymentMode": paymentMode,
        "transactionType": transactionType,
      };
}
