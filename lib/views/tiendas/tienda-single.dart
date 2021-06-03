import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/producto.dart';

class Tienda extends StatefulWidget {
  Tienda(this.tienda, {Key key}) : super(key: key);

  final Map tienda;
  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  @override
  Widget build(BuildContext context) {
    List<Map> _productos = widget.tienda['productos'];
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Center(
              child: Text(
            widget.tienda['name'],
            style: TextStyle(fontSize: 12),
          )),
        ),
        body: Column(children: [
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Image.asset("assets/img/${widget.tienda['logo']}"),
          ),
          //contenedor de los productos de la tienda
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: ListView(
                    children: List.generate(_productos.length,
                        (index) => ProductoTienda(_productos[index])),
                  )))
        ]));
  }
}

class ProductoTienda extends StatelessWidget {
  const ProductoTienda(this._producto, {Key key}) : super(key: key);
  final Map _producto;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Producto()))
              },
          child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        clipBehavior: Clip.hardEdge,
                        height: 90,
                        width: 90,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/img/${_producto['img']}",
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_producto['nombre']),
                          Text(_producto['precio'].toString())
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Color(0x5D000000),
                  height: 2,
                )
              ]))),
    );
  }
}
