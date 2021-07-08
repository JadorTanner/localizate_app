import 'package:flutter/material.dart';
import 'package:localizate/models/UserModel.dart';
// import 'package:localizate/views/cuenta/account.dart';
// import 'package:localizate/views/cuenta/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isLogged = false;

  @override
  void initState() {
    super.initState();
  }

  // Future getIsLogged() async {
  //   var sharedPreferences = await SharedPreferences.getInstance();
  //   bool? isLogged = sharedPreferences.getBool('isLogged') != null
  //       ? sharedPreferences.getBool('isLogged')
  //       : false;
  //   return isLogged;
  // }

  // logIn() async {
  //   var sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.setBool('isLogged', true);
  // }

  // logOut() async {
  //   var sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.setBool('isLogged', false);
  // }

  @override
  Widget build(BuildContext context) {
    var userModel = context.watch<UserModel>();
    isLogged = userModel.isLogged;
    String email = 'tannerjador@gmail.com';
    String password = '123456789';
    return Center(
        child: Column(
      children: [
        Text(isLogged
            ? 'Logueado ${userModel.name} - ${userModel.email}'
            : 'No logueado'),
        IconButton(
            icon: Icon(isLogged ? Icons.logout : Icons.person),
            onPressed: () => isLogged
                ? userModel.logout()
                : userModel.login(email, password, context))
      ],
    ));
    // return FutureBuilder(
    //   future: getIsLogged(),
    //   initialData: false,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     var isLogged = snapshot.data;
    //     return isLogged
    //         ? Account(() => {logOut(), setState(() => {})})
    //         : LoginPage(() => {logIn(), setState(() => {})});
    //   },
    // );
  }
}
