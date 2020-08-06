import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/cart_screens/shipping_address.dart';
import 'package:flutter_msd_app/app_screens/tab_screens/hometab/itemList/Item_List_Screen.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_bag.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_material_button.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class MyBagScreen extends StatefulWidget {
  @override
  _MyBagScreenState createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  double itemPrice = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<ItemModel> myItems = [];
    myItems = ItemModel.item.where((element) => element.addToBag).toList();

    for (ItemModel model in myItems) {
      itemPrice += model.price * model.quantity;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: myItems.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05, bottom: 10),
                        child: Text(
                          "My Cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    FlutterLogo(
                      size: 120,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your cart is currently empty :(",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableMaterialButton(
                        title: "SHOP NOW",
                        pressMe: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => ItemListScreen(
                                isBag: true,
                              ),
                            ),
                          ).then((value) {
                            if (value == true && value != null) {
                              setState(() {});
                            }
                          });
                        }),
                    Spacer(),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05, bottom: 10),
                        child: Text(
                          "My Cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ReusableBag(
                          myItems: myItems[index],
                        ),
                        itemCount: myItems.length,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.07,
                            vertical: SizeConfig.screenHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Subtotal",
                              style: gridStyle.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "AED ${itemPrice.round()}",
                              style: gridStyle.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ReusableMaterialButton(
                      title: "CHECKOUT",
                      pressMe: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ShippingDetails(),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
