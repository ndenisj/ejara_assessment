import 'dart:convert';

String loginRequestToMap(LoginRequest data) => json.encode(data.toMap());

class LoginRequest {
  LoginRequest({
    required this.log,
    required this.password,
  });

  String log;
  String password;

  Map<String, dynamic> toMap() => {
        "log": log,
        "password": password,
      };
}
