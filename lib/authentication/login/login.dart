import 'dart:convert';

class Login {
  final String clientId;
  final String apiKey;
  final String token;

  const Login({
    required this.clientId,
    required this.apiKey,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'apiKey': apiKey,
      'token': token,
    };
  }

  static Login? fromMap(Map<String, dynamic> map) {
    return Login(
      clientId: map['clientId'],
      apiKey: map['apiKey'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  static Login? fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Login(clientId: $clientId, apiKey: $apiKey, token: $token)';
  }
}
