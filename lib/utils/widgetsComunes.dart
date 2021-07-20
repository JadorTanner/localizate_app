import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  // ignore: avoid_init_to_null
  const AddressCard({Key? key, required this.direccion, this.id = null})
      : super(key: key);

  final direccion;
  final id;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            color: (id != null && id == direccion['id'])
                ? Colors.greenAccent
                : null,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(children: [
                  Text('Nombre: ' + direccion['name']),
                  Text('Calle Principal: ' + direccion['street1']),
                  Text('Calle Secundaria: ' + direccion['street2']),
                ]))));
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard(
    this.orderId,
    this.orderNumber,
    this.orderDate,
    this.orderState,
    // this.orderTotal,
    this.deliveryType,
    this.paymentType, {
    Key? key,
  }) : super(key: key);

  final String orderId;
  final String orderNumber;
  final String orderDate;
  final String orderState;
  final int deliveryType;
  // final String orderTotal;
  final String paymentType;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Text(orderNumber,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white)),
                    Text(orderDate.split(" ")[0],
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black38)),
                    Text(orderDate.split(" ")[1],
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black38))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(orderState,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Theme.of(context).primaryColor)),
                  Row(
                    children: [
                      Text(paymentType),
                      SizedBox(
                        width: 20,
                      ),
                      // Text("Gs. " + orderTotal),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Text(deliveryType == 1 ? "delivery" : "pasar a buscar"),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class FacturaCard extends StatelessWidget {
  // ignore: avoid_init_to_null
  FacturaCard(this.factura, {Key? key, this.id = null}) : super(key: key);
  var factura;
  final id;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: (id != null && id == factura['id']) ? Colors.greenAccent : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Razon: ${factura['razon'] ?? 'Razon'}"),
              Text("RUC: ${factura['ruc'] ?? 'Factura'}")
            ],
          ),
        ),
      ),
    );
  }
}
