import 'dart:convert';

import 'package:airwallex_flutter/authentication/login/login.dart';
import 'package:airwallex_flutter/authentication/login/login_api.dart';

class LoginHelper {
  final api = LoginApi();
  Future login(clientId, apiKey) async {
    final apiResult = await api.login(clientId, apiKey);
    print(apiResult);
    return Login.fromMap(jsonDecode(apiResult));
  }
}
