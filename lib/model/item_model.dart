import 'package:flutter/material.dart';

class ItemModel {
  final String image;
  final String desc;
  final double price;
  bool favourite;
  final String title;
  final double oldPrice;
  int quantity;
  bool addToBag;
  final int index;
  final bool isSpecial;
  Color color;

  ItemModel(
      {this.image,
      this.desc,
      this.price,
      this.favourite,
      this.title,
      this.oldPrice,
      this.quantity,
      this.addToBag,
      this.index,
      this.isSpecial,
      this.color});

  static final List<ItemModel> item = [
    ItemModel(
      image: "images/photo1.jpeg",
      desc: "Black Living Room",
      price: 5000.00,
      favourite: false,
      title: "Brown Sofa",
      oldPrice: 0.0,
      quantity: 2,
      addToBag: false,
      index: 0,
      isSpecial: true,
    ),
    ItemModel(
      image: "images/photo4.jpeg",
      desc: "Black Living Room",
      price: 5000.00,
      favourite: true,
      title: "Brown Sofa",
      oldPrice: 600.00,
      quantity: 2,
      addToBag: false,
      index: 1,
      isSpecial: true,
    ),
    ItemModel(
      image: "images/photo5.jpeg",
      desc: "Black Living Room",
      price: 5000.00,
      favourite: false,
      title: "Brown Sofa",
      oldPrice: 0.0,
      quantity: 2,
      addToBag: false,
      index: 2,
      isSpecial: true,
    ),
    ItemModel(
      image: "images/photo6.jpeg",
      desc: "Black Living Room",
      price: 5000.00,
      favourite: true,
      title: "Brown Sofa",
      oldPrice: 600.00,
      quantity: 2,
      addToBag: false,
      index: 3,
      isSpecial: false,
    ),
    ItemModel(
      image: "images/photo7.jpeg",
      desc: "Black Living Room",
      price: 5000.00,
      favourite: true,
      title: "Brown Sofa",
      oldPrice: 0.0,
      quantity: 2,
      addToBag: false,
      index: 4,
      isSpecial: false,
    ),
  ];
}
