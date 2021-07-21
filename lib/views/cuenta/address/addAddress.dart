import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localizate/models/UserModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatefulWidget {
  AddAddress({Key? key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  late GoogleMapController _mapController;

  double camZoom = 14;

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

  late double mapWidth;
  late double mapHeight;
  double iconSize = 40;

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
    _initialCamPosition = CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: camZoom);
    _finalPosition = LatLng(location.latitude, location.longitude);
    setPosition(LatLng(location.latitude, location.longitude));
    setState(() {});
  }

  //se setea una posicion animanco la camara
  setPosition(LatLng coords) {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: coords, zoom: camZoom)));
  }

  Future agregarDireccion() async {
    bool added = await userModel.addAddress(
        _nameController.text,
        _callePrincipal.text,
        _calleSecundaria.text,
        _referencia.text,
        _nroCasaController.text,
        _finalPosition.latitude.toString(),
        _finalPosition.longitude.toString(),
        context);
    if (added) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    userModel = context.read<UserModel>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [addAddress(context), buildMap()],
          ),
        ));
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
                  decoration: InputDecoration(labelText: 'N°'),
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
              decoration: InputDecoration(labelText: 'Calle secundaria'),
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
                  _referencia.text != "") {
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

  Stack buildMap() {
    mapWidth = MediaQuery.of(context).size.width;
    mapHeight = MediaQuery.of(context).size.height * 0.5;
    return Stack(
      alignment: Alignment(0.0, 0.0),
      children: [
        Container(
          width: mapWidth,
          height: mapHeight,
          child: GoogleMap(
            initialCameraPosition: _initialCamPosition,
            myLocationButtonEnabled: true,
            // myLocationEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController _cntlr) {
              _mapController = _cntlr;
              Completer<GoogleMapController>().complete(_mapController);
            },
            onTap: (LatLng coords) {
              setPosition(coords);
            },
            //actualiza el marcador a la nueva zona
            onCameraMove: (CameraPosition position) {
              _finalPosition = position.target;
              // Marker marker = markers[namopuaMarkerId]!;
              // Marker updatedMarker = marker.copyWith(
              //   positionParam: position.target,
              // );
              // // setState(() {
              // markers[namopuaMarkerId] = updatedMarker;
              // // });
            },
            onCameraIdle: () {
              setState(() {});
            },
          ),
        ),
        Positioned(
          top: (mapHeight - iconSize * 2) / 2,
          right: (mapWidth - iconSize * 2) / 2,
          child: new Icon(
            Icons.location_pin,
            size: iconSize,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
