// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ejara_assessment/presentations/login/views/login.view.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final _client = http.Client();
  final _baseUrl = "https://testbox-nellys-coin.ejaraapis.xyz/api/";

  Future<Map<String, dynamic>> test_post({
    required Map<String, dynamic> body,
    required Map<String, dynamic> clientID,
    required Map<String, dynamic> endpoint,
    required Map<String, dynamic> apiKey,
    required Map<String, dynamic> appVersion,
    required Map<String, dynamic> appPlatform,
    required Map<String, dynamic> client,
    required Map<String, dynamic> lang,
  }) async {
    try {
      var response = await _client
          .post(_buildUrl(endpoint: endpoint['key']), body: {}, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "api-key": apiKey['key'],
        "client-id": clientID['key'],
      });

      if (response.statusCode == 401) {
        return _handleError("Unauthenticated 👎");
      }

      return {
        'reqMessage': 'successful',
        'reqSuccess': true,
        'reqResponse': jsonDecode(response.body),
      };
    } on SocketException {
      return _handleError('No Internet connection 😑');
    } on HttpException {
      return _handleError("Couldn't find the post 😱");
    } on FormatException {
      return _handleError("Bad response format 👎");
    }
  }

  Future<Map<String, dynamic>> post({
    required body,
    required String endpoint,
    required String apiKey,
    required String clientID,
    required String appVersion,
    required String appPlatform,
    required String client,
    required String lang,
    String token = "",
  }) async {
    try {
      var response = await _client.post(_buildUrl(endpoint: endpoint),
          body: body,
          headers: _httpHeader(
            apiKey: apiKey,
            client: client,
            clientID: clientID,
            appPlatform: appPlatform,
            appVersion: appVersion,
            lang: lang,
            token: token,
          ));
      var decodedRes = jsonDecode(response.body);

      if (response.statusCode >= 400) {
        return _handleError(decodedRes['message'].toString());
      }

      return {
        'reqMessage': 'successful',
        'reqSuccess': true,
        'reqResponse': jsonDecode(response.body),
      };
    } on SocketException {
      return _handleError('No Internet connection 😑');
    } on HttpException {
      return _handleError("Couldn't find the post 😱");
    } on FormatException {
      return _handleError("Bad response format 👎");
    }
  }

  Future<Map<String, dynamic>> test_get() async {
    try {
      var response = await _client.get(_buildUrl(endpoint: ''),
          headers: _httpHeader(
            apiKey: '',
            client: '',
            clientID: '',
            appPlatform: '',
            appVersion: '',
            lang: '',
          ));

      var decodedRes = jsonDecode(response.body);

      if (response.statusCode >= 400) {
        return _handleError(decodedRes['message'].toString());
      }

      return {
        'reqMessage': 'successful',
        'reqSuccess': true,
        'reqResponse': jsonDecode(response.body),
      };
    } on SocketException {
      return _handleError('No Internet connection 😑');
    } on HttpException {
      return _handleError("Couldn't find the post 😱");
    } on FormatException {
      return _handleError("Bad response format 👎");
    }
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    required String apiKey,
    required String clientID,
    required String appVersion,
    required String appPlatform,
    required String client,
    required String lang,
    String token = "",
  }) async {
    try {
      var response = await _client.get(_buildUrl(endpoint: endpoint),
          headers: _httpHeader(
            apiKey: apiKey,
            client: client,
            clientID: clientID,
            appPlatform: appPlatform,
            appVersion: appVersion,
            lang: lang,
            token: token,
          ));

      var decodedRes = jsonDecode(response.body);

      if (response.statusCode >= 400) {
        return _handleError(decodedRes['message'].toString());
      }

      return {
        'reqMessage': 'successful',
        'reqSuccess': true,
        'reqResponse': jsonDecode(response.body),
      };
    } on SocketException {
      return _handleError('No Internet connection 😑');
    } on HttpException {
      return _handleError("Couldn't find the post 😱");
    } on FormatException {
      return _handleError("Bad response format 👎");
    }
  }

  Uri _buildUrl({required String endpoint}) {
    return Uri.parse(_baseUrl + endpoint);
  }

  Map<String, dynamic> _handleError(String errorMessage) {
    return {
      'reqMessage': errorMessage,
      'reqSuccess': false,
      'reqResponse': {},
    };
  }

  Map<String, String> _httpHeader({
    required String apiKey,
    required String clientID,
    required String appVersion,
    required String appPlatform,
    required String client,
    required String lang,
    String token = "",
  }) {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "api-key": apiKey,
      "client-id": clientID,
      "app-version": appVersion,
      "app-platform": appPlatform,
      "client": client,
      "Accept-Language": lang,
      "Authorization": "Bearer $token",
    };
  }
}
