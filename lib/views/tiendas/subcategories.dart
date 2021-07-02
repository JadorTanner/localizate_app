import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';
import 'package:localizate/views/tiendas/tiendas_subcategorias.dart';

class SubcategoriesView extends StatefulWidget {
  SubcategoriesView(this.subcategorias, this.categoria, {Key? key})
      : super(key: key);
  final List subcategorias;
  final categoria;

  @override
  _SubcategoriesViewState createState() => _SubcategoriesViewState();
}

class _SubcategoriesViewState extends State<SubcategoriesView> {
  TextEditingController editingController = TextEditingController();
//lista estatica de subcategorias
  late final List subcategorias;
  //lista dinamica que cambiara de acuerdo a la busqueda
  List listasubcategoriasDinamica = [];

  @override
  void initState() {
    subcategorias = widget.subcategorias;
    listasubcategoriasDinamica.addAll(subcategorias);
    super.initState();
  }
//filtrar por busqueda

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(subcategorias);
    if (query.isNotEmpty) {
      List dummyListData = [];
      dummySearchList.forEach((item) {
        if (item['name'].toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        listasubcategoriasDinamica.clear();
        listasubcategoriasDinamica.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listasubcategoriasDinamica.clear();
        listasubcategoriasDinamica.addAll(subcategorias);
      });
    }
  }

  TextStyle estilosTexto = TextStyle(
      fontFamily: 'Comfortaa', fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(toolbarHeight: 100, title: Text(widget.categoria.name)),
        appBar: AppBar(
          toolbarHeight: 100,
          title: TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: editingController,
            decoration: InputDecoration(
                labelText: "Buscar tiendas",
                hintText: "Buscar tiendas",
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
                itemCount: listasubcategoriasDinamica.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Tienda(
                                listasubcategoriasDinamica[index]['id']))),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 150,
                      child: Card(
                        semanticContainer: true,
                        child: Row(
                          children: [
                            // Container(
                            //     width: 150,
                            //     padding: EdgeInsets.all(20),
                            //     child: Center(
                            //         child: Image.asset(
                            //             listasubcategoriasDinamica[index]['img'],
                            //             fit: BoxFit.cover))),
                            Expanded(
                                child: Center(
                                    child: Text(
                              listasubcategoriasDinamica[index]['name'],
                              style: estilosTexto,
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
