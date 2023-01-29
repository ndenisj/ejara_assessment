// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ejara_assessment/presentations/login/views/login.view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final _client = http.Client();
  final _baseUrl = "https://testbox-nellys-coin.ejaraapis.xyz/api/v1/";

  Future<Map<String, dynamic>> test_post({
    required Map<String, dynamic> body,
    required Map<String, dynamic> clientID,
    required Map<String, dynamic> endpoint,
    required Map<String, dynamic> apiKey,
  }) async {
    try {
      var response =
          await _client.post(_buildUrl(endpoint['key']), body: {}, headers: {
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
  }) async {
    try {
      var response =
          await _client.post(_buildUrl(endpoint), body: body, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "api-key": apiKey,
        "client-id": clientID,
      });
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
    required BuildContext context,
    required String token,
    required String apiKey,
    required String clientID,
  }) async {
    try {
      var response = await _client.get(_buildUrl(endpoint), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "api-key": apiKey,
        "client-id": clientID,
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 401) {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
          (route) => false,
        );
        return _handleError("Bad response format 👎");
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

  Uri _buildUrl(String endpoint) {
    return Uri.parse(_baseUrl + endpoint);
  }

  Map<String, dynamic> _handleError(String errorMessage) {
    return {
      'reqMessage': errorMessage,
      'reqSuccess': false,
      'reqResponse': {},
    };
  }
}
