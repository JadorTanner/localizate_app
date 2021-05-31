import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';

class Tiendas extends StatefulWidget {
  Tiendas(this._categoria, {Key key}) : super(key: key);
  final String _categoria;
  @override
  _TiendasState createState() => _TiendasState();
}

class _TiendasState extends State<Tiendas> {
  TextEditingController editingController = TextEditingController();

//lista estatica de tiendas
  final tiendas = List<String>.generate(100, (i) => "Tienda $i");
  //lista dinamica que cambiara de acuerdo a la busqueda
  List<String> listaTiendasDinamica = [];

  @override
  void initState() {
    listaTiendasDinamica.addAll(tiendas);
    super.initState();
  }
//filtrar por busqueda

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(tiendas);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
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
                            builder: (BuildContext context) => Tienda(index))),
                    child: ListTile(
                      title: Text('${listaTiendasDinamica[index]}'),
                    ),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
