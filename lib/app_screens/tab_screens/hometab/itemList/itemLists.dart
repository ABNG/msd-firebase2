import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/item_details_screen.dart';
import 'package:flutter_msd_app/constants/constant.dart';
import 'package:flutter_msd_app/model/item_model.dart';
import 'package:flutter_msd_app/utils/SizeConfig.dart';
import 'package:flutter_msd_app/utils/utilities/Utils.dart';

class ItemLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.80,
        crossAxisSpacing: 10,
        children: List.generate(
          ItemModel.item.length,
          (index) => GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ItemDetailScreen(index))),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 1.1,
                        child: Image.asset(
                          "${ItemModel.item[index].image}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ItemModel.item[index].oldPrice > 0.0
                              ? Text(
                                  "AED ${ItemModel.item[index].oldPrice.round()}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    decorationThickness: 1.5,
                                  ),
                                )
                              : SizedBox(),
                          Text(
                            ItemModel.item[index].desc,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "AED ${Utils.putCommaInside(ItemModel.item[index].price.round().toString())}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          ItemModel.item[index].addToBag = true;
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "item added to bag".toUpperCase(),
                                style: textStyle3,
                              ),
                              backgroundColor: Colors.black87,
                              action: SnackBarAction(
                                onPressed: () {},
                                label: "OK",
                                textColor: Colors.white,
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
