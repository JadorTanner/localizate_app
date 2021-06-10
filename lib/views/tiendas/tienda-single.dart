import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/producto1.dart';
import 'package:localizate/views/tiendas/producto2.dart';

class Tienda extends StatefulWidget {
  Tienda(this.tienda, this.img, {Key? key}) : super(key: key);

  final Map tienda;
  final String img;
  @override
  _TiendaState createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  @override
  Widget build(BuildContext context) {
    List<Map> _productos = widget.tienda['products'];
    print(_productos);
    return Scaffold(
        floatingActionButton: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: Column(children: [
          Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                    height: 250,
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.img), fit: BoxFit.cover))),
                Positioned(
                    width: MediaQuery.of(context).size.width * 0.9,
                    bottom: -80,
                    child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Column(children: [
                                Image.asset(
                                  widget.tienda['img'],
                                  fit: BoxFit.scaleDown,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(widget.tienda['name']),
                              ])
                            ]))))
              ]),
          SizedBox(height: 100),
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
                        (index) => ProductoTienda(_productos[index], index)),
                  )))
        ]));
  }
}

class ProductoTienda extends StatelessWidget {
  const ProductoTienda(this._producto, this.index, {Key? key})
      : super(key: key);
  final Map _producto;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => index % 2 == 0
                            ? Producto1(_producto)
                            : Producto2(_producto)))
              },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              _producto['img'],
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_producto['name']),
                                  Text(_producto['price'].toString())
                                ],
                              ),
                            ),
                          ],
                        )
                      ]))))),
    );
  }
}
