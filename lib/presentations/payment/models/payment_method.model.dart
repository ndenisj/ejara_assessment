import 'dart:convert';

PaymentMethodModel paymentMethodModelFromMap(String str) =>
    PaymentMethodModel.fromMap(json.decode(str));

String paymentMethodModelToMap(PaymentMethodModel data) =>
    json.encode(data.toMap());

class PaymentMethodModel {
  PaymentMethodModel({
    this.responseCode,
    this.message,
    this.data,
  });

  String? responseCode;
  String? message;
  List<PaymentMethod>? data;

  PaymentMethodModel copyWith({
    String? responseCode,
    String? message,
    List<PaymentMethod>? data,
  }) =>
      PaymentMethodModel(
        responseCode: responseCode ?? this.responseCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PaymentMethodModel.fromMap(Map<String, dynamic> json) =>
      PaymentMethodModel(
        responseCode: json["responseCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PaymentMethod>.from(
                json["data"]!.map((x) => PaymentMethod.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "responseCode": responseCode,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class PaymentMethod {
  PaymentMethod({
    this.id,
    this.code,
    this.titleEn,
    this.titleFr,
    this.descriptionEn,
    this.minAmount,
    this.descriptionFr,
    this.iconImage,
  });

  int? id;
  String? code;
  String? titleEn;
  String? titleFr;
  String? descriptionEn;
  int? minAmount;
  String? descriptionFr;
  String? iconImage;

  PaymentMethod copyWith({
    int? id,
    String? code,
    String? titleEn,
    String? titleFr,
    String? descriptionEn,
    int? minAmount,
    String? descriptionFr,
    String? iconImage,
  }) =>
      PaymentMethod(
        id: id ?? this.id,
        code: code ?? this.code,
        titleEn: titleEn ?? this.titleEn,
        titleFr: titleFr ?? this.titleFr,
        descriptionEn: descriptionEn ?? this.descriptionEn,
        minAmount: minAmount ?? this.minAmount,
        descriptionFr: descriptionFr ?? this.descriptionFr,
        iconImage: iconImage ?? this.iconImage,
      );

  factory PaymentMethod.fromMap(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        code: json["code"],
        titleEn: json["title_en"],
        titleFr: json["title_fr"],
        descriptionEn: json["description_en"],
        minAmount: json["min_amount"],
        descriptionFr: json["description_fr"],
        iconImage: json["icon_image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "title_en": titleEn,
        "title_fr": titleFr,
        "description_en": descriptionEn,
        "min_amount": minAmount,
        "description_fr": descriptionFr,
        "icon_image": iconImage,
      };
}
