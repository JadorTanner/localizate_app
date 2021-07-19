import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.direccion,
  }) : super(key: key);

  final direccion;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            // color: direccion['is_default'] == true
            //     ? Theme.of(context).primaryColor
            //     : Colors.white,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(children: [
                  Text('Nombre: ' + direccion['name']),
                  Text('Calle Principal: ' + direccion['street1']),
                  Text('Calle Secundaria: ' + direccion['street2']),
                  Text(direccion['number'] != null
                      ? 'Nro: ' + direccion['number'].toString()
                      : ''),
                  Text('Referencia: ' + direccion['reference']),
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Razon: ' + factura['razon']),
                    Text('Ruc: ' + factura['ruc']),
                  ],
                ),
                Text('Email: ' + factura['email']),
                Text('Telefono: ' + factura['telefono']),
                Text(factura['direccion'])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
