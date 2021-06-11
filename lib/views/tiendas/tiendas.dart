import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';

class Tiendas extends StatefulWidget {
  Tiendas(this._categoria, {Key? key}) : super(key: key);
  final Map _categoria;

  @override
  _TiendasState createState() => _TiendasState();
}

class _TiendasState extends State<Tiendas> {
  TextEditingController editingController = TextEditingController();
//lista estatica de tiendas
  late final List tiendas;
  //lista dinamica que cambiara de acuerdo a la busqueda
  List listaTiendasDinamica = [];

  @override
  void initState() {
    tiendas = widget._categoria['shops'];
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

  TextStyle estilosTextoCategorias = TextStyle(
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
                labelText: "Buscar tienda de " + widget._categoria['name'],
                hintText: "Buscar tienda de " + widget._categoria['name'],
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
                            builder: (BuildContext context) => Tienda(
                                listaTiendasDinamica[index],
                                widget._categoria['img']))),
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
                                        listaTiendasDinamica[index]['img'],
                                        fit: BoxFit.cover))),
                            Expanded(
                                child: Center(
                                    child: Text(
                              listaTiendasDinamica[index]['name'],
                              style: estilosTextoCategorias,
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
