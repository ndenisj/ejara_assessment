import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.responsecode,
    this.message,
    this.token,
    this.refreshToken,
    this.expiresIn,
    this.refreshTokenExpiresIn,
    this.tokenType,
    this.user,
  });

  String? responsecode;
  String? message;
  String? token;
  String? refreshToken;
  int? expiresIn;
  int? refreshTokenExpiresIn;
  String? tokenType;
  User? user;

  UserModel copyWith({
    String? responsecode,
    String? message,
    String? token,
    String? refreshToken,
    int? expiresIn,
    int? refreshTokenExpiresIn,
    String? tokenType,
    User? user,
  }) =>
      UserModel(
        responsecode: responsecode ?? this.responsecode,
        message: message ?? this.message,
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
        expiresIn: expiresIn ?? this.expiresIn,
        refreshTokenExpiresIn:
            refreshTokenExpiresIn ?? this.refreshTokenExpiresIn,
        tokenType: tokenType ?? this.tokenType,
        user: user ?? this.user,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        responsecode: json["responsecode"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refresh_token"],
        expiresIn: json["expires_in"],
        refreshTokenExpiresIn: json["refresh_token_expires_in"],
        tokenType: json["token_type"],
        user: json["data"] == null ? null : User.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "responsecode": responsecode,
        "message": message,
        "token": token,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "refresh_token_expires_in": refreshTokenExpiresIn,
        "token_type": tokenType,
        "data": user?.toMap(),
      };
}

class User {
  User({
    this.userId,
    this.username,
    this.phoneNumber,
    this.phoneId,
    this.referalCode,
    this.firstName,
    this.lastName,
    this.gender,
    this.canBuy,
    this.canSell,
    this.canExchange,
    this.isPartner,
    this.isAgent,
    this.emailAddress,
    this.dateOfBirth,
    this.preferredLanguage,
    this.fiatCurrencyId,
    this.fiatCurrencyCode,
    this.fiatCurrencyName,
    this.inAppNotifications,
    this.appScreenshots,
    this.details,
    this.accountStatus,
    this.accountIsVerified,
    this.emailVerified,
    this.phoneVerified,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.customerType,
    this.kycLevelNumber,
    this.kycLevelName,
    this.loyaltyLevel,
    this.countryId,
    this.countryCode,
    this.countryNameEn,
    this.countryNameFr,
    this.countryDialCode,
    this.shortCountryCode,
    this.friendsReferred,
    this.referralRewardsCount,
    this.amountTransacted,
    this.balanceInDefaultFiat,
    this.balanceInCustomerFiat,
    this.godFather,
    this.dailyLimit,
    this.weeklyLimit,
    this.monthlyLimit,
    this.dailyLimitRemainingAmount,
    this.weeklyLimitRemainingAmount,
    this.monthlyLimitRemainingAmount,
    this.wallets,
    this.roles,
    this.permissions,
    this.countryStatus,
    this.countryCanSell,
    this.countryCanBuy,
    this.countryCanDeposit,
    this.countryCanWithdraw,
    this.countryCanSend,
    this.countryCanExchange,
    this.countryCanAccessLite,
  });

  int? userId;
  String? username;
  dynamic phoneNumber;
  String? phoneId;
  String? referalCode;
  String? firstName;
  String? lastName;
  String? gender;
  bool? canBuy;
  bool? canSell;
  bool? canExchange;
  bool? isPartner;
  bool? isAgent;
  String? emailAddress;
  dynamic dateOfBirth;
  String? preferredLanguage;
  int? fiatCurrencyId;
  String? fiatCurrencyCode;
  dynamic fiatCurrencyName;
  bool? inAppNotifications;
  bool? appScreenshots;
  dynamic details;
  String? accountStatus;
  bool? accountIsVerified;
  bool? emailVerified;
  bool? phoneVerified;
  int? emailVerifiedAt;
  dynamic phoneVerifiedAt;
  String? customerType;
  int? kycLevelNumber;
  String? kycLevelName;
  int? loyaltyLevel;
  int? countryId;
  String? countryCode;
  String? countryNameEn;
  String? countryNameFr;
  String? countryDialCode;
  String? shortCountryCode;
  int? friendsReferred;
  int? referralRewardsCount;
  int? amountTransacted;
  int? balanceInDefaultFiat;
  int? balanceInCustomerFiat;
  String? godFather;
  int? dailyLimit;
  int? weeklyLimit;
  int? monthlyLimit;
  int? dailyLimitRemainingAmount;
  int? weeklyLimitRemainingAmount;
  int? monthlyLimitRemainingAmount;
  List<dynamic>? wallets;
  List<Permission>? roles;
  List<Permission>? permissions;
  String? countryStatus;
  bool? countryCanSell;
  bool? countryCanBuy;
  bool? countryCanDeposit;
  bool? countryCanWithdraw;
  bool? countryCanSend;
  bool? countryCanExchange;
  bool? countryCanAccessLite;

  User copyWith({
    int? userId,
    String? username,
    dynamic phoneNumber,
    String? phoneId,
    String? referalCode,
    String? firstName,
    String? lastName,
    String? gender,
    bool? canBuy,
    bool? canSell,
    bool? canExchange,
    bool? isPartner,
    bool? isAgent,
    String? emailAddress,
    dynamic dateOfBirth,
    String? preferredLanguage,
    int? fiatCurrencyId,
    String? fiatCurrencyCode,
    dynamic fiatCurrencyName,
    bool? inAppNotifications,
    bool? appScreenshots,
    dynamic details,
    String? accountStatus,
    bool? accountIsVerified,
    bool? emailVerified,
    bool? phoneVerified,
    int? emailVerifiedAt,
    dynamic phoneVerifiedAt,
    String? customerType,
    int? kycLevelNumber,
    String? kycLevelName,
    int? loyaltyLevel,
    int? countryId,
    String? countryCode,
    String? countryNameEn,
    String? countryNameFr,
    String? countryDialCode,
    String? shortCountryCode,
    int? friendsReferred,
    int? referralRewardsCount,
    int? amountTransacted,
    int? balanceInDefaultFiat,
    int? balanceInCustomerFiat,
    String? godFather,
    int? dailyLimit,
    int? weeklyLimit,
    int? monthlyLimit,
    int? dailyLimitRemainingAmount,
    int? weeklyLimitRemainingAmount,
    int? monthlyLimitRemainingAmount,
    List<dynamic>? wallets,
    List<Permission>? roles,
    List<Permission>? permissions,
    String? countryStatus,
    bool? countryCanSell,
    bool? countryCanBuy,
    bool? countryCanDeposit,
    bool? countryCanWithdraw,
    bool? countryCanSend,
    bool? countryCanExchange,
    bool? countryCanAccessLite,
  }) =>
      User(
        userId: userId ?? this.userId,
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        phoneId: phoneId ?? this.phoneId,
        referalCode: referalCode ?? this.referalCode,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        canBuy: canBuy ?? this.canBuy,
        canSell: canSell ?? this.canSell,
        canExchange: canExchange ?? this.canExchange,
        isPartner: isPartner ?? this.isPartner,
        isAgent: isAgent ?? this.isAgent,
        emailAddress: emailAddress ?? this.emailAddress,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        fiatCurrencyId: fiatCurrencyId ?? this.fiatCurrencyId,
        fiatCurrencyCode: fiatCurrencyCode ?? this.fiatCurrencyCode,
        fiatCurrencyName: fiatCurrencyName ?? this.fiatCurrencyName,
        inAppNotifications: inAppNotifications ?? this.inAppNotifications,
        appScreenshots: appScreenshots ?? this.appScreenshots,
        details: details ?? this.details,
        accountStatus: accountStatus ?? this.accountStatus,
        accountIsVerified: accountIsVerified ?? this.accountIsVerified,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneVerified: phoneVerified ?? this.phoneVerified,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
        customerType: customerType ?? this.customerType,
        kycLevelNumber: kycLevelNumber ?? this.kycLevelNumber,
        kycLevelName: kycLevelName ?? this.kycLevelName,
        loyaltyLevel: loyaltyLevel ?? this.loyaltyLevel,
        countryId: countryId ?? this.countryId,
        countryCode: countryCode ?? this.countryCode,
        countryNameEn: countryNameEn ?? this.countryNameEn,
        countryNameFr: countryNameFr ?? this.countryNameFr,
        countryDialCode: countryDialCode ?? this.countryDialCode,
        shortCountryCode: shortCountryCode ?? this.shortCountryCode,
        friendsReferred: friendsReferred ?? this.friendsReferred,
        referralRewardsCount: referralRewardsCount ?? this.referralRewardsCount,
        amountTransacted: amountTransacted ?? this.amountTransacted,
        balanceInDefaultFiat: balanceInDefaultFiat ?? this.balanceInDefaultFiat,
        balanceInCustomerFiat:
            balanceInCustomerFiat ?? this.balanceInCustomerFiat,
        godFather: godFather ?? this.godFather,
        dailyLimit: dailyLimit ?? this.dailyLimit,
        weeklyLimit: weeklyLimit ?? this.weeklyLimit,
        monthlyLimit: monthlyLimit ?? this.monthlyLimit,
        dailyLimitRemainingAmount:
            dailyLimitRemainingAmount ?? this.dailyLimitRemainingAmount,
        weeklyLimitRemainingAmount:
            weeklyLimitRemainingAmount ?? this.weeklyLimitRemainingAmount,
        monthlyLimitRemainingAmount:
            monthlyLimitRemainingAmount ?? this.monthlyLimitRemainingAmount,
        wallets: wallets ?? this.wallets,
        roles: roles ?? this.roles,
        permissions: permissions ?? this.permissions,
        countryStatus: countryStatus ?? this.countryStatus,
        countryCanSell: countryCanSell ?? this.countryCanSell,
        countryCanBuy: countryCanBuy ?? this.countryCanBuy,
        countryCanDeposit: countryCanDeposit ?? this.countryCanDeposit,
        countryCanWithdraw: countryCanWithdraw ?? this.countryCanWithdraw,
        countryCanSend: countryCanSend ?? this.countryCanSend,
        countryCanExchange: countryCanExchange ?? this.countryCanExchange,
        countryCanAccessLite: countryCanAccessLite ?? this.countryCanAccessLite,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json["userId"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        phoneId: json["phone_id"],
        referalCode: json["referal_code"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        canBuy: json["canBuy"],
        canSell: json["canSell"],
        canExchange: json["canExchange"],
        isPartner: json["isPartner"],
        isAgent: json["isAgent"],
        emailAddress: json["email_address"],
        dateOfBirth: json["date_of_birth"],
        preferredLanguage: json["preferred_language"],
        fiatCurrencyId: json["fiat_currency_id"],
        fiatCurrencyCode: json["fiat_currency_code"],
        fiatCurrencyName: json["fiat_currency_name"],
        inAppNotifications: json["in_app_notifications"],
        appScreenshots: json["app_screenshots"],
        details: json["details"],
        accountStatus: json["account_status"],
        accountIsVerified: json["account_is_verified"],
        emailVerified: json["email_verified"],
        phoneVerified: json["phone_verified"],
        emailVerifiedAt: json["emailVerifiedAt"],
        phoneVerifiedAt: json["phoneVerifiedAt"],
        customerType: json["customer_type"],
        kycLevelNumber: json["kyc_level_number"],
        kycLevelName: json["kyc_level_name"],
        loyaltyLevel: json["loyalty_level"],
        countryId: json["country_id"],
        countryCode: json["country_code"],
        countryNameEn: json["country_name_en"],
        countryNameFr: json["country_name_fr"],
        countryDialCode: json["country_dial_code"],
        shortCountryCode: json["short_country_code"],
        friendsReferred: json["friends_referred"],
        referralRewardsCount: json["referral_rewards_count"],
        amountTransacted: json["amount_transacted"],
        balanceInDefaultFiat: json["balance_in_default_fiat"],
        balanceInCustomerFiat: json["balance_in_customer_fiat"],
        godFather: json["godFather"],
        dailyLimit: json["dailyLimit"],
        weeklyLimit: json["weeklyLimit"],
        monthlyLimit: json["monthlyLimit"],
        dailyLimitRemainingAmount: json["daily_limit_remaining_amount"],
        weeklyLimitRemainingAmount: json["weekly_limit_remaining_amount"],
        monthlyLimitRemainingAmount: json["monthly_limit_remaining_amount"],
        wallets: json["wallets"] == null
            ? []
            : List<dynamic>.from(json["wallets"]!.map((x) => x)),
        roles: json["roles"] == null
            ? []
            : List<Permission>.from(
                json["roles"]!.map((x) => Permission.fromMap(x))),
        permissions: json["permissions"] == null
            ? []
            : List<Permission>.from(
                json["permissions"]!.map((x) => Permission.fromMap(x))),
        countryStatus: json["country_status"],
        countryCanSell: json["country_can_sell"],
        countryCanBuy: json["country_can_buy"],
        countryCanDeposit: json["country_can_deposit"],
        countryCanWithdraw: json["country_can_withdraw"],
        countryCanSend: json["country_can_send"],
        countryCanExchange: json["country_can_exchange"],
        countryCanAccessLite: json["country_can_access_lite"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "username": username,
        "phone_number": phoneNumber,
        "phone_id": phoneId,
        "referal_code": referalCode,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "canBuy": canBuy,
        "canSell": canSell,
        "canExchange": canExchange,
        "isPartner": isPartner,
        "isAgent": isAgent,
        "email_address": emailAddress,
        "date_of_birth": dateOfBirth,
        "preferred_language": preferredLanguage,
        "fiat_currency_id": fiatCurrencyId,
        "fiat_currency_code": fiatCurrencyCode,
        "fiat_currency_name": fiatCurrencyName,
        "in_app_notifications": inAppNotifications,
        "app_screenshots": appScreenshots,
        "details": details,
        "account_status": accountStatus,
        "account_is_verified": accountIsVerified,
        "email_verified": emailVerified,
        "phone_verified": phoneVerified,
        "emailVerifiedAt": emailVerifiedAt,
        "phoneVerifiedAt": phoneVerifiedAt,
        "customer_type": customerType,
        "kyc_level_number": kycLevelNumber,
        "kyc_level_name": kycLevelName,
        "loyalty_level": loyaltyLevel,
        "country_id": countryId,
        "country_code": countryCode,
        "country_name_en": countryNameEn,
        "country_name_fr": countryNameFr,
        "country_dial_code": countryDialCode,
        "short_country_code": shortCountryCode,
        "friends_referred": friendsReferred,
        "referral_rewards_count": referralRewardsCount,
        "amount_transacted": amountTransacted,
        "balance_in_default_fiat": balanceInDefaultFiat,
        "balance_in_customer_fiat": balanceInCustomerFiat,
        "godFather": godFather,
        "dailyLimit": dailyLimit,
        "weeklyLimit": weeklyLimit,
        "monthlyLimit": monthlyLimit,
        "daily_limit_remaining_amount": dailyLimitRemainingAmount,
        "weekly_limit_remaining_amount": weeklyLimitRemainingAmount,
        "monthly_limit_remaining_amount": monthlyLimitRemainingAmount,
        "wallets":
            wallets == null ? [] : List<dynamic>.from(wallets!.map((x) => x)),
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toMap())),
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x.toMap())),
        "country_status": countryStatus,
        "country_can_sell": countryCanSell,
        "country_can_buy": countryCanBuy,
        "country_can_deposit": countryCanDeposit,
        "country_can_withdraw": countryCanWithdraw,
        "country_can_send": countryCanSend,
        "country_can_exchange": countryCanExchange,
        "country_can_access_lite": countryCanAccessLite,
      };

  String fullname() {
    if (firstName!.isNotEmpty || lastName!.isNotEmpty) {
      return "$firstName $lastName";
    }
    return username!;
  }
}

class Permission {
  Permission({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  Permission copyWith({
    int? id,
    String? name,
    String? description,
  }) =>
      Permission(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Permission.fromMap(Map<String, dynamic> json) => Permission(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
