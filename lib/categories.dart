import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

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


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
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
                        'https://a.namshicdn.com/cms/large/adidas/20190228/module_01.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: getCatWomen(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data.length,
                              separatorBuilder: (BuildContext context, int index) =>
                                  Divider(),
                              itemBuilder: (context , i ){
                                return Container(
                                  height: 50,
                                  color: Colors.grey[200],
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(snapshot.data[i]['name'],
                                          style: TextStyle(
                                            fontFamily: 'DroidKufi',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.network(snapshot.data[i]['icon'], width: 30.0,)
                                      ),

                                    ],
                                  ), ),);

                              }),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
              FutureBuilder(
                future: getProductsData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                MediaQuery.of(context).size.height / 1350.0,
                            crossAxisCount: 2),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      snapshot.data[i]['imgUrl'],
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: double.infinity,
                                    ),
                                  ),
                                  onTap: () {
                                    print(snapshot.data[i]['id']);
                                  },
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(
                                          snapshot.data[i]["price"].toString() +
                                              " KWD",
                                          style: TextStyle(
                                              color: Colors.lightGreen,
                                              fontSize: 12),
                                        )),
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            snapshot.data[i]['name'],
                                            style: TextStyle(
                                              fontFamily: 'DroidKufi',
                                              fontSize: 12,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                  return CircularProgressIndicator();
                },
              ),
              Text('Here another Caregories'),
            ],
          ),
        ),
      ),
    );
  }
}
