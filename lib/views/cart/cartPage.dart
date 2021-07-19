import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/views/cart/processCart.dart';
import 'package:localizate/views/tiendas/producto.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var formatter = NumberFormat('#,##0 Gs.', 'es_ES');
String apiUrl = "http://181.120.66.16:8001/api/flutter/";

class CartPage extends StatefulWidget {
  CartPage(this._pageController, {Key? key}) : super(key: key);
  PageController _pageController;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: context.watch<CartProvider>().items.length > 0
          ? Items(widget._pageController)
          : Center(
              child: Text('Aún no has agregado nada a tu carrito'),
            ),
    );
  }
}

class Items extends StatefulWidget {
  Items(this._pageController, {Key? key}) : super(key: key);
  PageController _pageController;
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  var items;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();
    items = cart.items;
    var cartTotal = context.watch<CartProvider>().total;
    var user = context.watch<UserModel>();

    return ListView(children: [
      ...List.generate(
          items.length,
          (index) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) =>
                          ProductoDetails(items[index]['id'], items[index]))),
              child: Card(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Hero(
                                tag: items[index]['id'],
                                child: Image.network(
                                  globals.imgUrl + items[index]['image'],
                                  frameBuilder: (BuildContext context,
                                      Widget child,
                                      frame,
                                      bool wasSynchronouslyLoaded) {
                                    if (wasSynchronouslyLoaded) {
                                      return child;
                                    }
                                    return AnimatedOpacity(
                                      child: child,
                                      opacity: frame == null ? 0 : 1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  },
                                  fit: BoxFit.fitHeight,
                                  height: 50,
                                )),
                          ),
                          Column(
                            children: [
                              Text(items[index]['name']),
                              Text(
                                  'Pu.: ${formatter.format(int.parse(items[index]['price']))}'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                  'Total: ${formatter.format(int.parse(items[index]['productTotal']))}'),
                              Text(
                                  'Cantidad: ${int.parse(items[index]['cantidad'])}'),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          IconButton(
                              onPressed: () => context
                                  .read<CartProvider>()
                                  .removeFromCart(items[index]),
                              icon: Icon(Icons.delete))
                        ],
                      ))))),
      Text(
          'Total en carrito: ${formatter.format(int.parse(cartTotal.toString()))}'),
      ElevatedButton(
          onPressed: () => {
                user.isLogged
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProcessCart(items)))
                    : widget._pageController.jumpToPage(1)
              },
          child: Text(user.isLogged
              ? 'Realizar pedido'
              : 'Inicie sesión para continuar'))
    ]);
  }
}
