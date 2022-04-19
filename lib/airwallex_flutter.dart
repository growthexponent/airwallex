import 'dart:async';

import 'package:flutter/services.dart';

class AirwallexFlutter {
  static const MethodChannel _channel = MethodChannel('airwallex_flutter');

  /// Return the current platform version
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
