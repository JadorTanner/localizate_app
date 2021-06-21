import 'package:flutter/material.dart';
import 'package:localizate/utils/capitalize.dart';
import 'package:localizate/views/tiendas/producto_parts/parteAbajoProducto.dart';
import 'package:localizate/views/tiendas/producto_parts/parteArribaProducto.dart';
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
  var checkedOptions = [];
  var productColor;
  var fields;
  @override
  void initState() {
    super.initState();
    producto = widget.producto;
    productColor = producto['color'] != null ? producto['color'] : "FF830F";
    if (producto['fields'] != null) {
      fields = producto['fields'];
      //genera una lista de widgets de acuerdo a lo que se necesite
      getExtraFields(fields);
    }
  }

  List<Widget> getExtraFields(fields) {
    return extraFields = List<Widget>.generate(fields.length, (fieldIndex) {
      switch (fields[fieldIndex]['type']) {
        case 'options':
          if (fields[fieldIndex]['multiple']) {
            var options = List.generate(
                fields[fieldIndex]['data'].length,
                (index) => CheckOption(
                      fields[fieldIndex]['data'][index],
                      (itemName, checked) => {
                        setState(
                          () => {
                            if (checked)
                              {
                                setState(() => {checkedOptions.add(itemName)})
                              }
                            else
                              {
                                setState(
                                    () => {checkedOptions.remove(itemName)})
                              }
                          },
                        )
                      },
                      productColor: "0xff" + productColor,
                    ));
            return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAlias,
                semanticContainer: true,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(capitalize(fields[fieldIndex]['name'])),
                      ),
                      ...options
                    ]));
          } else {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: DropdownProduct(
                  fields[fieldIndex]['name'], fields[fieldIndex]['data']),
            );
          }
        default:
          return Text(capitalize(fields[fieldIndex]['name']));
      }
    });
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
                  ParteAbajoProducto(
                    producto: producto,
                    extraFields: extraFields,
                    screenSize: screenSize,
                    productColor: productColor,
                  ),
                  parteArribaProducto(context, producto)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
