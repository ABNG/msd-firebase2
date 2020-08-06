import 'package:flutter/material.dart';
import 'package:flutter_msd_app/provider/page_enum.dart';

class PageSelection with ChangeNotifier {
  PageName _name = PageName.ITEM_PAGE;

  set setPage(PageName name) {
    _name = name;
    notifyListeners();
  }

  get getPage => _name;
}
