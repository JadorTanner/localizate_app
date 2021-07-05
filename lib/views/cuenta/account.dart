import 'package:flutter/material.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;

String url = globals.url;

class Account extends StatefulWidget {
  Account(this.logOut, {Key? key}) : super(key: key);
  var logOut;
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String _userName = 'Jador';

  Future logout() async {
    var response = await http.post(Uri.parse(url + 'logout'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      widget.logOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Center(
            child: Column(
              children: [
                Text(_userName),
                ElevatedButton(
                    onPressed: () => logout(), child: Text("cerrar sesión"))
              ],
            ),
          ),
        ]));
  }
}
