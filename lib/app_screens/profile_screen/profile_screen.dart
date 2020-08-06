import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/first_option_group.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';
import 'order_Screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05,
                  SizeConfig.screenHeight * 0.05, 0, 0),
              child: Text(
                "My Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.05,
                  vertical: SizeConfig.screenHeight * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 78,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(5, 5),
                          color: Colors.black12,
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(
                            "images/user.png",
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.center),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Welcome, Abu Bakar",
                        style: textStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ReusableContainer(
                    cIndex: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ReusableContainer(
                    cIndex: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  final int cIndex;

  ReusableContainer({this.cIndex});

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = [];
    cIndex == 1 ? list = FirstGroup.firstList : list = FirstGroup.secondList;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: List.generate(
          list.length,
          (index) => Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  switch (list[index].title) {
                    case "MY ORDERS":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OrdersScreen()));
                      break;
                    case "CHANGE LANGUAGE":
                      showAlertDialog(context);
                      break;
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Icon(
                          list[index].leading,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          list[index].title,
                          style: gridStyle,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          list[index].trailing,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 0.8,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.32,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "SELECT LANGUAGE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ReusablePadding(
                icon: Icons.radio_button_unchecked,
                iconColor: Colors.grey,
                title: "🇦🇪",
                padding: EdgeInsets.all(20),
                language: "العربية",
                fontSize: 30.0,
              ),
              ReusablePadding(
                icon: Icons.check_circle,
                iconColor: Colors.black,
                title: "🇺🇸",
                padding: EdgeInsets.symmetric(horizontal: 20),
                language: "ENGLISH",
                fontSize: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusablePadding extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final padding;
  final language;
  final double fontSize;

  ReusablePadding(
      {this.icon,
      this.iconColor,
      this.title,
      this.padding,
      this.language,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          Text(
            title,
            style: gridStyle.copyWith(
              fontSize: 30,
            ),
          ),
          Text(
            language,
            style: gridStyle.copyWith(
              fontSize: fontSize,
            ),
          )
        ],
      ),
    );
  }
}
