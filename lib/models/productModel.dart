//productos
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductModel {
  int id, companyId, subcategoryId, brandId;
  String price,
      offerPrice,
      wholersalersPrice,
      name,
      barcode,
      description,
      image;

  ProductModel(
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.offerPrice,
    this.wholersalersPrice,
    this.subcategoryId,
    this.barcode,
    this.companyId,
    this.brandId,
  );
}

class CartProvider with ChangeNotifier {
  //se conecta a los datos guardados en el dispositivo
  late SharedPreferences sharedPreferences;

  int _total = 0;
  int get total => _total;

  List _items = [];
  List get items => _items;

  //agrega un producto al carrito y calcula el total
  void addToCart(item, int cantidad) async {
    var product = item;
    int parsedPrice = int.parse(product['price'].replaceAll(".", ""));
    int totalPoduct = parsedPrice * cantidad;
    this._total += this.total + totalPoduct;
    product['cantidad'] = cantidad.toString();
    product['productTotal'] = totalPoduct.toString();
    this._items.add(product);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('cartItems', jsonEncode(_items));
    sharedPreferences.setInt('cartTotal', _total);

    notifyListeners();
  }

  getCartData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //obtiene los productos guardados en el dispositivo
    this._items = sharedPreferences.getString('cartItems') != null
        ? jsonDecode(sharedPreferences.getString('cartItems').toString())
        : [];

    //obtiene el total del carrito guardado en el dispositivo
    this._total = sharedPreferences.getString('cartTotal') != null
        ? int.parse(sharedPreferences.getInt('cartTotal').toString())
        : 0;
  }

  // optiene la posicion de un elemento en el carrito por su id
  int getPosition(product) {
    return items.indexWhere((element) => element['id'] == product['id']);
  }

  //remueve un item del carrito y recalcula el total en carrito
  void removeFromCart(item) async {
    int indexOnCart = getPosition(item);
    int itemPrice = int.parse(items[indexOnCart]['productTotal']);
    _items.removeAt(indexOnCart);
    _total -= itemPrice;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('cartItems', jsonEncode(_items));
    sharedPreferences.setString('cartTotal', _total.toString());

    notifyListeners();
  }
}
