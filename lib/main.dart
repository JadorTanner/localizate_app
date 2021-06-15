import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/models/products.dart';
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
  List<Category> categorias = [];
  List<Product> productos = [];
  @override
  void initState() {
    super.initState();
    login();
  }

  login() async {
    // var data = {"email": "tannerjador@gmail.com", "password": "123456789"};
    // var token = await Network().login(data, 'login');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != "") {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginPage()));
      // print(localStorage.getString('token'));
      var fullUrl = "http://192.168.0.9:8000/shop?mobile=true";
      var resp = await http.get(Uri.parse(fullUrl), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      var dataBody = jsonDecode(resp.body);
      for (var producto in dataBody['products']['data']) {
        String id = producto['id'].toString(),
            price = producto['price'].toString(),
            offerPrice = producto['offer_price'].toString(),
            wholersalersPrice = producto['wholersalers_price'].toString(),
            subcategoryId = producto['subcategory_id'].toString(),
            companyId = producto['company_id'].toString(),
            brandId = producto['brand_id'].toString(),
            name = producto['name'],
            description = producto['description'],
            image = dataBody['products_img_url'] + producto['image'],
            barcode = producto['barcode'];

        productos.add(Product(id, name, description, image, price, offerPrice,
            wholersalersPrice, subcategoryId, barcode, companyId, brandId));
      }
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
              Home(productos),
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
