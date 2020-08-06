import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/profile_screen/track_order_screen.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_appbar.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = ItemModel.item.where((element) => element.addToBag).toList();
    return ReusableAppBar(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
            child: Text(
              "My Orders",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ReusableColumn(
                  orderTitle: "112244",
                  orderPlaced: "29/07/2020",
                  list: list,
                  price: "AED 1195",
                  confirmation: "WAITING FOR CONFIRMATION",
                ),
                ReusableColumn(
                  orderTitle: "112255",
                  orderPlaced: "30/07/2020",
                  list: list,
                  price: "AED 2095",
                  confirmation: "DELIVERED",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableColumn extends StatelessWidget {
  final String orderTitle;
  final String orderPlaced;
  final list;
  final String price;
  final String confirmation;

  ReusableColumn(
      {this.orderTitle,
      this.orderPlaced,
      this.list,
      this.price,
      this.confirmation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => TrackOrderScreen(
            orderNumber: orderTitle,
            price: price,
            orderDate: orderPlaced,
          ),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.02, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Order #$orderTitle",
                        style: textStyle3.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Placed on: $orderPlaced",
                        style: textStyle3.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "VIEW DETAILS>>",
                        style: textStyle3.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: List.generate(
                        list.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            list[index].title,
                            style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          price,
                          style: textStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          confirmation,
                          style: TextStyle(
                            color: confirmation == "DELIVERED"
                                ? Colors.green
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
