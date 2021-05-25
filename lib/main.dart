import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    ));

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First page'),
        ),
        drawer: Drawer(
            child: SafeArea(
          child: Column(
            children: [Text('texto del menu')],
          ),
        )),
        body: Primerapagina());
  }
}

class Primerapagina extends StatelessWidget {
  const Primerapagina({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton.icon(
            onPressed: () => {Navigator.of(context).push(_createRoute())},
            icon: Icon(Icons.arrow_right),
            label: Text('Siguiente página')));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Pagetwo(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

class Pagetwo extends StatelessWidget {
  const Pagetwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('next page'),
      appBar: AppBar(
        title: Text('page two'),
      ),
    );
  }
}
