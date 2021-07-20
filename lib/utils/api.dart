import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = "http://181.120.66.16:8001/api/flutter/";
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
