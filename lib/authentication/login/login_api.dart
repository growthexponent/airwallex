import 'package:http/http.dart' as http;

import '../../const.dart';

class LoginApi {
  login(String clientId, String apiKey) async {
    try {
      final queryParameters = {
        'x-client-id': clientId,
        'x-api-key': apiKey,
      };
      final uri = Uri.https(
          Constants.apiRoot, "/authentication/login", queryParameters);
      final response = await http.post(uri);
      print(response);
      return response.body;
    } on Exception catch (e) {
      return (e);
    }
  }
}
