import 'dart:convert';

import 'package:http/http.dart' as http;

class Jemputmodel {
  static const _baseurl = 'https://boss-supreme-peacock.ngrok-free.app/ecosmartapi/jemput_sampah.php';

  Future<void> addDataJemput(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse(_baseurl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'data': data,
        }));
    print(response.body);
  }
}
