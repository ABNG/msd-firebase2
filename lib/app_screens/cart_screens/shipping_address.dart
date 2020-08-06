import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/cart_screens/new_shipping_address.dart';
import 'package:flutter_msd_app/app_screens/cart_screens/order_screen.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/address_model.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_appbar.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_material_button.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class ShippingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableAppBar(
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Select Shipping Address",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 22.0,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        child: Container(
                          decoration: kBoxDecoration,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.radio_button_unchecked,
                                      color: index == 0
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 30, 8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: getMyList(list[index])),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.delete_solid,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                  itemCount: list.length,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ShippingAddress())),
                child: Container(
                  height: SizeConfig.screenHeight * 0.06,
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: kBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "ADD NEW SHIPPING ADDRESS",
                          style: gridStyle,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05),
                child: ReusableMaterialButton(
                  title: "CONTINUE",
                  pressMe: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => OrderScreen())),
                ),
              )
            ],
          )),
    );
  }

  List<Widget> getMyList(var map) {
    List<Widget> getRows = [];
    map.forEach(
      (key, value) => getRows.add(
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                key,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return getRows;
  }
}
