import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';
import 'package:localizate/globals.dart' as globals;

// ignore: must_be_immutable
class SubcategoriesView extends StatefulWidget {
  SubcategoriesView(this.subcategories, this.categoria, {Key? key})
      : super(key: key);
  List subcategories = [];
  final categoria;

  @override
  _SubcategoriesViewState createState() => _SubcategoriesViewState();
}

class _SubcategoriesViewState extends State<SubcategoriesView>
    with SingleTickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
//lista estatica de subcategories
  late List brands = [];
  //lista dinamica que cambiara de acuerdo a la busqueda
  List listabrandsDinamica = [];
  var windowSizes;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.subcategories.length; i++) {
      if (widget.subcategories[i]['brands'].length > 0) {
        brands.addAll(widget.subcategories[i]['brands']);
      }
    }
    listabrandsDinamica.addAll(brands);
  }
//filtrar por busqueda

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(brands);
    if (query.isNotEmpty) {
      List dummyListData = [];
      dummySearchList.forEach((item) {
        if (item['name'].toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        listabrandsDinamica.clear();
        listabrandsDinamica.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listabrandsDinamica.clear();
        listabrandsDinamica.addAll(brands);
      });
    }
  }

  TextStyle estilosTexto = TextStyle(
      fontFamily: 'Comfortaa', fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    windowSizes = MediaQuery.of(context).size;
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
        body: ListView(
          padding: EdgeInsets.only(top: 20),
          children: <Widget>[
            ...List.generate(listabrandsDinamica.length, (index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tienda(
                              listabrandsDinamica[index]['id'],
                              listabrandsDinamica[index])))
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Card(
                    elevation: globals.cardElevation,
                    child: Container(
                      width: windowSizes.width,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Hero(
                              tag: listabrandsDinamica[index]['id'].toString() +
                                  listabrandsDinamica[index]['image'],
                              child: Image.network(
                                imgUrl + listabrandsDinamica[index]['image'],
                                frameBuilder: (BuildContext context,
                                    Widget child,
                                    int? frame,
                                    bool wasSynchronouslyLoaded) {
                                  if (wasSynchronouslyLoaded) {
                                    return child;
                                  }
                                  return AnimatedOpacity(
                                    child: child,
                                    opacity: frame == null ? 0 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                },
                                height: 90,
                                width: 90,
                                fit: BoxFit.contain,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(listabrandsDinamica[index]['name']),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
          ],
        ));
  }
}
