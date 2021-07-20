import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:localizate/models/productModel.dart';
import 'package:localizate/utils/capitalize.dart';
import 'package:localizate/utils/format.dart';
import 'package:localizate/views/tiendas/producto_parts/checkbox.dart';
import 'package:localizate/views/tiendas/producto_parts/dropdown.dart';
import 'package:provider/provider.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:http/http.dart' as http;

double parteArribaHeight = 400;

// ignore: must_be_immutable
class ProductoDetails extends StatelessWidget {
  ProductoDetails(this.id, this.localProduct, {Key? key}) : super(key: key);
  int id;
  var localProduct;
  List images = [];
  var extraFields;
  var checkedOptions = [];
  List items = [];
  int contador = 1;
  var itemOnCart;
  bool isOnCart = false;

  @override
  Widget build(BuildContext context) {
    items = context.watch<CartProvider>().items;
    int index =
        items.indexWhere((element) => element['id'] == localProduct['id']);
    if (index != -1) {
      isOnCart = true;
      itemOnCart = items[index];
      contador = int.parse(itemOnCart['cantidad']);
    }
    if (localProduct['image_2'] != null) {
      images.add(localProduct['image_2']);
    }
    if (localProduct['image_3'] != null) {
      images.add(localProduct['image_3']);
    }
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
        body: ListView(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: parteArribaHeight,
              child: CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 0.6,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false),
                  items: [
                    Hero(
                        tag: localProduct['id'].toString() +
                            localProduct['image'],
                        child: Image.network(
                          globals.imgUrl + localProduct['image'],
                          fit: BoxFit.contain,
                          frameBuilder: (BuildContext context, Widget child,
                              frame, bool wasSynchronouslyLoaded) {
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
                        )),
                    ...List.generate(
                      images.length,
                      (index) {
                        return Image.network(
                          globals.imgUrl + images[index],
                          frameBuilder: (BuildContext context, Widget child,
                              frame, bool wasSynchronouslyLoaded) {
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
                        );
                      },
                    )
                  ])),
          ParteAbajoProducto(localProduct, contador, isOnCart)
        ]));
  }
}

// ignore: must_be_immutable
class ParteAbajoProducto extends StatefulWidget {
  ParteAbajoProducto(this.producto, this.contador, this.isOnCart, {Key? key})
      : super(key: key);
  var producto;
  int contador;
  bool isOnCart;
  @override
  _ParteAbajoProductoState createState() => _ParteAbajoProductoState();
}

class _ParteAbajoProductoState extends State<ParteAbajoProducto> {
  List extraFields = [];
  var checkedOptions = [];
  late int contador;
  bool isOnCart = false;
  List relatedProducts = [];
  var producto;
  @override
  void initState() {
    super.initState();

    producto = widget.producto;
    isOnCart = widget.isOnCart;
    contador = widget.contador;

    getProductData();
  }

  //suma una vista al producto
  Future getProductData() async {
    var response = await http.get(Uri.parse(
        'http://181.120.66.16:8001/api/flutter/producto/' +
            producto['id'].toString()));
    if (jsonDecode(response.body)['special_fields'] != null) {
      extraFields = jsonDecode(response.body)['special_fields'];
      getExtraFields(extraFields);
    }
    relatedProducts = jsonDecode(response.body)['related'];
  }

  //extra fields
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
            List<String> options = [];
            for (var i = 0;
                i < jsonDecode(fields[fieldIndex]['options']).length;
                i++) {
              options
                  .add(jsonDecode(fields[fieldIndex]['options'])[i].toString());
            }
            setState(() {});
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: DropdownProduct(fields[fieldIndex]['name'], options),
            );
          }
        default:
          return Text(capitalize(fields[fieldIndex]['name']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - parteArribaHeight,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
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
              Text(producto['description']),
              SizedBox(height: 20),
              ...extraFields,
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CantidadContador(
                      (cont) => setState(() => contador = cont), contador),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        numberFormat(int.parse(producto['price'])),
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text("Total: " +
                          numberFormat(contador *
                                  int.parse(
                                      producto['price'].replaceAll(".", "")))
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
                    child: isOnCart
                        ? TextButton(
                            onPressed: () => {
                              context
                                  .read<CartProvider>()
                                  .removeFromCart(producto),
                              setState(() => isOnCart = false)
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              backgroundColor: MaterialStateProperty.all(
                                  Color(int.parse("0xffFF830F"))),
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Text(
                                  "Remover del carrito",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        : TextButton(
                            onPressed: () => {
                              if (contador > 0)
                                {
                                  context
                                      .read<CartProvider>()
                                      .addToCart(producto, contador),
                                  setState(() => isOnCart = true)
                                }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
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
              ),
            ],
          )),
          SizedBox(
            height: 40,
          ),
          RelatedProducts(relatedProducts)
        ])));
  }
}

//contador de cantidad a agregar el producto
// ignore: must_be_immutable
class CantidadContador extends StatefulWidget {
  CantidadContador(this.setContador, this.contador, {Key? key})
      : super(key: key);
  final setContador;
  int contador;
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
    contador = widget.contador;
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

class RelatedProducts extends StatelessWidget {
  const RelatedProducts(this.products);
  final List products;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(
            products.length,
            (index) => GestureDetector(
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => ProductoDetails(
                                  products[index]['id'], products[index])))
                    },
                child: Card(
                    child: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Image.network(
                      globals.imgUrl + products[index]['image'],
                      fit: BoxFit.contain,
                      frameBuilder: (BuildContext context, Widget child, frame,
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
                    )),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(products[index]['name']),
                            Text(numberFormat(
                                int.parse(products[index]['price'])))
                          ],
                        ))
                  ],
                ))))),
        options: CarouselOptions(viewportFraction: 0.5, disableCenter: false));
  }
}
