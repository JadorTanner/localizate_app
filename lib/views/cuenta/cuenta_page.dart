import 'package:flutter/material.dart';
import 'package:localizate/views/cuenta/account.dart';
import 'package:localizate/views/cuenta/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  Future getIsLogged() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    bool? isLogged = sharedPreferences.getBool('isLogged') != null
        ? sharedPreferences.getBool('isLogged')
        : false;
    return isLogged;
  }

  logIn() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool('isLogged', true);
  }

  logOut() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool('isLogged', false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIsLogged(),
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var isLogged = snapshot.data;
        return isLogged
            ? Account(() => {logOut(), setState(() => {})})
            : LoginPage(() => {logIn(), setState(() => {})});
      },
    );
  }
}
