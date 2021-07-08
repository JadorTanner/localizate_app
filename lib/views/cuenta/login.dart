import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;
import 'package:localizate/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

String url = globals.apiUrl;

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage(this.setLogin, {Key? key}) : super(key: key);
  var setLogin;
  @override
  _LoginPageState createState() => _LoginPageState();
}

//controladores de los inputs email y contraseña
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  var userModel;

  @override
  void initState() {
    super.initState();
    userModel = context.read<UserModel>();
  }

  Future login() async {
    var response = await http.post(Uri.parse(url + 'login'), body: {
      'email': _emailController.text,
      'password': _passwordController.text
    });

    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    if (jsonResponse['success']) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var user = jsonEncode(jsonResponse['user']);
      sharedPreferences.setString('user', user);
      sharedPreferences.setString(
          'orders', jsonEncode(jsonResponse['pedidos']));
      sharedPreferences.setString(
          'token', jsonEncode(jsonResponse['token']['accessToken']));
      widget.setLogin();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ha ocurrido un error'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => {}, child: Text('Olvidé mi contraseña')),
              TextButton(
                  onPressed: () => {
                        userModel.login(_emailController.text,
                            _passwordController.text, context)
                        // login()
                      },
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(color: Colors.white),
                      )),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor)))
            ],
          )
        ]));
  }
}
