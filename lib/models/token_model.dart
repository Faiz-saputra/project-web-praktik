import 'dart:convert';

import 'package:http/http.dart' as http;

class TokenModel {
  static const _baseurl = 'https://boss-supreme-peacock.ngrok-free.app/ecosmartapi/generate_token.php';

  Future<String> getToken(String orderId) async {
    final response = await http.post(Uri.parse(_baseurl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'order_id': orderId,
        }));
    var data = jsonDecode(response.body);
    var token = data['token'];
    print("token: $data");
    return token;
  }
}
