import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localizate/views/tiendas/tiendas.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> categorias = [
    {'name': 'Comida', 'img': 'pizza-home.png', 'categoria': 'comida'},
    {'name': 'Ropa', 'img': 'clothes.png', 'categoria': 'ropa'},
    {'name': 'Farmacia', 'img': 'botiquin.png', 'categoria': 'farmacia'},
  ];
  List<Widget> categoriasWidgets = [];

  // @override
  // void initState() {
  //   super.initState();
  //   categoriasWidgets = List.generate(
  //       categorias.length,
  //       (index) => GestureDetector(
  //           onTap: () => {
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => Tiendas('Comida')))
  //               },
  //           child: Card(
  //               semanticContainer: true,
  //               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //               child: Row(children: [
  //                 Image.asset('assets/img/${categorias[index]['img']}'),
  //                 Expanded(
  //                     child: Container(
  //                         padding: EdgeInsets.symmetric(
  //                             vertical: 50, horizontal: 20),
  //                         child: Text(categorias[index]['name']))),
  //               ]))));
  // }
  TextStyle estilos_texto_categorias = TextStyle(
      fontFamily: 'Comfortaa', fontSize: 24, fontWeight: FontWeight.bold);
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView(controller: _scrollController, children: [
      Image.asset(
        'assets/img/banners/bg-principal.png',
      ),
      SizedBox(height: 10),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 150,
          child: GestureDetector(
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Tiendas(categorias[0]['categoria'])))
                  },
              child: Card(
                  color: Theme.of(context).primaryColor,
                  semanticContainer: true,
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Image.asset('assets/img/${categorias[0]['img']}'),
                    ),
                    Expanded(
                        child: Center(
                            child: Text(
                      categorias[0]['name'],
                      style: estilos_texto_categorias,
                    ))),
                  ])))),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 150,
          child: GestureDetector(
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Tiendas(categorias[1]['categoria'])))
                  },
              child: Card(
                  color: Color(0xFFB5FFF3),
                  semanticContainer: true,
                  child: Row(children: [
                    Expanded(
                        child: Center(
                            child: Text(categorias[1]['name'],
                                style: estilos_texto_categorias))),
                    Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Image.asset('assets/img/${categorias[1]['img']}'),
                    ),
                  ])))),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 150,
          child: GestureDetector(
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Tiendas(categorias[2]['categoria'])))
                  },
              child: Card(
                  color: Color(0xFFCF4B4B),
                  semanticContainer: true,
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Image.asset(
                        'assets/img/${categorias[2]['img']}',
                        width: 80,
                      ),
                    ),
                    Expanded(
                        child: Center(
                            child: Text(categorias[2]['name'],
                                style: estilos_texto_categorias))),
                  ]))))
    ]);
  }
}

// class HomeBK extends StatefulWidget {
//   HomeBK({Key key}) : super(key: key);

//   @override
//   _HomeBKState createState() => _HomeBKState();
// }

// Future getCategorias() async {
//   var response = await http.post(
//       Uri.parse('http://jadortanner.cu.ma/localizate/localizate.php'),
//       body: {'request': 'tiendas'});
//   print(response.statusCode);
// }

// class _HomeBKState extends State<HomeBK> {
//   List categorias;
//   ScrollController _scrollController = ScrollController();
//   int currentMax = 10;
//   // List categorias = [
//   //   'Comida',
//   //   'Ropa',
//   //   'Bebidas',
//   //   'Perfumes',
//   //   'Jugueteria',
//   //   'Panaderia'
//   // ];

//   @override
//   void initState() {
//     super.initState();
//     categorias = List.generate(currentMax, (index) => 'Categoría ${index + 1}');
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         _masCategorias();
//       }
//     });
//   }

//   _masCategorias() {
//     print('mas categorias');
//     for (var i = currentMax; i < currentMax + 10; i++) {
//       categorias.add('Categoria ${i + 1}');
//     }
//     currentMax += 10;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         controller: _scrollController,
//         itemExtent: 150,
//         itemCount: categorias.length,
//         itemBuilder: (context, index) {
//           if (index == categorias.length + 1) {
//             return CupertinoActivityIndicator();
//           }
//           return Seccion(categorias[index]);
//         });
//     // return ListView(
//     //   itemExtent: 100,
//     //   controller: _scrollController,
//     //   children: [
//     //   Image.asset('assets/img/banners/bg-principal.png'),
//     //   SizedBox(
//     //     height: 50,
//     //   ),
//     //   ...List.from(secciones)
//     // ]);
//   }
// }

// class Seccion extends StatelessWidget {
//   const Seccion(this._title, {Key key}) : super(key: key);
//   final String _title;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () => {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Tiendas(_title)))
//             },
//         child: Card(
//             semanticContainer: true,
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             child: Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/pub50-1.jpg'),
//                         fit: BoxFit.cover)),
//                 child: Container(
//                     alignment: Alignment(-1, 0),
//                     color: Color(0xaaffffff),
//                     padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
//                     child: Text(_title)))));
//   }
// }
