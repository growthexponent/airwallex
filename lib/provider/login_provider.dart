import 'dart:async';

import 'package:dartz/dartz.dart';

import '../authentication/login/login.dart';
import '../authentication/login/login_helper.dart';
import '../model/glitch/glitch.dart';

class LoginProvider {
  final _helper = LoginHelper();

  Future<Either<Glitch, Login>> getToken(clientId, apiKey) async {
    final loginHelperResult = await _helper.login(clientId, apiKey);
    return loginHelperResult;
  }
}
