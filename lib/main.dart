import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:localizate/views/cuenta/account.dart';
import 'package:localizate/views/cuenta/login.dart';
import 'package:localizate/views/home.dart';
import 'package:localizate/views/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

//localstorage de la app
SharedPreferences localStorage;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFF830F), accentColor: Color(0xFFD87920)),
      home: Main(),
    ));

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          //barra superior, donde se encuentra el logo
          appBar: AppBar(
            toolbarHeight: orientation == Orientation.landscape ? 50 : 100,
            title: Center(
                child: Padding(
              padding: orientation == Orientation.landscape
                  ? EdgeInsets.symmetric(vertical: 20)
                  : EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/launcher/icon-foreground.png',
                    fit: BoxFit.scaleDown,
                    height: 50,
                  ),
                  Text(
                    'Localizate',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
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
              (localStorage != null)
                  ? AccountPage()
                  : LoginPage(() => {login()}),
              Center(
                child: Container(
                  child: Text('Carrito'),
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
            clipBehavior: Clip.none,
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchView()))
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          //barra de menú inferior
          bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Theme.of(context).primaryColor,
              clipBehavior: Clip.none,
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
                          _pageController, Icons.shopping_cart, 2),
                      bottomAppbarButton(_pageController, Icons.phone, 3)
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
