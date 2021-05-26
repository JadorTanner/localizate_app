import 'package:flutter/material.dart';

class Tienda extends StatefulWidget {
  Tienda(this.tienda, {Key key}) : super(key: key);

  final int tienda;
  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  List categorias = [
    'categoria 1',
    'categoria 2',
    'categoria 3',
    'categoria 4',
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
            children: List.generate(categorias.length,
                (index) => ProductoTienda(categorias[index])),
          ),
        ));
  }
}

class ProductoTienda extends StatelessWidget {
  const ProductoTienda(this.categoria, {Key key}) : super(key: key);
  final String categoria;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text('Productos con $categoria'),
              SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                            child: Card(
                                child: Padding(
                              child: Center(child: Text('Producto $index')),
                              padding: EdgeInsets.symmetric(horizontal: 30),
                            )),
                          )))
            ],
          )),
    );
  }
}
