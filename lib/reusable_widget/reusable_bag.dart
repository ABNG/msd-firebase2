import 'package:flutter/material.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/reusable_widget/quantity_buttonsforBag.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

import 'baseline_widget.dart';

class ReusableBag extends StatelessWidget {
  final ItemModel myItems;
  final bool showQuantity;

  ReusableBag({this.myItems, this.showQuantity = true});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          bottom: 8,
          left: SizeConfig.screenWidth * 0.05,
          right: SizeConfig.screenWidth * 0.05),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(-5, -5),
            color: Colors.black12,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    myItems.title,
                    style: gridStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "COLOR:-",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 15,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BaseLineWidget(
                    text: "AED",
                    price: myItems.price.round(),
                    identify: "bag",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  showQuantity
                      ? QuantityButtonForBag(myItems.quantity)
                      : Container(),
                ],
              ),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.30,
            height: SizeConfig.screenHeight * 0.18,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(myItems.image), fit: BoxFit.fitHeight)),
          )
        ],
      ),
    );
  }
}
