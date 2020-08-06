import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class QuantityButtonForBag extends StatelessWidget {
  final int quantity;

  QuantityButtonForBag(this.quantity);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ReusableFlatButton(
            Icons.minimize,
            BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            paddingValue: 8.0,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
            child: Text(
              "$quantity",
              style: textStyle,
            ),
          ),
          ReusableFlatButton(
            Icons.add,
            BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            paddingValue: 0.0,
          ),
        ],
      ),
    );
  }
}

class ReusableFlatButton extends StatelessWidget {
  final IconData icon;
  final borderRadius;
  final paddingValue;

  ReusableFlatButton(this.icon, this.borderRadius, {this.paddingValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.09,
      height: MediaQuery.of(context).size.width * 0.07,
      child: RawMaterialButton(
        elevation: 0,
        fillColor: Colors.grey[300],
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.only(bottom: paddingValue),
          child: Icon(
            icon,
            color: Colors.black,
            size: 15,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }
}
