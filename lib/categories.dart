import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'dart:convert';
import 'home.dart';
import 'categories.dart';
import 'search.dart';
import 'imgSlider-api.dart';

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(child: Text('الاطفال', style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DroidKufi',

              ),)),
              Tab(child: Text('النساء', style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DroidKufi',

              ),)),
              Tab(icon: Icon(Icons.directions_transit, color: Colors.black)),
            ],
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

