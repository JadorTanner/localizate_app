import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';
import 'package:localizate/globals.dart' as globals;

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController editingController = TextEditingController();

//lista estatica de tiendas
  late final List tiendas;
  //lista dinamica que cambiara de acuerdo a la busqueda
  List listaTiendasDinamica = [];

  @override
  void initState() {
    for (var item in globals.categorias) {
      tiendas.add(item['shops']);
    }
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
    print(listaTiendasDinamica);
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
                        builder: (BuildContext context) => Tienda(
                            listaTiendasDinamica[index],
                            listaTiendasDinamica[index]['img']))),
                child: ListTile(
                  title: Text('tienda'),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
