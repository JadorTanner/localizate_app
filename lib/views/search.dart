import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizate/utils/debouncer.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';
import 'package:http/http.dart' as http;
import 'package:localizate/globals.dart' as globals;

String url = "http://181.120.66.16:8001/api/flutter/";

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
          child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: brands.length,
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
                              Tienda(brands[index]['id']))),
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
                          //             brands[index]['img'],
                          //             fit: BoxFit.cover))),
                          Expanded(
                              child: Center(
                                  child: Text(
                            brands[index]['name'],
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
      )),
    );
  }
}
