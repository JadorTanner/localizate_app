import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';

class Tiendas extends StatefulWidget {
  Tiendas(this._categoria, {Key key}) : super(key: key);
  final String _categoria;

  final Map tiendas = {
    'comida': [
      {
        'name': 'McDonalds',
        'logo': 'mcdonalds.png',
        'productos': [
          {
            'id': 'BX456',
            'nombre': 'Papas fritas',
            'precio': 5000,
            'descripcion': 'Producto numero 1',
            'img': 'papas_fritas.png'
          },
          {
            'id': 'BX457',
            'nombre': 'Doble Cheddar',
            'precio': 50000,
            'descripcion': 'Producto numero 2',
            'img': 'doble_cheddar.jpg'
          },
          {
            'id': 'BX458',
            'nombre': 'Big Mac',
            'precio': 48500,
            'descripcion': 'Producto numero 3',
            'img': 'big_mac.jpg'
          },
        ]
      },
      {
        'name': 'BurgerKing',
        'logo': 'burger-king.png',
        'productos': [
          {
            'id': 'BX456',
            'nombre': 'Whopper',
            'precio': 5000,
            'descripcion': 'Producto numero 1',
            'img': 'whopper.jpg'
          },
          {
            'id': 'BX457',
            'nombre': 'Whopper Doble',
            'precio': 50000,
            'descripcion': 'Producto numero 2',
            'img': 'whopper_doble.jpg'
          },
          {
            'id': 'BX458',
            'nombre': 'Hamburguesa con queso',
            'precio': 48500,
            'descripcion': 'Hamburguesa con queso',
            'img': 'hamburguesa_con_queso.jpg'
          },
        ]
      },
      {
        'name': "Domino's pizza",
        'logo': 'dominos-pizza.png',
        'productos': [
          {
            'id': 'BX456',
            'nombre': 'Whopper',
            'precio': 5000,
            'descripcion': 'Producto numero 1',
            'img': 'whopper.jpg'
          },
          {
            'id': 'BX457',
            'nombre': 'Whopper Doble',
            'precio': 50000,
            'descripcion': 'Producto numero 2',
            'img': 'whopper_doble.jpg'
          },
          {
            'id': 'BX458',
            'nombre': 'Hamburguesa con queso',
            'precio': 48500,
            'descripcion': 'Hamburguesa con queso',
            'img': 'hamburguesa_con_queso.jpg'
          },
        ]
      },
    ],
    'ropa': [
      {'name': "Ñamopu'a", 'logo': 'mcdonalds.png'},
      {'name': 'Nike', 'logo': 'burger-king.png'},
      {'name': "Ropa", 'logo': 'dominos-pizza.png'},
    ],
    'farmacia': [
      {'name': "Ñamopu'a", 'logo': 'mcdonalds.png'},
      {'name': 'Nike', 'logo': 'burger-king.png'},
      {'name': "Ropa", 'logo': 'dominos-pizza.png'},
    ]
  };

  @override
  _TiendasState createState() => _TiendasState(tiendas[_categoria]);
}

class _TiendasState extends State<Tiendas> {
  _TiendasState(this.tiendas);
  TextEditingController editingController = TextEditingController();
//lista estatica de tiendas

  final List tiendas;
  //lista dinamica que cambiara de acuerdo a la busqueda
  List listaTiendasDinamica = [];

  @override
  void initState() {
    listaTiendasDinamica.addAll(tiendas);
    super.initState();
  }
//filtrar por busqueda

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(tiendas);
    if (query.isNotEmpty) {
      List dummyListData = [];
      dummySearchList.forEach((item) {
        if (item['name'].toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        listaTiendasDinamica.clear();
        listaTiendasDinamica.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listaTiendasDinamica.clear();
        listaTiendasDinamica.addAll(tiendas);
      });
    }
  }

  TextStyle estilos_texto_categorias = TextStyle(
      fontFamily: 'Comfortaa', fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: editingController,
            decoration: InputDecoration(
                labelText: "Buscar tienda de " + widget._categoria,
                hintText: "Buscar tienda de " + widget._categoria,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listaTiendasDinamica.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Tienda(listaTiendasDinamica[index]))),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 150,
                      child: Card(
                        semanticContainer: true,
                        child: Row(
                          children: [
                            Container(
                                width: 150,
                                padding: EdgeInsets.all(20),
                                child: Center(
                                    child: Image.asset(
                                  "assets/img/${listaTiendasDinamica[index]['logo']}",
                                  fit: BoxFit.cover,
                                ))),
                            Expanded(
                                child: Center(
                                    child: Text(
                              listaTiendasDinamica[index]['name'],
                              style: estilos_texto_categorias,
                            )))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
