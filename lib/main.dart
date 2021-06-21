import 'package:flutter/material.dart';
import 'package:localizate/models/products.dart';
import 'package:localizate/views/cuenta/account.dart';
import 'package:localizate/views/cuenta/login.dart';
import 'package:localizate/views/home.dart';
import 'package:localizate/views/search.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:localizate/views/tiendas/tiendas.dart';

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
  List<Category> categorias = [];
  List<Product> productos = [];
  @override
  void initState() {
    super.initState();
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
                Home(productos),
                globals.isLogged ? AccountPage() : LoginPage(),
                Tiendas(),
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
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            //barra de menú inferior
            bottomNavigationBar: BottomNavBar(_pageController));
      },
    );
  }
}

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar(this._pageController, {Key? key}) : super(key: key);
  PageController _pageController;
  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            bottomAppbarButton(widget._pageController, Icons.home, 0),
            bottomAppbarButton(widget._pageController, Icons.person, 1),
            bottomAppbarButton(widget._pageController, Icons.shopping_bag, 2),
            bottomAppbarButton(widget._pageController, Icons.shopping_cart, 3),
            bottomAppbarButton(widget._pageController, Icons.phone, 4)
          ]),
        ));
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
