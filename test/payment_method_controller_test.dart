import 'package:ejara_assessment/presentations/payment/controller/payment_method.controller.dart';
import 'package:ejara_assessment/presentations/payment/models/payment_method.model.dart';
import 'package:ejara_assessment/services/network_service.dart';
import 'package:ejara_assessment/shared/controllers/user.controller.dart';
import 'package:ejara_assessment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockNetworkService extends Mock implements NetworkService {}

class MockUserController extends Mock implements UserController {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockNetworkService mockNetworkService;
  late PaymentMethodController paymentMethodController;
  late MockBuildContext mockBuildContext;
  MockUserController mockUserController;

  setUp(
    () {
      mockNetworkService = MockNetworkService();
      paymentMethodController = PaymentMethodController(mockNetworkService);
      mockBuildContext = MockBuildContext();
      mockUserController = MockUserController();
    },
  );

  group("getPaymentList", () {
    test('getPaymentList should update paymentMethods and isLoading', () async {
      when(() => mockNetworkService.test_get()).thenAnswer((_) async => {
            'reqSuccess': true,
            'reqResponse': {
              'responseCode': 'get_payment_types_per_country_ok',
              'data': []
            }
          });

      final future = paymentMethodController.getPaymentList(mockBuildContext);

      expect(paymentMethodController.isLoading, true);
      await future;
      expect(paymentMethodController.paymentMethods, []);
      expect(paymentMethodController.isLoading, false);
    });

    test(
        'getPaymentList should call networkService.get and return paymentMethods',
        () async {
      final paymentMethods = [
        PaymentMethod(id: 1, titleEn: 'Method 1'),
        PaymentMethod(id: 2, titleEn: 'Method 2'),
      ];
      final serverResponse = {
        'responseCode': 'get_payment_types_per_country_ok',
        'data': [
          {'id': 1, 'titleEn': 'Method 1'},
          {'id': 2, 'titleEn': 'Method 2'},
        ],
      };
      // when(() => mockNetworkService.get(
      //       apiKey: kAPIKEY,
      //       clientID: kCLIENTID,
      //       endpoint:
      //           'v2/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy',
      //       appVersion: kAPPVERSION,
      //       appPlatform: kAPPPLATFORM,
      //       client: kCLIENT,
      //       lang: kLANGUAGE,
      //       token: 'token',
      //     )).thenAnswer((_) async => {
      //       'reqSuccess': true,
      //       'reqResponse': serverResponse,
      //     });
      when(() => mockNetworkService.test_get()).thenAnswer((_) async => {
            'reqSuccess': true,
            'reqResponse': serverResponse,
          });
      mockUserController = MockUserController();
      when(() => mockUserController.userModel.token).thenReturn('token');

      // final context =
      //     Provider.of<BuildContext>(mockBuildContext, listen: false);
      await paymentMethodController.getPaymentList(mockBuildContext);

      expect(paymentMethodController.paymentMethods, paymentMethods);
    });
  });
}
