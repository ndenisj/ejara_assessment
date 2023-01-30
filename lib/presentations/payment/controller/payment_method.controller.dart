import 'dart:developer';

import 'package:ejara_assessment/presentations/payment/models/payment_method.model.dart';
import 'package:ejara_assessment/presentations/payment/models/payment_type.model.dart';
import 'package:ejara_assessment/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/controllers/user.controller.dart';
import '../../../utils/constants.dart';

class PaymentMethodController extends ChangeNotifier {
  final NetworkService _networkService;
  PaymentMethodController(this._networkService);

// Payment method
  PaymentMethodModel _paymentMethodModel = PaymentMethodModel();
  List<PaymentMethod> _paymentMethods = [];
  List<PaymentMethod> get paymentMethods => _paymentMethods;
  PaymentMethod _selectedPayment = PaymentMethod();
  PaymentMethod get selectedPayment => _selectedPayment;
  set selectedPayment(PaymentMethod method) {
    _selectedPayment = method;
    notifyListeners();
  }

  // Payment method type
  PaymentTypeModel _paymentTypeModel = PaymentTypeModel();
  List<PaymentType> _paymentTypes = [];
  List<PaymentType> get paymentTypes => _paymentTypes;
  PaymentType _selectedPaymentType = PaymentType();
  PaymentType get selectedPaymentType => _selectedPaymentType;
  set selectedPaymentType(PaymentType type) {
    _selectedPaymentType = type;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isTypeLoading = false;
  bool get isTypeLoading => _isTypeLoading;

  Future<void> getPaymentList(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

// For Unit Test
    // final userCtrl = Provider.of<UserController>(context, listen: false);
    // var response = await _networkService.test_get();

// Normal
    final userCtrl = Provider.of<UserController>(context, listen: false);
    var response = await _networkService.get(
      apiKey: kAPIKEY,
      clientID: kCLIENTID,
      endpoint:
          'v2/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy',
      appVersion: kAPPVERSION,
      appPlatform: kAPPPLATFORM,
      client: kCLIENT,
      lang: kLANGUAGE,
      token: userCtrl.userModel.token!,
    );

    if (response['reqSuccess']) {
      var serverResponse = response['reqResponse'];

      if (serverResponse['responseCode'] != null &&
          serverResponse['responseCode'] ==
              'get_payment_types_per_country_ok') {
        _paymentMethodModel = PaymentMethodModel.fromMap(serverResponse);
        _paymentMethods = _paymentMethodModel.data!;
      }
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getPaymentTypeList(BuildContext context) async {
    Future.delayed(Duration.zero, () async {
      _isTypeLoading = true;
      notifyListeners();
    });

    final userCtrl = Provider.of<UserController>(context, listen: false);
    var response = await _networkService.get(
      apiKey: kAPIKEY,
      clientID: kCLIENTID,
      endpoint:
          'v1/customer/payment-settings-per-type?paymentTypeId=${_selectedPayment.id}&countryCode=CM&transactionType=buy',
      appVersion: kAPPVERSION,
      appPlatform: kAPPPLATFORM,
      client: kCLIENT,
      lang: kLANGUAGE,
      token: userCtrl.userModel.token!,
    );

    if (response['reqSuccess']) {
      var serverResponse = response['reqResponse'];

      if (serverResponse['responseCode'] != null &&
          serverResponse['responseCode'] == 'payment_settings_per_type_ok') {
        _paymentTypeModel = PaymentTypeModel.fromMap(serverResponse);
        _paymentTypes = _paymentTypeModel.data!;
      }
    }

    Future.delayed(Duration.zero, () async {
      _isTypeLoading = false;
      notifyListeners();
    });
  }
}
