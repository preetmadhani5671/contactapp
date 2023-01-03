import 'package:contactapp/homePage.dart';
import 'package:contactapp/spleshScreen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context)  => spleshScreen(),
        'homePage' : (context) => homePage(),
      },
    ),
  );
}