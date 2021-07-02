import 'package:flutter/material.dart';
import 'package:localizate/globals.dart' as globals;

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _userName = 'Jador';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Center(
            child: Text(_userName),
          ),
        ]));
  }
}
