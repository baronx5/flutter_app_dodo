import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'imgSlider-api.dart';


class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  Future imgSlidemain;

  @override
  void initState() {
    super.initState();
    imgSlidemain = fetchImg();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: FutureBuilder(
                future: imgSlidemain,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("Error connection");
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.done:
                      return Container(
                        child: GFCarousel(
                          pagination: true,
                          height: 300,
                          viewportFraction: 1.0,
                          items: imgListModel.map(
                                (imgList) {
                              return Container(
                                padding: EdgeInsets.only(bottom: 25.0),
                                margin: EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  child: Image.network(imgList.img,
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
                      );
                    default:
                      return Text("done");
                  }
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
              padding: EdgeInsets.all(5.0),
              child: Text('Latest Product', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: FutureBuilder(
                future: imgSlidemain,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("Error connection");
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.done:
                      return Container(
                        child: GFCarousel(
                          height: 250,
                          viewportFraction: 0.4,
                          items: imgListModel.map(
                                (imgList) {
                              return Container(
                                color: Colors.grey[100],
                                margin: EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        imgList.img,
                                        fit: BoxFit.cover,
                                        width: 200.0,
                                        height: 200,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(imgList.id),
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
                      );
                    default:
                      return Text("done");
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
