import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'imgSliderpp.dart';
import 'imgSlider-api.dart';




final List<String> imageList = [
  "https://pa.namshicdn.com/product/A8/67726W/1-web-desktop-list.jpg",
  "https://miro.medium.com/max/1742/0*Hkb-ctuDVxrxSwa0",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://pa.namshicdn.com/product/46/8363/v1/1-web-desktop-list.jpg",
  "https://pa.namshicdn.com/product/A0/99584W/1-web-desktop-list.jpg"
];

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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
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
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: GFCarousel(
                  pagination: true,
                  height: 300,
                  viewportFraction: 1.0,
                  items: imageList.map(
                    (url) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 25.0),
                        margin: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Image.network(url,
                              fit: BoxFit.cover, width: 1000.0),
                        ),
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      index;
                    });
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.all(30),
                  color: Colors.grey[100],
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.card_giftcard,
                        size: 40,
                      ),
                      Text(
                        'Hello',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Hello This is our shooping app',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ))),
              Container(
                child: GFCarousel(
                  height: 250,
                  viewportFraction: 0.4,
                  items: imageList.map(
                    (url) {
                      return Container(
                        color: Colors.grey[100],
                        margin: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                url,
                                fit: BoxFit.cover,
                                width: 200.0,
                                height: 200,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('12 KWD'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      index;
                    });
                  },
                ),
              ),
              Container(
                child: FutureBuilder(
                  future: fetchimgSlide(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index){
                          ImgSliderpp image = snapshot.data[index];
                          return Text('${image.img}');

                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
