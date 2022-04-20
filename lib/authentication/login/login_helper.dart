import 'dart:convert';

import 'package:airwallex_flutter/authentication/login/login.dart';
import 'package:airwallex_flutter/authentication/login/login_api.dart';
import 'package:dartz/dartz.dart';

import '../../model/glitch/glitch.dart';
import '../../model/glitch/no_internet_glitch.dart';

class LoginHelper {
  final api = LoginApi();
  Future<Either<Glitch, Login>> login(clientId, apiKey) async {
    final apiResult = await api.login(clientId, apiKey);
    return apiResult.fold((l) {
      // There can be many types of error, but for simplicity, we are going
      // to assume only NoInternetGlitch
      return Left(NoInternetGlitch());
    }, (r) {
      // the API returns breed, id, url, width, height, category, details, etc.,
      // but we will take only the information we need in our app and ignore
      // the rest
      // here we will decode the API result to CatPhoto
      final login = Login.fromMap(jsonDecode(r)[0]);
      return Right(login!);
    });
  }
}
