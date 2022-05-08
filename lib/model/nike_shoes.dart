import 'package:flutter/cupertino.dart';

class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int color;
  final int modelNumber;

  NikeShoes({
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.images,
    required this.color,
    required this.modelNumber,
  });
}

final shoes = <NikeShoes>[
  NikeShoes(
      model: 'Trainer Running',
      oldPrice: 130,
      currentPrice: 100,
      images: [
        'images/nike_shoes/nike1_1.jpg',
        'images/nike_shoes/nike1_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 99),
  NikeShoes(
      model: 'KD Mega 2',
      oldPrice: 175,
      currentPrice: 130,
      images: [
        'images/nike_shoes/nike2_1.jpg',
        'images/nike_shoes/nike2_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 22),
  NikeShoes(
      model: 'Nike AF1 Vantage',
      oldPrice: 130,
      currentPrice: 99,
      images: [
        'images/nike_shoes/nike3_1.jpg',
        'images/nike_shoes/nike3_2.jpg',
        'images/nike_shoes/nike3_3.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 78),
  NikeShoes(
      model: 'Nike AF1 `Hoops`',
      oldPrice: 199,
      currentPrice: 155,
      images: [
        'images/nike_shoes/nike4_1.jpg',
        'images/nike_shoes/nike4_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 77),
  NikeShoes(
      model: 'Nike Blazer low',
      oldPrice: 125,
      currentPrice: 99,
      images: [
        'images/nike_shoes/nike5_1.jpg',
        'images/nike_shoes/nike5_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 11),
  NikeShoes(
      model: 'Jordan 1 Smoke Grey',
      oldPrice: 250,
      currentPrice: 200,
      images: [
        'images/nike_shoes/nike6_1.jpg',
        'images/nike_shoes/nike6_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 1),
  NikeShoes(
      model: 'Nike Air Jordan 4',
      oldPrice: 250,
      currentPrice: 220,
      images: [
        'images/nike_shoes/nike7_1.jpg',
        'images/nike_shoes/nike7_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 44),
  NikeShoes(
      model: 'Jordan High Gym Red',
      oldPrice: 350,
      currentPrice: 250,
      images: [
        'images/nike_shoes/nike8_1.jpg',
        'images/nike_shoes/nike8_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 001),
  NikeShoes(
      model: 'AirMax 97 Silver',
      oldPrice: 175,
      currentPrice: 150,
      images: [
        'images/nike_shoes/nike9_1.jpg',
        'images/nike_shoes/nike9_2.jpg',
      ],
      color: 0xFFF6F6F6,
      modelNumber: 97),
];

const List sizeShoes = ["6", "7", "8", "9", "10", "11"];

const List imgShoes = [
  {"img": 'images/nike_shoes/kobe.jpg', "name": "Kobe IV", "open": 1},
  {"img": 'images/nike_shoes/kobe2.jpg', "name": "Kobe V", "open": 1},
  {"img": 'images/nike_shoes/lb.jpg', "name": "Lebron XXII", "open": 1},
  {"img": 'images/nike_shoes/lb2.jpg', "name": "Lebron X", "open": 0},
  {
    "img": 'images/nike_shoes/nike6_1.jpg',
    "name": "Jordan Smoke Grey",
    "open": 0
  },
  {
    "img": 'images/nike_shoes/jordan.jpg',
    "name": "Jordan slides black",
    "open": 1
  },
  {
    "img": 'images/nike_shoes/jordan2.jpg',
    "name": "Jordan slides black",
    "open": 0
  },
];

const List cartList = [
  {
    "img": "images/nike_shoes/kobe.jpg",
    "name": "Kobe IV",
    "price": "\$150",
    "size": "10 US"
  },
  {
    "img": "images/nike_shoes/lb2.jpg",
    "name": "Lebron X",
    "price": "\$140",
    "size": "9 US"
  },
  {
    "img": "images/nike_shoes/nike7_1.jpg",
    "name": "Nike Jordan 4",
    "price": "\$220",
    "size": "7 US"
  },
  {
    "img": "images/nike_shoes/nike8_1.jpg",
    "name": "Jordan High Gym Red",
    "price": "\$250",
    "size": "8 US"
  },
  {
    "img": "images/nike_shoes/nike6_1.jpg",
    "name": "Jordan 1 Smoke Grey",
    "price": "\$260",
    "size": "7 US"
  },
];
