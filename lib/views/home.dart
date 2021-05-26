import 'package:flutter/material.dart';
import 'package:localizate/views/tienda-single.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List secciones;

  @override
  void initState() {
    super.initState();
    secciones = ['ofertas', 'tiendas', 'destacado'];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            secciones.length, (index) => Secciones((index + 1) * 8, index)),
      ),
    );
  }
}

class Secciones extends StatelessWidget {
  const Secciones(this.cantidadItems, this.idSeccion, {Key key})
      : super(key: key);
  final int cantidadItems;
  final int idSeccion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tiendas $idSeccion',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cantidadItems,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Tienda(index))),
                      child: Card(
                          child: Padding(
                        child: Center(child: Text('Tienda $index')),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                      )),
                    )),
          ),
        ],
      ),
    );
  }
}
