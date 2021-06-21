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
              },
              {
                'type': 'options',
                'multiple': false,
                'name': 'Acompañar con:',
                'data': [
                  'Gaseosa',
                  'Helado',
                  'Soda',
                  'Agua',
                ]
              },
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

var shop = {
  "products_img_url": "http://127.0.0.1:8001/images/products/",
  "products": {
    "current_page": 1,
    "data": [
      {
        "id": 3,
        "name": "hambur",
        "barcode": "8465",
        "description":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        "company_id": 2,
        "subcategory_id": 3,
        "image": "product_3_0615202121522660c9595a282bb.jpg",
        "image_2": null,
        "image_3": null,
        "enabled": true,
        "deleted_at": null,
        "created_at": "2021-06-15 21:52:26",
        "updated_at": "2021-06-20 16:55:46",
        "created_by": 3,
        "updated_by": null,
        "deleted_by": null,
        "brand_id": 5,
        "price": "5.000",
        "views": 4,
        "offer_price": "2.500",
        "wholesalers_price": "0.00",
        "rating": {"percent": 0, "rating": 0, "quantity": 0},
        "is_new": true,
        "stocks": [],
        "subcategory": {
          "id": 3,
          "name": "hamburguesas",
          "enabled": true,
          "category_id": 1,
          "deleted_at": null,
          "created_at": "2021-06-08 22:43:03",
          "updated_at": "2021-06-08 22:43:03",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "category": {
            "id": 1,
            "name": "Comida",
            "enabled": true,
            "deleted_at": null,
            "created_at": "2021-06-08 22:41:32",
            "updated_at": "2021-06-08 22:41:32",
            "created_by": 1,
            "updated_by": null,
            "deleted_by": null,
            "commission_percentage": "10.00",
            "stockable": true
          }
        }
      },
      {
        "id": 2,
        "name": "hamburger",
        "barcode": "123456",
        "description":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        "company_id": 2,
        "subcategory_id": 3,
        "image": "placeholder-imagen-error-800x800.png",
        "image_2": null,
        "image_3": null,
        "enabled": true,
        "deleted_at": null,
        "created_at": "2021-06-10 20:37:51",
        "updated_at": "2021-06-20 16:55:49",
        "created_by": 1,
        "updated_by": 3,
        "deleted_by": null,
        "brand_id": 5,
        "price": "10.000",
        "views": 4,
        "offer_price": "5.000",
        "wholesalers_price": "0.00",
        "rating": {"percent": 0, "rating": 0, "quantity": 0},
        "is_new": false,
        "stocks": [],
        "subcategory": {
          "id": 3,
          "name": "hamburguesas",
          "enabled": true,
          "category_id": 1,
          "deleted_at": null,
          "created_at": "2021-06-08 22:43:03",
          "updated_at": "2021-06-08 22:43:03",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "category": {
            "id": 1,
            "name": "Comida",
            "enabled": true,
            "deleted_at": null,
            "created_at": "2021-06-08 22:41:32",
            "updated_at": "2021-06-08 22:41:32",
            "created_by": 1,
            "updated_by": null,
            "deleted_by": null,
            "commission_percentage": "10.00",
            "stockable": true
          }
        }
      },
      {
        "id": 4,
        "name": "Jeans Azules",
        "barcode": "7894",
        "description":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        "company_id": 2,
        "subcategory_id": 6,
        "image": "product_4_0616202100051360c978799cdce.jpg",
        "image_2": "product_4_0616202100051360c97879bf0ad.jpg",
        "image_3": "product_4_0616202100051360c97879dddcd.jpg",
        "enabled": true,
        "deleted_at": null,
        "created_at": "2021-06-16 00:05:13",
        "updated_at": "2021-06-16 00:06:38",
        "created_by": 3,
        "updated_by": null,
        "deleted_by": null,
        "brand_id": 7,
        "price": "35.000",
        "views": 2,
        "offer_price": "30.000",
        "wholesalers_price": "0.00",
        "rating": {"percent": 0, "rating": 0, "quantity": 0},
        "is_new": true,
        "stocks": [],
        "subcategory": {
          "id": 6,
          "name": "pantalones",
          "enabled": true,
          "category_id": 2,
          "deleted_at": null,
          "created_at": "2021-06-08 22:44:03",
          "updated_at": "2021-06-08 22:44:03",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "category": {
            "id": 2,
            "name": "Ropa",
            "enabled": true,
            "deleted_at": null,
            "created_at": "2021-06-08 22:43:44",
            "updated_at": "2021-06-08 22:43:44",
            "created_by": 1,
            "updated_by": null,
            "deleted_by": null,
            "commission_percentage": "10.00",
            "stockable": true
          }
        }
      },
      {
        "id": 1,
        "name": "Whopper",
        "barcode": "0123",
        "description":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        "company_id": 2,
        "subcategory_id": 3,
        "image": "product_1_0608202122503760c02c7d1cf2b.jpg",
        "image_2": null,
        "image_3": null,
        "enabled": true,
        "deleted_at": null,
        "created_at": "2021-06-08 22:50:37",
        "updated_at": "2021-06-20 17:11:19",
        "created_by": 1,
        "updated_by": 3,
        "deleted_by": null,
        "brand_id": 5,
        "price": "15.000",
        "views": 19,
        "offer_price": "10.000",
        "wholesalers_price": "0.00",
        "rating": {"percent": 0, "rating": 0, "quantity": 0},
        "is_new": false,
        "stocks": [
          {
            "id": 1,
            "product_id": 1,
            "company_id": 1,
            "quantity": 100,
            "deleted_at": null,
            "created_at": null,
            "updated_at": null,
            "created_by": 1,
            "updated_by": null,
            "deleted_by": null
          }
        ],
        "subcategory": {
          "id": 3,
          "name": "hamburguesas",
          "enabled": true,
          "category_id": 1,
          "deleted_at": null,
          "created_at": "2021-06-08 22:43:03",
          "updated_at": "2021-06-08 22:43:03",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "category": {
            "id": 1,
            "name": "Comida",
            "enabled": true,
            "deleted_at": null,
            "created_at": "2021-06-08 22:41:32",
            "updated_at": "2021-06-08 22:41:32",
            "created_by": 1,
            "updated_by": null,
            "deleted_by": null,
            "commission_percentage": "10.00",
            "stockable": true
          }
        }
      }
    ],
    "first_page_url": "http://192.168.0.9:8000/shop?page=1",
    "from": 1,
    "last_page": 1,
    "last_page_url": "http://192.168.0.9:8000/shop?page=1",
    "next_page_url": null,
    "path": "http://192.168.0.9:8000/shop",
    "per_page": 24,
    "prev_page_url": null,
    "to": 4,
    "total": 4
  },
  "categories": [
    {
      "id": 1,
      "name": "Comida",
      "enabled": true,
      "deleted_at": null,
      "created_at": "2021-06-08 22:41:32",
      "updated_at": "2021-06-08 22:41:32",
      "created_by": 1,
      "updated_by": null,
      "deleted_by": null,
      "commission_percentage": "10.00",
      "stockable": true,
      "subcategories": [
        //pizza
        {
          "id": 1,
          "name": "pizza",
          "enabled": true,
          "category_id": 1,
          "deleted_at": null,
          "created_at": "2021-06-08 22:42:46",
          "updated_at": "2021-06-08 22:42:46",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "brands": [
            {
              "id": 5,
              "name": "Pizzahut",
              "created_at": "2021-06-08 22:45:52",
              "updated_at": "2021-06-08 22:45:52",
              "deleted_at": null,
              "created_by": 1,
              "updated_by": null,
              "deleted_by": null,
              "products": [
                {
                  "id": 3,
                  "name": "Pizza 1",
                  "barcode": "8465",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_3_0615202121522660c9595a282bb.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-15 21:52:26",
                  "updated_at": "2021-06-20 16:55:46",
                  "created_by": 3,
                  "updated_by": null,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "5.000",
                  "views": 4,
                  "offer_price": "2.500",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": true,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"Extra queso\", \"Mostaza\", \"Piña\", \"Jamón\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 2,
                  "name": "Whopper triple",
                  "barcode": "123456",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "placeholder-imagen-error-800x800.png",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-10 20:37:51",
                  "updated_at": "2021-06-20 16:55:49",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "10.000",
                  "views": 4,
                  "offer_price": "5.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"Extra queso\", \"Mostaza\", \"Piña\", \"Jamón\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 1,
                  "name": "Whopper",
                  "barcode": "0123",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_1_0608202122503760c02c7d1cf2b.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-08 22:50:37",
                  "updated_at": "2021-06-20 17:11:19",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "15.000",
                  "views": 19,
                  "offer_price": "10.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"Extra queso\", \"Mostaza\", \"Piña\", \"Jamón\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                }
              ]
            },
            {
              "id": 4,
              "name": "Pizza chida",
              "created_at": "2021-06-08 22:45:52",
              "updated_at": "2021-06-08 22:45:52",
              "deleted_at": null,
              "created_by": 1,
              "updated_by": null,
              "deleted_by": null,
              "products": [
                {
                  "id": 6,
                  "name": "Mc hamburguesa triple",
                  "barcode": "8469",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_3_0615202121522660c9595a282bb.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-15 21:52:26",
                  "updated_at": "2021-06-20 16:55:46",
                  "created_by": 3,
                  "updated_by": null,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "5.000",
                  "views": 4,
                  "offer_price": "2.500",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": true,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"Extra queso\", \"Mostaza\", \"Piña\", \"Jamón\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 5,
                  "name": "Mc hamburguesa doble",
                  "barcode": "123457",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "placeholder-imagen-error-800x800.png",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-10 20:37:51",
                  "updated_at": "2021-06-20 16:55:49",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "10.000",
                  "views": 4,
                  "offer_price": "5.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"Extra queso\", \"Mostaza\", \"Piña\", \"Jamón\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 4,
                  "name": "Mc Hamburguesa",
                  "barcode": "0124",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_1_0608202122503760c02c7d1cf2b.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-08 22:50:37",
                  "updated_at": "2021-06-20 17:11:19",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "15.000",
                  "views": 19,
                  "offer_price": "10.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"Extra queso\", \"Mostaza\", \"Piña\", \"Jamón\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                }
              ]
            },
          ],
        },
        //hamburguesas
        {
          "id": 3,
          "name": "hamburguesas",
          "enabled": true,
          "category_id": 1,
          "deleted_at": null,
          "created_at": "2021-06-08 22:43:03",
          "updated_at": "2021-06-08 22:43:03",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "brands": [
            {
              "id": 5,
              "name": "burguer king",
              "created_at": "2021-06-08 22:45:52",
              "updated_at": "2021-06-08 22:45:52",
              "deleted_at": null,
              "created_by": 1,
              "updated_by": null,
              "deleted_by": null,
              "products": [
                {
                  "id": 3,
                  "name": "Whopper doble",
                  "barcode": "8465",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_3_0615202121522660c9595a282bb.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-15 21:52:26",
                  "updated_at": "2021-06-20 16:55:46",
                  "created_by": 3,
                  "updated_by": null,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "5.000",
                  "views": 4,
                  "offer_price": "2.500",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": true,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"helado\", \"pizza\", \"queso\", \"jamon\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 2,
                  "name": "Whopper triple",
                  "barcode": "123456",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "placeholder-imagen-error-800x800.png",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-10 20:37:51",
                  "updated_at": "2021-06-20 16:55:49",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "10.000",
                  "views": 4,
                  "offer_price": "5.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"helado\", \"pizza\", \"queso\", \"jamon\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 1,
                  "name": "Whopper",
                  "barcode": "0123",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_1_0608202122503760c02c7d1cf2b.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-08 22:50:37",
                  "updated_at": "2021-06-20 17:11:19",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "15.000",
                  "views": 19,
                  "offer_price": "10.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"helado\", \"pizza\", \"queso\", \"jamon\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                }
              ]
            },
            {
              "id": 4,
              "name": "Mc Donalds",
              "created_at": "2021-06-08 22:45:52",
              "updated_at": "2021-06-08 22:45:52",
              "deleted_at": null,
              "created_by": 1,
              "updated_by": null,
              "deleted_by": null,
              "products": [
                {
                  "id": 6,
                  "name": "Mc hamburguesa triple",
                  "barcode": "8469",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_3_0615202121522660c9595a282bb.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-15 21:52:26",
                  "updated_at": "2021-06-20 16:55:46",
                  "created_by": 3,
                  "updated_by": null,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "5.000",
                  "views": 4,
                  "offer_price": "2.500",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": true,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"helado\", \"pizza\", \"queso\", \"jamon\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 5,
                  "name": "Mc hamburguesa doble",
                  "barcode": "123457",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "placeholder-imagen-error-800x800.png",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-10 20:37:51",
                  "updated_at": "2021-06-20 16:55:49",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "10.000",
                  "views": 4,
                  "offer_price": "5.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"helado\", \"pizza\", \"queso\", \"jamon\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 4,
                  "name": "Mc Hamburguesa",
                  "barcode": "0124",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_1_0608202122503760c02c7d1cf2b.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-08 22:50:37",
                  "updated_at": "2021-06-20 17:11:19",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "15.000",
                  "views": 19,
                  "offer_price": "10.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "product_fields": [
                    {
                      "id": 2,
                      "product_id": 1,
                      "field_id": 1,
                      "value": "10",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 3,
                      "product_id": 1,
                      "field_id": 2,
                      "value": "ff0000",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    },
                    {
                      "id": 4,
                      "product_id": 1,
                      "field_id": 3,
                      "value": "helado",
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:40:56",
                      "updated_at": "2021-06-14 01:40:56",
                      "created_by": 3,
                      "updated_by": null,
                      "deleted_by": null
                    }
                  ],
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "toppings",
                      "type": "options",
                      "multiple": true,
                      "options":
                          "[\n\"helado\", \"pizza\", \"queso\", \"jamon\"\n]",
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                }
              ]
            },
          ],
        },
      ]
    },
    //categoria ropa
    {
      "id": 2,
      "name": "Ropa",
      "enabled": true,
      "deleted_at": null,
      "created_at": "2021-06-08 22:43:44",
      "updated_at": "2021-06-08 22:43:44",
      "created_by": 1,
      "updated_by": null,
      "deleted_by": null,
      "commission_percentage": "10.00",
      "stockable": true,
      "subcategories": [
        {
          "id": 6,
          "name": "pantalones",
          "enabled": true,
          "category_id": 2,
          "deleted_at": null,
          "created_at": "2021-06-08 22:44:03",
          "updated_at": "2021-06-08 22:44:03",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "brands": [
            {
              "id": 5,
              "name": "Ñamopu'a",
              "created_at": "2021-06-08 22:45:52",
              "updated_at": "2021-06-08 22:45:52",
              "deleted_at": null,
              "created_by": 1,
              "updated_by": null,
              "deleted_by": null,
              "products": [
                {
                  "id": 3,
                  "name": "Jeans",
                  "barcode": "8465",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "product_3_0615202121522660c9595a282bb.jpg",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-15 21:52:26",
                  "updated_at": "2021-06-20 16:55:46",
                  "created_by": 3,
                  "updated_by": null,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "5.000",
                  "views": 4,
                  "offer_price": "2.500",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": true,
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "Talla",
                      "type": "options",
                      "multiple": false,
                      "options": ["40", "42", "44", "46", "48"],
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    },
                    {
                      "id": 3,
                      "name": "Color",
                      "type": "options",
                      "multiple": false,
                      "options": ['Rojo', 'Negro', 'Azul', 'Marino'],
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
                {
                  "id": 2,
                  "name": "Jeans Skinny",
                  "barcode": "123456",
                  "description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  "company_id": 2,
                  "subcategory_id": 3,
                  "image": "placeholder-imagen-error-800x800.png",
                  "image_2": null,
                  "image_3": null,
                  "enabled": true,
                  "deleted_at": null,
                  "created_at": "2021-06-10 20:37:51",
                  "updated_at": "2021-06-20 16:55:49",
                  "created_by": 1,
                  "updated_by": 3,
                  "deleted_by": null,
                  "brand_id": 5,
                  "price": "10.000",
                  "views": 4,
                  "offer_price": "5.000",
                  "wholesalers_price": "0.00",
                  "rating": {"percent": 0, "rating": 0, "quantity": 0},
                  "is_new": false,
                  "special_fields": [
                    {
                      "id": 3,
                      "name": "Talla",
                      "type": "options",
                      "multiple": false,
                      "options": ["40", "42", "44", "46", "48"],
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    },
                    {
                      "id": 3,
                      "name": "Color",
                      "type": "options",
                      "multiple": false,
                      "options": ['Rojo', 'Negro', 'Azul', 'Marino'],
                      "nullable": true,
                      "category_id": 1,
                      "deleted_at": null,
                      "created_at": "2021-06-14 01:39:04",
                      "updated_at": "2021-06-14 01:40:16",
                      "created_by": 3,
                      "updated_by": 3,
                      "deleted_by": null,
                      "value": "helado"
                    }
                  ],
                },
              ]
            },
          ],
        },
        {
          "id": 7,
          "name": "camisas",
          "enabled": true,
          "category_id": 2,
          "deleted_at": null,
          "created_at": "2021-06-08 22:44:08",
          "updated_at": "2021-06-08 22:44:08",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "brands": []
        },
        {
          "id": 8,
          "name": "deportivos",
          "enabled": true,
          "category_id": 2,
          "deleted_at": null,
          "created_at": "2021-06-08 22:44:23",
          "updated_at": "2021-06-08 22:44:23",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "brands": []
        },
        {
          "id": 10,
          "name": "bermudas",
          "enabled": true,
          "category_id": 2,
          "deleted_at": null,
          "created_at": "2021-06-08 22:44:37",
          "updated_at": "2021-06-08 22:44:37",
          "created_by": 1,
          "updated_by": null,
          "deleted_by": null,
          "brands": []
        }
      ]
    }
  ],
  "brands": [
    {
      "id": 5,
      "name": "burguer king",
      "created_at": "2021-06-08 22:45:52",
      "updated_at": "2021-06-08 22:45:52",
      "deleted_at": null,
      "created_by": 1,
      "updated_by": null,
      "deleted_by": null,
      "products": [
        {
          "id": 3,
          "name": "hambur",
          "barcode": "8465",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          "company_id": 2,
          "subcategory_id": 3,
          "image": "product_3_0615202121522660c9595a282bb.jpg",
          "image_2": null,
          "image_3": null,
          "enabled": true,
          "deleted_at": null,
          "created_at": "2021-06-15 21:52:26",
          "updated_at": "2021-06-20 16:55:46",
          "created_by": 3,
          "updated_by": null,
          "deleted_by": null,
          "brand_id": 5,
          "price": "5.000",
          "views": 4,
          "offer_price": "2.500",
          "wholesalers_price": "0.00",
          "rating": {"percent": 0, "rating": 0, "quantity": 0},
          "is_new": true
        },
        {
          "id": 2,
          "name": "hamburger",
          "barcode": "123456",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          "company_id": 2,
          "subcategory_id": 3,
          "image": "placeholder-imagen-error-800x800.png",
          "image_2": null,
          "image_3": null,
          "enabled": true,
          "deleted_at": null,
          "created_at": "2021-06-10 20:37:51",
          "updated_at": "2021-06-20 16:55:49",
          "created_by": 1,
          "updated_by": 3,
          "deleted_by": null,
          "brand_id": 5,
          "price": "10.000",
          "views": 4,
          "offer_price": "5.000",
          "wholesalers_price": "0.00",
          "rating": {"percent": 0, "rating": 0, "quantity": 0},
          "is_new": false
        },
        {
          "id": 1,
          "name": "Whopper",
          "barcode": "0123",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          "company_id": 2,
          "subcategory_id": 3,
          "image": "product_1_0608202122503760c02c7d1cf2b.jpg",
          "image_2": null,
          "image_3": null,
          "enabled": true,
          "deleted_at": null,
          "created_at": "2021-06-08 22:50:37",
          "updated_at": "2021-06-20 17:11:19",
          "created_by": 1,
          "updated_by": 3,
          "deleted_by": null,
          "brand_id": 5,
          "price": "15.000",
          "views": 19,
          "offer_price": "10.000",
          "wholesalers_price": "0.00",
          "rating": {"percent": 0, "rating": 0, "quantity": 0},
          "is_new": false
        }
      ]
    },
    {
      "id": 7,
      "name": "fashiongo",
      "created_at": "2021-06-08 22:46:11",
      "updated_at": "2021-06-08 22:46:11",
      "deleted_at": null,
      "created_by": 1,
      "updated_by": null,
      "deleted_by": null,
      "products": [
        {
          "id": 4,
          "name": "Jeans Azules",
          "barcode": "7894",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          "company_id": 2,
          "subcategory_id": 6,
          "image": "product_4_0616202100051360c978799cdce.jpg",
          "image_2": "product_4_0616202100051360c97879bf0ad.jpg",
          "image_3": "product_4_0616202100051360c97879dddcd.jpg",
          "enabled": true,
          "deleted_at": null,
          "created_at": "2021-06-16 00:05:13",
          "updated_at": "2021-06-16 00:06:38",
          "created_by": 3,
          "updated_by": null,
          "deleted_by": null,
          "brand_id": 7,
          "price": "35.000",
          "views": 2,
          "offer_price": "30.000",
          "wholesalers_price": "0.00",
          "rating": {"percent": 0, "rating": 0, "quantity": 0},
          "is_new": true
        }
      ]
    }
  ],
  "companies": [
    {
      "id": 1,
      "name": "Mc Donalds",
      "legal_name": "Mc Donalds",
      "ruc": "123456",
      "contact_name": "mc",
      "street1": "petereby",
      "street2": "ernesto guevara",
      "house_number": "123",
      "email": "mcdonalds@gmail.com",
      "phone": "0982494617",
      "info": null,
      "enabled": true,
      "deleted_at": null,
      "created_at": "2021-06-08 22:41:09",
      "updated_at": "2021-06-08 22:49:31",
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "latitude": "-25.359065194345",
      "longitude": "-57.643156213638",
      "rating": {"percent": 0, "rating": 0, "quantity": 0}
    },
    {
      "id": 2,
      "name": "Burger king",
      "legal_name": "Burger King",
      "ruc": "1234567",
      "contact_name": "Burger",
      "street1": null,
      "street2": null,
      "house_number": null,
      "email": "burger@gmail.com",
      "phone": "0982494617",
      "info": null,
      "enabled": true,
      "deleted_at": null,
      "created_at": "2021-06-08 22:49:22",
      "updated_at": "2021-06-16 00:03:41",
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "latitude": "-25.8052919",
      "longitude": "-55.092472",
      "rating": {"percent": 0, "rating": 0, "quantity": 0}
    }
  ]
};
