import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';

class LoginApi {
  Future<Either<Exception, String>> login(
      String clientId, String apiKey) async {
    try {
      final queryParameters = {
        'x-client-id': clientId,
        'x-api-key': apiKey,
      };
      final uri = Uri.https(
          Constants.apiRoot, "/authentication/login", queryParameters);
      final response = await http.post(uri);
      if (response.statusCode == 200) {
        print(response);
        return Right(response.body);
      }
      return Left(Exception('Invalid response from API'));
    } on Exception catch (e) {
      return (Left(e));
    }
  }
}
