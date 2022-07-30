import 'dart:async';

import '../authentication/login/login_helper.dart';

class LoginProvider {
  final _helper = LoginHelper();

  Future getToken(clientId, apiKey) async {
    final loginHelperResult = await _helper.login(clientId, apiKey);
    return loginHelperResult;
  }
}
