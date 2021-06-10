library localizate_app_v1.globals;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool isLogged = false;
List<Map> categorias = [
  {
    'name': 'Comida',
    'icon': FontAwesomeIcons.utensils,
    'img': 'assets/img/bg/burger_bg.jpg',
    'categoria': 'comida',
    'shops': [
      {
        'name': 'McDonalds',
        'img': 'assets/img/shops/comida/mcdonalds/logo.png',
        'path': 'mcdonals',
        'products': [
          {
            'name': 'Papas Fritas',
            'price': 5000,
            'img': 'assets/img/shops/comida/mcdonalds/papas_fritas.png',
            'description': 'Papas fritas'
          },
          {
            'name': 'Doble Cheddar',
            'price': 15000,
            'img': 'assets/img/shops/comida/mcdonalds/doble_cheddar.jpg',
            'description': 'Hamburguesa Doble Cheddar'
          },
          {
            'name': 'Big Mac',
            'price': 20000,
            'img': 'assets/img/shops/comida/mcdonalds/big_mac.jpg',
            'description': 'Hamburguesa Big Mac'
          },
        ]
      },
      {
        'name': 'Burguer King',
        'img': 'assets/img/shops/comida/burgerking/logo.png',
        'path': 'burgerking',
        'products': [
          {
            'name': 'Whopper',
            'price': 7500,
            'img': 'assets/img/shops/comida/burgerking/whopper.jpg',
            'description': 'Hamburguesa Whopper'
          },
          {
            'name': 'Whopper Doble',
            'price': 15500,
            'img': 'assets/img/shops/comida/burgerking/whopper_doble.jpg',
            'description': 'Hamburguesa Whopper doble'
          },
          {
            'name': 'Hamburguesa con queso',
            'price': 17000,
            'img':
                'assets/img/shops/comida/burgerking/hamburguesa_con_queso.jpg',
            'description': 'Hamburguesa con queso'
          },
        ]
      },
      {
        'name': "Domino's Pizza",
        'img': 'assets/img/shops/comida/dominos/logo.png',
        'path': 'dominos',
        'products': [
          {
            'name': 'Parmesana',
            'price': 25000,
            'img': 'assets/img/shops/comida/dominos/parmesana.png',
            'description': 'Pizza parmesana'
          },
          {
            'name': 'Pecado Carnal',
            'price': 30000,
            'img': 'assets/img/shops/comida/dominos/pecado_carnal.png',
            'description': 'Pizza pecado carnal'
          },
          {
            'name': 'Cremozza',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/cremozza.png',
            'description': 'Pizza cremozza'
          },
          {
            'name': 'Barbacoa',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/barbacoa.png',
            'description': 'Pizza barbacoa'
          },
        ]
      },
    ]
  },
  {
    'name': 'Ropa',
    'icon': FontAwesomeIcons.tshirt,
    'img': 'assets/img/bg/clothes_bg.jpg',
    'categoria': 'ropa',
    'shops': [
      {
        'name': "Ñamopu'a",
        'img': 'assets/img/shops/ropa/namopua/logo.png',
        'path': 'namopua',
        'products': [
          {
            'name': 'Skinny azul',
            'price': 40000,
            'img': 'assets/img/shops/ropa/namopua/jeans_skinny_azul.png',
            'description': 'Pantalon skinny azul'
          },
          {
            'name': 'Skinny negro',
            'price': 35000,
            'img': 'assets/img/shops/ropa/namopua/jeans_skinny_negro.png',
            'description': 'Pantalon skinny negro'
          },
          {
            'name': 'Jogger',
            'price': 37000,
            'img': 'assets/img/shops/ropa/namopua/jogger.png',
            'description': 'Pantalon Jogger'
          },
        ]
      },
    ]
  },
  {
    'name': 'Farmacia',
    'icon': FontAwesomeIcons.heartbeat,
    'img': 'assets/img/bg/farmacia_bg.jpg',
    'categoria': 'farmacia',
    'shops': [
      {
        'name': 'McDonalds',
        'img': 'assets/img/shops/comida/mcdonalds/logo.png',
        'path': 'mcdonals',
        'products': [
          {
            'name': 'Papas Fritas',
            'price': 5000,
            'img': 'assets/img/shops/comida/mcdonalds/papas_fritas.png'
          },
          {
            'name': 'Doble Cheddar',
            'price': 15000,
            'img': 'assets/img/shops/comida/mcdonalds/doble_cheddar.jpg'
          },
          {
            'name': 'Big Mac',
            'price': 20000,
            'img': 'assets/img/shops/comida/mcdonalds/big_mac.jpg'
          },
        ]
      },
      {
        'name': 'Burguer King',
        'img': 'assets/img/shops/comida/burgerking/logo.png',
        'path': 'burgerking',
        'products': [
          {
            'name': 'Whopper',
            'price': 7500,
            'img': 'assets/img/shops/comida/burgerking/whopper.jpg'
          },
          {
            'name': 'Whopper Doble',
            'price': 15500,
            'img': 'assets/img/shops/comida/burgerking/whopper_doble.jpg'
          },
          {
            'name': 'Hamburguesa con queso',
            'price': 17000,
            'img':
                'assets/img/shops/comida/burgerking/hamburguesa_con_queso.jpg'
          },
        ]
      },
      {
        'name': "Domino's Pizza",
        'img': 'assets/img/shops/comida/dominos/logo.png',
        'path': 'dominos',
        'products': [
          {
            'name': 'Parmesana',
            'price': 25000,
            'img': 'assets/img/shops/comida/dominos/parmesana.png'
          },
          {
            'name': 'Pecado Carnal',
            'price': 30000,
            'img': 'assets/img/shops/comida/dominos/pecado_carnal.png'
          },
          {
            'name': 'Cremozza',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/hamburguesa_con_queso.png'
          },
          {
            'name': 'Barbacoa',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/barbacoa.png'
          },
        ]
      },
    ]
  },
];
