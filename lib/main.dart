import 'package:flutter/material.dart';
import 'package:localizate/search.dart';
import 'package:localizate/views/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFF830F), accentColor: Color(0xFFD87920)),
      home: Main(),
    ));

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/launcher/icon-foreground.png',
                fit: BoxFit.scaleDown,
                height: 50,
              ),
              Text(
                'Localizate',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        )),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int) {
          print('cambio de página $int');
        },
        children: [
          Home(),
          Center(
            child: Container(
              child: Text('Cuenta'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Carrito'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Contacto'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        mini: false,
        clipBehavior: Clip.none,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchView()))
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Theme.of(context).primaryColor,
          clipBehavior: Clip.none,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    onPressed: () => {_pageController.jumpToPage(0)}),
                IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onPressed: () => {_pageController.jumpToPage(1)}),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () => {_pageController.jumpToPage(2)}),
                IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    onPressed: () => {_pageController.jumpToPage(3)}),
              ],
            ),
          )),
    );
  }
}
