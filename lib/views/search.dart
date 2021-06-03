import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';

class SearchView extends StatefulWidget {
  SearchView({Key key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController editingController = TextEditingController();

//lista estatica de tiendas
  final List tiendas = [
    {'name': 'McDonalds', 'logo': 'mcdonalds.png'},
    {'name': 'BurgerKing', 'logo': 'burger-king.png'},
    {'name': "Domino's pizza", 'logo': 'dominos-pizza.png'},
    {'name': "Ñamopu'a", 'logo': 'mcdonalds.png'},
    {'name': 'Nike', 'logo': 'burger-king.png'},
    {'name': "Ropa", 'logo': 'dominos-pizza.png'},
  ];
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
        if (item.contains(query)) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        TextField(
          onChanged: (value) {
            filterSearchResults(value);
          },
          controller: editingController,
          decoration: InputDecoration(
              labelText: "Buscar tienda",
              hintText: "Buscar tienda",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        ),
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
                child: ListTile(
                  title: Text('${listaTiendasDinamica[index]}'),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
