import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tiendas.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List secciones;

  List categorias = [
    'Comida',
    'Ropa',
    'Bebidas',
    'Perfumes',
    'Jugueteria',
    'Panaderia'
  ];

  @override
  void initState() {
    super.initState();
    secciones =
        List.generate(categorias.length, (index) => Seccion(categorias[index]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Image.network('https://via.placeholder.com/350x150'),
      ...List.from(secciones)
    ]);
  }
}

class Seccion extends StatelessWidget {
  const Seccion(this._title, {Key key}) : super(key: key);
  final String _title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Tiendas(_title)))
            },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Text(_title)),
        ));
  }
}
