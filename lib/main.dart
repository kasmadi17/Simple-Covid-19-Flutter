import 'package:covid19/const.dart';
import 'package:flutter/material.dart';

import 'screen/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: TextTheme(
            headline1: TextStyle(color: kBodyTextColor),
          )),
      home: Home(),
    );
  }
}
