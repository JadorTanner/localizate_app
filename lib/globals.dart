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
            'description':
                'Papas fritas, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'color': 'ffc920'
          },
          {
            'name': 'Doble Cheddar',
            'price': 15000,
            'img': 'assets/img/shops/comida/mcdonalds/doble_cheddar.jpg',
            'description':
                'Hamburguesa Doble Cheddar, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'color': 'a98000',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'queso',
                  'mostaza',
                  'mayonesa',
                  'lechuga',
                  'pan',
                  'tomate'
                ]
              }
            ]
          },
          {
            'name': 'Big Mac',
            'price': 20000,
            'img': 'assets/img/shops/comida/mcdonalds/big_mac.jpg',
            'description':
                'Hamburguesa Big Mac, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'queso',
                  'mostaza',
                  'mayonesa',
                  'lechuga',
                  'pan',
                  'tomate'
                ]
              }
            ]
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
            'description':
                'Hamburguesa Whopper, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.'
          },
          {
            'name': 'Whopper Doble',
            'price': 15500,
            'img': 'assets/img/shops/comida/burgerking/whopper_doble.jpg',
            'description':
                'Hamburguesa Whopper doble, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.'
          },
          {
            'name': 'Hamburguesa con queso',
            'price': 17000,
            'img':
                'assets/img/shops/comida/burgerking/hamburguesa_con_queso.jpg',
            'description':
                'Hamburguesa con queso, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.'
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
            'description':
                'Pizza parmesana, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
          },
          {
            'name': 'Pecado Carnal',
            'price': 30000,
            'img': 'assets/img/shops/comida/dominos/pecado_carnal.png',
            'description':
                'Pizza pecado carnal, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
          },
          {
            'name': 'Cremozza',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/cremozza.png',
            'description':
                'Pizza cremozza, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
          },
          {
            'name': 'Barbacoa',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/barbacoa.png',
            'description':
                'Pizza barbacoa, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
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
            'description':
                'Pantalon skinny azul, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': false,
                'name': 'tallas',
                'data': [
                  '44',
                  '46',
                  '48',
                  '50',
                ]
              },
              {
                'type': 'options',
                'multiple': false,
                'name': 'color',
                'data': [
                  'rojo',
                  'azul',
                  'negro',
                  'marino',
                ]
              }
            ]
          },
          {
            'name': 'Skinny negro',
            'price': 35000,
            'img': 'assets/img/shops/ropa/namopua/jeans_skinny_negro.png',
            'description':
                'Pantalon skinny negro, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': false,
                'name': 'tallas',
                'data': [
                  '44',
                  '46',
                  '48',
                  '50',
                ]
              },
              {
                'type': 'options',
                'multiple': false,
                'name': 'color',
                'data': [
                  'rojo',
                  'azul',
                  'negro',
                  'marino',
                ]
              }
            ]
          },
          {
            'name': 'Jogger',
            'price': 37000,
            'img': 'assets/img/shops/ropa/namopua/jogger.png',
            'description':
                'Pantalon Jogger, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': false,
                'name': 'tallas',
                'data': [
                  '44',
                  '46',
                  '48',
                  '50',
                ]
              },
              {
                'type': 'options',
                'multiple': false,
                'name': 'color',
                'data': [
                  'rojo',
                  'azul',
                  'negro',
                  'marino',
                ]
              }
            ]
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
            'img': 'assets/img/shops/comida/mcdonalds/papas_fritas.png',
            'description':
                'Papas fritas, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'color': 'ffc920'
          },
          {
            'name': 'Doble Cheddar',
            'price': 15000,
            'img': 'assets/img/shops/comida/mcdonalds/doble_cheddar.jpg',
            'description':
                'Hamburguesa Doble Cheddar, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'color': 'a98000',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'queso',
                  'mostaza',
                  'mayonesa',
                  'lechuga',
                  'pan',
                  'tomate'
                ]
              }
            ]
          },
          {
            'name': 'Big Mac',
            'price': 20000,
            'img': 'assets/img/shops/comida/mcdonalds/big_mac.jpg',
            'description':
                'Hamburguesa Big Mac, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'queso',
                  'mostaza',
                  'mayonesa',
                  'lechuga',
                  'pan',
                  'tomate'
                ]
              }
            ]
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
            'description':
                'Hamburguesa Whopper, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.'
          },
          {
            'name': 'Whopper Doble',
            'price': 15500,
            'img': 'assets/img/shops/comida/burgerking/whopper_doble.jpg',
            'description':
                'Hamburguesa Whopper doble, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.'
          },
          {
            'name': 'Hamburguesa con queso',
            'price': 17000,
            'img':
                'assets/img/shops/comida/burgerking/hamburguesa_con_queso.jpg',
            'description':
                'Hamburguesa con queso, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.'
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
            'description':
                'Pizza parmesana, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
          },
          {
            'name': 'Pecado Carnal',
            'price': 30000,
            'img': 'assets/img/shops/comida/dominos/pecado_carnal.png',
            'description':
                'Pizza pecado carnal, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
          },
          {
            'name': 'Cremozza',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/cremozza.png',
            'description':
                'Pizza cremozza, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
          },
          {
            'name': 'Barbacoa',
            'price': 20000,
            'img': 'assets/img/shops/comida/dominos/barbacoa.png',
            'description':
                'Pizza barbacoa, Lorem ipsum dolor sit amet, consectetur adipiscing elit. etiam nec suscipit arcu, feugiat fermentum ex cras nec scelerisque magna, eu dignissim ante.',
            'fields': [
              {
                'type': 'options',
                'multiple': true,
                'name': 'toppings',
                'data': [
                  'extra-queso',
                  'comino',
                  'salame',
                  'borde relleno',
                  'jamón',
                  'extra-salsa'
                ]
              }
            ]
          },
        ]
      }
    ]
  },
];
