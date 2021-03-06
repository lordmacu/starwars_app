// @dart=2.9

import 'package:starwars_app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.black,
            centerTitle: true
          ) ,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xff44454f),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),

      ],
      home: Home(),
    );
  }
}

