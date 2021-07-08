import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

String url = globals.apiUrl;

class UserModel with ChangeNotifier {
  String _name = "";
  String get name => _name;

  String _email = "";
  String get email => _email;

  bool _isLogged = false;
  bool get isLogged => _isLogged;

  login(email, password, context) async {
    var response = await http.post(Uri.parse(url + 'login'),
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success']) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var user = jsonEncode(jsonResponse['user'].toString());
        sharedPreferences.setString('user', user.toString());
        sharedPreferences.setString(
            'token', jsonEncode(jsonResponse['token']['accessToken']));
        print(user);
        print(jsonResponse['token']['accessToken']);
        // _name = user['name'];
        // _email = user['email'];
        _name = 'Jador Tanner';
        _email = 'tannerjador@gmail.com';
        _isLogged = true;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Ha ocurrido un error'),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token').toString();
    var response = await http.get(Uri.parse(url + 'logout'),
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
    print(response.statusCode);
    // if (response.statusCode == 200) {
    sharedPreferences.remove('user');
    sharedPreferences.remove('token');
    sharedPreferences.remove('pedidos');
    _isLogged = false;
    _name = "";
    _email = "";
    notifyListeners();
    // }
  }

  setUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('user') != null) {
      _isLogged = true;
      _name = 'Jador Tanner';
      _email = 'tannerjador@gmail.com';
      notifyListeners();
    }
  }
}
