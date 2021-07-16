import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/utils/widgetsComunes.dart';
import 'package:localizate/views/cuenta/cuenta_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProcessCart extends StatefulWidget {
  ProcessCart(this.items, {Key? key}) : super(key: key);
  List items;
  @override
  _ProcessCartState createState() => _ProcessCartState();
}

class _ProcessCartState extends State<ProcessCart> {
  var cart;
  List<PageViewModel> pages = [
    PageViewModel(
        title: 'Selecciona una dirección', bodyWidget: SelectAddress()),
    PageViewModel(title: 'Factura?', bodyWidget: SelectFactura()),
  ];

  @override
  Widget build(BuildContext context) {
    cart = context.watch<CartProvider>();
    return IntroductionScreen(
      showDoneButton: true,
      showNextButton: false,
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var processUrl =
            Uri.parse("http://181.120.66.16:8001/api/flutter/process-cart");
        var token = "Bearer " +
            sharedPreferences.getString('token').toString().replaceAll('"', '');
        var body = {
          "cart": jsonEncode({
            "delivery_type": 1,
            "payment_type": "cash",
            "products": widget.items
          })
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
      },
      pages: pages,
    );
  }
}

class SelectAddress extends StatefulWidget {
  SelectAddress({Key? key}) : super(key: key);

  @override
  _SelectAddressState createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserModel>();
    return Column(
      children: List.generate(
        user.addresses.length,
        (index) => AddressCard(direccion: user.addresses[index]),
      ),
    );
  }
}

class SelectFactura extends StatefulWidget {
  SelectFactura({Key? key}) : super(key: key);

  @override
  _SelectFacturaState createState() => _SelectFacturaState();
}

class _SelectFacturaState extends State<SelectFactura> {
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserModel>();
    return Column(
      children: List.generate(
        user.facturas.length,
        (index) => FacturaCard(user.facturas[index]),
      ),
    );
  }
}
