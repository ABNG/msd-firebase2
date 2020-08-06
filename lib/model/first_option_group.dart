import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstGroup {
  IconData leading;
  String title;
  IconData trailing;

  FirstGroup({this.leading, this.title, this.trailing});

  static List<FirstGroup> firstList = [
    FirstGroup(
      leading: Icons.card_giftcard,
      title: "MY ORDERS",
      trailing: Icons.arrow_forward_ios,
    ),
    FirstGroup(
      leading: Icons.favorite,
      title: "MY WISHLIST",
      trailing: Icons.arrow_forward_ios,
    ),
    FirstGroup(
      leading: Icons.place,
      title: "MY ADDRESSES",
      trailing: Icons.arrow_forward_ios,
    ),
  ];
  static List<FirstGroup> secondList = [
    FirstGroup(
      leading: Icons.language,
      title: "CHANGE LANGUAGE",
      trailing: Icons.arrow_forward_ios,
    ),
    FirstGroup(
      leading: CupertinoIcons.mail_solid,
      title: "SUPPORT",
      trailing: Icons.arrow_forward_ios,
    ),
    FirstGroup(
      leading: CupertinoIcons.padlock,
      title: "LOGOUT",
      trailing: Icons.arrow_forward_ios,
    ),
  ];
}
