import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/cart_screens/mybag_screen.dart';
import 'package:flutter_msd_app/app_screens/profile_screen/profile_screen.dart';
import 'package:flutter_msd_app/app_screens/tab_screens/hometab/Home_Screen.dart';
import 'package:flutter_msd_app/app_screens/wishlist_screen/wishlist_screen.dart';
import 'package:flutter_msd_app/custom_icons/my_cart_icons.dart';
import 'package:flutter_msd_app/custom_icons/my_favourite_icons.dart';
import 'package:flutter_msd_app/custom_icons/my_flutter_app_icons.dart';
import 'package:flutter_msd_app/custom_icons/my_home_icons.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        iconSize: 22,
        currentIndex: index,
        activeColor: Colors.black87,
        inactiveColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              MyHome.home_run,
            ),
            title: Text(
              'HOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFavourite.heart,
            ),
            title: Text(
              'WISHLIST',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyCart.shopping_cart,
            ),
            title: Text(
              'MY CART',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.user,
            ),
            title: Text(
              'PROFILE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ShowBody(index),
    );
  }
}

class ShowBody extends StatelessWidget {
  final int index;

  ShowBody(this.index);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return WishListScreen();
        break;
      case 2:
        return MyBagScreen();
        break;
      case 3:
        return ProfileScreen();
        break;
      default:
        return null;
    }
  }
}
