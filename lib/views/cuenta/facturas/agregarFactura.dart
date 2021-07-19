import 'package:flutter/material.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:provider/provider.dart';

class AgregarFactura extends StatefulWidget {
  AgregarFactura({Key? key}) : super(key: key);

  @override
  _AgregarFacturaState createState() => _AgregarFacturaState();
}

class _AgregarFacturaState extends State<AgregarFactura> {
  TextEditingController _razonController = TextEditingController();
  TextEditingController _rucController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();
  TextEditingController _principalController = TextEditingController();
  TextEditingController _secundarioController = TextEditingController();
  TextEditingController _nroCasaController = TextEditingController();
  TextEditingController _ciudadController = TextEditingController();

  late UserModel userModel;

  Future addFactura() async {
    String direccion =
        "${_principalController.text}, ${_secundarioController.text} - ${_ciudadController.text}";
    bool added = await userModel.addFactura(
        _razonController.text,
        _rucController.text,
        _emailController.text,
        _telefonoController.text,
        direccion);
    if (added) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    userModel = context.read<UserModel>();
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [facturaForm(context)],
          ),
        ));
  }

  Column facturaForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _razonController,
          decoration: InputDecoration(labelText: 'Razon'),
        ),
        TextField(
          controller: _rucController,
          decoration: InputDecoration(labelText: 'Ruc'),
        ),
        TextField(
          controller: _telefonoController,
          decoration: InputDecoration(labelText: 'Telefono'),
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: _ciudadController,
              decoration: InputDecoration(labelText: 'Ciudad'),
            )),
            Container(
                margin: EdgeInsets.only(left: 20),
                width: 70,
                child: TextField(
                  controller: _nroCasaController,
                  decoration: InputDecoration(labelText: 'N°'),
                  keyboardType: TextInputType.number,
                )),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: _principalController,
              decoration: InputDecoration(labelText: 'Calle principal'),
            )),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: TextField(
              controller: _secundarioController,
              decoration: InputDecoration(labelText: 'Calle secundaria'),
            )),
          ],
        ),
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addFactura();
            }),
      ],
    );
  }
}
