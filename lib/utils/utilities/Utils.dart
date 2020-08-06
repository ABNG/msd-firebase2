import 'package:flutter_msd_app/model/item_model.dart';

class Utils {
  static double getSubTotal(var items) {
    double price = 0;
    for (ItemModel item in items) {
      price += item.price;
    }
    return price;
  }

  static List<String> getKeys(var map) {
    List<String> mykeys = [];
    for (var key in map.keys) {
      mykeys.add(key);
    }
    return mykeys;
  }

  static List<String> getValues(var map) {
    List<String> myValues = [];
    for (var value in map.values) {
      myValues.add(value);
    }
    return myValues;
  }

  static String putCommaInside(String text) {
    var before = text.substring(0, 1);
    var after = text.substring(1, text.length);
    return before + "," + after;
  }
}
