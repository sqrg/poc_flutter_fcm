import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:poc_flutter_fcm/constants.dart' as Constants;

import 'package:poc_flutter_fcm/locator.dart';

@lazySingleton
class AuthenticationService {
  final String baseUrl = 'https://5393ce6d7ae1.ngrok.io';

  final FlutterSecureStorage _secureStorage = locator<FlutterSecureStorage>();

  Future<bool> isUserAuthenticated() async {
    // TODO: Implement

    return false;
  }

  Future<String> getToken() async {
    return await _secureStorage.read(key: Constants.TOKEN);
  }

  Future<String> login(String username, String password) async {
    var response = await http.post(
      '$baseUrl/auth/token/',
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw 'Authentication error';
    }

    var tokenResponse = jsonDecode(response.body);

    return tokenResponse['token'];
  }

  Future registerDevice(String deviceId) async {
    final String token = await this.getToken();

    var response = await http.post(
      '$baseUrl/auth/register-device/',
      headers: {
        'Authorization': 'Token $token',
      },
      body: {
        'device_id': deviceId,
      },
    );

    if (response.statusCode != 200) {
      throw 'Device could not be registered';
    }
  }
}
