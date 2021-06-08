import 'package:flutter/material.dart';

class Producto extends StatefulWidget {
  Producto({Key? key}) : super(key: key);

  @override
  _ProductoState createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
      ),
      body: ListView(
        children: [
          Image.network('https://via.placeholder.com/500x400'),
          SizedBox(
            height: 20,
          ),
          Text('Cantidad'),
          Form(
              child: Column(children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Cantidad'),
              initialValue: "1",
            )
          ]))
        ],
      ),
    );
  }
}
