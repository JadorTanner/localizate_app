import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/producto.dart';

class Tienda extends StatefulWidget {
  Tienda(this.tienda, {Key key}) : super(key: key);

  final int tienda;
  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  List<Map> _productos = [
    {
      'id': 'BX456',
      'nombre': 'Producto 1',
      'precio': 5000,
      'descripcion': 'Producto numero 1'
    },
    {
      'id': 'BX457',
      'nombre': 'Producto 2',
      'precio': 50000,
      'descripcion': 'Producto numero 2'
    },
    {
      'id': 'BX458',
      'nombre': 'Producto 3',
      'precio': 48500,
      'descripcion': 'Producto numero 3'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Center(
              child: Text(
            'Tienda ${widget.tienda}',
            style: TextStyle(fontSize: 12),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(_productos.length,
                (index) => ProductoTienda(_productos[index])),
          ),
        ));
  }
}

class ProductoTienda extends StatelessWidget {
  const ProductoTienda(this._producto, {Key key}) : super(key: key);
  final Map _producto;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Producto()))
                  },
              child: Card(
                child: Row(
                  children: [
                    Image.network('https://via.placeholder.com/100x100'),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(_producto['nombre']),
                          Text(_producto['precio'].toString())
                        ],
                      ),
                    ))
                  ],
                ),
              )),
        ));
  }
}
