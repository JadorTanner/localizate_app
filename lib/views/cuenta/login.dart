import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

String url = globals.url;

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
  @override
  void initState() {
    super.initState();
  }

  Future login() async {
    var response = await http.post(Uri.parse(url + 'login'), body: {
      'email': _emailController.text,
      'password': _passwordController.text
    });
    if (response.statusCode == 200) {
      widget.setLogin();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('user', response.body.toString());
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
                onPressed: () => login(),
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).primaryColor)),
              )
            ],
          )
        ]));
  }
}
