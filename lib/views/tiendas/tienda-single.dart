import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;
import 'package:localizate/utils/format.dart';
import 'package:localizate/views/tiendas/producto.dart';

String imgUrl = globals.imgUrl;

class Tienda extends StatefulWidget {
  Tienda(this.id, this.brand, {Key? key}) : super(key: key);

  final int id;
  final brand;
  // final String img;
  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List _listItems = [];
  Future brandDetails() async {
    var response = await http
        .get(Uri.parse(globals.apiUrl + "brand/" + widget.id.toString()));
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Hero(
              tag: widget.brand['id'].toString() + widget.brand['image'],
              child: Image.network(
                imgUrl + widget.brand['image'],
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    child: child,
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                height: 90,
                width: 90,
                fit: BoxFit.contain,
              )),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              widget.brand['name'],
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          FutureBuilder(
            future: brandDetails(),
            initialData: "",
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  var data = snapshot.data;

                  //agregar items a la lista animada

                  // fetching data from web api, db...
                  final fetchedList = data['products'];
                  var future = Future(() {});
                  for (var i = 0; i < fetchedList.length; i++) {
                    future = future.then((_) {
                      return Future.delayed(Duration(milliseconds: 50), () {
                        _listItems.add(fetchedList[i]);
                        _listKey.currentState!
                            .insertItem(_listItems.length - 1);
                      });
                    });
                  }
                  return Expanded(
                      child: AnimatedList(
                    padding: EdgeInsets.only(bottom: 20),
                    initialItemCount: _listItems.length,
                    key: _listKey,
                    itemBuilder:
                        (context, prodIndex, Animation<double> animation) {
                      return SlideTransition(
                        position: CurvedAnimation(
                                curve: Curves.easeOut, parent: animation)
                            .drive(Tween<Offset>(
                                begin: Offset(0.1, 0), end: Offset(0, 0))),
                        child: ProductoTienda(_listItems[prodIndex]),
                      );
                    },
                  ));
                default:
                  return Text('done');
              }
            },
          ),
        ]));
  }
}

// ignore: must_be_immutable
class ProductoTienda extends StatelessWidget {
  ProductoTienda(this._producto, {Key? key}) : super(key: key);
  final _producto;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            ProductoDetails(_producto['id'], _producto)))
              },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                  elevation: globals.cardElevation,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Hero(
                                tag: _producto['id'].toString() +
                                    _producto['image'],
                                child: Image.network(
                                  imgUrl + _producto['image'],
                                  frameBuilder: (BuildContext context,
                                      Widget child,
                                      int? frame,
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
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_producto['name'].toString()),
                                  Text(numberFormat(
                                      int.parse(_producto['price'])))
                                ],
                              ),
                            ),
                          ],
                        )
                      ]))))),
    );
  }
}
