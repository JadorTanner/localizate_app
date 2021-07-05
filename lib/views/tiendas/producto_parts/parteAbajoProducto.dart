import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParteAbajoProducto extends StatelessWidget {
  const ParteAbajoProducto(
      {Key? key,
      required this.producto,
      required this.extraFields,
      required this.screenSize,
      required this.productColor})
      : super(key: key);

  final Map producto;
  final List extraFields;
  final Size screenSize;
  final productColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      margin: EdgeInsets.only(top: screenSize.height * 0.35),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //descripcion del producto
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                producto['description'],
                style: TextStyle(height: 1.5),
              ),
            ),
            ...extraFields,
            SizedBox(
              height: 20,
            ),
            //contador de cantidad
            CantidadContador(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Color(int.parse("0xff" + productColor))),
                    ),
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.cartPlus,
                        color: Colors.grey[500],
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(
                            Color(int.parse("0xff" + productColor))),
                      ),
                      child: Text(
                        "Agregar al carrito",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//contador de cantidad a agregar el producto
class CantidadContador extends StatefulWidget {
  CantidadContador({Key? key}) : super(key: key);

  @override
  _CantidadContadorState createState() => _CantidadContadorState();
}

class _CantidadContadorState extends State<CantidadContador> {
  int cantItems = 1;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text('Cantidad'),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCountButton(Icon(Icons.remove), 'remove'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              cantItems.toString().padLeft(2, "0"),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          buildCountButton(Icon(Icons.add), 'add'),
        ],
      )
    ]);
  }

  SizedBox buildCountButton(icon, operation) {
    return SizedBox(
      width: 70,
      height: 50,
      child: OutlinedButton(
        autofocus: false,
        clipBehavior: Clip.none,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
            padding: MaterialStateProperty.all(EdgeInsets.zero)),
        onPressed: () => {
          setState(() {
            operation == "add"
                ? cantItems += 1
                : cantItems > 1
                    ? cantItems -= 1
                    // ignore: unnecessary_statements
                    : null;
          })
        },
        child: icon,
      ),
    );
  }
}
