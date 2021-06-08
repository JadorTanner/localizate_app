import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage(this.loginFunction, {Key? key}) : super(key: key);
  final void loginFunction;
  @override
  _LoginPageState createState() => _LoginPageState();
}

//controladores de los inputs email y contraseña
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
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
                onPressed: () => {login()},
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

login() {
  print('login');
}
