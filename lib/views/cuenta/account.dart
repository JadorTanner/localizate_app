import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String url = globals.url;

class Account extends StatefulWidget {
  Account(this.logOut, {Key? key}) : super(key: key);
  var logOut;
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Future logout() async {
    var response = await http.post(Uri.parse(url + 'api/logout'));
    if (response.statusCode == 200) {
      widget.logOut();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove('user');
    }
  }

  @override
  void initState() {
    super.initState();
    // logout();
  }

  Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var _user = sharedPreferences.getString('token');
    return _user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserData(),
      initialData: "",
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var userData = snapshot.data;
        return Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Center(
                child: Column(
                  children: [
                    // Text(userData['full_name']),
                    Text(userData),
                    ElevatedButton(
                        onPressed: () => logout(), child: Text("cerrar sesión"))
                  ],
                ),
              ),
            ]));
      },
    );
  }
}
