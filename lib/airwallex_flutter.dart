import 'dart:async';

import 'package:airwallex_flutter/provider/login_provider.dart';
import 'package:flutter/services.dart';

class AirwallexFlutter {
  static const MethodChannel _channel = MethodChannel('airwallex_flutter');
  late LoginProvider login;
  late bool authenticated;
  late String authToken;

  /// Return the current platform version
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Return the current platform version
  Future<String?> get loginToken async {
    login = LoginProvider();
    final String? token = (await login.getToken(clientId, apiKey)) as String?;
    return token;
  }

  get apiKey => null;

  get clientId => null;
}
