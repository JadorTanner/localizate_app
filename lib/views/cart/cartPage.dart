import 'package:flutter/material.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/utils/format.dart';
import 'package:localizate/views/cart/processCart.dart';
import 'package:localizate/views/tiendas/producto.dart';
import 'package:provider/provider.dart';
import 'package:localizate/globals.dart' as globals;

String apiUrl = globals.apiUrl;

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

    return ListView(padding: EdgeInsets.all(20), children: [
      ...List.generate(
          items.length,
          (index) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) =>
                          ProductoDetails(items[index]['id'], items[index]))),
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
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
                                      'Pu.: ${numberFormat(int.parse(items[index]['price']))}'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                      'Total: ${numberFormat(int.parse(items[index]['productTotal']))}'),
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
                          )))))),
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          'Total: ${numberFormat(int.parse(cartTotal.toString()))}',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      ElevatedButton(
          onPressed: () => {
                user.isLogged
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProcessCart(items)))
                    : widget._pageController.jumpToPage(1)
              },
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).primaryColor)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(user.isLogged
                ? 'Realizar pedido'
                : 'Inicie sesión para continuar'),
          ))
    ]);
  }
}
