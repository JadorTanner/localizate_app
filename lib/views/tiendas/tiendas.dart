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
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
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
            Tab(
              child: Text('cateogoria 1'),
              icon: Icon(Icons.fastfood),
            ),
            Tab(
                child: Text('cateogoria 2'),
                icon: Icon(
                  Icons.shopping_basket_rounded,
                ))
          ],
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          Center(
            child: Text('tab 1'),
          ),
          Center(
            child: Text('tab 2'),
          )
        ]))
      ],
    ));
  }
}
