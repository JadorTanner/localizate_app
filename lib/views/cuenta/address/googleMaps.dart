import 'package:flutter/material.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/views/cuenta/address/addAddress.dart';
import 'package:provider/provider.dart';

class GoogleMapView extends StatefulWidget {
  GoogleMapView({Key? key}) : super(key: key);

  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  //direcciones del usuario
  List direcciones = [];
  var userModel;

  @override
  Widget build(BuildContext context) {
    userModel = context.watch<UserModel>();
    direcciones = userModel.addresses;
    return RefreshIndicator(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView(
            children: [
              TextButton.icon(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAddress()))
                      },
                  icon: Icon(Icons.map_outlined),
                  label: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text('Mis Direcciones'),
                  )),
              ...List.generate(
                  direcciones.length,
                  (index) => Card(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(children: [
                            Text('Nombre: ' + direcciones[index]['name']),
                            Text('Calle Principal: ' +
                                direcciones[index]['street1']),
                            Text('Calle Secundaria: ' +
                                direcciones[index]['street2']),
                          ])))),
            ],
          ),
        ),
        onRefresh: () => userModel.getAddresses());
  }
}
