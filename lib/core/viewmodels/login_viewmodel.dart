import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';

import 'package:poc_flutter_fcm/locator.dart';
import 'package:poc_flutter_fcm/core/services/authentication_service.dart';

import 'package:poc_flutter_fcm/constants.dart' as Constants;

class LoginViewModel extends BaseViewModel {
  final FlutterSecureStorage _secureStorage = locator<FlutterSecureStorage>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<bool> login(String username, String password) async {
    setBusy(true);

    String token;

    try {
      token = await _authenticationService.login(username, password);

      await _secureStorage.write(key: Constants.TOKEN, value: token);
    } catch (exception) {}

    if (token != null) {
      var deviceId = await FirebaseMessaging().getToken();

      await _authenticationService.registerDevice(deviceId);

      setBusy(false);

      return true;
    }

    setBusy(false);

    return false;
  }
}
