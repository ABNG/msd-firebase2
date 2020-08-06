import 'package:flutter/material.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';

class ReusableMaterialButton extends StatelessWidget {
  final String title;
  final Function pressMe;

  ReusableMaterialButton({this.title, this.pressMe});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: SizeConfig.screenWidth / 1.1),
      child: MaterialButton(
        onPressed: pressMe,
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: textStyle2,
        ),
      ),
    );
  }
}
