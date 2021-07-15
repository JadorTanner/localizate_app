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
    PageViewModel(
        title: 'Factura?',
        bodyWidget: Center(
          child: Text('Facturas'),
        )),
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
