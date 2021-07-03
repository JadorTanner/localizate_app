import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/utils/capitalize.dart';
import 'package:localizate/views/tiendas/producto_parts/checkbox.dart';
import 'package:localizate/views/tiendas/producto_parts/dropdown.dart';

class ProductoDetails extends StatefulWidget {
  ProductoDetails(this.producto, {Key? key}) : super(key: key);
  final producto;
  @override
  _ProductoDetailsState createState() => _ProductoDetailsState();
}

class _ProductoDetailsState extends State<ProductoDetails> {
  var producto;
  var extraFields;
  var checkedOptions = [];
  int contador = 0;
  @override
  void initState() {
    super.initState();
    producto = widget.producto;
    if (producto['special_fields'] != null) {
      getExtraFields(producto['special_fields']);
    } else {
      extraFields = [];
    }
  }

  List<Widget> getExtraFields(fields) {
    return extraFields = List<Widget>.generate(fields.length, (fieldIndex) {
      switch (fields[fieldIndex]['type']) {
        case 'options':
          if (fields[fieldIndex]['multiple']) {
            var options = List.generate(
                jsonDecode(fields[fieldIndex]['options']).length, (index) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0x88A3A3A3)))),
                  child: CheckOption(
                    jsonDecode(fields[fieldIndex]['options'])[index],
                    (itemName, checked) => {
                      setState(
                        () => {
                          if (checked)
                            {
                              setState(() => {checkedOptions.add(itemName)})
                            }
                          else
                            {
                              setState(() => {checkedOptions.remove(itemName)})
                            }
                        },
                      )
                    },
                  ));
            });
            return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAlias,
                semanticContainer: true,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(capitalize(fields[fieldIndex]['name'])),
                      ),
                      ...options
                    ]));
          } else {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: DropdownProduct(
                  fields[fieldIndex]['name'], fields[fieldIndex]['options']),
            );
          }
        default:
          return Text(capitalize(fields[fieldIndex]['name']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: Center(
                child: Icon(
              Icons.image,
              size: 50 * 4,
              color: Colors.white,
            )),
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Text(
                        producto['name'],
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(producto['description'] +
                          producto['description'] +
                          producto['description'] +
                          producto['description']),
                      SizedBox(height: 20),
                      ...extraFields,
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CantidadContador(
                              (cont) => setState(() => contador = cont)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Gs. " + producto['price'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text("Total: Gs. " +
                                  (contador *
                                          int.parse(producto['price']
                                              .replaceAll(".", "")))
                                      .toString())
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 80),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart),
                          SizedBox(width: 40),
                          Expanded(
                            child: TextButton(
                              onPressed: () => {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(int.parse("0xffFF830F"))),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: Text(
                                    "Agregar al carrito",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  ))))
        ],
      ),
    );
  }
}

//contador de cantidad a agregar el producto
// ignore: must_be_immutable
class CantidadContador extends StatefulWidget {
  CantidadContador(this.setContador, {Key? key}) : super(key: key);
  final setContador;
  @override
  _CantidadContadorState createState() => _CantidadContadorState();
}

class _CantidadContadorState extends State<CantidadContador> {
  int contador = 1;
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = contador.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCountButton(Icon(Icons.remove), 'remove'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // child: Container(
                //     child: TextField(
                //   controller: _textController,
                //   onChanged: (String newValue) {
                //     setState(() => {
                //           if (int.parse(newValue) > 0)
                //             {contador = int.parse(newValue)}
                //           else
                //             {contador = 1}
                //         });
                //   },
                // ))
                child: Text(
                  contador.toString().padLeft(2, "0"),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              buildCountButton(Icon(Icons.add), 'add'),
            ],
          ),
        ]);
  }

  SizedBox buildCountButton(icon, operation) {
    return SizedBox(
      width: 70,
      height: 50,
      child: OutlinedButton(
        autofocus: false,
        clipBehavior: Clip.none,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
            padding: MaterialStateProperty.all(EdgeInsets.zero)),
        onPressed: () => {
          setState(() {
            operation == "add"
                ? contador += 1
                : contador > 1
                    ? contador -= 1
                    // ignore: unnecessary_statements
                    : null;
          }),
          widget.setContador(contador)
        },
        child: icon,
      ),
    );
  }
}
