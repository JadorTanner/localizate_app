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

  List _orders = [];
  List get orders => _orders;

  //iniciar sesión
  login(email, password, context) async {
    var response = await http.post(Uri.parse(url + 'login'),
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success']) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        var user = jsonEncode(jsonResponse['user']);

        sharedPreferences.setString('user', user);
        sharedPreferences.setString(
            'token', jsonEncode(jsonResponse['token']['accessToken']));

        _name = jsonResponse['user']['full_name'];
        _email = jsonResponse['user']['email'];
        _isLogged = true;
        _orders = [];
        var jsonOrders = await getOrders();
        for (var i = 0; i < jsonOrders.length; i++) {
          _orders.add(jsonOrders[i]);
        }

        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Ha ocurrido un error'),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  //cerrar sesión
  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(url + 'logout'), headers: {
      HttpHeaders.authorizationHeader: "Bearer " +
          sharedPreferences.getString('token').toString().replaceAll('"', '')
    });
    if (response.statusCode == 200) {
      sharedPreferences.remove('user');
      sharedPreferences.remove('token');
      sharedPreferences.remove('pedidos');
      _isLogged = false;
      _name = "";
      _email = "";
      notifyListeners();
    }
  }

  //cargar los datos guardados en almacenamiento al iniciar la aplicación
  setUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences.getString('user');
    if (user != null) {
      var jsonUser = jsonDecode(user);
      _isLogged = true;
      _name = jsonUser['full_name'];
      _email = jsonUser['email'];
      var jsonOrders = await getOrders();
      _orders = [];
      for (var i = 0; i < jsonOrders.length; i++) {
        _orders.add(jsonOrders[i]);
      }
      notifyListeners();
    }
  }

  setOrders() async {
    var jsonOrders = await getOrders();
    _orders = [];
    for (var i = 0; i < jsonOrders.length; i++) {
      _orders.add(jsonOrders[i]);
    }
    notifyListeners();
  }

  //ordenes del usuario
  getOrders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(url + 'user/orders'), headers: {
      HttpHeaders.authorizationHeader: "Bearer " +
          sharedPreferences.getString('token').toString().replaceAll('"', '')
    });
    var userOrders;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['orders'];
      if (jsonResponse.length > 0) {
        userOrders = jsonResponse;
      } else {
        userOrders = [];
      }
    } else {
      userOrders = [];
    }
    return userOrders;
  }
}
