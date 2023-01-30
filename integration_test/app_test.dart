// ignore_for_file: prefer_const_constructors
import 'package:ejara_assessment/app/app.dart';
import 'package:ejara_assessment/presentations/payment/views/choose_payment_method.view.dart';
import 'package:ejara_assessment/presentations/payment/views/new_wallet.view.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ejara_assessment/presentations/login/views/login.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

void main() {
// ensure the integration_test package is initialized and ready
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  setUp(() {});

  group('end-to-end test', () {
    login_flow(WidgetTester tester) async {
      await tester.pumpWidget(EjaraApp());
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const ValueKey('username')), 'ejaraTests');

      await tester.enterText(
          find.byKey(const ValueKey('password')), 'CmKVGexi%REJjn!u65BI7PlR5');

      await tester.tap(find.byKey(Key('loginBtn')));

      await addDelay(15000);

      await tester.pumpAndSettle();

      tester.printToConsole('Login successful');

      // navigate to next screen from login
      expect(find.byType(LoginView), findsNothing);
      expect(find.byType(ChoosePaymentMethodView), findsOneWidget);

      expect(find.text('Choose a payment method'), findsOneWidget);
    }

    testWidgets('Authentication Testing', (WidgetTester tester) async {
      await login_flow(tester);
    });

    testWidgets(
        'Fetch payment types, display bottomsheet and navigate to new wallet screen',
        (WidgetTester tester) async {
      await login_flow(tester);

      await addDelay(15000);

      await tester.pumpAndSettle(); // Wait for loading to complete

      expect(find.byKey(Key('paymentMethodKey0')), findsOneWidget);

      await tester.tap(find.byKey(Key('paymentMethodKey0')));

      await tester.pumpAndSettle();

      expect(find.byKey(Key('paymentTypesBSheet')), findsOneWidget);

      // navigate to new wallet screen
      await tester.tap(find.byKey(Key('addWalletKey')));

      await addDelay(15000);

      expect(find.byType(ChoosePaymentMethodView), findsNothing);
      expect(find.byType(NewWalletView), findsOneWidget);

      expect(find.byKey(Key('closeWalletScreen')), findsOneWidget);

      // navigate back from new wallet screen
      await tester.tap(find.byKey(Key('closeWalletScreen')));

      await addDelay(15000);

      expect(find.byType(NewWalletView), findsNothing);
      expect(find.byType(ChoosePaymentMethodView), findsOneWidget);

      tester.printToConsole('Completed');
    });
  });
}
