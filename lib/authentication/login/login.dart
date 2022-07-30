import 'dart:convert';

class Login {
  String? clientId;
  String? apiKey;
  String? token;
  String? expiresAt;

  Login({
    this.clientId,
    this.apiKey,
    this.token,
    this.expiresAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'apiKey': apiKey,
      'token': token,
      'expiresAt': expiresAt,
    };
  }

  static Login fromMap(Map<String, dynamic> map) {
    return Login(
      clientId: map['clientId'],
      apiKey: map['apiKey'],
      token: map['token'],
      expiresAt: map['expiresAt'],
    );
  }

  String toJson() => json.encode(toMap());

  static Login? fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Login(clientId: $clientId, apiKey: $apiKey, token: $token, expiresAt: $expiresAt)';
  }
}
