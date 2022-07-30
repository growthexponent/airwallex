import 'dart:async';

import 'package:airwallex_flutter/authentication/login/login.dart';
import 'package:airwallex_flutter/provider/login_provider.dart';
import 'package:flutter/services.dart';

class AirwallexFlutter {
  static const MethodChannel _channel = MethodChannel('airwallex_flutter');
  late Login login;
  late LoginProvider loginProvider;
  late bool authenticated;
  late String authToken;

  get clientId => null;
  get apiKey => null;

  setLoginCredentials(_clientId, _apiKey) {
    login = Login(
      clientId: _clientId,
      apiKey: _apiKey,
    );
  }

  /// Return the current platform version
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Return login token
  Future get loginToken async {
    loginProvider = LoginProvider();
    return await loginProvider.getToken(clientId, apiKey);
  }
}
