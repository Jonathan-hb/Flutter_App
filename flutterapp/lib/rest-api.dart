import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getApi(url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> postApi(url, data) async {
    final response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
