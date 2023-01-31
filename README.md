# Ejara assessment

Fluter accessment.

- Developed with flutter 3.3.10 stable.
- Does not need any special configuration to run except `flutter pub get` to get the packages

TEST:
It has Unit test and Integration/widget test

- Use vscode test feature to run the integration test. This can be found in `integration_test/app_test.dart` directory and unit test can be found in `test` directory (run the test individually with easy) or use the command `flutter test integration_test/app_test.dart` for integration test and `flutter test` for unit test

##### NOTE

- Before running the Login controller Unit test update the code in `lib/presentations/login/controller/login.controller.dart` by uncommenting line 28-37 (calls `test_post()` in `NetworkService` class to perform a test post request) and comment out line 39-48 (calls `post()` in `NetworkService` class to persorm a real post request to the endpoint)
- Before running the Payment_method controller Unit test update the code in `lib/presentations/payment/controller/payment_method.controller.dart` by uncommenting line 48 (calls `test_get()` in `NetworkService` class to perform a test get request) and comment out line 51-62 (calls `get()` in `NetworkService` class to persorm a real get request to the endpoint)
