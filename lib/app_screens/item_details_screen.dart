import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/custom_icons/my_cart_icons.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/reusable_widget/baseline_widget.dart';
import 'package:flutter_msd_app/reusable_widget/quantity_buttons.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class ItemDetailScreen extends StatefulWidget {
  final int index;

  ItemDetailScreen(this.index);

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  List<bool> selected = [
    false,
    false,
    true,
  ];
  List<Color> colors = [
    Color(0xffFFF9F1),
    Color(0xff75330A),
    Color(0xff1F2226)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.40,
            color: Colors.red,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  '${ItemModel.item[widget.index].image}',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back,
                          color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Row(
                    children: <Widget>[
                      SafeArea(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                              ItemModel.item[widget.index].favourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.black),
                        ),
                      ),
                      SafeArea(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(MyCart.shopping_cart, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: SizeConfig.screenWidth / 2.5,
                  bottom: SizeConfig.screenWidth * 0.05,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 5,
                        height: 5,
                        decoration: circleShape,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: circleShape,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: circleShape,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          ItemModel.item[widget.index].title,
                          style: gridStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        ItemModel.item[widget.index].oldPrice > 0.0
                            ? Text(
                                "AED ${ItemModel.item[widget.index].oldPrice.round()}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.5,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ItemModel.item[widget.index].desc,
                          style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ItemModel.item[widget.index].oldPrice > 0.0
                            ? BaseLineWidget(
                                text: "AED",
                                price:
                                    ItemModel.item[widget.index].price.round(),
                              )
                            : Text(
                                "AED ${ItemModel.item[widget.index].price.round()}",
                                style: gridStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Text(
                      "Select Color",
                      style: textStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected[0] = true;
                              selected[1] = false;
                              selected[2] = false;
                            });
                          },
                          child: ReusableContainer(colors[0], selected[0]),
                        ),
                        GestureDetector(
                          child: ReusableContainer(
                            colors[1],
                            selected[1],
                          ),
                          onTap: () {
                            setState(() {
                              selected[0] = false;
                              selected[1] = true;
                              selected[2] = false;
                            });
                          },
                        ),
                        GestureDetector(
                          child: ReusableContainer(colors[2], selected[2]),
                          onTap: () {
                            setState(() {
                              selected[0] = false;
                              selected[1] = false;
                              selected[2] = true;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Quantity",
                          style: gridStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        QuantityButton(
                          quantity: ItemModel.item[widget.index].quantity,
                          increment: () {
                            setState(() {
                              ItemModel.item[widget.index].quantity++;
                            });
                          },
                          decrement: () {
                            setState(() {
                              if (ItemModel.item[widget.index].quantity == 1) {
                                return;
                              }
                              ItemModel.item[widget.index].quantity--;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Builder(
                          builder: (BuildContext context) {
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: SizeConfig.screenWidth / 2.5),
                              child: OutlineButton.icon(
                                icon: Icon(
                                  MyCart.shopping_cart,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  ItemModel.item[widget.index].addToBag = true;

                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "item added to bag".toUpperCase(),
                                        style: textStyle3,
                                      ),
                                      backgroundColor: Colors.black87,
                                      action: SnackBarAction(
                                        onPressed: () {},
                                        label: "OK",
                                        textColor: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                                highlightedBorderColor: Colors.black,
                                label: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 3.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            );
                          },
                        ),
                        ReusableButton(
                          title: "Checkout",
                          icon: Icons.add_shopping_cart,
                          pressMe: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  final Color color;
  final bool selected;

  ReusableContainer(this.color, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      height: MediaQuery.of(context).size.width * 0.1,
      margin: EdgeInsets.only(right: 6),
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8, right: 8),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]),
          ),
          selected
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  final title;
  final icon;
  final Function pressMe;
  ReusableButton({this.title, this.icon, this.pressMe});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width / 2.5),
      child: MaterialButton(
        onPressed: pressMe,
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
