import 'package:flutter/material.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:localizate/models/UserModel.dart';
import 'package:provider/provider.dart';

String url = "http://181.120.66.16:8001/api/flutter/";

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

//controladores de los inputs email y contraseña
TextEditingController _nameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  var userModel;

  @override
  void initState() {
    super.initState();
    userModel = context.read<UserModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: MediaQuery.of(context).size.width * 0.1),
            alignment: Alignment.center,
            child: ListView(children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Teléfono'),
              ),
              SizedBox(height: 20),
              PasswordField(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => {
                            //inicia sesión por el método del provider de user
                            userModel.register(
                                _nameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _phoneController.text,
                                _passwordController.text,
                                context)
                          },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'Registrarse',
                            style: TextStyle(color: Colors.white),
                          )),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Theme.of(context).primaryColor)))
                ],
              )
            ])));
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
