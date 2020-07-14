import 'dart:convert';
import 'package:http/http.dart' as http;

class CallService {
  Future<String> callService(String url, String data) async {
    // String body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: data,
    );
    print(response.body + data + response.statusCode.toString());
    return response.body;
  }
}
