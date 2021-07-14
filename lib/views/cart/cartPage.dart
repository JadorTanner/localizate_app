import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/views/tiendas/producto/producto.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var formatter = NumberFormat('#,##0 Gs.', 'es_ES');
String apiUrl = "http://181.120.66.16:8001/api/flutter/";

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

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
          ? Items()
          : Center(
              child: Text('Aún no has agregado nada a tu carrito'),
            ),
    );
  }
}

class Items extends StatefulWidget {
  Items({Key? key}) : super(key: key);

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
    Future processPedido() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var processUrl = Uri.parse(apiUrl + "process-cart");
      var token = "Bearer " +
          sharedPreferences.getString('token').toString().replaceAll('"', '');
      var body = {
        "cart": jsonEncode(
            {"delivery_type": 1, "payment_type": "cash", "products": items})
      };
      var response = await http.post(processUrl, body: body, headers: {
        HttpHeaders.authorizationHeader: token,
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success']) {
          cart.deleteItems();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('Su pedido se ha procesado, está en estado pendiente'),
            duration: Duration(seconds: 2),
          ));
          context.read<UserModel>().setOrders();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Ha ocurrido un error'),
            duration: Duration(seconds: 2),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Ha ocurrido un error'),
          duration: Duration(seconds: 2),
        ));
      }
    }

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
                          Column(
                            children: [
                              Text(items[index]['name']),
                              Text(
                                  'P. Unitario: ${formatter.format(int.parse(items[index]['price']))}'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                  'Total: ${formatter.format(int.parse(items[index]['productTotal']))}'),
                              Text(
                                  'Cantidad: ${formatter.format(int.parse(items[index]['cantidad']))}'),
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
          onPressed: () => {processPedido()}, child: Text('Realizar pedido'))
    ]);
  }
}
