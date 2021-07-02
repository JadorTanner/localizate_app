import 'package:flutter/material.dart';
import 'package:localizate/models/CategoryModel.dart';
import 'package:localizate/views/tiendas/tienda-single.dart';

// ignore: must_be_immutable
class Tiendas extends StatefulWidget {
  Tiendas(this.data, {Key? key}) : super(key: key);
  var data;
  @override
  _TiendasState createState() => _TiendasState();
}

class _TiendasState extends State<Tiendas> with TickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
  TextStyle estilosTexto = TextStyle(
      fontFamily: 'Comfortaa', fontSize: 20, fontWeight: FontWeight.bold);
  List<Category> categories = [];
  late TabController _categoriesTabController;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.data.length; i++) {
      if (widget.data[i].subcategories.length > 0) {
        categories.add(widget.data[i]);
      }
    }
    _categoriesTabController =
        TabController(length: categories.length, vsync: this);
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
    return Column(
      children: [
        TabBar(
            controller: _categoriesTabController,
            isScrollable: true,
            tabs: List.generate(categories.length, (index) {
              return Container(
                  padding: EdgeInsets.all(10),
                  child: Text(categories[index].name));
            })),
        Expanded(
            child: TabBarView(
                controller: _categoriesTabController,
                children: List.generate(categories.length, (index) {
                  return SubcategoryTabView(categories[index].subcategories);
                })))
      ],
    );
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
  List subcategories = [];
  late TabController _subcategoriesTabController;
  var windowSizes;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.subcategories.length; i++) {
      if (widget.subcategories[i]['brands'].length > 0) {
        subcategories.add(widget.subcategories[i]);
      }
    }
    _subcategoriesTabController =
        TabController(length: subcategories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    windowSizes = MediaQuery.of(context).size;
    return Column(
      children: [
        TabBar(
            controller: _subcategoriesTabController,
            isScrollable: true,
            tabs: List.generate(subcategories.length, (index) {
              return Container(
                  padding: EdgeInsets.all(5),
                  child: Text(subcategories[index]['name']));
            })),
        Expanded(
            child: TabBarView(
                controller: _subcategoriesTabController,
                children: List.generate(subcategories.length, (index) {
                  List brands = subcategories[index]['brands'];
                  return brands.length > 0
                      ? Column(
                          children: List.generate(brands.length, (brandIndex) {
                            return GestureDetector(
                                onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Tienda(
                                                  brands[brandIndex]['id'])))
                                    },
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Container(
                                      width: windowSizes.width,
                                      padding: EdgeInsets.all(20),
                                      child: Text(brands[brandIndex]['name'])),
                                ));
                          }),
                        )
                      : Center(
                          child: Text('No hemos encontrado marcas'),
                        );
                })))
      ],
    );
  }
}
