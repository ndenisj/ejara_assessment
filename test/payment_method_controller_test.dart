import 'package:ejara_assessment/presentations/payment/controller/payment_method.controller.dart';
import 'package:ejara_assessment/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NetworkServiceMock extends Mock implements NetworkService {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late NetworkServiceMock networkServiceMock;
  late PaymentMethodController paymentMethodController;
  late MockBuildContext mockBuildContext;

  setUp(
    () {
      networkServiceMock = NetworkServiceMock();
      paymentMethodController = PaymentMethodController(networkServiceMock);
      mockBuildContext = MockBuildContext();
    },
  );

  group("description", () {
    test('getPaymentList should update paymentMethods and isLoading', () async {
      final mockNetworkService = NetworkServiceMock();
      when(() => mockNetworkService.get(
            apiKey: '',
            appPlatform: '',
            appVersion: '',
            client: '',
            clientID: '',
            endpoint: '',
            lang: '',
            token: '',
          )).thenAnswer((_) async => {
            'reqSuccess': true,
            'reqResponse': {
              'responseCode': 'get_payment_types_per_country_ok',
              'data': []
            }
          });

      // final paymentMethodController = PaymentMethodController(mockNetworkService);

      await paymentMethodController.getPaymentList(mockBuildContext);

      expect(paymentMethodController.paymentMethods, []);
      expect(paymentMethodController.isLoading, false);
    });
  });
}
