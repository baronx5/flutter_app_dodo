import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'productView.dart';


class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {

  Future getProductsData() async {
    var url = 'http://localhost/catdemo/select-products.php?catId=cars';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future getCatWomen() async {
    var url = 'http://localhost/catdemo/catwomen.php?women=true';
    var responseWomenUrl = await http.get(url);
    var responseWomen = jsonDecode(responseWomenUrl.body);
    return responseWomen;
  }

  Future getCatMen() async {
    var url = 'http://localhost/catdemo/catmen.php?men=true';
    var responseMenUrl = await http.get(url);
    var responseMen = jsonDecode(responseMenUrl.body);
    return responseMen;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TabBar(
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                        child: Text(
                      'الاطفال',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DroidKufi',
                      ),
                    )),
                    Tab(
                        child: Text(
                      'الرجال',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DroidKufi',
                      ),
                    )),
                    Tab(
                        child: Text(
                      'النساء',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DroidKufi',
                      ),
                    )),
                  ],
                ),
              )),
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      height: 200,
                      color: Colors.greenAccent[200],
                      child: Image.network(
                        'https://www.pouted.com/wp-content/uploads/2019/05/children-fashion-outfits.jpg',
                        width: 800.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: getCatMen(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Divider(),
                              itemBuilder: (context, i) {
                                return GestureDetector(child: Container(
                                  height: 50,
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.keyboard_arrow_left, color: Colors.grey,),
                                        ),
                                        Spacer(flex: 1,),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            snapshot.data[i]['name'],
                                            style: TextStyle(
                                              fontFamily: 'DroidKufi',
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Image.network(
                                              snapshot.data[i]['icon'],
                                              width: 30.0,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),onTap: () {
                                  print(snapshot.data[i]['id']);
                                  Navigator.of(context)
                                      .push(new MaterialPageRoute<Null>(
                                    settings: RouteSettings(
                                      arguments: snapshot.data[i],
                                      name: 'children',
                                    ),
                                    builder: (BuildContext context) {
                                      return new productView();
                                    },
                                    fullscreenDialog: true,
                                  ));
                                },
                                );
                              }),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      height: 200,
                      color: Colors.greenAccent[200],
                      child: Image.network(
                        'https://lapol0.s3.amazonaws.com/media/None/100-years-of-men-fashion-cover-lapolo.jpg',
                        fit: BoxFit.cover,
                        width: 800.0,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: getCatWomen(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                  Divider(),
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  child: Container(
                                    height: 50,
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(Icons.keyboard_arrow_left, color: Colors.grey,),
                                          ),
                                          Spacer(flex: 1,),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              snapshot.data[i]['name'],
                                              style: TextStyle(
                                                fontFamily: 'DroidKufi',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                              const EdgeInsets.all(5.0),
                                              child: Image.network(
                                                snapshot.data[i]['icon'],
                                                width: 30.0,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    print(snapshot.data[i]['id']);
                                    Navigator.of(context)
                                        .push(new MaterialPageRoute<Null>(
                                      settings: RouteSettings(
                                        arguments: snapshot.data[i],
                                        name: 'women',
                                      ),
                                      builder: (BuildContext context) {
                                        return new productView();
                                      },
                                      fullscreenDialog: true,
                                    ));
                                  },
                                );
                              }),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Container(
                      height: 200,
                      color: Colors.greenAccent[200],
                      child: Image.network(
                        'https://a.namshicdn.com/cms/large/adidas/20190228/module_01.jpg',
                        fit: BoxFit.cover,
                        width: 800.0,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: getCatWomen(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Divider(),
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  child: Container(
                                    height: 50,
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(Icons.keyboard_arrow_left, color: Colors.grey,),
                                          ),
                                          Spacer(flex: 1,),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              snapshot.data[i]['name'],
                                              style: TextStyle(
                                                fontFamily: 'DroidKufi',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.network(
                                                snapshot.data[i]['icon'],
                                                width: 30.0,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    print(snapshot.data[i]['id']);
                                    Navigator.of(context)
                                        .push(new MaterialPageRoute<Null>(
                                      settings: RouteSettings(
                                        arguments: snapshot.data[i],
                                        name: 'women',
                                      ),
                                      builder: (BuildContext context) {
                                        return new productView();
                                      },
                                      fullscreenDialog: true,
                                    ));
                                  },
                                );
                              }),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
