import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/utils/debouncer.dart';
import 'package:localizate/utils/widgetsComunes.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;

String url = globals.apiUrl;

// ignore: must_be_immutable
class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List brands = [];
  List listaBrandsDinamica = [];
  TextEditingController editingController = TextEditingController();
  Debouncer _debouncer = Debouncer(milliseconds: 300);
  @override
  void initState() {
    super.initState();
  }

  Future getBrands(name) async {
    var body = {"name": name};
    var response = await http.post(Uri.parse(url + "search"), body: body);

    if (response.statusCode == 200) {
      if (name != "") {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse.length > 0) {
          setState(() {
            brands = jsonResponse;
          });
        } else {
          setState(() {
            brands = [];
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('No hemos encontrado resultados para su búsqueda'),
            duration: Duration(seconds: 3),
          ));
        }
      } else {
        setState(() {
          brands = [];
        });
      }
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
            _debouncer.run(() {
              getBrands(value);
            });
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
      body: Container(
          padding: EdgeInsets.only(top: 20), child: BrandsCuadricula(brands)
          /*Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20),
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Tienda(brands[index]['id'], brands[index]))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: globals.cardElevation,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Hero(
                                tag: brands[index]['id'].toString() +
                                    brands[index]['image'],
                                child: Image.network(
                                  imgUrl + brands[index]['image'],
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
                                      duration:
                                          const Duration(milliseconds: 300),
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
                            Text(
                              brands[index]['name'] ?? 'name',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )*/
          ),
    );
  }
}
