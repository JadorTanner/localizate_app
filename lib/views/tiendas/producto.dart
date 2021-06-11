import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localizate/views/tiendas/parte_arriba_producto.dart';

class Producto extends StatefulWidget {
  Producto(this.producto, {Key? key}) : super(key: key);
  final Map producto;
  @override
  _ProductoState createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  late Map producto;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    producto = widget.producto;
  }

  @override
  Widget build(BuildContext context) {
    var productColor = producto['color'] != null ? producto['color'] : "FF830F";
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(int.parse("0xff" + productColor)),
      appBar: AppBar(
          backgroundColor: Color(int.parse("0xff" + productColor)),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {Navigator.pop(context)},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height,
              child: Stack(
                children: [
                  //seccion blanca con detalles del producto
                  Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(top: screenSize.height * 0.35),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //descripcion del producto
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: Text(
                              producto['description'],
                              style: TextStyle(height: 1.5),
                            ),
                          ),
                          //contador de cantidad
                          CantidadContador(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  height: 50,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(
                                            int.parse("0xff" + productColor))),
                                  ),
                                  child: IconButton(
                                    icon: FaIcon(
                                      FontAwesomeIcons.cartPlus,
                                      color: Colors.grey[500],
                                    ),
                                    onPressed: () => {},
                                  ),
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () => {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      backgroundColor:
                                          MaterialStateProperty.all(Color(
                                              int.parse(
                                                  "0xff" + productColor))),
                                    ),
                                    child: Text(
                                      "Agregar al carrito",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  parte_arriba_producto(context, producto)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//contador de cantidad a agregar el producto
class CantidadContador extends StatefulWidget {
  CantidadContador({Key? key}) : super(key: key);

  @override
  _CantidadContadorState createState() => _CantidadContadorState();
}

class _CantidadContadorState extends State<CantidadContador> {
  int cantItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildCountButton(Icon(Icons.remove), 'remove'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            cantItems.toString().padLeft(2, "0"),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        BuildCountButton(Icon(Icons.add), 'add'),
      ],
    );
  }

  SizedBox BuildCountButton(icon, operation) {
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
                ? cantItems += 1
                : cantItems > 1
                    ? cantItems -= 1
                    : null;
            print(cantItems);
          })
        },
        child: icon,
      ),
    );
  }
}
