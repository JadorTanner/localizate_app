import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/models/CategoryModel.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/utils/api.dart';
import 'package:localizate/views/cuenta/account.dart';
import 'package:localizate/views/cuenta/login.dart';
import 'package:localizate/views/home.dart';
import 'package:http/http.dart' as http;
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
  List<ProductModel> productos = [];
  final String _url = 'http://181.120.116.15:8000/api/';

  @override
  void initState() {
    super.initState();
  }

  Future getCategories() async {
    var response = await http.get(Uri.parse(_url + "categories"));
    var jsonCategories = jsonDecode(response.body)['categories'];
    List<Category> categories = List.generate(
        jsonCategories.length,
        (index) => Category(jsonCategories[index]['name'],
            jsonCategories[index]['subcategories']));
    return categories;
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
            body: FutureBuilder(
              future:
                  Future.delayed(Duration(seconds: 3), () => getCategories()),
              initialData: "",
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    var data = snapshot.data;
                    return PageView(
                      controller: _pageController,
                      onPageChanged: (int) {
                        print('cambio de página $int');
                      },
                      children: [
                        Home(productos),
                        globals.isLogged ? AccountPage() : LoginPage(),
                        Tiendas(data),
                        Center(
                          child: Container(
                            child:
                                Text('Aun no has agregado algo a tu carrito'),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Text('Contacto'),
                          ),
                        )
                      ],
                    );
                  default:
                    return Text('done');
                }
              },
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
