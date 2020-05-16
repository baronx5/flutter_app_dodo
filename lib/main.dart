import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "HOME",
          style: TextStyle(color: Colors.black),
        ),
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
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: GFItemsCarousel(
                  rowCount: 3,
                  children: imageList.map(
                        (url) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child:
                          Image.network(url, fit: BoxFit.cover, width: 1000.0),

                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                width: 100,
                height: 300,
                color: Colors.orange[300],
                child: Text('Text3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
