import 'package:flutter/material.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/views/cuenta/register.dart';
import 'package:provider/provider.dart';

String url = "http://181.120.66.16:8001/api/flutter/";

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
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
          PasswordField(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()))
                      },
                  child: Text('Registrarse')),
              TextButton(
                  onPressed: () => {
                        //inicia sesión por el método del provider de user
                        userModel.login(_emailController.text,
                            _passwordController.text, context)
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

//campo de contraseña, mostrar y ocultar contraseña
class PasswordField extends StatefulWidget {
  PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Contraseña',
          suffixIcon: IconButton(
              icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => obscure = !obscure))),
      obscureText: obscure,
    );
  }
}
