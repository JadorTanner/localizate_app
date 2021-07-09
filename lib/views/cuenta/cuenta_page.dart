import 'package:flutter/material.dart';
import 'package:localizate/models/UserModel.dart';
import 'package:localizate/views/cuenta/login.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

var formatter = NumberFormat('#,##0', 'es_ES');

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  bool isLogged = false;
  List<Widget> pages = [Text('Pedidos'), Text('Direcciones'), Text('Facturas')];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var userModel = context.watch<UserModel>();
    isLogged = userModel.isLogged;
    userModel.getOrders();
    List orders = userModel.orders;
    return isLogged
        ? Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userModel.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black)),
                      Text(userModel.email,
                          style: Theme.of(context).textTheme.headline6),
                      IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () => userModel.logout())
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black45,
                    labelPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    controller: _tabController,
                    tabs: pages),
              ),
              Expanded(
                  child: TabBarView(controller: _tabController, children: [
                ListView(
                  children: List.generate(
                      orders.length,
                      (index) => OrderCard(
                          orders[index]['id'].toString(),
                          orders[index]['invoice_number'].toString(),
                          orders[index]['created_at'].toString(),
                          orders[index]['status'],
                          formatter
                              .format(int.parse(
                                  double.parse(orders[index]['total'])
                                      .toString()))
                              .toString()
                              .toString(),
                          orders[index]['delivery_type'],
                          orders[index]['payment_type'])),
                ),
                ListView(
                  children: [Center(child: Text('Direcciones'))],
                ),
                ListView(
                  children: [Center(child: Text('Facturas'))],
                )
              ]))
            ],
          )
        : LoginPage();
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard(
    this.orderId,
    this.orderNumber,
    this.orderDate,
    this.orderState,
    this.orderTotal,
    this.deliveryType,
    this.paymentType, {
    Key? key,
  }) : super(key: key);

  final String orderId;
  final String orderNumber;
  final String orderDate;
  final String orderState;
  final int deliveryType;
  final String orderTotal;
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
                      Text("Gs. " + orderTotal),
                      SizedBox(
                        width: 20,
                      ),
                      Text(deliveryType == 1 ? "delivery" : "pasar a buscar"),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
