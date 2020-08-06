import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/cart_screens/place_order_Screen.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_appbar.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_material_button.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';
import 'package:flutter_msd_app/utils/utilities/Utils.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myItem = ItemModel.item.where((element) => element.addToBag).toList();
    var myMap = {
      "SUBTOTAL": "${Utils.getSubTotal(myItem).round()} AED",
      "DELIVERY": "25 AED",
      "COUPON CODE": "-130 AED",
    };
    TextEditingController myCoupon = TextEditingController();
    myCoupon.text = "MVP10";
    bool isFirstOption = true;
    return ReusableAppBar(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                "Order Summary",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        elevation: 2,
                        shadowColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "ITEM(S)",
                                            style: textStyle3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "QTY",
                                            style: textStyle3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "PRICE",
                                            style: textStyle3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Column(
                                    children: List.generate(
                                        myItem.length,
                                        (index) => ReusableTableRow(
                                              title: "${myItem[index].title}",
                                              quantity:
                                                  "${myItem[index].quantity}",
                                              price:
                                                  "${myItem[index].price.round()} AED",
                                            )),
                                  )
                                ],
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[300]),
                                    )),
                              ),
                              TableRow(
                                children: [
                                  Column(
                                    children: List.generate(
                                        3,
                                        (index) => ReusableTableRow(
                                              title: "",
                                              quantity:
                                                  "${Utils.getKeys(myMap)[index]}",
                                              price:
                                                  "${Utils.getValues(myMap)[index]}",
                                              index: index,
                                            )),
                                  )
                                ],
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[300]),
                                    )),
                              ),
                              TableRow(
                                children: [
                                  ReusableTableRow(
                                    title: "",
                                    quantity: "TOTAL",
                                    price:
                                        "${Utils.getSubTotal(myItem).round() + 25 - 113} AED",
                                  )
                                ],
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.white,
                                    height: SizeConfig.screenHeight * 0.04,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: TextField(
                                        controller: myCoupon,
                                        style: textStyle,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: LimitedBox(
                                      maxHeight: SizeConfig.screenHeight * 0.04,
                                      child: MaterialButton(
                                        color: Colors.white,
                                        onPressed: () {},
                                        child: Text(
                                          "APPLY",
                                          style: textStyle.copyWith(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "10% discount for mvp application and game design",
                                style: TextStyle(
                                  color: Colors.lightGreenAccent.shade400,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.04,
                      ),
                      Text(
                        "Choose a Payment Method",
                        style: textStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight * 0.18,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 2,
                            spreadRadius: 5,
                          )
                        ]),
                    child: StatefulBuilder(
                      builder: (BuildContext context,
                              void Function(void Function()) setState) =>
                          Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: ReusableRow(
                              icon: Icon(
                                isFirstOption
                                    ? Icons.check_circle
                                    : Icons.radio_button_unchecked,
                                color:
                                    isFirstOption ? Colors.black : Colors.grey,
                              ),
                              title: "Cash on Delivery",
                            ),
                            onTap: () {
                              setState(() => isFirstOption = true);
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() => isFirstOption = false);
                            },
                            child: ReusableRow(
                              icon: Icon(
                                isFirstOption
                                    ? Icons.radio_button_unchecked
                                    : Icons.check_circle,
                                color:
                                    isFirstOption ? Colors.grey : Colors.black,
                              ),
                              title: "Credit / Debit Card",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05),
              child: ReusableMaterialButton(
                title: "PLACE ORDER",
                pressMe: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PlaceOrder())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableTableRow extends StatelessWidget {
  final int index;
  final String title;
  final String quantity;
  final String price;

  ReusableTableRow({this.index = 0, this.title, this.quantity, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: textStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              quantity,
              style: textStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              price,
              style: TextStyle(
                color: index == 2 ? Colors.red.shade900 : Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final Icon icon;
  final String title;

  ReusableRow({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title,
              style: textStyle.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
