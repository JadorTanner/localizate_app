import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

String url = "http://181.120.66.16:8001/api/flutter/";

class UserModel with ChangeNotifier {
  String _name = "";
  String get name => _name;

  String _email = "";
  String get email => _email;

  bool _isLogged = false;
  bool get isLogged => _isLogged;

  List _orders = [];
  List get orders => _orders;

  List _addresses = [];
  List get addresses => _addresses;

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
        _addresses = await getAddresses();
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
      //vaciar localstorage
      sharedPreferences.remove('user');
      sharedPreferences.remove('token');
      sharedPreferences.remove('pedidos');
      sharedPreferences.remove('addresses');

      //vaciar provider
      _isLogged = false;
      _name = "";
      _email = "";
      _orders.clear();
      _addresses.clear();

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

      //ordenes
      var jsonOrders = await getOrders();
      _orders = [];
      for (var i = 0; i < jsonOrders.length; i++) {
        _orders.add(jsonOrders[i]);
      }

      //direcciones
      var jsonAddresses = await getAddresses();
      _addresses = [];
      for (var i = 0; i < jsonAddresses.length; i++) {
        _addresses.add(jsonAddresses[i]);
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

  setAddresses() async {
    var jsonAddresses = await getAddresses()();
    _addresses = [];
    for (var i = 0; i < jsonAddresses.length; i++) {
      _addresses.add(jsonAddresses[i]);
    }
    notifyListeners();
  }

  getAddresses() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(url + 'addresses'), headers: {
      HttpHeaders.authorizationHeader: "Bearer " +
          sharedPreferences.getString('token').toString().replaceAll('"', '')
    });
    var jsonAddreses = [];
    if (response.statusCode == 200) {
      jsonAddreses = jsonDecode(response.body);
      _addresses = jsonAddreses;
      notifyListeners();
    }
    return jsonAddreses;
  }

  addAddress(name, principal, secundaria, referencia, numero, latitud, longitud,
      context) async {
    bool added = false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
        Uri.parse('http://181.120.66.16:8001/api/flutter/addresses/add'),
        body: {
          'name': name,
          'street1': principal,
          'street2': secundaria,
          'reference': referencia,
          'latitude': latitud,
          'longitude': longitud,
        },
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " +
              sharedPreferences
                  .getString('token')
                  .toString()
                  .replaceAll('"', '')
        });
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Se ha agregado correctamente'),
        duration: Duration(seconds: 2),
      ));
      added = true;
      _addresses.add(jsonDecode(response.body));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ha ocurrido un error'),
        duration: Duration(seconds: 2),
      ));
    }
    return added;
  }
}
