//productos
import 'package:flutter/cupertino.dart';

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
  int _total = 0;
  int get total => _total;

  List _items = [];
  List get items => _items;
  void addToCart(item, int cantidad) {
    var product = item;
    int parsedPrice = int.parse(product['price'].replaceAll(".", ""));
    int totalPoduct = parsedPrice * cantidad;
    product['cantidad'] = cantidad.toString();
    product['productTotal'] = totalPoduct.toString();
    _total += totalPoduct;
    _items.add(product);
    notifyListeners();
  }

  int getPosition(product) {
    return items.indexWhere((element) => element['id'] == product['id']);
  }

  void removeFromCart(item) {
    int indexOnCart = getPosition(item);
    int itemPrice = int.parse(items[indexOnCart]['productTotal']);
    _items.removeAt(indexOnCart);
    _total -= itemPrice;
    notifyListeners();
  }
}
