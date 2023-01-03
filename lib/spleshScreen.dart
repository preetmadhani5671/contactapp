import 'dart:async';

import 'package:flutter/material.dart';

class spleshScreen extends StatefulWidget {
  const spleshScreen({Key? key}) : super(key: key);

  @override
  State<spleshScreen> createState() => _spleshScreenState();
}

class _spleshScreenState extends State<spleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, 'homePage');
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(Icons.perm_contact_calendar_sharp,size: 100),
              Text("Contact",style: TextStyle(fontSize: 25,color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
