import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/producto/producto.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;
import 'package:localizate/views/transitions/productPageRouter.dart';

class Tienda extends StatefulWidget {
  Tienda(this.id, {Key? key}) : super(key: key);

  final int id;
  // final String img;
  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  Future brandDetails() async {
    var response = await http
        .get(Uri.parse(globals.url + "brand/" + widget.id.toString()));
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: brandDetails(),
        initialData: "",
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              var data = snapshot.data;
              return Column(children: [
                Text(data['name']),
                Expanded(
                    child: ListView(
                  children: List.generate(data['products'].length, (prodIndex) {
                    print(data['products'][prodIndex]);
                    return ProductoTienda(data['products'][prodIndex]);
                  }),
                ))
                // ...List.generate(
                //     _productos.length,
                //     (index) => GestureDetector(
                //         onTap: () => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (BuildContext context) =>
                //                     ProductoDetails(_productos[index]))),
                //         child: Card(
                //             margin:
                //                 EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //             child: Padding(
                //                 padding: EdgeInsets.all(20),
                //                 child: Row(
                //                   children: [Text(_productos[index]['name'])],
                //                 )))))
              ]);
            default:
              return Text('done');
          }
        },
      ),
    );
    // return Scaffold(
    //     floatingActionButton: IconButton(
    //         onPressed: () => Navigator.pop(context),
    //         icon: Icon(
    //           Icons.arrow_back,
    //           color: Colors.white,
    //         )),
    //     floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    //     body: Column(children: [
    //       Stack(
    //           alignment: Alignment.center,
    //           clipBehavior: Clip.none,
    //           children: [
    //             // Container(
    //             //     height: 250,
    //             //     padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
    //             //     decoration: BoxDecoration(
    //             //         image: DecorationImage(
    //             //             image: AssetImage(widget.img), fit: BoxFit.cover))),
    //             Positioned(
    //                 width: MediaQuery.of(context).size.width * 0.9,
    //                 bottom: -80,
    //                 child: Card(
    //                     child: Padding(
    //                         padding: EdgeInsets.all(20),
    //                         child:
    //                             Stack(alignment: Alignment.center, children: [
    //                           Column(children: [
    //                             // Image.asset(
    //                             //   widget.tienda['img'],
    //                             //   fit: BoxFit.scaleDown,
    //                             //   height: 100,
    //                             // ),
    //                             SizedBox(
    //                               height: 10,
    //                             ),
    //                             Text(widget.tienda['name']),
    //                           ])
    //                         ]))))
    //           ]),
    //       SizedBox(height: 100),
    //       //contenedor de los productos de la tienda
    //       Expanded(
    //           child: Container(
    //               padding: EdgeInsets.only(top: 10),
    //               decoration: BoxDecoration(
    //                   color: Theme.of(context).primaryColor,
    //                   borderRadius:
    //                       BorderRadius.vertical(top: Radius.circular(20))),
    //               child: ListView(
    //                 children: List.generate(_productos.length,
    //                     (index) => ProductoTienda(_productos[index], index)),
    //               )))
    //     ]));
  }
}

// ignore: must_be_immutable
class ProductoTienda extends StatelessWidget {
  ProductoTienda(this._producto, {Key? key}) : super(key: key);
  final _producto;
  late String imgUrl = globals.imgUrl;
  @override
  Widget build(BuildContext context) {
    print(imgUrl + _producto['image']);
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ProductoDetails(_producto)))
              },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image.network(
                            //   imgUrl +
                            //       (_producto['image'] != null
                            //           ? _producto['image']
                            //           : "placeholder.png"),
                            //   height: 90,
                            //   width: 90,
                            //   fit: BoxFit.cover,
                            // ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_producto['name'].toString()),
                                  Text(_producto['price'].toString())
                                ],
                              ),
                            ),
                          ],
                        )
                      ]))))),
    );
  }
}
