import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';
import 'package:localizate/globals.dart' as globals;
import 'package:localizate/views/tiendas/tiendas_subcategorias.dart';

class Tiendas extends StatefulWidget {
  Tiendas({Key? key}) : super(key: key);

  @override
  _TiendasState createState() => _TiendasState();
}

class _TiendasState extends State<Tiendas> with TickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
  late TabController _tabController;
  var shop = globals.shop;
  var categories;
  List subcategories = [];
  List subcategoriesPages = [];
  TextStyle estilosTexto = TextStyle(
      fontFamily: 'Comfortaa', fontSize: 20, fontWeight: FontWeight.bold);
  @override
  void initState() {
    super.initState();
    categories = shop['categories'];
    for (var i = 0; i < categories.length; i++) {
      subcategories.add(categories[i]['subcategories']);
    }
    for (var i = 0; i < subcategories.length; i++) {
      subcategoriesPages.add(subcategories[i]);
    }
    _tabController = TabController(length: 2, vsync: this);
  }
//filtrar por busqueda

  // void filterSearchResults(String query) {
  //   List dummySearchList = [];
  //   dummySearchList.addAll(tiendas);
  //   if (query.isNotEmpty) {
  //     List dummyListData = [];
  //     dummySearchList.forEach((item) {
  //       if (item['name'].toLowerCase().contains(query.toLowerCase())) {
  //         dummyListData.add(item);
  //       }
  //     });
  //     setState(() {
  //       listaTiendasDinamica.clear();
  //       listaTiendasDinamica.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       listaTiendasDinamica.clear();
  //       listaTiendasDinamica.addAll(tiendas);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            ...List.generate(
                categories.length,
                (index) => Tab(
                      child: Text(categories[index]['name']),
                      icon: Icon(Icons.fastfood),
                    )),
            // Tab(
            //   child: Text('cateogoria 1'),
            //   icon: Icon(Icons.fastfood),
            // ),
            // Tab(
            //     child: Text('cateogoria 2'),
            //     icon: Icon(
            //       Icons.shopping_basket_rounded,
            //     ))
          ],
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          ...List.generate(categories.length, (index) => buildSubcategoryPage())
        ]))
        /*Expanded(
            child: TabBarView(controller: _tabController, children: [
          ...List.generate(subcategoriesPages.length, (indexpage) {
            print(indexpage);
            return Column(
              children: [
                    GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TiendasSubcategorias(
                                          subcategoriesPages[indexpage]
                                              [indexSubcategory]))),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 150,
                            child: Card(
                              semanticContainer: true,
                              child: Row(
                                children: [
                                  Text('subcategoria')
                                  // Expanded(
                                  //     child: Center(
                                  //         child: Text(
                                  //   subcategoriesPages[indexpage]
                                  //       [indexSubcategory]['name'],
                                  //   style: estilosTexto,
                                  // )))
                                ],
                              ),
                            ),
                          ),
                        )
              ],
            );
            
          })
        ]))*/
      ],
    ));
  }

  Column buildSubcategoryPage() {
    TabController _subcategoryController =
        TabController(length: 6, vsync: this);
    return Column(
      children: [
        TabBar(controller: _subcategoryController, isScrollable: true, tabs: [
          ...List.generate(
              6,
              (indexSubcat) => Tab(
                    child: Text('subcategoria ' + indexSubcat.toString()),
                    icon: Icon(Icons.fastfood),
                  ))
        ]),
        Expanded(
            child: TabBarView(controller: _subcategoryController, children: [
          ...List.generate(
            6,
            (index) => SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                      6,
                      (index) => GestureDetector(
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) => TiendasSubcategorias(
                            //             subcategoriesPages[indexpage][indexSubcategory]))),
                            onTap: () => {},
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              height: 150,
                              child: Card(
                                  semanticContainer: true,
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Text('Tienda')
                                        // Expanded(
                                        //     child: Center(
                                        //         child: Text(
                                        //   subcategoriesPages[indexpage]
                                        //       [indexSubcategory]['name'],
                                        //   style: estilosTexto,
                                        // )))
                                      ],
                                    ),
                                  )),
                            ),
                          ))
                ],
              ),
            ),
          )
        ]))
      ],
    );
  }
}
