import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localizate/models/UserModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class GoogleMapView extends StatefulWidget {
  GoogleMapView({Key? key}) : super(key: key);

  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late GoogleMapController _mapController;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId namopuaMarkerId = MarkerId('userPos');
  CameraPosition _initialCamPosition = CameraPosition(
      target: LatLng(-25.333887493447556, -57.63717781886183), zoom: 14);
  LatLng _finalPosition = LatLng(-25.333887493447556, -57.63717781886183);
  Location _userLocation = Location();

  //inputs de texto
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nroCasaController = TextEditingController();
  TextEditingController _callePrincipal = TextEditingController();
  TextEditingController _calleSecundaria = TextEditingController();
  TextEditingController _referencia = TextEditingController();

  //direcciones del usuario
  List direcciones = [];
  var userModel;
  @override
  void initState() {
    super.initState();
    userLocation();
  }

  //obtiene la posición del usuario
  userLocation() async {
    LocationData location = await _userLocation.getLocation();
    LatLng userPosition = LatLng(location.latitude, location.longitude);
    markers = {
      namopuaMarkerId: Marker(
          draggable: false, position: userPosition, markerId: namopuaMarkerId)
    };
    _initialCamPosition = CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: 14);
    _finalPosition = LatLng(location.latitude, location.longitude);
    setState(() {});
  }

  //se setea una posicion animanco la camara
  setPosition(LatLng coords) {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: coords, zoom: 14)));
  }

  Future agregarDireccion() async {
    userModel.addAddress(
        _nameController.text,
        _callePrincipal.text,
        _calleSecundaria.text,
        _referencia.text,
        _nroCasaController.text,
        _finalPosition.latitude.toString(),
        _finalPosition.longitude.toString(),
        context);
  }

  @override
  Widget build(BuildContext context) {
    userModel = context.watch<UserModel>();
    direcciones = userModel.addresses;
    print(direcciones);
    return RefreshIndicator(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView(
            children: [
              TextButton.icon(
                  onPressed: () => {
                        Scaffold.of(context)
                            .showBottomSheet((context) => BottomSheet(
                                onClosing: () => {},
                                builder: (context) => Center(
                                      child: Column(
                                        children: [
                                          addAddress(context),
                                          buildMap()
                                        ],
                                      ),
                                    )))
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

  Column addAddress(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre de la dirección'),
            )),
            Container(
                margin: EdgeInsets.only(left: 20),
                width: 70,
                child: TextField(
                  controller: _nroCasaController,
                  decoration:
                      InputDecoration(labelText: 'N°', helperText: 'opcional'),
                  keyboardType: TextInputType.number,
                )),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: _callePrincipal,
              decoration: InputDecoration(labelText: 'Calle principal'),
            )),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: TextField(
              controller: _calleSecundaria,
              decoration: InputDecoration(
                  labelText: 'Calle secundaria', helperText: 'opcional'),
            )),
          ],
        ),
        TextField(
          controller: _referencia,
          decoration: InputDecoration(labelText: 'Referencia'),
        ),
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              if (_nameController.text != "" &&
                  _callePrincipal.text != "" &&
                  _referencia.text != "" &&
                  _nroCasaController.text != "") {
                agregarDireccion();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Rellene los campos necesarios'),
                  duration: Duration(seconds: 2),
                ));
              }
            }),
      ],
    );
  }

  Expanded buildMap() {
    return Expanded(
        child: GoogleMap(
      initialCameraPosition: _initialCamPosition,
      myLocationButtonEnabled: true,
      // myLocationEnabled: true,
      zoomControlsEnabled: false,
      markers: Set<Marker>.of(markers.values),
      onMapCreated: (GoogleMapController _cntlr) {
        _mapController = _cntlr;
        Completer<GoogleMapController>().complete(_mapController);
      },
      onTap: (LatLng coords) => setPosition(coords),
      //actualiza el marcador a la nueva zona
      onCameraMove: (CameraPosition position) {
        Marker marker = markers[namopuaMarkerId]!;
        Marker updatedMarker = marker.copyWith(
          positionParam: position.target,
        );
        setState(() {
          markers[namopuaMarkerId] = updatedMarker;
        });
      },
      onCameraIdle: () {
        setState(() {
          _finalPosition = markers.values.first.position;
        });
      },
    ));
  }
}
