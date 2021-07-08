import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localizate/globals.dart';
import 'package:localizate/models/CategoryModel.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/views/cart/cartPage.dart';
import 'package:localizate/views/cuenta/cuenta_page.dart';
import 'package:localizate/views/home.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/views/search.dart';
import 'package:localizate/views/tiendas/tiendas.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;

String url = globals.apiUrl;
void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => UserModel())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Color(0xFFFF830F), accentColor: Color(0xFFD87920)),
          home: Main(),
        )));

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<ProductModel> productos = [];

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getCartData();
    context.read<UserModel>().setUserData();
  }

  Future getCategories() async {
    var response = await http.get(Uri.parse(url + "categories"));
    var jsonCategories;
    List<Category> categories;
    if (response.statusCode == 200) {
      jsonCategories = jsonDecode(response.body)['categories'];
      categories = List.generate(
          jsonCategories.length,
          (index) => Category(
              jsonCategories[index]['name'],
              jsonCategories[index]['image'],
              jsonCategories[index]['subcategories']));
    } else {
      categories = [];
    }
    return categories;
  }

  Future processPedido() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(url + 'cart/process'), body: {
      'user': sharedPreferences.getString('user')
    }, headers: {
      HttpHeaders.authorizationHeader:
          sharedPreferences.getString('token').toString(),
    });
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
                  // Future.delayed(Duration(seconds: 3), () =>
                  getCategories()
              // ),
              ,
              initialData: "",
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    var data = snapshot.data;
                    List<Category> categorias = [];
                    if (data != null) {
                      for (var i = 0; i < data.length; i++) {
                        if (data[i].subcategories.length > 0) {
                          for (var s = 0;
                              s < data[i].subcategories.length;
                              s++) {
                            if (data[i].subcategories[s]['brands'].length > 0) {
                              if (categorias.length >= 4) {
                                break;
                              }
                              categorias.add(data[i]);
                            }
                          }
                        }
                      }
                    } else {
                      categorias = [];
                    }
                    return PageView(
                      controller: _pageController,
                      onPageChanged: (int) {},
                      children: [
                        Home(categorias),
                        AccountPage(),
                        Tiendas(categorias),
                        CartPage(),
                        // Center(
                        //   child: Container(
                        //     child: Text('Contacto'),
                        //   ),
                        // )
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
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Search(categorias)))
              },
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
            // bottomAppbarButton(widget._pageController, Icons.phone, 4)
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
