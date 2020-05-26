import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:getflutter/getflutter.dart';
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

  @override
  Widget build(BuildContext context) {
    // Fot List view
    final List<String> entries = <String>['الاحذية', 'الملابس الرياضية', 'الجينز'];

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
              GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(30, (index) {
                  return Center(
                    child: Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                }),
              ),
              FutureBuilder(
                future: getProductsData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.height / 1350.0,
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
                                    onTap: (){
                                      print(snapshot.data[i]['id']);
                                    },
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Colors.white,

                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: <Widget>[
                                          Text(snapshot.data[i]["price"].toString()+ " KWD", style: TextStyle(color: Colors.lightGreen, fontSize: 12),),
                                          Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(snapshot.data[i]['name'], style: TextStyle(
                                              fontFamily: 'DroidKufi',
                                              fontSize: 12,
                                              color: Colors.black87,

                                            ),),
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
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, left:8.0, right: 8.0),
                    child: Container(
                      height: 200,
                      color: Colors.greenAccent[200],
                      child: Image.network('https://a.namshicdn.com/cms/large/adidas/20190228/module_01.jpg',
                      fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        separatorBuilder: (BuildContext context, int index) => Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            color: Colors.grey[200],
                            child: Center(child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,                                  children: <Widget>[
                                    Text('قسم ${entries[index]}',style: TextStyle(
                                      fontFamily: 'DroidKufi',
                                      fontSize: 18,
                                    ),),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.favorite, size: 30.0,),
                                    ),
                                  ],
                                ),

                              ],
                            )),
                          );
                        }
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
