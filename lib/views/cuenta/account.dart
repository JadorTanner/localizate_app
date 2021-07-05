import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  Account(this.logOut, {Key? key}) : super(key: key);
  var logOut;
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String _userName = 'Jador';
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
                    onPressed: () => widget.logOut(),
                    child: Text("cerrar sesión"))
              ],
            ),
          ),
        ]));
  }
}
