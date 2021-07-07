import 'package:flutter/material.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/views/tiendas/producto/producto.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

var formatter = NumberFormat('#,##0 Gs.', 'es_ES');

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

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = context.watch<CartProvider>().items;
    var cartTotal = context.watch<CartProvider>().total;
    return ListView(children: [
      ...List.generate(
          items.length,
          (index) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => ProductoDetails(items[index]))),
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
      ElevatedButton(onPressed: () => {}, child: Text('Realizar pedido'))
    ]);
  }
}
