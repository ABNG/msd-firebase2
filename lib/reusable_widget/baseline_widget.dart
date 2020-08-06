import 'package:flutter/material.dart';

class BaseLineWidget extends StatelessWidget {
  final String text;
  final int price;
  final String identify;

  BaseLineWidget({this.text, this.price, this.identify});

  @override
  Widget build(BuildContext context) {
    return identify == "bag"
        ? BagBaseline(
            text: text,
            price: price,
          )
        : DetailBaseline(
            text: text,
            price: price,
          );
  }
}

class DetailBaseline extends StatelessWidget {
  final String text;
  final int price;
  DetailBaseline({this.text, this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          "$price",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class BagBaseline extends StatelessWidget {
  final String text;
  final int price;
  BagBaseline({this.text, this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          "$price ",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
