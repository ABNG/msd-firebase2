import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/item_details_screen.dart';
import 'package:flutter_msd_app/app_screens/tab_screens/hometab/itemList/Item_List_Screen.dart';
import 'package:flutter_msd_app/custom_icons/my_bed_icons.dart';
import 'package:flutter_msd_app/custom_icons/my_cart_icons.dart';
import 'package:flutter_msd_app/custom_icons/my_chair_icons.dart';
import 'package:flutter_msd_app/custom_icons/my_sofa_icons.dart';
import 'package:flutter_msd_app/custom_icons/my_table_icons.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/provider/page_enum.dart';
import 'package:flutter_msd_app/provider/page_selection.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';
import 'package:flutter_msd_app/utils/utilities/Utils.dart';
import 'package:provider/provider.dart';

const List<String> names = ["Sofas", "Chairs", "Tables", "Beds"];
const List<IconData> icons = [
  MySofa.sofa,
  MyChair.chair,
  MyTable.table,
  MyBed.bed
];

void pageConversion(BuildContext context) {
  Provider.of<PageSelection>(context, listen: false).setPage =
      PageName.ITEM_LIST_PAGE;
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> myModel =
        ItemModel.item.where((element) => element.isSpecial).toList();
    SizeConfig().init(context);
    return Provider.of<PageSelection>(context, listen: true).getPage ==
            PageName.ITEM_LIST_PAGE
        ? ItemListScreen()
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 10),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.clear_all,
                      color: Colors.black,
                    ),
                    Text(
                      "Explore",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                centerTitle: false,
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
                  )
                ],
              ),
            ),
            body: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4,
                      (index) => GestureDetector(
                            onTap: () {
                              pageConversion(context);
                            },
                            child: ReusableContainer(
                              name: names[index],
                              icon: icons[index],
                            ),
                          )),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableBodyContainer(
                  text: "New Arrivals",
                  icon: Icons.arrow_forward,
                  imageAsset: "images/photo3.jpeg",
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableBodyContainer(
                  text: "On Sale",
                  icon: Icons.arrow_forward,
                  imageAsset: "images/photo8.jpeg",
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.03),
                  child: Text(
                    "Special Items",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                    myModel.length,
                    (index) => GestureDetector(
                      onTap: () {
                        pageConversion(context);
                      },
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ItemDetailScreen(myModel[index].index))),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.03,
                          ),
                          width: SizeConfig.screenWidth * 0.35,
                          height: SizeConfig.screenHeight * 0.30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 0.95,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "${myModel[index].image}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        myModel[index].desc,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "AED ${Utils.putCommaInside(myModel[index].price.round().toString())}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
                )
              ],
            ),
          );
  }
}

class ReusableContainer extends StatelessWidget {
  final IconData icon;
  final name;

  ReusableContainer({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageConversion(context);
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableBodyContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final String imageAsset;

  ReusableBodyContainer({this.text, this.icon, this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageConversion(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
        height: SizeConfig.screenHeight * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.black38, BlendMode.softLight)),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight * 0.01,
                  horizontal: SizeConfig.screenWidth * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
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
