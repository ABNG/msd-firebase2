import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/tab_screens/hometab/itemList/itemLists.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/custom_icons/my_cart_icons.dart';
import 'package:flutter_msd_app/provider/page_enum.dart';
import 'package:flutter_msd_app/provider/page_selection.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

class ItemListScreen extends StatefulWidget {
  final bool isBag;

  ItemListScreen({this.isBag = false});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SizeConfig().init(context);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Platform.isAndroid
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  widget.isBag
                      ? Navigator.pop(context, true)
                      : Provider.of<PageSelection>(context, listen: false)
                          .setPage = PageName.ITEM_PAGE;
                })
            : IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  widget.isBag
                      ? Navigator.pop(context, true)
                      : Provider.of<PageSelection>(context, listen: false)
                          .setPage = PageName.ITEM_PAGE;
                }),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                MyCart.shopping_cart,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: controller,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide.none,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey, //this is by default color
          labelPadding: EdgeInsets.only(
              bottom: 10.0, left: SizeConfig.screenWidth * 0.03),
          isScrollable: true,
          tabs: [
            Text(
              "All",
              style: kTabBarStyle,
            ),
            Text(
              "Single Bed",
              style: kTabBarStyle,
            ),
            Text(
              "Sofa Bed",
              style: kTabBarStyle,
            ),
            Text(
              "Children bed",
              style: kTabBarStyle,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          ItemLists(),
          ItemLists(),
          ItemLists(),
          ItemLists(),
        ],
      ),
    );
  }
}
