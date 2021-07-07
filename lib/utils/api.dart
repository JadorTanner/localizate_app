import 'dart:convert';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;

class Network {
  final String _url = globals.apiUrl;
  getCategories() async {
    var response = await http.get(Uri.parse(_url + "categories"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
