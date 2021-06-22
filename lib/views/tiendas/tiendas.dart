import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';
import 'package:localizate/globals.dart' as globals;

class Tiendas extends StatefulWidget {
  Tiendas({Key? key}) : super(key: key);

  @override
  _TiendasState createState() => _TiendasState();
}

class _TiendasState extends State<Tiendas> with SingleTickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
  late TabController _tabController;
  var categories = globals.categories;
  TextStyle estilosTexto = TextStyle(
      fontFamily: 'Comfortaa', fontSize: 20, fontWeight: FontWeight.bold);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
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
                      child: Text(categories[index]['name'].toString()),
                    )),
          ],
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          ...List.generate(
              categories.length,
              (index) =>
                  SubcategoryTabView(categories[index]['subcategories'])),
          // Center(
          //   child: Text('tab 1'),
          // ),
          // Center(
          //   child: Text('tab 2'),
          // ),
          //   ...List.generate(
          //       categories.length,
          //       (index) => SingleChildScrollView(
          //             child: Column(
          //               children:
          //               [...List.generate(subcategories.length,
          //                   (indexSubcategory) =>
          //                 Column(children: [...List.generate(
          //                     subcategories[indexSubcategory],
          //                     (index) => GestureDetector(
          //                           onTap: () => Navigator.push(
          //                               context,
          //                               MaterialPageRoute(
          //                                   builder: (BuildContext context) =>
          //                                       TiendasSubcategorias(
          //                                           subcategories[
          //                                               index]))),
          //                           child: Container(
          //                             padding:
          //                                 EdgeInsets.symmetric(horizontal: 20),
          //                             margin: EdgeInsets.symmetric(vertical: 10),
          //                             height: 150,
          //                             child: Card(
          //                               semanticContainer: true,
          //                               child: Row(
          //                                 children: [
          //                                   Expanded(
          //                                       child: Center(
          //                                           child: Text(
          //                                     subcategories[index][0]
          //                                         ['name'],
          //                                     style: estilosTexto,
          //                                   )))
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                         ))]
          //               ))]
          //             ,
          //           ))
          // ]))
        ]))
      ],
    ));
  }
}

// ignore: must_be_immutable
class SubcategoryTabView extends StatefulWidget {
  SubcategoryTabView(this.subcategories, {Key? key}) : super(key: key);
  var subcategories;
  @override
  _SubcategoryTabViewState createState() => _SubcategoryTabViewState();
}

class _SubcategoryTabViewState extends State<SubcategoryTabView>
    with SingleTickerProviderStateMixin {
  var subcategories;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    subcategories = widget.subcategories;
    _tabController = TabController(length: subcategories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(controller: _tabController, isScrollable: true, tabs: [
          ...List.generate(
              subcategories.length,
              (index) => Tab(
                    child: Text(subcategories[index]['name']),
                  ))
        ]),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          ...List.generate(
              subcategories.length,
              (index) => Column(
                    children: [
                      SizedBox(height: 40),
                      ...List.generate(
                        subcategories[index]['brands'].length,
                        (indexBrand) => GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Tienda(
                                        subcategories[index]['brands']
                                            [indexBrand]))),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Card(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      padding: EdgeInsets.all(20),
                                      child: Row(children: [
                                        Text(subcategories[index]['brands']
                                            [indexBrand]['name']),
                                      ])),
                                ))),
                      )
                    ],
                  ))
        ]))
      ],
    );
  }
}
