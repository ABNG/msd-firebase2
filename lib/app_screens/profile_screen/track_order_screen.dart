import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_appbar.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_bag.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderDate;
  final String orderNumber;
  final String price;

  TrackOrderScreen({this.orderDate, this.orderNumber, this.price});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> myItems = [];
    myItems = ItemModel.item.where((element) => element.addToBag).toList();
    return ReusableAppBar(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
            child: Text(
              "Track Order",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ReusableColumn(
                  orderDate: orderDate,
                  title: "Order On:",
                ),
                ReusableColumn(
                  orderDate: orderNumber,
                  title: "Order Number:",
                ),
                ReusableColumn(
                  orderDate: price,
                  title: "Total Amount",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.10,
                vertical: SizeConfig.screenHeight * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    DotWidget(),
                    ReusableWidget(),
                    DotWidget(),
                    ReusableWidget(),
                    DotWidget(),
                    ReusableWidget()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ReusableText(
                        text: "Order has been placed",
                        textAlign: TextAlign.start,
                      ),
                      ReusableText(
                        text: "Processing your Order",
                        textAlign: TextAlign.center,
                      ),
                      ReusableText(
                        text: "Order Not dispatched yet",
                        textAlign: TextAlign.center,
                      ),
                      ReusableText(
                        text: "Order Not delivered yet",
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 25, bottom: 5, top: SizeConfig.screenHeight * 0.04),
            child: Text(
              "ORDER ITEMS",
              style: textStyle.copyWith(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: myItems.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: ReusableBag(
                        myItems: myItems[index],
                        showQuantity: false,
                      ),
                    )),
          )
        ],
      ),
    );
  }
}

class ReusableText extends StatelessWidget {
  final String text;
  final textAlign;

  ReusableText({this.text, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

class ReusableColumn extends StatelessWidget {
  const ReusableColumn({
    @required this.orderDate,
    this.title,
  });

  final String title;
  final String orderDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Text(
          "$orderDate",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class DotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
          5,
          (index) => Container(
                width: 5,
                height: 5,
                margin: EdgeInsets.symmetric(horizontal: 5 / 2),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              )),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 30,
          height: 30,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
