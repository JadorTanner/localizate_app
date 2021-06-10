import 'package:flutter/material.dart';

class Producto2 extends StatefulWidget {
  Producto2(this.producto, {Key? key}) : super(key: key);
  final Map producto;

  @override
  _Producto2State createState() => _Producto2State();
}

class _Producto2State extends State<Producto2> {
  late Map producto;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    producto = widget.producto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xff6159ff),
        floatingActionButton: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(producto['img']),
                SizedBox(
                  height: 20,
                ),
                Text(
                  producto['name'],
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(producto['description']),
                SizedBox(
                  height: 30,
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    onPressed: () => {},
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Agregar al carrito'))
              ],
            )));
  }
}
