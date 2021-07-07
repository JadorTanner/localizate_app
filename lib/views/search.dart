import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  Search(this.categorias, {Key? key}) : super(key: key);
  List categorias;
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List brands = [];
  List listaBrandsDinamica = [];
  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future getBrands() async {
    var categorias = widget.categorias;
    for (var c = 0; c < categorias.length; c++) {
      for (var s = 0; s < categorias[c].subcategories.length; s++) {
        for (var b = 0;
            b < categorias[c].subcategories[s]['brands'].length;
            b++) {
          brands.add(categorias[c].subcategories[s]['brands'][b]);
        }
      }
    }
    return brands;
  }

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
        listaBrandsDinamica.clear();
        listaBrandsDinamica.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listaBrandsDinamica.clear();
        listaBrandsDinamica.addAll(brands);
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
                labelText: "Buscar marcas",
                hintText: "Buscar marcas",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        body: FutureBuilder(
          future: getBrands(),
          initialData: "",
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            listaBrandsDinamica = snapshot.data;
            return Container(
                child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listaBrandsDinamica.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Tienda(
                        //             listaBrandsDinamica[index],
                        //             widget._subCategoria['img']))),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Tienda(listaBrandsDinamica[index]['id']))),
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
                                //             listaBrandsDinamica[index]['img'],
                                //             fit: BoxFit.cover))),
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  listaBrandsDinamica[index]['name'],
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
            ));
          },
        ));
  }
}
