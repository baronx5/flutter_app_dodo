import 'package:flutter/material.dart';
import 'package:flutterappdodo/search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'selecterProductPage.dart';

class productView extends StatefulWidget {

  @override
  _productViewState createState() => _productViewState();
}

class _productViewState extends State<productView> {

  @override
  Widget build(BuildContext context) {
    final dynamic catid = ModalRoute.of(context).settings.arguments;
    final String cattype = ModalRoute.of(context).settings.name;
    Future getProductsData() async {
      var url = 'http://localhost/catdemo/view-selected-product.php?getCatId=${catid["id"].toString()}&gettype=${cattype}';
      var response = await http.get(url);
      var responseBody = jsonDecode(response.body);
      return responseBody;
    }


    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light, // this makes status bar text color black
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black54
        ),
        title: Text(catid['name'], style: TextStyle(
          fontFamily: 'DroidKufi',
          fontSize: 16,
          color: Colors.black54,
        ),),
      ),
      body: FutureBuilder(
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
                            Navigator.of(context)
                                .push(new MaterialPageRoute<Null>(
                              settings: RouteSettings(
                                arguments: snapshot.data[i]
                              ),
                              builder: (BuildContext context) {
                                return new selectedProductPage();
                              },
                              fullscreenDialog: true,
                            ));
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

    );
  }
}