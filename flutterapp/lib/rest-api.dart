import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getApi(url) async {
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      final List test = ["test"];
      return test;
    } else if (response.body == null) {
      return null;
    }
  }

// https://stackoverflow.com/questions/66920066/disable-cors-on-flutter
// Access to XMLHttpRequest at 'http://51.15.137.206:8000/' from origin 'http://localhost:40229' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.

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
