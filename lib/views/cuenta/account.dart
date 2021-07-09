import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String url = globals.apiUrl;

// ignore: must_be_immutable
class Account extends StatefulWidget {
  Account(this.logOut, {Key? key}) : super(key: key);
  var logOut;
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(url + 'logout'), headers: {
      HttpHeaders.authorizationHeader: "Bearer " +
          sharedPreferences.getString('token').toString().replaceAll('"', '')
    });
    if (response.statusCode == 200) {
      widget.logOut();
      sharedPreferences.remove('user');
      sharedPreferences.remove('token');
      sharedPreferences.remove('pedidos');
    }
  }

  var _userData;

  @override
  void initState() {
    super.initState();
    // logout();
    getUserData();
    getOrders();
  }

  Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map _user = {};
    _user['user'] = sharedPreferences.getString('user');
    print(_user['user']);
    _userData = jsonDecode(_user['user'].toString());
    // _user['pedidos'] = await getOrders();
    // return _user;
  }

  Future getOrders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token =
        sharedPreferences.getString('token').toString().replaceAll('"', '');
    var response = await http.post(Uri.parse(url + "user/orders"),
        headers: {HttpHeaders.authorizationHeader: "Bearer " + token});
    var pedidos = [];
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success']) {
        pedidos = jsonResponse['orders'];
        sharedPreferences.setString('pedidos', jsonEncode(pedidos).toString());
      }
    } else {
      pedidos = [];
    }
    return pedidos;
  }

  @override
  Widget build(BuildContext context) {
    print(_userData);
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Center(
            child: Column(
              children: [
                // Text(_userData['full_name']),
                // ...List.generate(
                //     pedidos.length,
                //     (index) => Text(
                //         "${pedidos[index]['invoice_number']}) ${pedidos[index]['status']}")),
                ElevatedButton(
                    onPressed: () => logout(), child: Text("cerrar sesión"))
              ],
            ),
          ),
        ]));
  }
}
