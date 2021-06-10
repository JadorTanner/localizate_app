import 'package:flutter/material.dart';

class Producto1 extends StatefulWidget {
  Producto1(this.producto, {Key? key}) : super(key: key);
  final Map producto;
  @override
  _Producto1State createState() => _Producto1State();
}

class _Producto1State extends State<Producto1> {
  late Map producto;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    producto = widget.producto;
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
        // backgroundColor: Color(0xff6159ff),
        floatingActionButton: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: Column(children: [
          Container(
            width: screenSize,
            height: 250,
          ),
          //contenedor de los productos de la tienda
          Expanded(
              child: Container(
            width: screenSize,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                  top: -125,
                  right: 0,
                  child: Image.asset(
                    producto['img'],
                    width: 200,
                    height: 200,
                    scale: 0.5,
                  )),
              Container(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        producto['name'],
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('Descripcion',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[300])),
                      Text(
                        producto['description'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(producto['price'].toString()),
                      SizedBox(
                        height: 200,
                      ),
                      ElevatedButton.icon(
                          onPressed: () => {},
                          icon: Icon(Icons.shopping_cart),
                          label: Text('Agregar al carrito'))
                    ],
                  ))
            ]),
          ))
        ]));
  }
}
