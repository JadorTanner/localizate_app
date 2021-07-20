import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localizate/models/CategoryModel.dart';
import 'package:localizate/utils/format.dart';
import 'package:localizate/views/cart/cartPage.dart';
import 'package:localizate/views/tiendas/subcategories.dart';
import 'package:localizate/globals.dart' as globals;

String imgUrl = globals.imgUrl;

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home(this.categories, this.reload, {Key? key}) : super(key: key);
  List<Category> categories;
  var reload;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categorias = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    categorias = widget.categories;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(controller: _scrollController, children: [
      Image.asset(
        'assets/img/banners/bg-principal.png',
      ),
      SizedBox(height: 10),
      categorias.length > 0
          ? Categories(categorias)
          : Center(
              child: Column(
              children: [
                Text('Por favor verifique su conexión a internet'),
                TextButton(
                    onPressed: () => widget.reload(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('Recargar'),
                    ))
              ],
            ))
    ]);
  }
}

class Categories extends StatelessWidget {
  const Categories(this.categorias, {Key? key}) : super(key: key);
  final List categorias;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          categorias.length, (index) => CategoryCard(categorias[index], index)),
    );
  }
}

// tarjeta de categoria
class CategoryCard extends StatelessWidget {
  const CategoryCard(this.categoria, this.index, {Key? key}) : super(key: key);
  final Category categoria;
  final int index;
  @override
  Widget build(BuildContext context) {
    final double indexPar = index % 2;
    TextStyle estilosTextoCategorias = TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: Colors.white);
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 200,
        child: GestureDetector(
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubcategoriesView(
                              categoria.subcategories, categoria)))
                },
            child: Card(
                clipBehavior: Clip.hardEdge,
                semanticContainer: true,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(imgUrl + categoria.image)))),
                    // image: AssetImage(categoria['img']))),
                    CustomPaint(
                      child: Container(
                          padding: EdgeInsets.all(20),
                          alignment: indexPar == 0
                              ? Alignment.bottomLeft
                              : Alignment.bottomRight,
                          child: Text(categoria.name,
                              style: estilosTextoCategorias)),
                      size: Size(
                          100,
                          (200 * 0.625)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(indexPar),
                    ),
                  ],
                )
                // child: Row(
                //     textDirection: (index % 2) == 0
                //         ? TextDirection.ltr
                //         : TextDirection.rtl,
                //     children: [
                //       Expanded(
                //           flex: 1,
                //           child: Container(
                //             alignment: Alignment.center,
                //             transformAlignment: Alignment.center,
                //             transform: Matrix4.rotationZ(
                //                 (index % 2) == 0 ? -0.3 : 0.3),
                //             child: FaIcon(
                //               categoria['icon'],
                //               color: Colors.white,
                //               size: 60,
                //             ),
                //           )),
                //       Expanded(
                //           flex: 2,
                //           child: Center(
                //               child: Text(categoria['name'],
                //                   style: estilosTextoCategorias))),
                //     ])
                )));
  }
}

class RPSCustomPainter extends CustomPainter {
  RPSCustomPainter(this.indexPar);
  final double indexPar;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      // ..color = Color.fromARGB(255, 33, 150, 243)
      ..color = Color(0xFFFF830F)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(indexPar == 0 ? 0 : size.width, size.height);
    path_0.lineTo(
        indexPar == 0 ? size.width * 0.5 : size.width * 0.5, size.height);
    path_0.lineTo(indexPar == 0 ? size.width * 0.25 : size.width * 0.75, 0);
    path_0.lineTo(indexPar == 0 ? 0 : size.width, 0);
    path_0.lineTo(indexPar == 0 ? 0 : size.width, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
