import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String _url = 'http://181.120.116.15:8000/api/';
  getCategories() async {
    var response = await http.get(Uri.parse(_url + "categories"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
