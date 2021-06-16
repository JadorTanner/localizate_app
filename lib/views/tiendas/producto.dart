import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localizate/views/tiendas/parte_arriba_producto.dart';
import 'package:localizate/views/tiendas/producto_parts/checkbox.dart';
import 'package:localizate/views/tiendas/producto_parts/dropdown.dart';

class Producto extends StatefulWidget {
  Producto(this.producto, {Key? key}) : super(key: key);
  final Map producto;
  @override
  _ProductoState createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  late Map producto;
  //en caso de que traiga campos extra
  late List extraFields = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    producto = widget.producto;
    if (producto['fields'] != null) {
      var fields = producto['fields'];
      //genera una lista de widgets de acuerdo a lo que se necesite
      extraFields = List<Widget>.generate(fields.length, (fieldIndex) {
        switch (fields[fieldIndex]['type']) {
          case 'options':
            if (fields[fieldIndex]['multiple']) {
              var options = List.generate(fields[fieldIndex]['data'].length,
                  (index) => buildCheckboxes(fields[fieldIndex], index));
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(fields[fieldIndex]['name']), ...options]);
            } else {
              return Row(children: [
                Column(children: [
                  Text(fields[fieldIndex]['name']),
                  DropdownProduct(fields[fieldIndex]['data'])
                ]),
                SizedBox(
                  width: 20,
                )
              ]);
            }
          default:
            return Text(fields[fieldIndex]['name']);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var productColor = producto['color'] != null ? producto['color'] : "FF830F";
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(int.parse("0xff" + productColor)),
      appBar: AppBar(
          backgroundColor: Color(int.parse("0xff" + productColor)),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {Navigator.pop(context)},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  //seccion blanca con detalles del producto
                  seccionBlanca(screenSize, productColor),
                  parte_arriba_producto(context, producto)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container seccionBlanca(Size screenSize, productColor) {
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
            //otras opciones
            Row(
              children: [
                ...extraFields,
              ],
            ),
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
                    : null;
            print(cantItems);
          })
        },
        child: icon,
      ),
    );
  }
}

class buildCheckboxes extends StatefulWidget {
  buildCheckboxes(this.field, this.index, {Key? key}) : super(key: key);
  final field;
  final int index;
  @override
  _buildCheckboxesState createState() => _buildCheckboxesState();
}

class _buildCheckboxesState extends State<buildCheckboxes> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      label: widget.field['data'][widget.index],
      padding: EdgeInsets.zero,
      value: false,
      onChanged: (bool newValue) {
        setState(() {
          isChecked = newValue;
        });
      },
    );
  }
}
