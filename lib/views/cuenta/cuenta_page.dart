import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/utils/widgetsComunes.dart';
import 'package:localizate/views/cuenta/address/addAddress.dart';
import 'package:localizate/views/cuenta/facturas/agregarFactura.dart';
import 'package:localizate/views/cuenta/login.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:pusher_websocket_flutter/pusher.dart';

var formatter = NumberFormat('#,##0', 'es_ES');

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  late UserModel userModel;
  late Channel channel;
  bool isLogged = false;
  List<Widget> pages = [Text('Pedidos'), Text('Direcciones'), Text('Facturas')];
  late TabController _tabController;
  List direcciones = [];
  List facturas = [];
  List orders = [];
  // var textoEvento = "texto_evento";
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: pages.length, vsync: this);
    // userModel.getOrders();
    // userModel.getAddresses();
    // userModel.getFacturas();
    // initPusher();
  }

  // Future<void> initPusher() async {
  //   try {
  //     await Pusher.init("4a54c4ccefa7c6413910", PusherOptions(cluster: "us2"));
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }

  //   Pusher.connect();

  //   channel = await Pusher.subscribe('admin');
  //   channel.bind('update-order', (event) {
  //     print(event.data);
  //     var data = jsonDecode(event.data);
  //     print(data);
  //     print(data['texto']);
  //     setState(() {
  //       textoEvento = data['texto'];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    userModel = context.watch<UserModel>();
    // userModel.logout();
    isLogged = userModel.isLogged;
    direcciones = userModel.addresses;
    orders = userModel.orders;

    // userModel.getFacturas();
    facturas = userModel.facturas;
    return isLogged
        ? Column(
            children: [
              // IconButton(
              //     icon: Icon(Icons.logout), onPressed: () => userModel.logout())
              Container(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userModel.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black)),
                      Text(userModel.email,
                          style: Theme.of(context).textTheme.headline6),
                      IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () => userModel.logout())
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black45,
                    labelPadding:
                        EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    controller: _tabController,
                    tabs: pages),
              ),
              Expanded(
                  child: TabBarView(controller: _tabController, children: [
                RefreshIndicator(
                    child: ListView(
                      children: List.generate(
                          orders.length,
                          (index) => OrderCard(
                              orders[index]['id'].toString(),
                              orders[index]['invoice_number'].toString(),
                              orders[index]['created_at'].toString(),
                              orders[index]['status'],
                              // orders[index]['total'],
                              orders[index]['delivery_type'],
                              orders[index]['payment_type'])),
                    ),
                    onRefresh: () => userModel.setOrders()),
                // ListView(
                //   children: [Center(child: Text('Ordenes'))],
                // ),
                RefreshIndicator(
                    child: ListView(
                      children: [
                        // Text(textoEvento),
                        TextButton.icon(
                            onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddAddress()))
                                },
                            icon: Icon(Icons.map_outlined),
                            label: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Text('Agregar Dirección'),
                            )),
                        ...List.generate(
                            direcciones.length,
                            (index) =>
                                AddressCard(direccion: direcciones[index])),
                      ],
                    ),
                    onRefresh: () => userModel.setAddresses()),
                RefreshIndicator(
                    child: ListView(children: [
                      TextButton.icon(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AgregarFactura()))
                              },
                          icon: Icon(Icons.map_outlined),
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Text('Agregar Factura'),
                          )),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: [
                          ...List.generate(facturas.length,
                              (index) => FacturaCard(facturas[index])),
                        ],
                      )
                    ]),
                    onRefresh: () => userModel.setFacturas())
              ]))
            ],
          )
        : LoginPage();
  }
}
