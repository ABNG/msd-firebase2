import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class QuantityButton extends StatelessWidget {
  final int quantity;
  final Function decrement;
  final Function increment;

  QuantityButton({this.quantity, this.decrement, this.increment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            elevation: 0,
            onPressed: decrement,
            fillColor: Colors.white,
            constraints: BoxConstraints(
              minHeight: 30,
              minWidth: 30,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(
                Icons.minimize,
                color: Colors.black,
                size: 15,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
            child: Text(
              "$quantity",
              style: textStyle,
            ),
          ),
          RawMaterialButton(
            elevation: 0,
            onPressed: increment,
            fillColor: Colors.white,
            constraints: BoxConstraints(
              minHeight: 30,
              minWidth: 30,
            ),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 15,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ],
      ),
    );
  }
}
