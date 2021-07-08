import 'dart:convert';
import 'dart:io';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = globals.apiUrl;
  getCategories() async {
    var response = await http.get(Uri.parse(_url + "categories"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  authPostRequest(url, body) async {
    var response = await http.post(url, body: body, headers: _setHeaders());
    return response;
  }

  _setHeaders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return {
      HttpHeaders.authorizationHeader:
          sharedPreferences.getString('token').toString(),
    };
  }
}
