import 'package:ejara_assessment/presentations/login/controller/login.controller.dart';
import 'package:ejara_assessment/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkService extends Mock implements NetworkService {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late LoginController loginController;
  late MockNetworkService mockNetworkService;
  late MockBuildContext mockBuildContext;

  setUp(() {
    mockBuildContext = MockBuildContext();
    mockNetworkService = MockNetworkService();
    loginController = LoginController(mockNetworkService);
  });

  group("login", () {
    void arrangeNetworkServiceRequest(Map<String, dynamic> loginResponse) {
      when(() => mockNetworkService.test_post(
            body: {"key": "value"},
            apiKey: {"key": "value"},
            clientID: {"key": "value"},
            endpoint: {"key": "value"},
          )).thenAnswer(
        (_) async => Future.value(loginResponse),
      );
    }

    test(
      "Initial values are correct",
      () {
        expect(loginController.obscureText, true);
      },
    );

    test("network post method was called once", () async {
      final loginResponse = {
        'reqSuccess': true,
        'reqMessage': 'successful',
        'reqResponse': {},
      };

      arrangeNetworkServiceRequest(loginResponse);

      await loginController.login(mockBuildContext); // Act

      verify(() => mockNetworkService.test_post(
            body: {"key": "value"},
            apiKey: {"key": "value"},
            clientID: {"key": "value"},
            endpoint: {"key": "value"},
          )).called(1);
    });

    test('login function should return successful login response', () async {
      final loginResponse = {
        'reqSuccess': true,
        'reqMessage': 'successful',
        'reqResponse': {},
      };

      arrangeNetworkServiceRequest(loginResponse);

      final response = await loginController.login(mockBuildContext);

      expect(response['reqSuccess'], true);
      verify(() => mockNetworkService.test_post(
            body: {"key": "value"},
            apiKey: {"key": "value"},
            clientID: {"key": "value"},
            endpoint: {"key": "value"},
          ));
    });

    test('login function should failed', () async {
      final loginResponse = {
        'reqSuccess': false,
        'reqMessage': 'successful',
        'reqResponse': {},
      };

      arrangeNetworkServiceRequest(loginResponse);

      final response = await loginController.login(mockBuildContext);

      expect(response['reqSuccess'], false);
      verify(() => mockNetworkService.test_post(
            body: {"key": "value"},
            apiKey: {"key": "value"},
            clientID: {"key": "value"},
            endpoint: {"key": "value"},
          ));
    });

    test(
      "texteditingcontroller have value when login is clicked",
      () async {
        loginController.usernameCtrl.text = 'testuser';
        loginController.passwordCtrl.text = 'testpassword';

        final loginResponse = {
          'reqSuccess': false,
          'reqMessage': 'successful',
          'reqResponse': {},
        };

        final person = MockNetworkService();
        when(() {
          return person.post(
              body: 'body',
              endpoint: 'endpoint',
              apiKey: 'apiKey',
              clientID: 'clientID');
        }).thenAnswer((_) async => Future.value({}));

        arrangeNetworkServiceRequest(loginResponse);

        await loginController.login(mockBuildContext);

        expect(loginController.usernameCtrl.text, 'testuser');
        expect(loginController.passwordCtrl.text, 'testpassword');
      },
    );
  });
}
