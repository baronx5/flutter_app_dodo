import 'package:flutter/material.dart';
import 'home.dart';
import 'categories.dart';
import 'search.dart';
import 'imgSlider-api.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  Widget currentScreen;
  final _pageOptions = [
    homePage(),
    categories(),
    searchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20.0),
          iconSize: 30,
          icon: Icon(
            Icons.view_list,
            color: Colors.black,
          ),
          onPressed: () {
            // do something
          },
        ),
        title: Text(
          "HOME",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 20.0),
            iconSize: 30,
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _selectedPage,
        children: _pageOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
