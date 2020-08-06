import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/profile_screen/order_Screen.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/reusable_widget/reusable_material_button.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class PlaceOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/order.jpg',
                fit: BoxFit.cover,
                height: SizeConfig.screenHeight * 0.45,
              ),
              Divider(
                thickness: 2,
                height: 1,
                indent: SizeConfig.screenWidth * 0.06,
                endIndent: SizeConfig.screenWidth * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Thank You For Your Order",
                  style: gridStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.03),
                child: Text(
                  "Your order has been placed successfully",
                  style: gridStyle.copyWith(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              ReusableMaterialButton(
                  title: "TRACK ORDER",
                  pressMe: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => OrdersScreen()))),
            ],
          ),
        ],
      ),
    );
  }
}
