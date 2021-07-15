import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/views/cuenta/cuenta_page.dart';
import 'package:provider/provider.dart';

class ProcessCart extends StatefulWidget {
  ProcessCart({Key? key}) : super(key: key);

  @override
  _ProcessCartState createState() => _ProcessCartState();
}

class _ProcessCartState extends State<ProcessCart> {
  List<PageViewModel> pages = [
    PageViewModel(
        title: 'Selecciona una dirección', bodyWidget: SelectAddress()),
    PageViewModel(title: 'Factura?', bodyWidget: SelectFactura()),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showDoneButton: true,
      showNextButton: false,
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => {},
      pages: pages,
    );
  }
}

class SelectAddress extends StatefulWidget {
  SelectAddress({Key? key}) : super(key: key);

  @override
  _SelectAddressState createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserModel>();
    return Column(
      children: List.generate(
        user.addresses.length,
        (index) => AddressCard(direccion: user.addresses[index]),
      ),
    );
  }
}

class SelectFactura extends StatefulWidget {
  SelectFactura({Key? key}) : super(key: key);

  @override
  _SelectFacturaState createState() => _SelectFacturaState();
}

class _SelectFacturaState extends State<SelectFactura> {
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserModel>();
    return Column(
      children: List.generate(
        user.facturas.length,
        (index) => FacturaCard(user.facturas[index]),
      ),
    );
  }
}

class FacturaCard extends StatelessWidget {
  FacturaCard(this.factura, {Key? key}) : super(key: key);
  var factura;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Center(
            child: Text(factura['ruc'] ?? 'Factura'),
          ),
        ),
      ),
    );
  }
}
