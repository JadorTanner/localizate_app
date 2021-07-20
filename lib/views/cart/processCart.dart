import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/utils/widgetsComunes.dart';
import 'package:localizate/views/cuenta/address/addAddress.dart';
import 'package:localizate/views/cuenta/cuenta_page.dart';
import 'package:localizate/views/cuenta/facturas/agregarFactura.dart';
import 'package:localizate/views/tiendas/producto.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String apiUrl = "http://181.120.66.16:8001/api/flutter/";

class ProcessCart extends StatefulWidget {
  ProcessCart(this.items, {Key? key}) : super(key: key);
  List items;
  @override
  _ProcessCartState createState() => _ProcessCartState();
}

class _ProcessCartState extends State<ProcessCart> {
  var canPass;
  var direccion = "";
  var factura = "";
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();
    var items = cart.items;
    var cartTotal = cart.total;

    Future processPedido() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var processUrl = Uri.parse(apiUrl + "process-cart");
      var token = "Bearer " +
          sharedPreferences.getString('token').toString().replaceAll('"', '');
      var body = {
        "cart": jsonEncode({
          "delivery_type": 1,
          "payment_type": "cash",
          "products": items,
          "direccion": direccion,
          "factura": factura
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
          Navigator.pop(context);
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

    return IntroductionScreen(
      showDoneButton: true,
      showNextButton: false,
      freeze: canPass != null ? false : true,
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => {processPedido()},
      pages: [
        PageViewModel(
            title: 'Selecciona una dirección',
            bodyWidget: SelectAddress((direccion) => setState(() {
                  canPass = true;
                  direccion = direccion.toString();
                }))),
        PageViewModel(
            title: 'Factura? (opcional)',
            bodyWidget: SelectFactura((facturaId) =>
                setState(() => {factura = facturaId.toString()}))),
        PageViewModel(
            title: 'Resumen',
            footer: Text(
                "Total: Gs. ${formatter.format(int.parse(cartTotal.toString()))}"),
            bodyWidget: Column(children: [
              ...List.generate(
                  items.length,
                  (index) => GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => ProductoDetails(
                                  items[index]['id'], items[index]))),
                      child: Card(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Hero(
                                        tag: items[index]['id'],
                                        child: Image.network(
                                          "http://jadortanner.cu.ma/localizate/images/" +
                                              items[index]['image'],
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
                                              duration: const Duration(
                                                  milliseconds: 300),
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
                                ],
                              ))))),
            ]))
      ],
    );
  }
}

class SelectAddress extends StatefulWidget {
  SelectAddress(this.setDireccion, {Key? key}) : super(key: key);
  var setDireccion;
  @override
  _SelectAddressState createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  var selectedDirection;
  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserModel>();
    return Column(
      children: [
        ...List.generate(
            user.addresses.length,
            (index) => GestureDetector(
                  onTap: () => {
                    setState(
                        () => selectedDirection = user.addresses[index]['id']),
                    widget.setDireccion(user.addresses[index]['id']),
                  },
                  child: AddressCard(
                      direccion: user.addresses[index], id: selectedDirection),
                )),
        TextButton.icon(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddAddress())),
            icon: Icon(Icons.map),
            label: Text('Agregar dirección'))
      ],
    );
  }
}

class SelectFactura extends StatefulWidget {
  SelectFactura(this.setFactura, {Key? key}) : super(key: key);
  var setFactura;
  @override
  _SelectFacturaState createState() => _SelectFacturaState();
}

class _SelectFacturaState extends State<SelectFactura> {
  var facturaid;
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserModel>();
    return Column(
      children: [
        ...List.generate(
            user.facturas.length,
            (index) => GestureDetector(
                  onTap: () => {
                    setState(() => facturaid = user.facturas[index]['id']),
                    widget.setFactura(user.facturas[index]['id'])
                  },
                  child: FacturaCard(user.facturas[index], id: facturaid),
                )),
        TextButton.icon(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AgregarFactura())),
            icon: Icon(Icons.person),
            label: Text('Agregar factura'))
      ],
    );
  }
}
