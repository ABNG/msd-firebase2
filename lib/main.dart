import 'package:flutter/material.dart';
import 'package:flutter_msd_app/app_screens/main_screen.dart';
import 'package:flutter_msd_app/provider/page_selection.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageSelection>(
      create: (BuildContext context) => PageSelection(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color(0xffF1F1F1),
        ),
        home: MainScreen(),
      ),
    );
  }
}
