import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getApi(url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      final List test = ["test"];
      return test;
    } else {
      return null;
    }
  }

  static Future<bool> postApi(urllol, data) async {
    //String urllol = "http://51.15.137.206:8000";
    Uri url = Uri.parse(urllol);
    final response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
