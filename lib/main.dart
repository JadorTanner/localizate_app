import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/utils/api.dart';
import 'package:localizate/views/cuenta/account.dart';
import 'package:localizate/views/cuenta/login.dart';
import 'package:localizate/views/home.dart';
import 'package:localizate/views/search.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFF830F), accentColor: Color(0xFFD87920)),
      home: Main(),
    ));

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List _user = [];
  @override
  void initState() {
    super.initState();
  }

  login() async {
    var data = {"email": "tannerjador@gmail.com", "password": "123456789"};
    Network().login(data, 'login');

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString('token') != "") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          //barra superior, donde se encuentra el logo
          appBar: AppBar(
            toolbarHeight: orientation == Orientation.landscape ? 50 : 70,
            title: Center(
                child: Image.asset(
              'assets/img/logo-localizate-header_white.png',
              width: 150,
            )),
          ),

          //vistas (home, cuenta, tienda, carrito)
          body: PageView(
            controller: _pageController,
            onPageChanged: (int) {
              print('cambio de página $int');
            },
            children: [
              Home(),
              globals.isLogged ? AccountPage() : LoginPage(),
              SearchView(),
              Center(
                child: Container(
                  child: Text('Aun no has agregado algo a tu carrito'),
                ),
              ),
              Center(
                child: Container(
                  child: Text('Contacto'),
                ),
              )
            ],
          ),

          //botón central flotante de búsqueda
          floatingActionButton: FloatingActionButton(
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            mini: false,
            clipBehavior: Clip.hardEdge,
            onPressed: () => {_pageController.jumpToPage(2)},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //barra de menú inferior
          bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Theme.of(context).primaryColor,
              notchMargin: 10,
              clipBehavior: Clip.hardEdge,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bottomAppbarButton(_pageController, Icons.home, 0),
                      bottomAppbarButton(_pageController, Icons.person, 1),
                      SizedBox(
                        width: 10,
                      ),
                      bottomAppbarButton(
                          _pageController, Icons.shopping_cart, 3),
                      bottomAppbarButton(_pageController, Icons.phone, 4)
                    ]),
              )),
        );
      },
    );
  }
}

IconButton bottomAppbarButton(_pageController, IconData icon, int toPage) {
  return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: () => {_pageController.jumpToPage(toPage)});
}
