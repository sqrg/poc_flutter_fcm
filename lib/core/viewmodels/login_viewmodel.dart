import 'dart:convert';

import 'package:stacked/stacked.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends BaseViewModel {
  final String baseUrl = 'https://e7cd3f76a62b.ngrok.io';

  Future login(String username, String password) async {
    setBusy(true);

    var deviceToken = await FirebaseMessaging().getToken();

    var response = await http.post(
      '$baseUrl/auth/token/',
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var tokenResponse = jsonDecode(response.body);
    }

    setBusy(false);
  }
}
